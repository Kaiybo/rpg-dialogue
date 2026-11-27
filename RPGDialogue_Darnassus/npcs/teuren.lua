-- Teuren Vineshade, barber of Darnassus (Forever only). Voice: bibles/teuren.md
-- Cuts, colours, beards, piercings and kaldorei markings; vain about his craft, kind about everyone else's looks.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dar_teuren", id = TODO_NPC("Teuren Vineshade"), name = "Teuren Vineshade", title = "Barber", gender = "male",
  bible = "bibles/teuren.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "chatty" }, values = { "beauty", "craft", "friendly" },
  notices = { "beard", "markings", "weathered" },

  impression = {
    first = "He studies every face like a garden he's been asked to tend.",
    third = "{name} met Teuren Vineshade, the barber of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome back, friend! Sit; I've a new style just for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome. Sit down, if you must, and let me see what the wind has done to your hair." },
    { id = "g_default", text = "Welcome to my barbershop! Cuts, colours and more; have a seat and we'll get to work." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Either you loved it or you hated it, and I'm hoping for the first." },
    { id = "g_fl_face", when = { flirt = true, chance = 0.4 },
      text = "Oh, now that is a face I would cross the sea for! Sit down, sit down, and let me pretend I'm studying your parting rather than simply admiring you." },
    { id = "g_fl_back", when = { flirt = true, npcFlagBefore = "fl_muse" }, cooldown = "3d",
      text = "My muse returns! I've sketched a dozen styles for you since you left, and not one of them did you justice, so you'll simply have to sit for me again." },
    { id = "g_fl_no", when = { flirt = true, npcFlagBefore = "fl_no" }, once = true,
      text = "Welcome back! Strictly scissors today, I promise; I've put my compliments away in a drawer, where they are sulking terribly." },
    { id = "g_away", when = { away = 21 }, text = "Gone {away}, and it shows, my friend. Sit, sit, before something nests in there." },
  },

  notice = {
    { id = "n_beard", cat = "beard", when = { race = "Dwarf" },
      text = "Now that is a beard with a history! I'll not touch a braid without your leave, but I'd dearly love to." },
    { id = "n_marks", cat = "markings", when = { race = "NightElf", class = "DRUID" },
      text = "Your markings are fading at the edges. A druid's face should say what it means, so let me freshen them." },
    { id = "n_weather", cat = "weathered", when = { minLevel = 40 },
      text = "You've been somewhere with endless wind and very little water, by the look of your hair. Sit down at once." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Teuren Vineshade, at your service. We groom beards, cut and colour hair, set piercings and ink kaldorei markings, anything you might need to look like yourself, only more so." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, in my chair! Your hair grows so quickly, you know; you could try a new style every season and never repeat yourself in a lifetime." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! I'll need the low stool, and I'll need you to tell me whether that colour is natural, because I'd like to know how to make it." },
      },
      again = {
        { id = "h_again", text = "What else? Mind your head, the vines hang low." },
        { id = "h_again2", text = "Ask away, I talk better with a comb in my hand." },
      },
      choices = {
        { text = "I'd like a new look.", next = "BUSINESS" },
        { text = "What do the markings mean?", next = "markings" },
        { text = "Why does Darnassus need a barber?", next = "why" },
        { text = "Who sits in your chair?", next = "who" },
        { text = "Would you trim a dwarf's beard?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "You're staring, Teuren. Is something wrong with my hair?", next = "fl_stare", when = { flirt = true } },
        { text = "What's the hardest cut you've ever done?", next = "w_hard" },
        { text = "Farewell, Teuren.", next = "END" },
      },
    },
    fl_stare = {
      lines = {
        { id = "fl_stare_default", text = "Wrong? Nothing in the world, and that's precisely the trouble, because a barber looks for something to fix and I can't find a thing. I've cut hair for a very long time, and I'll confess I would rather just look at yours." },
        { id = "fl_stare_dwarf", when = { race = "Dwarf" },
          text = "Wrong? Nothing, and that's the trouble! Braids like those take years, and I've half a mind to ask how they're done and the other half to sit here admiring them, and I can't decide which half is winning." },
        { id = "fl_stare_gnome", when = { race = "Gnome" },
          text = "Wrong? Not at all! I've simply never seen hair so bright, nor a smile so near the height of my comb, and I'm trying to remember how one holds a pair of scissors." },
        { id = "fl_stare_human", when = { race = "Human" },
          text = "Wrong? Nothing, and that's the trouble! You humans grow lovelier in a single season than we manage in a century, which hardly seems fair, and I've decided I don't mind in the least." },
      },
      choices = {
        { text = "A good haircut lifts the spirit.", next = "BACK", reply = "It does! Nobody ever faced a dragon feeling worse for a tidy braid.", fx = { align = { light = 1 } } },
        { text = "Haircuts are vanity.", next = "BACK", reply = "Then look shaggy.", fx = { align = { light = -1 } } },
        { text = "Then admire away, Teuren. I'll sit as long as you like.", next = "fl_stare2",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_muse" } } } },
        { text = "Flattery won't earn you a bigger tip, Teuren.", next = "fl_stare2",
          reply = "Won't it? Then I'll flatter you for nothing, which is the purest kind there is.",
          fx = { trait = { witty = 1 }, npcFlag = { set = { "fl_muse" } } } },
        { text = "Just the trim, please, Teuren. Nothing more.", next = "BACK",
          reply = "Just the trim, of course, and I'll keep my eyes on the scissors, where they belong.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "fl_no" } } } },
        { text = "Save the poetry for your other customers.", next = "BACK",
          reply = "Ah, but my other customers have heard all my poetry, and you were a fresh audience. I'll mind my manners, I promise.",
          fx = { affinity = -1, npcFlag = { set = { "fl_no" } } } },
      },
    },
    fl_stare2 = {
      lines = {
        { id = "fl_stare2_default", text = "Then sit, and I'll do your hair as though Elune herself were coming to supper, and when you walk out every head on the Terrace will turn. I'll tell them who cut it, naturally, but I'll be thinking of who wore it." },
      },
      choices = {
        { text = "Make it worth turning heads for, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    markings = {
      lines = {
        { id = "ma_default", text = "Some are family, some are vows, and some are simply beautiful, and I ask before I ink which kind you want. The Sentinels favour the old patterns across the eyes; the young ones off the boat from Auberdine want something new every month." },
      },
      choices = {
        { text = "The old patterns should be kept as they are.", next = "BACK", reply = "The Sentinels would kiss you for saying so, though they'd never admit it. There is a weight in an old line that a new one has to earn over centuries.", fx = { align = { order = 1 } } },
        { text = "A face is your own. Change it as you like.", next = "BACK", reply = "Spoken like one of the young ones off the Auberdine boat, and I do not mind it at all. Sit down, and tell me what you want people to see when they look at you.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because ten thousand years is a long time to wear the same hair, and we've a new city and a new tree to grow into. A new home asks for a new face now and then, and I'm happy to provide it." },
      },
      choices = {
        { text = "Do the priestesses approve?", next = "why_temple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_temple = {
      lines = {
        { id = "wt_default", text = "Some of them come in after dark with their hoods up and ask for something subtle. I keep their secrets, as a barber should, and Elune has never once complained about a tidy fringe." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    who = {
      lines = {
        { id = "wo_default", text = "Sentinels before a long patrol, druids back from the Moonglade with leaves in their hair, and more humans and dwarves every week now the boats run. Everyone talks in the chair, and I hear more news than the Temple does." },
      },
      choices = {
        { text = "What news have you heard?", next = "who_news" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_news = {
      lines = {
        { id = "wn_default", text = "That Ashenvale's fighting gets worse each season, that the Warsong are cutting deeper into the trees, and that every Sentinel I trim comes back a little more tired. I'd rather cut hair for weddings, but I cut it for whoever comes.",
          fx = { learn = { "warsong" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "Trim it? I'd sooner trim the Temple roof without asking the High Priestess. I'll comb it, oil it and re-braid it, and I'll give you every hair back that I take, if that's your custom." },
      },
      choices = {
        { text = "Comb it, then, and gently, please.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_hard = {
      lines = {
        { id = "w_hard_default", text = "A Sentinel captain who wanted her hair cut short for the first time in four thousand years, the night before she left for Ashenvale. She sat in that chair without a word while I worked, and I have never been so afraid of my own scissors." },
      },
      choices = {
        { text = "Why did she want it cut?", next = "w_hard2" },
        { text = "Four thousand years is a long time to grow.", next = "w_hard2" },
      },
    },
    w_hard2 = {
      lines = {
        { id = "w_hard2_default", text = "She said a helmet sits better without it, which was true, and that she wanted to look like someone new when she reached the front, which was the real reason. I kept a lock of it for her, in a little silk bag, in case she wanted it when she came back." },
        { id = "w_hard2_w1", when = { race = "NightElf" }, text = "You are kaldorei, so you know what it means for us to cut our hair. Not many outlanders understand why she wept a little when she saw it." },
      },
      choices = {
        { text = "Did she come back for it?", next = "BACK" },
        { text = "Something else, Teuren.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've been tidying kaldorei heads since long before this city stood, and I'll be tidying them long after you've gone grey, I expect." } },
    advice = { { id = "tp_ad", text = "Wash it, comb it, and don't cut it yourself the night before a battle. I've seen what happens." } },
    _none = { { id = "tp_none", text = "Now that I couldn't say, but sit a while and someone in the chair will know." } },
  },
}
