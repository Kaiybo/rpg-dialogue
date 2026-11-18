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
    { id = "g_op_demons", when = { gossip = { topic = "demons", stance = "fear" } }, text = "The boss says you told him you're scared of his little friends. Smart, pal, real smart, because I'm scared of 'em too, and I get paid to be." },
    { id = "g_default", text = "Got any spiders or beetles on you, pal? They scurry fast, but if you're faster, they're a treat, and the best part is they don't cost a copper!" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you bring bugs this time? No? Well, I'll forgive you, chum, just this once, and I'll put it on your account." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, pal, and I ate every beetle on this hill while you were away, so now I have to walk further for lunch. I'm billing that to you somehow, I just haven't worked out the paperwork yet." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody out there's happy with you, I hear, and that's good for your credit! Nobody's ever happy with me, except Mor'zul, and only when I've done somethin' horrible on schedule." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Oh, an imp! Hello, little fellow, does your boss let you out of the jar? Mine stays in his, but he's very clever about it, and he works for room and board, which is the best rate in the Steppes." },
    { id = "n_gob", cat = "class", when = { class = "ROGUE" },
      text = "You've got sticky fingers, pal, I can tell, so I'll keep my jar where I can see it. It's not for sale, and it's certainly not for stealing, and the imp bites anybody who hasn't signed for him." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorzeeki Wildeyes, alchemist, ink-brewer, candle-maker and loyal servant to master Mor'zul, who pays on time, every time, and you'd be amazed how rare that is among demons and goblins both! What can I do for you, besides sell you a potion at a very competitive price?" },
        { id = "h_case", tags = { "news" }, when = { questActive = TODO_QUEST("Wildeyes") },
          text = "Is that blood? It is, and it must be for master Mor'zul, because he's so fond of the stuff, and fond means repeat business! He'll want an ink from it for another dreadsteed parchment, I suppose, and isn't that exciting?" },
        { id = "h_imp", tags = { "news" }, when = { questActive = TODO_QUEST("Imp Delivery") },
          text = "Take the jar to the alchemy lab in the Scholomance and let him out, pal, and he'll infuse the parchment with stardust. He's very clever, my imp, but please bring the jar back, because it's not for sale and I've got a deposit on it with myself!" },
        { id = "h_imp_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Imp Delivery"), days = 3 } },
          text = "J'eevee made the parchment, and you brought my jar back, thank you, chum! How was the Scholomance? Charming, I hear, and the bugs there are delicious, if you can get past the necromancers charging admission." },
        { id = "h_candle", tags = { "news" }, when = { questActive = TODO_QUEST("Doomsday Candle") },
          text = "Three black dragonscales, pal, and I'll make you a Doomsday Candle that burns any demon that tries to break your circle, which is a bargain when you think about the alternative. Buy them from a skinner, unless you want to ask a dragon nicely and see what that costs." },
        { id = "h_nonlock", when = { class = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "DRUID" } },
          text = "You're not a warlock, are you? That's fine, I'm not either, really, I just work for one, and the pay's good and the company's fascinatin', so I call it a career." },
        { id = "dd_dreadsteed", when = { questDone = TODO_QUEST("Dreadsteed of Xoroth") },
          text = "Master Mor'zul says you've got yourself a dreadsteed, and you didn't even get eaten by it, pal! That's the best return on a candle I ever sold, and I'm tellin' every warlock who walks by." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I've got potions, inks, opinions, and a beetle I was saving, and only one of those is free." },
        { id = "h_again2", text = "Anything else? Ask quick, chum, because the candle wax is coolin' and cold wax is wasted stock." },
        { id = "h_again3", text = "Still here, pal? Lovely, because the imp's been watching you, and he only watches paying customers." },
      },
      choices = {
        { text = "Why do you work for Mor'zul?", next = "master" },
        { text = "Do you keep any demons of your own?", next = "jar" },
        { text = "You really eat bugs?", next = "bugs" },
        { text = "What do you brew for warlocks?", next = "xpotion", when = { class = "WARLOCK" } },
        { text = "A goblin should be selling, not serving.", next = "xgoblin", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    master = {
      lines = {
        { id = "ma_default", text = "Because he pays well and he doesn't mind my diet, pal, and do you know how rare that is in an employer? I worked for a trading company once, and they said I scared the customers, which was only true on Tuesdays and I never once charged extra for it." },
      },
      choices = {
        { text = "Mor'zul looks like he'd frighten anyone.", next = "master_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_fear = {
      lines = {
        { id = "mf_default", text = "He frightens me all the time, and isn't it wonderful? He's so enamored with blood, and he loves to see it spilled, whereas I like it in a small rodent's veins, where it stays warm and doesn't go to waste. We understand each other perfectly, like a good contract." },
      },
      choices = {
        { text = "You two are monsters.", next = "master_monster" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_monster = {
      lines = {
        { id = "mm_default", text = "Monsters? We're businessmen, pal, and our business happens to be demons, which has very low overhead once you get past the screaming. Everyone in the Steppes is killing somethin', and at least we're doing it for the art and a steady wage." },
      },
      choices = {
        { text = "Business is business. I don't judge.", next = "BACK", reply = "Now that's what I call a valued customer, pal, and I'm writin' your name down for the good list. Want a beetle while you think about what else you need?", fx = { align = { light = -1 } } },
        { text = "Dressing it up as art doesn't make it right.", next = "BACK", reply = "Ooh, a critic, and all the way out here on the mountain! Look, buddy, art is whatever somebody pays for, and the boss pays on time, which is more than the Steppes can say.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    jar = {
      lines = {
        { id = "ja_default", text = "His name's J'eevee, and he lives in this jar, and he's the cleverest imp I've ever met, which isn't saying much about imps but is saying a lot about him. I've had the jar for years, chum, and it's not for sale, not at any price, so stop doing the sums in your head!" },
      },
      choices = {
        { text = "Does he ever want out?", next = "jar_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jar_out = {
      lines = {
        { id = "jo_default", text = "Only when there's work, and then he's off like a shot and back again when it's done, and he's never once asked for a raise. I think he likes the jar, because it's warm and nobody steps on him." },
      },
      choices = {
        { text = "That's no life for a creature, even an imp.", next = "BACK", reply = "No life? He's got central heating and a lid, pal, which is better than half the goblins I grew up with in Undermine. Ask him yourself, but he bites, so I'd knock first.", fx = { align = { order = -1 } } },
        { text = "Everyone has a place. His is the jar.", next = "BACK", reply = "Exactly, chum, a place for everything and an imp in every jar! You get it, and that's rarer than a dry match in these parts.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bugs = {
      lines = {
        { id = "bu_default", text = "Of course, pal! Spiders, beetles, the odd scorpid when I'm feeling fancy, and they're full of good things for the brain and cost nothin'. The Steppes are crawling with them, so it's practically a free buffet out here, and I hate to waste a free buffet." },
      },
      choices = {
        { text = "Some bugs must taste better than others.", next = "bugs_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bugs_best = {
      lines = {
        { id = "bb_default", text = "Fire beetles, roasted on the lava itself, crunchy outside and gooey inside, and the fuel's free because the whole mountain's on fire. I'd offer you one, chum, but I just ate the last one, and I'm not sorry." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xpotion = {
      big = true,
      lines = {
        { id = "xp_default", text = "Potions that let you walk through Jaedenar wearing the Shadow Council's own flavor of evil, pal, so you can speak with Lord Banehollow about his stardust. They cost a bit, I'll say that up front, but they're a lot cheaper than being torn apart by satyrs." },
      },
      choices = {
        { text = "Wearing the Council's evil doesn't trouble me.", next = "BACK", reply = "Ha, that's the spirit, pal, a customer with no squeamish line items! The satyrs never smell a thing, and you walk out with your skin still attached.", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight my way through, fair and open.", next = "BACK", reply = "Honest, sure, real honest, and real expensive in bandages and burial fees. Your call, buddy, but the potion's still here when the satyrs change your mind.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgoblin = {
      big = true,
      lines = {
        { id = "xg_default", text = "I am selling! I'm selling myself, to Mor'zul, at a very good rate, and it's the best deal I ever made, pal. The trading companies never offered me anything half as good, and they never offered dental." },
      },
      choices = {
        { text = "A goblin who sold himself. I've heard worse deals.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A goblin alchemist who left trading for demons, pal, best career move I ever made, and I've never looked back, except to check for bugs." } },
    advice = { { id = "tp_ad", text = "Eat what scurries, friend, because it's free and it's everywhere, and free is the best price there is." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion's demons are wonderful, pal, just wonderful, and they pay in power instead of gold. Mor'zul says I'm too enthusiastic, but I say there's no such thing." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I started, pal, sellin' potions to pirates on credit, which was a mistake. Demons are a much better class of customer; they always pay, one way or another." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons under the mountain have reagents I'd kill for, pal, and maybe I will someday. Mor'zul says to be patient." } },
    _none = { { id = "tp_none", text = "No idea, pal! But if it has six legs, I'll tell you how it tastes, and if it hasn't, I'll tell you what it's worth." } },
  },
}
