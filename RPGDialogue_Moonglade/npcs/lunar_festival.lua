-- Fariel Starsong, Valadar's sister, who trades fireworks and festive recipes for coins of ancestry
-- at the Lunar Festival. Voice: bibles/fariel.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "fariel", id = TODO_NPC("Fariel Starsong"), name = "Fariel Starsong", title = "Coin of Ancestry Collector",
  bible = "bibles/fariel.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "cheerful", "chatty" }, values = { "generous", "family" },
  notices = { "craft", "race", "level" },

  impression = {
    first = "Fariel Starsong runs the Lunar Festival's stalls with her brother Valadar, trading rockets and festive recipes for coins of ancestry. She loves fireworks rather more than her solemn brother thinks proper.",
    third = "{name} met Fariel Starsong, who trades festival fireworks and recipes for coins of ancestry in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Nighthaven! Have you honored any elders yet? Show me your coins and I'll show you something that goes bang." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The festival's begun, and the sky over the lake will be full of rockets tonight! Come and see what your coins can buy." },
    { id = "g_bought", when = { questDone = TODO_QUEST("Small Rockets") }, text = "You're the one who bought my small rockets! Did you set them off by the lake? Tell me you set them off by the lake." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and just in time for something, I'm sure. There's always something to celebrate if you look." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, you'll want the launcher recipes, I can see it in your eyes. Promise me you'll stand well back the first time." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor, good! I've festive patterns that'll have the whole of Darnassus asking where you got your clothes." },
    { id = "n_young", cat = "level", when = { maxLevel = 20 },
      text = "You're very young to have come all the way to Moonglade, and that's lovely. The elders like the young ones best, I think, though they'd never say so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Fariel Starsong, and my brother Valadar and I keep the Lunar Festival in Nighthaven. He handles the solemn part, the elders and the blessings, and I handle the coins of ancestry and the fireworks, which I think is the better half." },
        { id = "h_festival", when = { holiday = "lunar" },
          text = "Every elder you honor gives you a coin of ancestry, and I'll trade you rockets, launchers and festive recipes for them. Small rockets, large rockets, cluster rockets, and the launchers to fire them from, if you've the coins and the nerve." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, are you? Then welcome; the festival belongs to everyone who honors their elders, and I've seen tauren set off rockets with more joy than any night elf alive." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk about fireworks until the moon sets, so do stop me." },
        { id = "h_again2", text = "Go on, ask me something. Valadar says I talk too much; let's prove him right." },
      },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "What are coins of ancestry?", next = "coins" },
        { text = "Why fireworks?", next = "fireworks" },
        { text = "Tell me about Valadar.", next = "valadar" },
        { text = "Which recipes do you have for an engineer?", next = "xeng", when = { profession = "Engineering" } },
        { text = "Show me what the coins can buy.", next = "BUSINESS" },
        { text = "Enjoy the festival, Fariel.", next = "END" },
      },
    },
    festival = {
      lines = {
        { id = "f_default", text = "It's the celebration of the new year and of the elders who came before us, all the ancestors whose wisdom we stand on. The druids open Moonglade to everyone for it, and the elders' spirits rest in the cities and the wilds, waiting to be honored." },
      },
      choices = {
        { text = "Do the elders really walk among us?", next = "elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = {
        { id = "e_default", text = "Their spirits do, during the festival, in the old places: by the trees, in the hills, in the cities' quiet corners. Honor one and they'll give you a coin of ancestry, and a little of their blessing besides." },
      },
      choices = {
        { text = "Why honor the dead at all?", next = "elders_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders_why = {
      big = true,
      lines = {
        { id = "ew_default", text = "Because everything we have, they built or fought for or planted, and they never saw most of it grow. Valadar puts it more beautifully, but I'd say it's simply good manners to thank someone, even if they've been gone a thousand years." },
      },
      choices = {
        { text = "We owe them everything. Honor them well.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The dead had their time. We make our own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coins = {
      lines = {
        { id = "c_default", text = "Little silver coins with the moon struck on them, given by the elders to those who seek them out. I collect them, and in return I hand out rockets and recipes, which keeps everyone travelling and everyone happy." },
      },
      choices = {
        { text = "What do you do with all the coins?", next = "coins_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coins_where = {
      lines = {
        { id = "cw_default", text = "I keep them safe, and I count them more often than I should. Each one is someone remembering someone, and I can't think of anything better to have a chest full of." },
      },
      choices = {
        { text = "That's a lovely way to see it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fireworks = {
      lines = {
        { id = "fw_default", text = "Because you can't say thank you to a thousand years of ancestors quietly, can you? Valadar would have us all whisper prayers by candlelight, and I'd have the whole sky over Lake Elune'ara blooming red and green and gold, so we compromise and do both." },
      },
      choices = {
        { text = "Don't the druids mind the noise?", next = "druids_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids_mind = {
      big = true,
      lines = {
        { id = "dm_default", text = "Some of them grumble that it frightens the owls, and Rabine once asked me, very politely, to aim them further from his garden. But the Keeper watched the first launch from the hill last year, and I swear he smiled." },
      },
      choices = {
        { text = "Then aim them higher and keep the owls happy.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A festival should be loud. Let them grumble.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valadar = {
      lines = {
        { id = "v_default", text = "My brother is the most patient soul in Kalimdor, and he'll tell you that's because he has to be, with a sister like me. He talks to the elders like old friends, and every year he says we'll bake fewer cakes, and every year I bake more." },
      },
      choices = {
        { text = "Do you two ever really argue?", next = "argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argue = {
      big = true,
      lines = {
        { id = "a_default", text = "Only about whether the festival is a celebration or a vigil, and we've been having that argument for a very long time. I think the elders would want to see us laugh, and he thinks they'd want to see us remember, and I suspect we're both right." },
      },
      choices = {
        { text = "Remembering matters most. Valadar has the right of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Laugh while you can. That's how to honor them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xe_default", text = "Launchers, mostly: a firework launcher, a cluster launcher, and the rocket recipes to feed them. Build one, load it, and on a clear night by the lake you'll understand why I gave my coins away for the plans in the first place." },
      },
      choices = {
        { text = "I'll build one and stand well back.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The druids are kind enough to let us have their glade every year, and patient enough not to complain about the smoke, much." } },
    background = { { id = "tp_bg", text = "Valadar's sister, festival keeper, and the only elf in Nighthaven who owns more rockets than candles." } },
    advice = { { id = "tp_ad", text = "Honor the elders in the hills as well as the ones in the cities. The ones in the hills get lonely." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, but ask Valadar; he knows everything solemn." } },
  },
}
