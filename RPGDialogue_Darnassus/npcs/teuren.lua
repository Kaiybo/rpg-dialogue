-- Teuren Vineshade, barber of Darnassus (Forever only). Voice: bibles/teuren.md
-- Cuts, colours, beards, piercings and kaldorei markings; vain about his craft, kind about everyone else's looks.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dar_teuren", id = TODO_NPC("Teuren Vineshade"), name = "Teuren Vineshade", title = "Barber",
  bible = "bibles/teuren.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "chatty" }, values = { "beauty", "craft", "friendly" },
  notices = { "beard", "markings", "weathered" },

  impression = {
    first = "Teuren Vineshade cuts hair, trims beards and inks kaldorei markings in Darnassus, and he studies every face that comes through his door as if it were a garden he'd been asked to tend.",
    third = "{name} met Teuren Vineshade, the barber of Darnassus.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to my barbershop! Cuts, colours and more; have a seat and we'll get to work." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Either you loved it or you hated it, and I'm hoping for the first." },
    { id = "g_away", when = { away = 21 }, text = "Gone {away}, and it shows, my friend. Sit, sit, before something nests in there." },
  },

  notice = {
    { id = "n_beard", cat = "beard", when = { race = "Dwarf" },
      text = "Now that is a beard with a history! I'll not touch a braid without your leave, but I'd dearly love to." },
    { id = "n_marks", cat = "markings", when = { race = "NightElf", class = "DRUID" },
      text = "Your markings are fading at the edges. A druid's face should say what it means, so let me freshen them." },
    { id = "n_weather", cat = "weathered", when = { minLevel = 40 },
      text = "You've been somewhere with a great deal of wind and very little water, by the look of your hair. Sit down at once." },
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
        { text = "Farewell, Teuren.", next = "END" },
      },
    },

    markings = {
      lines = {
        { id = "ma_default", text = "Some are family, some are vows, and some are simply beautiful, and I ask before I ink which kind you want. The Sentinels favour the old patterns across the eyes; the young ones off the boat from Auberdine want something new every month." },
      },
      choices = {
        { text = "The old patterns should be kept as they are.", next = "BACK", reply = "The Sentinels would kiss you for saying so, though they'd never admit it. There is a weight in an old line that a new one has to earn over centuries.", fx = { align = { order = 1 } } },
        { text = "A face is your own. Change it as you like.", next = "BACK", reply = "Spoken like one of the young ones off the Auberdine boat, and I do not mind it at all. A face that never changes is a face that has stopped living.", fx = { affinity = 1, align = { order = -1 } } },
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
        { text = "Comb it, then. Gently.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've been tidying kaldorei heads since long before this city stood, and I'll be tidying them long after you've gone grey, I expect." } },
    advice = { { id = "tp_ad", text = "Wash it, comb it, and don't cut it yourself the night before a battle. I've seen what happens." } },
    _none = { { id = "tp_none", text = "Now that I couldn't say, but sit a while and someone in the chair will know." } },
  },
}
