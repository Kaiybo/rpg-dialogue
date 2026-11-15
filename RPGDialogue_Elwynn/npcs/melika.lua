-- Melika Isenstrider, Assistant Innkeeper, Lion's Pride Inn, Goldshire. Voice: bibles/melika.md
-- She has no gossip menu in the game: right-clicking her opens the box (Conversation.lua).
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "melika", id = TODO_NPC("Melika Isenstrider"), name = "Melika Isenstrider", title = "Assistant Innkeeper",
  bible = "bibles/melika.md", role = "innkeeper", tier = "quest",
  communities = { "goldshire" }, temper = { "steady", "sharp" }, values = { "kind", "witty" },
  notices = { "form", "road", "regular" },
  impression = {
    first = "Melika Isenstrider keeps the inn running while everyone else talks, and she notices how people sit down. She seems to think better of guests who look as if they've earned their rest.",
    third = "{name} met Melika Isenstrider, the assistant innkeeper, who misses very little and wipes the benches twice.",
  },

  greetings = {
    { id = "g_busy", text = "Sit wherever there's a chair. I'll get to you." },
    { id = "g_regular", when = { timesTalked = { min = 3 } }, text = "Same table as last time? It's free, for once." },
    { id = "g_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } }, text = "Back already? Your bed's where you left it, and I've aired it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Kitchen's shut, fire isn't. Keep your voice down, the upstairs is asleep." },
  },

  notice = {
    { id = "n_cat", cat = "form", place = "before", when = { form = "cat" },
      text = "Off the bench, puss. I only just wiped it." },
    { id = "n_bear", cat = "form", place = "before", when = { form = "bear" },
      text = "A bear. In the main room. Farley's going to have something to say about his tables." },
    { id = "n_travel", cat = "form", place = "before", when = { form = "travel" },
      text = "We stable animals out back, even the ones that talk." },
    { id = "n_road", cat = "road", place = "after", when = { minLevel = 18 },
      text = "You're no fresh recruit, are you? Too much road on those boots, and you sat down like you'd earned it." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "Not on the bench!" },
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Not the bear, not in here, and not on my clean floor!" },
    { id = "r_stealth", on = "stealth", text = "I saw that, you know. Everyone tries it once." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Melika. Farley talks to the guests, I feed them. What do you need?" },
        { id = "h_rest", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rest and Relaxation"), days = 1 } },
          text = "Falkhaan sent you up the road? He sends all the tired ones. Farley gets the thanks and I get the dishes." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of the sky folk! We don't get many through Goldshire. Is it true your people came down out of the clouds, or is that Remy talking?" },
        { id = "h_sky_druid", when = { race = "Skyborne", class = "DRUID" },
          text = "A sky-folk druid. I didn't know your people had druids. Whatever you turn into, it stays off the tables." },
        { id = "h_visitor", when = { minLevel = 18 },
          text = "You're past Goldshire's usual sort. Passing through, or did the road bring you back?" },
        { id = "h_liked", when = { townStanding = { town = "goldshire", min = 30 } },
          text = "Folk talk about you in here. Mostly kindly. I'd keep it that way." },
        { id = "h_distrust", when = { townStanding = { town = "goldshire", max = -20 } },
          text = "I'll serve you. Don't make me sorry I did." },
        { id = "e_farley_cart", when = { heardLine = "farley.r_hogger" },
          text = "Did Farley tell you about the hunter on the cart? He tells it every night. The cart gets longer every time." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Josetta's upstairs, if it's her you're after. If it's supper, it's me. Most priests want both, in that order." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quick, the stew won't stir itself." },
        { id = "h_again2", text = "What else? I've three tables waiting, so make it a good one." },
      },
      choices = {
        { text = "What's in the kitchen tonight?", next = "kitchen" },
        { text = "Heard anything worth hearing?", next = "news" },
        { text = "Isenstrider? Any relation to Falkhaan?", next = "family" },
        { text = "What's Farley like to work for?", next = "farley" },
        { text = "Winds be with you.", tag = "Skyborne", next = "winds", when = { race = "Skyborne" } },
        { text = "The road brought me back. For a night, anyway.", next = "road", when = { minLevel = 18 } },
        { text = "Does anyone here need a healer's hands?", next = "healer", when = { class = "PRIEST" } },
      },
    },

    kitchen = {
      lines = {
        { id = "k_default", text = "Mutton stew, this morning's bread, and a cheese that's better than both. Dobbins has the ale, but don't let him choose it for you." },
        { id = "k_night", when = { timeOfDay = "night" }, text = "Kitchen's shut. There's bread, if you don't mind yesterday's." },
      },
      choices = {
        { text = "Who does the cooking?", next = "kitchen_cook" },
        { text = "Sounds good.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen_cook = {
      lines = {
        { id = "kc_default", text = "Tomas. He cooks, Dobbins pours, Toddrick cuts the meat, Farley talks. I carry it all and taste the stew when Tomas isn't looking." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    news = {
      lines = {
        { id = "w_default", text = "The Westfall wagons come in short a crate or two. Everyone blames the Defias, and nobody's been wrong yet.",
          fx = { learn = { "defias" } } },
        { id = "w_hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Hogger again. Half the room wants him dead and the other half's scared of him. Same half, mostly.",
          fx = { learn = { "hogger" } } },
        { id = "w_hogger_done", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Since Hogger went down, the hunters drink to celebrate instead of to forget. Better for the floor." },
        { id = "w_murlocs", when = { heardClaim = "murlocs_in_elwynn" },
          text = "Remy's murlocs? He's told every table. I'll believe it when one orders a drink." },
        { id = "w_lovers", when = { topicKnown = "maybell_tommy" },
          text = "Maybell Maclure's been in twice this week, both times when William was. I clear their table slowly." },
      },
      choices = {
        { text = "Who'd know more?", next = "news_more" },
        { text = "Thanks, Melika.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_more = {
      lines = {
        { id = "nm_default", text = "Farley, if you've an hour. Remy, if you've two and don't mind hearing it twice. The Marshal, if you want it true and short." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    family = {
      lines = {
        { id = "f_default", text = "Falkhaan? He's family. He sends the tired ones our way, and I'm the one who makes up the beds." },
        { id = "f_met", when = { questDone = TODO_QUEST("Rest and Relaxation") },
          text = "So you've met him. He'll have told you this is the best inn in Elwynn. He's not wrong, but he's family." },
      },
      choices = {
        { text = "What's he like?", next = "family_falk" },
        { text = "He speaks well of the place.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_falk = {
      lines = {
        { id = "ff_default", text = "He stands on the road out of Northshire and catches the worn-out ones before they fall over. Farley calls him his best friend, and means it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farley = {
      lines = {
        { id = "fa_default", text = "Loud, kind, and he'll tell every guest his family's kept this inn since the first King Llane. I've heard it a thousand times. It's still true." },
      },
      choices = {
        { text = "Does he ever stop talking?", next = "farley_quiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farley_quiet = {
      lines = {
        { id = "fq_default", text = "When someone's crying into their ale. Then he sits down, goes quiet and listens as long as it takes, and that's when I like him best, though don't tell him I said so." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },

    winds = {
      lines = {
        { id = "s_default", text = "Winds be... with you as well? Is that how it's answered? Give me a week, I'll have it right." },
      },
      choices = {
        { text = "That's exactly right.", next = "BACK", fx = { affinity = 1 },
          journal = { first = "Taught the assistant innkeeper at the Lion's Pride how we greet each other. She means to practice.",
                      third = "{name} taught Melika Isenstrider a Skyborne greeting." } },
        { text = "Close enough.", next = "BACK" },
      },
    },

    road = {
      lines = {
        { id = "ro_default", text = "Then sit and tell me one thing worth hearing. Everyone who comes back down that road has one. Most have three and tell the worst." },
      },
      choices = {
        { text = "The sea's bigger than you'd think.", next = "BACK", fx = { affinity = 2 } },
        { text = "Nothing out there beats a bed in Goldshire.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
      },
    },

    healer = {
      lines = {
        { id = "he_default", text = "Dobbins scalded his hand on the kettle this morning and won't admit it. Go and have a look. Don't tell him I sent you." },
      },
      choices = {
        { text = "I'll see to him.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { goldshire = 1 } } },
        { text = "Dobbins is a grown man, and he can come to me himself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carry plates at the Lion's Pride, and I'm Falkhaan's family. That's all anybody needs to know, and more than Remy does." } },
    advice = { { id = "tp_ad", text = "Eat before you go out, not after. You'll fight better and I'll have fewer people fainting into the stew." } },
    lions_pride = { { id = "t_inn", text = "Upstairs for sleeping, downstairs for everything else. Farley's family has kept it for generations, and he'll name every one of them." } },
    hogger = { { id = "t_hogger", text = "Big, mean and southwest of here. Don't go alone, and don't go hungry." } },
    defias = { { id = "t_defias", text = "Red bandanas. They don't wear them in here. That doesn't mean they aren't in here." } },
    murlocs_east = { { id = "t_murlocs", text = "Ask Remy, and then ask anyone else." } },
    maybell_tommy = { { id = "t_lovers", text = "Everybody knows, nobody says. That's how Goldshire keeps a secret." } },
    gold_dust = { { id = "t_dust", text = "Remy buys it. I asked him once what he does with it, and he told me, at length." } },
    _none = { { id = "t_none", text = "Ask Farley. He knows everything, and he'll tell you twice." } },
  },
}
