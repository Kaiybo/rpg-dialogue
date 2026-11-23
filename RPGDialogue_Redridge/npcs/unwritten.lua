-- Redridge folk with no conversation yet: Bernard Brubaker, who sells leather armour from a hill
-- east of Stonewatch Falls.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bernard Brubaker: leather armor merchant on the hill east of Stonewatch Falls.
P:NPC {
  key = "rr_bernard_brubaker", id = TODO_NPC("Bernard Brubaker"), name = "Bernard Brubaker", title = "Leather Armor Merchant", gender = "male",
  role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "gruff", "wry" }, values = { "practical", "brave" },
  notices = { "kit", "craft" },
  impression = {
    first = "He sells armour on a hill nobody sane would camp on.",
    third = "{name} met Bernard Brubaker, who sells leather armour on a hill east of Stonewatch Falls.",
  },
  greetings = {
    { id = "g_default", text = "Customer! Come up, come up, and keep your head down, because the gnolls throw rocks at anything that moves on this hill." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing. That's a fine advertisement for my leathers, that is." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather yourself, I can tell from your fingers. Then you'll know good stitching when you see it, so look closely." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's seen better days, friend, and so have you. Buy something before the next gnoll finishes the job." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bernard Brubaker, leather armour for the bold and the unlucky. I set up out here because nobody fights the Redridge gnolls in their Sunday best, and they all come past this hill sooner or later." } },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've a rock-thrower to watch." },
        { id = "h_again2", text = "Go on, ask, but keep an eye on the ridge for me." },
      },
      choices = {
        { text = "Why sell out here, instead of Lakeshire?", next = "why" },
        { text = "What's happening at Stonewatch?", next = "stonewatch" },
        { text = "Let me see the leathers.", next = "BUSINESS" },
        { text = "Good luck up here, Bernard.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Lakeshire's got shops enough, and the folk there buy fish, not armour. Out here every fighter who's lost a jerkin to a gnoll comes stumbling past, and I'm the only merchant for a mile who isn't a corpse." } },
      choices = {
        { text = "Profiting from the war, then.", next = "profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    profit = {
      lines = { { id = "p_default", text = "Somebody has to, and better a man who sells honest leather than one who sells shoddy goods at Lakeshire prices. I've kept more fools alive with my stitching than the Redridge watch ever has." } },
      choices = {
        { text = "An honest trade is honest, wherever it's done.", next = "BACK", reply = "That's it exactly. You've a head on your shoulders, keep it there.", fx = { align = { honor = 1 } } },
        { text = "A clever man finds the gap and fills it.", next = "BACK", reply = "Clever, honest, whichever. I fill the gap and the gap pays well.", fx = { align = { honor = -1 } } },
      },
    },
    stonewatch = {
      lines = { { id = "s_default", text = "The Blackrock orcs have the keep, and the gnolls run their errands, and the whole valley below's crawling with both. Magistrate Solomon keeps writing to Stormwind for soldiers, and Stormwind keeps not sending them.", fx = { learn = { "stonewatch_keep", "redridge_gnolls" } } } },
      choices = { { text = "Then I'll clear a few myself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Tanner's son from Lakeshire. I learned the trade from my father, and the nerve from somewhere else entirely." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask in Lakeshire, they've time for gossip down there." } },
  },
}

---------------------------------------------------------------------------
-- Madison: a little girl of Lakeshire, wandering from the fields behind Alma Jainrose's to the docks.
---------------------------------------------------------------------------
P:NPC {
  key = "rr_madison", id = 848, name = "Madison", gender = "female",
  role = "child", tier = "service",
  communities = { "lakeshire" }, temper = { "cheerful" }, values = { "family" },
  notices = { "race", "class" },
  impression = {
    first = "A little girl in a muddy dress skips along the path from the fields to the Lakeshire docks, a dandelion in one fist and a stick in the other.",
    third = "{name} met Madison, a little girl of Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Are you an adventurer? You look like an adventurer, because you've got a sword and you're all dirty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Madison, and I'm going to the docks to look at the fish, and then I'm going back to the fields to look at the flowers. Mama says I'm not allowed past the bridge because of the gnolls." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "You've got the biggest beard I ever saw! Can I touch it? Mama says I shouldn't ask, but I already did." },
      },
      again = { { id = "h_again", text = "Do you want to know anything else? I know lots of things." } },
      choices = {
        { text = "What do you know about the gnolls?", next = "gnolls" },
        { text = "What do you like best about Lakeshire?", next = "lakeshire" },
        { text = "Run along home, now.", next = "END" },
      },
    },
    gnolls = {
      lines = { { id = "g2_default", text = "They're big and smelly and they live in the hills, and they steal things and hurt people. Mister Solomon says the guards will chase them away, but they haven't yet, and I think they should hurry up." } },
      choices = {
        { text = "I'll chase them away for you.", next = "chase" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chase = {
      lines = { { id = "c_default", text = "Really? Promise? If you do, I'll pick you the biggest flower in the whole field, even bigger than this one, and this one is very big." } },
      choices = { { text = "That's a deal.", next = "BACK", fx = { affinity = 1 } } },
    },
    lakeshire = {
      lines = { { id = "l_default", text = "The lake, because you can see the fish and sometimes a big one jumps up and goes splash. Also Missus Jainrose's garden, but don't tell her I go in it." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know that one. You should ask a grown-up, they know boring things." } } },
}

---------------------------------------------------------------------------
-- Erin: a little girl of Lakeshire who plays with Hannah near the town.
---------------------------------------------------------------------------
P:NPC {
  key = "rr_erin", id = 850, name = "Erin", gender = "female",
  role = "child", tier = "service",
  communities = { "lakeshire" }, temper = { "bossy", "cheerful" }, values = { "family", "play" },
  notices = { "race" },
  impression = {
    first = "A little girl with her hair in two crooked braids is very busy telling another child what to do.",
    third = "{name} met Erin, a little girl of Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "We're playing guards and gnolls, and I'm the guard captain, so you have to be a gnoll unless you're a real hero." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "You're littler than my papa but bigger than me, so you can be my lieutenant if you want!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Erin, and that's Hannah, and she's my best friend even though she always wants to be the gnoll. Are you a real hero? You look a bit like a real hero." } },
      again = { { id = "h_again", text = "What else? Hurry, Hannah's sneaking up on the bridge." } },
      choices = {
        { text = "I'm a real hero, yes.", next = "hero" },
        { text = "Why play at gnolls, of all things?", next = "why" },
        { text = "Off you go and play.", next = "END" },
      },
    },
    hero = {
      lines = { { id = "he_default", text = "Then you have to fight the real gnolls up in the hills, because Papa says the guards aren't enough and Mister Solomon writes letters that nobody answers." } },
      choices = {
        { text = "I'll fight them, I promise.", next = "BACK", reply = "Hooray! I'll tell Hannah you're on our side.", fx = { align = { honor = 1 } } },
        { text = "Heroes get paid first, little one.", next = "BACK", reply = "That's not how heroes work in stories, you know.", fx = { align = { honor = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because everyone's scared of them, and if you play at it, you're not scared as much. Mama says that's very wise for a girl my age, but she still won't let me past the bridge." } },
      choices = {
        { text = "Your mama is right about the bridge.", next = "bridge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bridge = {
      lines = { { id = "b_default", text = "I know, I know, everybody says it, and I only went across once and it was only a little way. Don't tell her, all right?" } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know that, but Hannah might, she listens at the inn window." } } },
}

---------------------------------------------------------------------------
-- Hannah: Erin's playmate in Lakeshire, who always plays the gnoll.
---------------------------------------------------------------------------
P:NPC {
  key = "rr_hannah", id = 851, name = "Hannah", gender = "female",
  role = "child", tier = "service",
  communities = { "lakeshire" }, temper = { "shy", "curious" }, values = { "family", "play" },
  notices = { "class" },
  impression = {
    first = "A small girl peeks at you from behind a fencepost, growling softly to herself.",
    third = "{name} met Hannah, a little girl of Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Grr! Oh, sorry, I thought you were Erin, and I'm meant to be a gnoll, so I have to growl at everybody." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "Is that your pet? Can it growl better than me? I bet it can, but please don't tell Erin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Hannah, and I always play the gnoll because Erin always wants to be the captain, and somebody has to lose. I don't mind, really, because gnolls get to hide in the best places." } },
      again = { { id = "h_again", text = "Do you want to ask me something else? I'm good at answers when Erin isn't listening." } },
      choices = {
        { text = "Have you ever seen a real gnoll?", next = "real" },
        { text = "Don't you mind always losing?", next = "lose" },
        { text = "Good hiding, Hannah.", next = "END" },
      },
    },
    real = {
      lines = { { id = "r_default", text = "Once, from the inn window, far away on the hill, and it was much bigger than me and much scarier than my growl. I listen at the inn window a lot, and the soldiers say the gnolls work for orcs now, which is even worse." } },
      choices = {
        { text = "What else do the soldiers say?", next = "soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers = {
      lines = { { id = "s_default", text = "That Stonewatch Keep is full of orcs, and that a big orc called Gath'Ilzogg is the worst of them, and that somebody ought to do something. Then they order more ale, so I don't think it's going to be them." } },
      choices = { { text = "Maybe it'll be me. Something else.", next = "BACK" } },
    },
    lose = {
      lines = { { id = "l_default", text = "A little bit, but Erin's my best friend, and best friends let each other win sometimes. Mama says that's called being gracious." } },
      choices = {
        { text = "Your mama's right. That's real kindness.", next = "BACK", reply = "I'll tell her a hero said so!", fx = { align = { honor = 1 } } },
        { text = "You should make Erin lose sometimes too.", next = "BACK", reply = "Ooh, maybe I will, the very next game.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I can listen at the inn window and find out." } } },
}
