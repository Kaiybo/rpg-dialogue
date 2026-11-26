-- Saern Priderunner, moved here from the Stonetalon roster (a later-era placement). Voice: bibles/missed_saern.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Saern Priderunner: tauren on Hunter Rise, Thunder Bluff (the scan's "Sunwalker Saern" is her later name).
P:NPC {
  key = "saern_priderunner", id = TODO_NPC("Saern Priderunner"), name = "Saern Priderunner", gender = "female",
  bible = "bibles/missed_saern.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "steady" }, values = { "brave", "loyal" },
  notices = { "class" },
  impression = {
    first = "Saern Priderunner is a tauren brave who stands on Hunter Rise in Thunder Bluff with the bearing of someone who has run a long way to be there. She watches the plains below as if she could still see every mile of them.",
    third = "{name} met Saern Priderunner, a tauren brave on Hunter Rise in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "The winds greet you on Hunter Rise, {class}. Stand a while and look out, for there is no finer view of Mulgore." },
    { id = "g_back", when = { metBefore = true }, text = "You have climbed the Rise again. The plains have not changed, and I am glad of that." },
  },
  notice = {
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = { "WARRIOR", "HUNTER" } },
      text = "You carry yourself as one who has run the plains with a spear in hand. The Rise is the right place for you, and the elders here will be glad to see it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Saern Priderunner. My family carried word between the tribes on foot in the days before we had a city, and though the Bluff has made that work lighter, I have not forgotten how to run." } },
      again = { { id = "h_again_x", text = "Ask, friend. I still have breath." },
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, and I will hear you." },
      },
      choices = {
        { text = "Your people ran between the tribes?", next = "ran" },
        { text = "What do you watch for from up here?", next = "watch" },
        { text = "Who should a young hunter seek on the Rise?", next = "seek" },
        { text = "What was the longest run you made?", next = "x_run" },
        { text = "The tribes should never have settled in one place.", next = "x_st" },
        { text = "I'm a druid. I can run as a cheetah.", next = "x_dr", when = { class = "DRUID" } },
        { text = "I'm tauren, and I'd like to run the paths.", next = "x_ta", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    ran = {
      lines = { { id = "r_default", text = "When the centaur drove us from one grazing ground to the next, the tribes were often many days apart. A runner who knew the plains could cross them faster than a kodo, and bring warning before the dust of the war bands was in sight." } },
      choices = {
        { text = "And now that the tribes are one?", next = "now" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now Cairne has given us a home that does not move, and I thank the Earth Mother for it each morning. But I still run the plains at dawn, because a people who forget how they survived will not survive the next hardship." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Old habit, mostly. I look for dust where there should be none, and though the centaur do not come into Mulgore now, the quilboar and the goblins' diggers have given my eyes new work." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    seek = {
      lines = { { id = "s_default", text = "The Thunderhorns teach the hunter's path here, and the Ragetotems the warrior's. Go to them humbly, for they have forgotten more of the hunt than most will ever learn." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    x_run = {
      lines = {
        { id = "xr1", text = "From Red Rocks to the Thousand Needles, carrying word that the centaur were massing. It took three days, and I did not stop except to drink, and I arrived in time." },
      },
      choices = {
        { text = "What happened then?", next = "x_run2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_run2 = {
      lines = {
        { id = "xr2", text = "The tribes gathered, and Cairne led them, and the centaur were driven back. It was the first time I saw him fight, and the first time I believed we might have a home." },
      },
      choices = {
        { text = "Do you still run?", next = "x_run3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_run3 = {
      lines = {
        { id = "xr3", text = "Every dawn, the old paths, though nobody needs a message carried now. My legs remember, and so do I. The Earth Mother gave us long legs and a long road, and I mean to use both." },
      },
      choices = {
        { text = "A fine tradition. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Some of the old ones say so, that we were made to wander. But I remember the centaur, and I know a city of stone and wood keeps our calves safe. What do you think?" },
      },
      choices = {
        { text = "Safety matters more than wandering.", next = "BACK", reply = "So I believe, though my legs disagree.", fx = { align = { order = 1 } } },
        { text = "A people who stop moving grow soft.", next = "BACK", reply = "Perhaps. I run every morning so I do not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "Then you are faster than I ever was, and I envy you. But a cheetah cannot carry a message in its mouth, so perhaps the old ways had something after all." },
      },
      choices = {
        { text = "Perhaps they did. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "Then meet me at the lift at dawn, and we will run to Bloodhoof Village and back. If you keep pace, I will teach you the old runner's songs." },
      },
      choices = {
        { text = "I'll be there. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "Cairne gave us a home that does not move. I run so I never forget what it was like before." } },
    background = { { id = "tp_bg", text = "I am of the Priderunners, who carried word between the tribes on foot. I keep the old running alive." } },
    _none = { { id = "tp_none", text = "The winds have not told me. Ask among the elders on Elder Rise." } },
  },
}
