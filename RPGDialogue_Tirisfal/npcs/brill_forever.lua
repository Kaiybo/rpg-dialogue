-- Brill (Forever only): the Forsaken paladin trainer, the tavern cook and a townswoman. Voice: bibles/brill_forever.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Shari Stilwell: paladin trainer, recruiter for Bandarion Keep.
P:NPC {
  key = "tf_shari", id = TODO_NPC("Shari Stilwell"), name = "Shari Stilwell", title = "Paladin Trainer",
  bible = "bibles/brill_forever.md", role = "trainer", tier = "quest",
  communities = { "brill" }, temper = { "steady" }, values = { "devout", "loyal" },
  notices = { "class", "light" },
  impression = {
    first = "Shari Stilwell holds the Light in a body it burns, and she speaks of it calmly, as if the pain were simply the price of a good thing. She is recruiting for a new order, and she means to see it take root.",
    third = "{name} met Shari Stilwell in Brill, who trains the Forsaken's paladins and sends them on to Bandarion Keep.",
  },

  greetings = {
    { id = "g_default", text = "The Light shines for everyone, even here. What can I do for you?" },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Welcome, paladin. Have you come to train, or only to stand somewhere you're not stared at?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Good; I like to see how my people are faring." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8, class = "PALADIN" }, text = "You've grown strong in the Light since you first came to me. I can see it in how you stand." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Brill has been saying kind things about you, and Brill doesn't say kind things easily. Every one of those helps us all." },
  },

  notice = {
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "You're holding yourself stiffly. It burns worse after a long day of fighting, I know, and it does ease, though it never stops." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest of the shadow, standing beside a paladin's trainer. Don't worry; I won't preach at you unless you ask." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Shari Stilwell, and I train paladins here in Brill. You may not be one of us, but you may find some comfort in the Light yet, should you ever go looking for it." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "The Light shines for all of us, paladin, though some of us feel it more sharply than others. What can I do for you?" },
        { id = "h_fresh", tags = { "news" }, when = { questActive = TODO_QUEST("Continue Your Training") },
          text = "Aramis Hammerhand sent you from Deathknell, didn't he? Welcome to Brill, paladin. There are many here who need an adventurer's help, so find work, grow stronger in the Light, and come back to me whenever you need training." },
        { id = "h_ready", when = { questBefore = TODO_QUEST("A Second Home"), class = "PALADIN", minLevel = 8 },
          text = "You've proven yourself to me and to Brill, paladin, and so I have something to tell you. We've begun a new order of our own here in Tirisfal, and there's a place in it for you." },
        { id = "h_home", tags = { "news" }, when = { questActive = TODO_QUEST("A Second Home") },
          text = "Bandarion Keep stands on the bluffs northwest of the Solliden Farmstead, at the edge of the Whispering Woods. Report to Breton Samuels when you get there, and tell him I sent you." },
        { id = "h_homedone", when = { questDone = TODO_QUEST("A Second Home") },
          text = "You've been to the Keep, then, and seen what Danitha Morr is building there. I hope it felt a little like coming home." },
        { id = "h_bareth", tags = { "news" }, when = { questActive = TODO_QUEST("Seeking Refuge") },
          text = "You have news of Bareth Dawnstone? Please tell me he's safe, because the Keep has been waiting on his message for days, and I've feared the worst." },
        { id = "h_barethdone", tags = { "news" }, when = { questRecent = { TODO_QUEST("Seeking Refuge"), days = 3 } },
          text = "Bareth came through, thanks to you, and our order is a little less thin than it was. I still can't believe the Scarlets meant to try him for the crime of existing." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "One of our living allies, come to speak with a dead woman about the Light. I'm glad of it, because it means you don't think the question is foolish." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind?" },
        { id = "h_again2", text = "Ask what you need to. I have time, and the Light has patience." },
      },
      choices = {
        { text = "I'd like to train, Shari.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Tell me about this new order.", next = "order" },
        { text = "Does the Light hurt you?", next = "burn" },
        { text = "How do the Forsaken treat paladins here?", next = "distrust" },
        { text = "What happened to Bareth Dawnstone?", next = "bareth", when = { any = { { questActive = TODO_QUEST("Seeking Refuge") }, { questDone = TODO_QUEST("Seeking Refuge") } } } },
        { text = "Who were you, before?", next = "before" },
        { text = "What comfort could the Light offer me?", next = "solace", when = { ["not"] = { class = "PALADIN" } } },
        { text = "I've no use for the Light, Shari.", next = "shadow", when = { class = { "PRIEST", "WARLOCK" }, race = "Scourge" } },
        { text = "How do you know Aramis Hammerhand?", next = "aramis", when = { any = { { questDone = TODO_QUEST("Continue Your Training") }, { questActive = TODO_QUEST("Continue Your Training") } } } },
        { text = "What does Executor Zygand make of you?", next = "zygand" },
        { text = "Farewell, Shari.", next = "END" },
      },
    },
    order = {
      hub = true,
      lines = {
        { id = "o_default", key = true, text = "It's only through community and shared faith that we'll come into our full strength, and so we've begun a paladin order of our own here in Tirisfal. Our monastery is Bandarion Keep, on the bluffs at the edge of the Whispering Woods, and Danitha Morr leads it." },
      },
      again = {
        { id = "o_again", text = "What else would you know of the Keep?" },
      },
      choices = {
        { text = "Who is Danitha Morr?", next = "danitha" },
        { text = "Who was Bandarion?", next = "garek" },
        { text = "Why form a new order at all?", next = "why_order" },
        { text = "Who will meet me at the Keep?", next = "breton" },
        { text = "Something else, Shari.", next = "hello" },
      },
    },
    breton = {
      lines = {
        { id = "br_default", text = "Breton Samuels keeps the gate and greets the new arrivals, and he'll tell you that you've come home, which sounds like the sort of thing people say until you hear him say it. He means it, and after a while you find you believe him." },
      },
      choices = {
        { text = "I'd like to believe it.", next = "order", fx = { affinity = 1 } },
        { text = "Something else.", next = "order" },
      },
    },
    aramis = {
      lines = {
        { id = "ar_default", text = "Danitha sent us both out from the Keep, him to the church in Deathknell and me to Brill, to find our people as they rise and tell them they aren't alone. He's gentler than I am, and he'll have told you not to turn from the Light, and he was right." },
        { id = "ar_warned", when = { questDone = TODO_QUEST("Continue Your Training") },
          text = "Danitha sent us both out from the Keep, him to Deathknell and me to Brill. He'll have warned you to take care travelling through Forsaken lands as a paladin, and I hope you listened, because there are many here who'd rather we kept walking." },
      },
      choices = {
        { text = "He did warn me. I'll be careful.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zygand = {
      lines = {
        { id = "zy_default", text = "That we're useful, I think, and that's all he's ever said on the matter. He watches my students the way he watches everything, as if he's already writing the report, and I've decided to take that as a compliment." },
      },
      choices = {
        { text = "From Zygand, it probably is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danitha = {
      lines = {
        { id = "d_default", text = "She was a Knight of the Silver Hand once, and she lost the Light for a long while after she rose, as most of us did. She found it again, and then she went looking for the rest of us who'd lost our way, and she hasn't stopped looking since." },
      },
      choices = {
        { text = "She found you, then.", next = "order", fx = { learn = { "silver_hand" } } },
        { text = "Something else.", next = "order" },
      },
    },
    garek = {
      lines = {
        { id = "ga_default", text = "Garek Bandarion was the first captain of the Deathguard and the first of us the Light answered after death. He gave his life to save this kingdom from the Scourge, and Danitha named the Keep for him, because she was his friend, and because we needed to remember that it can be done." },
      },
      choices = {
        { text = "A worthy name to carry.", next = "order", fx = { affinity = 1 } },
        { text = "Something else.", next = "order" },
      },
    },
    why_order = {
      big = true,
      lines = {
        { id = "wo_default", text = "Because a paladin alone in Forsaken lands is a curiosity at best and a threat at worst. Together we're an order with a purpose, and an order can prove to the Dark Lady's people that the Light in us serves them, which one stray knight could never do." },
      },
      choices = {
        { text = "The Forsaken need protectors. Your order should serve them.", next = "order", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Faith shouldn't need an order. Each must find their own way.", next = "order", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "order" },
      },
    },
    burn = {
      big = true,
      lines = {
        { id = "b_default", text = "It does, every time. The Light was never meant to dwell in a body like this one, and it lets me know it, but it still comes when I call, and I've decided that matters more than the pain." },
        { id = "b_fpal", when = { class = "PALADIN", race = "Scourge" },
          text = "You know it does, because it hurts you too. Aramis calls it a forge, and I've come to think of it more as a fever; it hurts because something in us is fighting to mend." },
      },
      choices = {
        { text = "Then the pain is worth bearing. Hold to the Light.", next = "BACK", reply = "Thank you, truly, because I don't hear that often in Brill. The burn fades a little each time, or perhaps I'm only learning to carry it better.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Anything that burns you that badly isn't worth keeping.", next = "BACK", reply = "I've heard that from the apothecaries and from my own doubts on the bad nights. But the Light is the only thing that ever answered me after I died, and I'll not throw it away for a little pain.", fx = { align = { light = -1 } } },
        { text = "Do you ever doubt that it really answers you?", tag = "Persuade", next = "doubt",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PALADIN" }, { questDone = TODO_QUEST("Seeking Refuge") } } } },
          fail = { next = "doubt_no", fx = { affinity = -1 } } },
      },
    },
    doubt = {
      lines = {
        { id = "do_default", text = "Every morning, before I open my eyes. I wonder whether the warmth is the Light or only something I've wanted so badly that I've made it up, and then I lay my hands on someone wounded and they get up, and that's the only answer I've ever been given." },
      },
      choices = {
        { text = "That's answer enough, I think.", next = "BACK", fx = { affinity = 2 } },
        { text = "Thank you for telling me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    doubt_no = {
      lines = {
        { id = "dn_default", text = "That's between me and the Light, and I'll thank you to leave it there." },
      },
      choices = { { text = "Of course. Forgive me.", next = "BACK" } },
    },
    distrust = {
      big = true,
      lines = {
        { id = "di_default", text = "Warily. Many in the Dark Lady's service distrust us for our nearness to the Light, and I can't say I blame them, since the Light's own servants still burn our people in the fields west of here. We have to earn their trust, and we have to do it twice as carefully as anyone else." },
        { id = "di_lesson", when = { questDone = TODO_QUEST("A Lesson in Divinity") },
          text = "Better than they did, thanks in part to you. Word of what you did for Falgan has spread among the Deathguard, and I've had two of them nod at me in the street this week, which is two more than last month." },
      },
      choices = {
        { text = "Then we'll earn it slowly, and without tricks.", next = "BACK", reply = "Slowly and honestly is the only way it's ever done, and I'm glad to hear you'll do it with us. Every wound we close in Brill is another stone in that wall.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We don't need their trust. Let our deeds speak.", next = "BACK", reply = "Deeds speak loudly, I'll grant you, but people only listen when they already trust the speaker. I'll keep earning it, if it's all the same to you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bareth = {
      lines = {
        { id = "ba_default", text = "He was carrying a message from the Keep to me when the Scarlet Crusade took him at the Crusader's Outpost. They meant to try him, for nothing more than standing up after he died, and Bareth told me afterward that it was their Light that frightened him most, because it was the same Light as his and it was full of hate." },
      },
      choices = {
        { text = "The same Light? How can that be?", next = "same_light" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    same_light = {
      big = true,
      lines = {
        { id = "sl_default", text = "I don't know, and that frightens me too. The Light doesn't seem to refuse anyone who calls on it with conviction, whether they're dead or hateful or both, so I've come to think it's what we do with it that we'll answer for." },
      },
      choices = {
        { text = "Then the Scarlets will answer for a great deal.", next = "BACK", reply = "They will, and I've wondered whether I'll stand near them when the reckoning comes. I hope that whatever judges us looks at what we've done with our second chance.", fx = { affinity = 1, align = { light = 1 }, learn = { "scarlet_crusade" } } },
        { text = "Then the Light is only a weapon, like any other.", next = "BACK", reply = "If that's so, then I mean to be very careful where I point it. A weapon in kind hands can still mend a broken town.", fx = { align = { light = -1 }, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "Someone who held the Light in life, and lost it for a time after. Most of what came between is gone, or it's somewhere I don't care to look, so judge me by what I do now." },
      },
      choices = {
        { text = "That's fair. Something else.", next = "BACK" },
        { text = "What you do now is enough.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    solace = {
      lines = {
        { id = "so_default", text = "Not answers, I think, but company. When the nights are long and you can't remember who you were, it helps to know that something warm still turns toward you, even now. You don't need to be a paladin to feel that." },
        { id = "so_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "Perhaps nothing, if your own spirits already answer you. But if you ever stand in a dark place and want a warmth that asks nothing of you, the Light is there, and it doesn't care whose army you march with." },
      },
      choices = {
        { text = "I'll remember that, Shari.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow = {
      big = true,
      lines = {
        { id = "sh_default", text = "I didn't ask you to have one. The Dark Lady freed us so that we could choose, and you've chosen differently from me, and that's what freedom looks like. I only ask that you don't stand in my way while I help people." },
      },
      choices = {
        { text = "I won't. We serve the same queen.", next = "BACK", reply = "We do, and she gave us all the freedom to walk different roads, mine with the Light and yours without it. Go well, and come to me if you're ever hurt.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll be watching you all the same, paladin.", next = "BACK", reply = "Watch all you like, because you'll only see me bandaging deathguards and praying over the fallen. I'd rather be watched than ignored, if I'm honest.", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    silver_hand = { { id = "tp_sh", text = "The Silver Hand broke when Lordaeron fell. What's left of it walks in Bandarion Keep now, and it's learning to walk again." } },
    scarlet_crusade = { { id = "tp_sc", text = "They carry the Light like a torch, and they mean to burn us with it. I pray for them, and I'd still cut them down to save Brill." } },
    background = { { id = "tp_bg", text = "I held the Light once, lost it when I rose, and found it again with Danitha's help. That's all of it that matters." } },
    advice = { { id = "tp_ad", text = "When the Light burns, don't flinch from it. The flinch is what people see, and they remember it." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. The Light doesn't tell me everything." } },
  },
}

-- William Pickman: cooking trainer in the Gallows' End Tavern.
P:NPC {
  key = "tf_pickman", id = TODO_NPC("William Pickman"), name = "William Pickman", title = "Cooking Trainer",
  bible = "bibles/brill_forever.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "cheerful" }, values = { "generous", "proud" },
  notices = { "craft", "hunger" },
  impression = {
    first = "William Pickman cooks with great care for guests he can no longer share a meal with. He can't taste a thing and seems determined not to let that stop him.",
    third = "{name} met William Pickman, the cooking trainer at the Gallows' End Tavern in Brill.",
  },

  greetings = {
    { id = "g_default", text = "I can teach you how to cook! Pull up a stool." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "Cooking is a lifelong pursuit, and I see we share the same passion!" },
    { id = "g_back", when = { metBefore = true }, text = "Back in my kitchen! Mind the pot; it's always hotter than it looks." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You've a living stomach, and it's growling, unless I'm much mistaken. That's the best compliment a kitchen can get." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell of woodsmoke and charred meat, and I mean that kindly. That's the smell of somebody who's been practising." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "William Pickman, cook of the Gallows' End. I can teach you how to cook, and I'd be glad to, because there's nothing better for an adventurer to know." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Cooking") },
          text = "Eleanor Shackleton sent you, did she? Good, because a good campfire is the foundation of any good camp, and I'll teach you to build one and cook over it." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Cooking") },
          text = "You can set up camp anywhere in the wild now, though only a small one to start. Raise your cooking and you'll learn to build bigger fires, and the other trainers can show you how to furnish the place." },
        { id = "h_cook", when = { profession = "Cooking" },
          text = "Cooking is a lifelong pursuit, and I see we share the same passion! What can I teach you today?" },
      },
      again = {
        { id = "h_again", text = "Anything else? The stew won't stir itself, but it can wait a moment." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "How do you cook when you can't taste?", next = "taste" },
        { text = "Why does cooking matter for camping?", next = "camp" },
        { text = "Who do you cook for, in a town of the dead?", next = "whofor" },
        { text = "What should I cook out here?", next = "recipes" },
        { text = "Goodbye, William.", next = "END" },
      },
    },
    taste = {
      lines = {
        { id = "t_default", text = "By memory, mostly, and by watching faces. I remember how a stew ought to look when it's right, and I remember how my old customers used to close their eyes over a good bite, and when a living guest does the same, I know I've done it." },
      },
      choices = {
        { text = "That's oddly touching, William.", next = "BACK", fx = { affinity = 1 } },
        { text = "And when they don't close their eyes?", next = "taste2" },
      },
    },
    recipes = {
      lines = {
        { id = "rc_default", text = "Wolf meat, to start with, charred over a good fire, and the hills are full of wolves. Once you've the knack of that, try the spiders, and don't make that face, because a spider leg roasted properly is a fine thing, or so my living guests tell me." },
        { id = "rc_eleanor", when = { questDone = TODO_QUEST("Camping 101: Cooking") },
          text = "Whatever you can catch near your camp! Eleanor Shackleton will tell you a camp's only as good as its fire, and a fire's only as good as what's roasting on it, so start with wolf meat and work your way up." },
      },
      choices = {
        { text = "Wolf meat it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll leave the spiders to you.", next = "BACK" },
      },
    },
    taste2 = {
      lines = {
        { id = "t2_default", text = "Then I've overdone the salt again. It happens more than I'd like to admit, and Innkeeper Renee is kind enough to say nothing about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "Because the fire comes first! Cooking isn't only about tasty food; it's the foundation of your camp, and once you can build a proper fire, you can set up camp anywhere out in the wilderness, rain or Scourge permitting." },
      },
      choices = {
        { text = "Then I'll learn to build a proper fire.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    whofor = {
      big = true,
      lines = {
        { id = "w_default", text = "For the living, mostly, the orcs and trolls off the zeppelin and the odd tauren, and for the dead who like the smell even if they can't taste it. Some of the Forsaken say a dead cook is a waste of a good kitchen, and I tell them a dead cook is the only kind who never eats the stock." },
      },
      choices = {
        { text = "Feeding our living allies is good work, William.", next = "BACK", reply = "Good of you to say so, and they're good folk, even if the orcs eat like a famine's coming. A full belly keeps a grunt on the wall at the Bulwark.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Feeding the living just keeps them weak and dependent.", next = "BACK", reply = "Weak, is it? You'd not say that to the orc who carried three ghouls off the road last week on a bowl of my stew. Allies who eat well fight well, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked before I died, and I cook now. Some things the grave doesn't take from you, so long as you don't let it." } },
    advice = { { id = "tp_ad", text = "Never leave a fire unattended in Tirisfal. The damp puts it out, or the Scarlets see it, and either way you've lost your supper." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me about a stew." } },
  },
}

-- Angie Cilas: a Brill townswoman with an eye on the street.
P:NPC {
  key = "tf_angie", id = TODO_NPC("Angie Cilas"), name = "Angie Cilas",
  bible = "bibles/brill_forever.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "dry" }, values = { "practical", "curious" },
  notices = { "race", "class" },
  impression = {
    first = "Angie Cilas watches Brill's street the way some people watch a play, with dry remarks for every entrance. She seems to know who comes and goes, and what everyone thinks of them.",
    third = "{name} met Angie Cilas, a Forsaken of Brill with a dry word for everyone who passes through the town.",
  },

  greetings = {
    { id = "g_default", text = "Another new face in Brill. They come and go like the fog these days." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Brill must agree with you." },
  },

  notice = {
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "One of Shari Stilwell's paladins. Mind the Deathguard; they pretend not to stare, and they're very bad at pretending." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Off the zeppelin, I'd guess. You'll get used to the smell of Tirisfal, though the smell of Tirisfal will never quite get used to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Angie Cilas. I live here, if you can call it that, and I keep an eye on who passes through. In Brill, that's a full day's work." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, in Brill, walking about as bold as you please. I'd have thought that impossible a year ago, and now there's a trainer for you by the town hall." },
      },
      again = {
        { id = "h_again", text = "Anything else you'd like to know about the neighbours?" },
      },
      choices = {
        { text = "Who passes through Brill these days?", next = "who" },
        { text = "What do people make of Shari's paladins?", next = "paladins" },
        { text = "What's the trouble in Brill?", next = "trouble" },
        { text = "What do you make of the apothecaries?", next = "apoth" },
        { text = "Goodbye, Angie.", next = "END" },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Everyone, lately. Orcs and trolls off the zeppelin from Durotar, newly risen wandering in from Deathknell with dirt still in their hair, and now and then a Deathguard who's been sent out to the Bulwark and come back with that look they all get." },
      },
      choices = {
        { text = "What look is that?", next = "look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = {
        { id = "l_default", text = "Like a man who's counted the Scourge on the other side of the wall and done the sums. Executor Zygand doesn't like them talking about it, so naturally that's all anyone talks about at the Gallows' End." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    paladins = {
      big = true,
      lines = {
        { id = "p_default", text = "Some of Brill thinks they're spies for the Light, and the rest thinks they're the best thing to happen to the town since the apothecaries stopped testing on the neighbours. I haven't decided yet, though I'll admit Shari is very hard to dislike." },
      },
      choices = {
        { text = "They're Forsaken. They deserve the same trust as anyone.", next = "BACK", reply = "That's the fair answer, and I'd like to think Brill will come round to it eventually. Shari's certainly done more for this town than some of those who grumble about her.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Anyone who serves the Light bears watching.", next = "BACK", reply = "Oh, half the town would agree with you, and they say so loudly in the Gallows' End. I watch everyone, myself, so it's no special insult to the paladins.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth = {
      lines = {
        { id = "ap_default", text = "The Royal Apothecary Society? Clever people, very busy, and very quiet about what they're busy with. They pay well for herbs and better for things nobody else wants to touch, and I've learned not to ask which of the two I'm smelling on the wind." },
      },
      choices = {
        { text = "A wise habit.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "t_default", text = "The Scarlets to the west, the Scourge to the east, and the Scarlet converts in the fields who'd happily see us all burned. Take your pick, because Brill has more trouble than it has guards to handle it, and Deathguard Dillinger will tell you so at length." },
      },
      choices = {
        { text = "Then I'll help where I can.", next = "BACK", fx = { affinity = 1, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm from Brill, I died in Brill, and here I still am. It isn't much of a story, but it has a strong sense of place." } },
    advice = { { id = "tp_ad", text = "Never sit with your back to the door at the Gallows' End. Nobody will hurt you, but you'll miss the best gossip." } },
    _none = { { id = "tp_none", text = "Haven't heard a whisper about that, which is rare, so you can be sure nobody in Brill knows." } },
  },
}
