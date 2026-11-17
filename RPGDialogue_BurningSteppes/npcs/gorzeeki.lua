-- Gorzeeki Wildeyes: Mor'zul's goblin alchemist by the Altar of Storms, who brews dreadsteed inks, keeps an imp in a jar, and eats bugs. Voice: bibles/gorzeeki.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gorzeeki", id = TODO_NPC("Gorzeeki Wildeyes"), name = "Gorzeeki Wildeyes",
  bible = "bibles/gorzeeki.md", role = "questgiver", tier = "quest",
  communities = { "altar_of_storms" }, temper = { "excitable", "chatty" }, values = { "greedy", "curious" },
  notices = { "pet", "class" },

  impression = {
    first = "Gorzeeki Wildeyes offered me a beetle before he offered me his name. He's a goblin alchemist who serves Mor'zul and seems to think the whole business of demons is wonderful fun.",
    third = "{name} met Gorzeeki Wildeyes, Mor'zul Bloodbringer's goblin alchemist at the Altar of Storms in the Burning Steppes.",
  },

  greetings = {
    { id = "g_default", text = "Do you have any spiders or beetles? They scurry fast, but if you're faster, they're quite a treat!" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you bring bugs this time? No? Well, I'll forgive you, just this once." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I ate every beetle on this hill while you were away. Now I have to walk further, which is your fault somehow." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody out there's happy with you, I hear! That's nice. Nobody's ever happy with me, except Mor'zul, and only when I've done something horrible." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Oh, an imp! Hello, little fellow, does your master let you out of the jar? Mine stays in his, but he's very clever about it." },
    { id = "n_gob", cat = "class", when = { class = "ROGUE" },
      text = "You've got sticky fingers, I can tell, so I'll keep my jar where I can see it. It's not for sale, and it's certainly not for stealing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorzeeki Wildeyes, alchemist, ink-brewer, candle-maker and loyal servant to master Mor'zul, who pays on time, which is more than I can say for most demons. What can I do for you, besides sell you a potion?" },
        { id = "h_case", tags = { "news" }, when = { questActive = TODO_QUEST("Wildeyes") },
          text = "Is that blood? It is, and it must be from master Mor'zul, because he's so fond of the stuff. He'll want an ink from it, I suppose, for another dreadsteed parchment! How exciting!" },
        { id = "h_imp", tags = { "news" }, when = { questActive = TODO_QUEST("Imp Delivery") },
          text = "Take the jar to the alchemy lab in the Scholomance and let him out, and he'll infuse the parchment with stardust. He's quite clever, my imp, but please bring the jar back, because it's not for sale!" },
        { id = "h_imp_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Imp Delivery"), days = 3 } },
          text = "J'eevee made the parchment, and you brought my jar back, thank you! How was the Scholomance? Charming, I hear, and the bugs there are delicious." },
        { id = "h_candle", tags = { "news" }, when = { questActive = TODO_QUEST("Doomsday Candle") },
          text = "Three black dragonscales, and I'll make you a Doomsday Candle that burns any demon that tries to break your circle. Buy them from a skinner, unless you want to ask a dragon nicely." },
        { id = "h_nonlock", when = { class = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } },
          text = "You're not a warlock, are you? That's fine, I'm not either, really, I just work for one. The pay's good and the company's fascinating." },
      },
      again = {
        { id = "h_again", text = "What else? I've got potions, inks, opinions, and a beetle I was saving." },
        { id = "h_again2", text = "Anything else? Ask quick, the candle wax is cooling." },
      },
      choices = {
        { text = "Why do you work for Mor'zul?", next = "master" },
        { text = "Tell me about your imp.", next = "jar" },
        { text = "You really eat bugs?", next = "bugs" },
        { text = "What are the shadowy potions for?", next = "xpotion", when = { class = "WARLOCK" } },
        { text = "A goblin should be selling, not serving.", next = "xgoblin", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    master = {
      lines = {
        { id = "ma_default", text = "Because he pays well and he doesn't mind my diet, and do you know how rare that is? I worked for a trading company once, and they said I scared the customers, which was only true on Tuesdays." },
      },
      choices = {
        { text = "Doesn't Mor'zul frighten you?", next = "master_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_fear = {
      lines = {
        { id = "mf_default", text = "All the time, and isn't it wonderful? He's so enamored with blood, and he loves to see it spilled, whereas I like it in a small rodent's veins, where it stays warm until you want it. We understand each other perfectly." },
      },
      choices = {
        { text = "You two are monsters.", next = "master_monster" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_monster = {
      lines = {
        { id = "mm_default", text = "Monsters? We're businessmen, friend, and our business happens to be demons. Everyone in the Steppes is killing something, and at least we're doing it for the art." },
      },
      choices = {
        { text = "Business is business. I don't judge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Dressing it up as art doesn't make it right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    jar = {
      lines = {
        { id = "ja_default", text = "His name's J'eevee, and he lives in this jar, and he's the cleverest imp I've ever met, which isn't saying much about imps but is saying a lot about him. I've had the jar for years, and it's not for sale!" },
      },
      choices = {
        { text = "Does he ever want out?", next = "jar_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jar_out = {
      lines = {
        { id = "jo_default", text = "Only when there's work, and then he's off like a shot and back again when it's done. I think he likes the jar, because it's warm and nobody steps on him." },
      },
      choices = {
        { text = "That's no life for a creature, even an imp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Everyone has a place. His is the jar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bugs = {
      lines = {
        { id = "bu_default", text = "Of course! Spiders, beetles, the odd scorpid when I'm feeling fancy, and they're full of good things for the brain. The Steppes are crawling with them, so it's practically a feast out here." },
      },
      choices = {
        { text = "What's the best one?", next = "bugs_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bugs_best = {
      lines = {
        { id = "bb_default", text = "Fire beetles, roasted on the lava itself, crunchy outside and gooey inside. I'd offer you one, but I just ate the last one, and I'm not sorry." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xpotion = {
      big = true,
      lines = {
        { id = "xp_default", text = "To walk through Jaedenar in the Shadow Council's own flavor of evil, so you can speak with Lord Banehollow about his stardust. They cost a bit, I won't lie, but they're cheaper than being torn apart by satyrs." },
      },
      choices = {
        { text = "Wearing the Council's evil doesn't trouble me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight my way through honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgoblin = {
      big = true,
      lines = {
        { id = "xg_default", text = "I am selling! I'm selling myself, to Mor'zul, at a very good rate. It's the best deal I ever made, and the trading companies never offered me anything half as good, and they never offered dental." },
      },
      choices = {
        { text = "A goblin who sold himself. I've heard worse deals.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A goblin alchemist who left trading for demons, and I've never looked back, except to check for bugs." } },
    advice = { { id = "tp_ad", text = "Eat what scurries, friend, it's free and it's everywhere." } },
    _none = { { id = "tp_none", text = "No idea! But if it has six legs, I'll tell you how it tastes." } },
  },
}
