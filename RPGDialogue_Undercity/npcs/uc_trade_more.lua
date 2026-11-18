-- More of the Trade Quarter: Patrick Garrett, sweeping the bat pens beneath his dignity;
-- Raleigh Andrean, the ex-chef who wants his wife's murderer's hands; and Velora Nitely,
-- the armorsmith who lost her sense of humour when she died. Voices: bibles/uc_trade_more.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Patrick Garrett: a Garrett, sweeping bat dung, and he'd like you to know it.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_pgarrett", id = TODO_NPC("Patrick Garrett"), name = "Patrick Garrett",
  bible = "bibles/uc_trade_more.md", role = "worker", tier = "quest",
  communities = { "undercity" }, temper = { "proud", "cheerful" }, values = { "ambitious", "loyal" },
  notices = { "class", "kit" },
  impression = {
    first = "Patrick Garrett sweeps the bat pens by the Undercity's flight master and makes it perfectly clear that the work is beneath a Garrett. He speaks like a lord fallen on hard times and holds his broom like a sceptre.",
    third = "{name} met Patrick Garrett, a proud Forsaken who sweeps the bat pens in the Trade Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Step around the droppings, please, I've only just swept there. The bats have no respect for my labour, none at all." },
    { id = "g_broom", when = { questDone = TODO_QUEST("Reclaimed Treasures") }, text = "Behold, the Garrett family weapon of choice, and the bats tremble before it! You're bloody well worth every silver I spent on you, I say." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's in a dreadful state, if you don't mind my saying. A Garrett would never be seen in public like that, not even a Garrett with a broom." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Patrick Garrett, of the Garretts, though you wouldn't know it to look at me now. Sweeping the bat pens with this broom is not befitting a Garrett, I assure you, but a man must earn his coin somehow." },
        { id = "h_before", when = { minLevel = 38, questBefore = TODO_QUEST("Reclaimed Treasures") },
          text = "You look like someone who goes places, {class}, and I've earned a little coin from this accursed job that I'm willing to spend on you. The Garrett family's chest sits in the South Common Hall of Uldaman, and what's inside it would free me from these pens forever." },
        { id = "h_active", when = { questActive = TODO_QUEST("Reclaimed Treasures") },
          text = "Uldaman, the South Common Hall, the Garrett chest! I'd go myself, but the bats would take the place over in a day, and then where would the flight master be?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I can lean on my broom and talk for a while, it's my one luxury." },
        { id = "h_again2", text = "Go on, the bats are asleep, more or less." },
      },
      choices = {
        { text = "What's in the Garrett family chest?", next = "chest" },
        { text = "Why would the Garretts have a chest in Uldaman?", next = "uldaman" },
        { text = "How bad can sweeping bat pens be?", next = "bats" },
        { text = "Are you related to the flight master?", next = "michael" },
        { text = "I'll leave you to your sweeping.", next = "END" },
      },
    },
    chest = {
      lines = { { id = "ch_default", text = "The Garrett family weapon of choice, locked away since the old days, and I'll say no more than that, because a family must have some secrets. Once it's in my hands, these pens will see a Garrett as he was meant to be seen." } },
      choices = {
        { text = "A weapon? For a bat sweeper?", next = "chest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chest2 = {
      lines = { { id = "c2_default", text = "Do you think the bats will respect an ordinary broom? They won't, I've tried. They need to understand that they're dealing with a Garrett, and for that I need the family weapon." } },
      choices = { { text = "Something else, Patrick.", next = "BACK" } },
    },
    uldaman = {
      lines = { { id = "ul_default", text = "We Garretts toiled there as diggers once, for the dwarves' Explorers, back when the Badlands were only bad and not yet unbearable. Honest labour, mind you, but labour with a certain dignity to it, and we kept our chest in the common hall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bats = {
      big = true,
      lines = { { id = "ba_default", text = "They eat, they sleep upside down, and the rest I'd rather not describe, all day and all night, and I have to sweep up after every one of them. A Garrett was made for better things, and I'll have them yet." } },
      choices = {
        { text = "Honest work is nothing to be ashamed of.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You deserve better. Reach for it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    michael = {
      lines = { { id = "mi_default", text = "Michael Garrett keeps the bats and I keep their floor, and whether that makes us family is a question I prefer not to answer in public. Let us say that all Garretts are distinguished, but some are more distinguished than others." } },
      choices = { { text = "Something else, Patrick.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Garretts are an old family, and I'm the oldest of what's left of it. I'd rather not say how much is left." } },
    advice = { { id = "tp_ad", text = "Always stand up straight, even when you're shovelling dung. Especially then, actually." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside a Garrett's expertise, which is narrower than it once was." } },
  },
}

---------------------------------------------------------------------------
-- Raleigh Andrean: feels nothing for his wife, and wants her killer's hands.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_raleigh", id = TODO_NPC("Raleigh Andrean"), name = "Raleigh Andrean", title = "Ex-Chef",
  bible = "bibles/uc_trade_more.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "grim", "calm" }, values = { "vengeful" },
  notices = { "race", "class" },
  impression = {
    first = "Raleigh Andrean was a chef once, and his wife Deliah was murdered by his closest friend. He says plainly that he can no longer grieve for her, but the wish for revenge still burns in him, and it's the only warm thing about him.",
    third = "{name} met Raleigh Andrean, a Forsaken ex-chef in the Trade Quarter who wanted revenge for his wife's murder.",
  },

  greetings = {
    { id = "g_hi", text = "If you're looking for a cook, I'm no longer one. Try the inn." },
    { id = "g_ring", when = { questActive = TODO_QUEST("Raleigh and the Undercity") }, text = "That ring you're carrying, let me see it. Yes, I know it, because I gave it to my wife." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You still have a sense of taste, I suppose. Use it while you can, because I promise you'll miss it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Raleigh Andrean, once a chef, and once a husband, and neither of those things is true any longer. The Scourge took me, the Dark Lady freed me, and somewhere in between I stopped feeling most of what a man ought to feel." },
        { id = "h_ring", when = { questDone = TODO_QUEST("Raleigh and the Undercity"), questBefore = TODO_QUEST("A Husband's Revenge") },
          text = "Valdred, once my good friend, murdered my wife, and although I can't grieve, I do yearn for revenge. I last heard he was at the Greymane Wall in southern Silverpine, trying to slip into Gilneas, so bring me his cursed hands." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Husband's Revenge") },
          text = "I keep his hands in a box under my bench, and I look at them some evenings. It doesn't bring her back, and I didn't expect it to, but it's the only thing that still feels like anything at all." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask it, then." },
        { id = "h_again2", text = "I have nowhere to be. Go on." },
      },
      choices = {
        { text = "Who was Deliah?", next = "deliah" },
        { text = "Why did Valdred kill her?", next = "valdred" },
        { text = "How can you want revenge but feel no grief?", next = "feeling" },
        { text = "Why did you stop cooking?", next = "chef" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    deliah = {
      lines = { { id = "de_default", text = "My wife, in Brill, back when Brill was a village with an inn and a market and not a camp for the dead. Her fate was the fate of all who failed to endure those times, and I find I feel nothing for her death, nor for the story of what was done with her body." } },
      choices = {
        { text = "And the ring?", next = "ring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ring = {
      lines = { { id = "ri_default", text = "I gave it to her the summer I was made head cook at a lord's table in Lordaeron, and I meant every word I said that day. Keep it, if you want it, because it's a bauble now, and the hands are all I care to keep." } },
      choices = { { text = "Something else, Raleigh.", next = "BACK" } },
    },
    valdred = {
      lines = { { id = "va_default", text = "I don't know why, and I find I don't care why, which troubles me less than it should. He was my friend for twenty years, he ate at my table, and his hands did it, so it's his hands I want." } },
      choices = {
        { text = "Did Valdred become one of the dead too?", next = "valdred2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valdred2 = {
      lines = { { id = "v2_default", text = "No, he lived, and ran south to the Greymane Wall hoping the Gilneans would open their gate for him. They won't, they don't open it for anyone, so he'll be standing there waiting, with his hands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feeling = {
      big = true,
      lines = { { id = "fe_default", text = "Grief is for the living, who can still be hurt by what they've lost. Revenge is simpler, because it only needs to know who did it, and I know exactly who did it." } },
      choices = {
        { text = "Then he should pay for what he did.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Revenge won't give you anything back. Let it go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chef = {
      lines = { { id = "cf_default", text = "Because I can't taste anything now, and a cook who can't taste is only a man who burns things. I still know every recipe, though, and sometimes I recite them in my head to remember what saffron was like." } },
      choices = { { text = "Something else, Raleigh.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked for lords and their guests for fifteen years. Not one of them ever asked my name." } },
    advice = { { id = "tp_ad", text = "Eat well while you still can, and trust no one who praises your cooking too much." } },
    _none = { { id = "tp_none", text = "I don't know, and I find I don't much care, which is how most questions go with me now." } },
  },
}

---------------------------------------------------------------------------
-- Velora Nitely: Lordaeron's finest armorsmith, still telling jokes that don't land.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_velora", id = TODO_NPC("Velora Nitely"), name = "Velora Nitely",
  bible = "bibles/uc_trade_more.md", role = "blacksmith", tier = "quest",
  communities = { "undercity" }, temper = { "cheerful", "grim" }, values = { "honest", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Velora Nitely was one of the finest armorsmiths in Lordaeron, they say, and she still works the anvil in the Trade Quarter. She tells jokes out of old habit, and they fall flat, and she notices every time.",
    third = "{name} met Velora Nitely, a Forsaken armorsmith in the Trade Quarter who makes brutal legguards.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome to the finest forge in the Undercity, which isn't saying much, because it's mostly sewers. That was a joke." },
    { id = "g_bones", when = { questActive = TODO_QUEST("Dragonmaw Shinbones") }, text = "Any shinbones yet? Sturdy ones, mind, and test them, because if you can snap one with your bare hands it's no good to me." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, good, so you'll know why I hate a cold anvil. You do know, don't you?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's falling apart, so either you've had a terrible week or a wonderful one. Which was it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Velora Nitely, armorsmith, and I used to be the best in Lordaeron, or so the lords told me when they wanted a discount. These days I don't care much for my craft, but it beats being a mindless minion of the Scourge, I suppose." },
        { id = "h_brutal", when = { questActive = TODO_QUEST("Velora Nitely and the Brutal Legguards") },
          text = "Thun'grim in the Barrens sent you for the brutal legguards, did he? I can make them, but I'll need materials, and the materials are attached to some rather angry orcs in the Wetlands." },
        { id = "h_done", when = { questDone = TODO_QUEST("Brutal Legguards") },
          text = "How do the legguards fit? Let me know if you need any changes, I aim to please, or at least I used to aim to please." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, though I'm hammering too." },
        { id = "h_again2", text = "Ask. If I don't know, I'll make something up, and it'll be funnier than the truth." },
      },
      choices = {
        { text = "Why tell jokes if they don't land?", next = "jokes" },
        { text = "Why Dragonmaw shinbones?", next = "shinbones" },
        { text = "Who were you making armour for, before?", next = "before" },
        { text = "What makes armour brutal?", next = "brutal" },
        { text = "Can you show a smith your methods?", next = "methods", when = { profession = "Blacksmithing" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    jokes = {
      big = true,
      lines = { { id = "jo_default", text = "Because I used to be funny, everyone said so, and I keep hoping that one day a joke will come out the way it used to. Here's one: a Dragonmaw orc walks into my forge and limps out without his shins. You're not laughing, are you?" } },
      choices = {
        { text = "I'll laugh anyway, to be kind.", next = "jokes_kind", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "No. But keep trying. It'll come back.", next = "jokes_honest", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jokes_kind = {
      lines = { { id = "jk_default", text = "You're laughing at me rather than at the joke, I can tell, but I'll take it. Kindness from the living is rarer down here than good iron." } },
      choices = { { text = "Something else, Velora.", next = "BACK" } },
    },
    jokes_honest = {
      lines = { { id = "jh_default", text = "Honest, at least, and that's worth more to an armorsmith than flattery. A smith who's lied to about a weak seam ends up burying the customer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shinbones = {
      lines = { { id = "sh_default", text = "The Dragonmaw orcs in the Wetlands have nice thick shinbones, perfect for bracing a brutal legguard, and I need eight of them. They must be sturdy, though, so test each one, and if it snaps in your hands, throw it away and find a sturdier orc." } },
      choices = {
        { text = "That's grim, Velora.", next = "grim" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } },
      },
    },
    grim = {
      lines = { { id = "gr_default", text = "It's armour, {class}, and armour has always been made from whatever the last war left lying about. Besides, the Dragonmaw won't be needing them once you've finished." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },
    before = {
      lines = { { id = "be_default", text = "Knights of the Silver Hand, lords of the court, and once a breastplate for a prince who wanted his initials worked into the steel. I'd rather not say which prince, since he's the reason I'm dead." } },
      choices = { { text = "Something else, Velora.", next = "BACK" } },
    },
    brutal = {
      lines = { { id = "br_default", text = "Thick plates, heavy bracing, and no decoration at all, because the whole point is to look like you'd survive anything. Thun'grim in the Barrens does the gauntlets, Orm Stonehoof in Thunder Bluff does the helm, and I do the legs, which is the best part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    methods = {
      lines = { { id = "me_default", text = "Use the tongs for everything, even what you'd have held bare-handed in life, because you can't feel the heat any longer and you'll burn your fingers to the bone without noticing. That's a Forsaken smith's first lesson, and most of us learned it the hard way." } },
      choices = { { text = "Something else, Velora.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I apprenticed in Lordaeron's armouries at twelve and was the master there at thirty. I'm not sure what age I am now." } },
    advice = { { id = "tp_ad", text = "Always check the straps before the plates. A good plate on a bad strap is just a weight." } },
    _none = { { id = "tp_none", text = "No idea, but I'll pretend I know if you'd like. That was a joke too." } },
  },
}
