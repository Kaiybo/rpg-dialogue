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
    first = "She thinks better of guests who look as if they've earned rest.",
    third = "{name} met Melika Isenstrider, the assistant innkeeper, who misses very little and wipes the benches twice.",
  },

  greetings = {
    { id = "g_busy", text = "Sit wherever there's a chair. I'll get to you." },
    { id = "g_regular", when = { timesTalked = { min = 3 } }, text = "Same table as last time? It's free, for once." },
    { id = "g_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } }, text = "Back already? Your bed's where you left it, and I've aired it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The kitchen's shut, but the fire isn't. Keep your voice down, because the upstairs is asleep." },
  },

  notice = {
    { id = "n_cat", cat = "form", place = "before", when = { form = "cat" },
      text = "Off the bench, puss. I only just wiped it." },
    { id = "n_bear", cat = "form", place = "before", when = { form = "bear" },
      text = "A bear, in the main room! Farley's going to have something to say about his tables." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than they'd like. You, for one, sit like someone listening to the floor, and I'd say you've earned your rest." } },
      choices = {
        { text = "A well-run inn is a blessing, Melika. Thank you.", next = "BACK", reply = "Kind of you to notice, and Farley will never believe it. Sit by the fire and I'll bring you something warm.", fx = { align = { order = 1 } } },
        { text = "I'll sit where I please. No need for fuss.", next = "BACK", reply = "Sit where you like, then, so long as it's not on the hearth. One of you tried that already.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Some do and some don't, and the ones who don't come up at midnight wanting bread and cheese. I feed them all the same, because a guest is a guest, but I'll not have demons sitting on my benches." } },
      choices = {
        { text = "A guest is a guest. That's fair of you, Melika.", next = "BACK", reply = "Thank you, it's how I've always run things. Bread and cheese for anybody, and no demons on the benches.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What I keep is better company than half your guests.", next = "BACK", reply = "Maybe so, but it's not paying for supper, so it can wait outside. Your table's by the window.", fx = { align = { light = -1 } } },
        { text = "Something else, Melika.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mud, mostly, and dented tables, and one who slept on the hearth and wouldn't be moved. They pay well and tip badly and come back every time, so I suppose I'm fond of them." } },
      choices = {
        { text = "I'll keep the mud outside and the tables whole.", next = "BACK", reply = "Bless you for that, I'd be grateful. Farley might even smile.", fx = { align = { honor = 1 } } },
        { text = "A little mud never hurt a tavern.", next = "BACK", reply = "It never hurt the tavern, no, only my back with all the scrubbing. Boots off at the door, if you would.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Out the back by the woodpile, where Farley won't trip on it. I'll put out the scraps after the supper rush, and if it's polite, there'll be a bone in it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Out the back by the woodpile, where Farley won't trip on it, and I'll put out the scraps after the supper rush. Your {pet} is polite enough, I suppose, and better than some of Farley's guests, who track mud up my stairs." },
      },
      choices = {
        { text = "I'll keep it in the yard and out of your way.", next = "BACK", reply = "Thank you, I'll make sure it gets a bone. It's always the polite ones who get the best scraps.", fx = { align = { order = 1 } } },
        { text = "It's well trained. It can eat where I eat.", next = "BACK", reply = "Not at my tables, it can't, trained or not. The woodpile's a fine place for a dinner.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Keryn Sylvius's students practice in the common room when they think nobody's watching, and I watch everything that happens in here. I don't mind you learning your trade, but I do mind boot marks on clean wood." } },
      choices = {
        { text = "I'll practice elsewhere and leave your benches clean.", next = "BACK", reply = "Thank you, and I'll keep quiet about what I've seen. That's how we get along, you and I.", fx = { align = { order = 1 } } },
        { text = "Your benches are perfect cover. I'll keep using them.", next = "BACK", reply = "Then I'll keep a rag handy and a close eye on you. You'll find I'm better at watching than most.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not since he moved in, because he says the common room's too loud for thinking, and Farley says that's what a common room is for. I take it up and he forgets to eat it, so I suppose I'm feeding the rats as well." } },
      choices = {
        { text = "I'll take his supper up and see he eats it.", next = "BACK", reply = "Would you? He'd be grateful, though he'd never say it. Take the bread and the cheese both.", fx = { align = { honor = 1 } } },
        { text = "If he won't come down, let him go hungry.", next = "BACK", reply = "I've thought of it, believe me, but Farley would never let me. Somebody has to keep him alive.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not that I'd say out loud, though there are folk who come up from the cellar at odd hours, and I don't like the way they look at the kitchen. Farley says they're harmless, and Falkhaan says to keep my knife handy, and I believe Falkhaan." } },
      choices = {
        { text = "Then I'll watch them, and see the law kept.", next = "BACK", reply = "I'd sleep better for it, and so would the kitchen. Falkhaan will be glad of the help.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they've done nothing, they're free to come and go.", next = "BACK", reply = "I suppose they are, and I'll keep my knife handy anyway. A girl can't be too careful.", fx = { align = { order = -1 } } },
        { text = "Something else, Melika.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Sit by the door, if you would, because Farley gets nervous when the cellar folk come up for supper." },
        { id = "h_default", text = "I'm Melika. Farley talks to the guests and I feed them, so what do you need?" },
        { id = "h_rest", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rest and Relaxation"), days = 1 } },
          text = "Falkhaan sent you down the road? He sends all the tired ones here. Farley gets the thanks and I get the dishes." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of the sky folk! We don't get many through Goldshire. Is it true your people came down out of the clouds, or is that Remy talking?" },
        { id = "h_sky_druid", when = { race = "Skyborne", class = "DRUID" },
          text = "A sky-folk druid. I didn't know your people had druids. Whatever you turn into, it stays off the tables." },
        { id = "h_visitor", when = { minLevel = 18 },
          text = "You're past Goldshire's usual sort. Passing through, or did the road bring you back?" },
        { id = "h_liked", when = { townStanding = { town = "goldshire", min = 30 } },
          text = "Folk talk about you in here, mostly kindly, and I'd keep it that way." },
        { id = "h_distrust", when = { townStanding = { town = "goldshire", max = -20 } },
          text = "I'll serve you, but don't make me sorry I did." },
        { id = "e_farley_cart", when = { heardLine = "farley.r_hogger" },
          text = "Did Farley tell you his story about the hunter on the cart? He tells it every night, and the cart gets longer every time." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Priestess Josetta's upstairs, if it's her you're after. If it's supper, it's me. Most priests want both, in that order." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Mind the bench, rogue, because I polish it every morning and I can tell when someone's been crouching behind it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Zaldimar's upstairs, if you're after him, and he'll want his supper sent up, so take it with you if you're going." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want a hot meal and a bath, I expect, and I'll give you the meal; the bath you'll find yourself." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If that animal's coming in, it eats in the yard; I won't have it under the tables begging." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've come up from the cellar, by the chill on you. Your sort eat at odd hours, so I'll keep a bowl back, but don't bring anything to my table that doesn't eat stew." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. You look like you've walked a long way. Sit down; I'll find you a quiet table." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quick, the stew won't stir itself." },
        { id = "h_again2", text = "What else? I've three tables waiting, so make it a good one." },
      },
      choices = {
        { text = "Something smells good from the kitchen.", next = "kitchen" },
        { text = "Heard anything worth hearing?", next = "news" },
        { text = "Isenstrider. You must be related to Falkhaan.", next = "family" },
        { text = "What's Farley like to work for?", next = "farley" },
        { text = "Winds be with you.", tag = "Skyborne", next = "winds", when = { race = "Skyborne" } },
        { text = "The road brought me back. For a night, anyway.", next = "road", when = { minLevel = 18 } },
        { text = "Does anyone here need a healer's hands?", next = "healer", when = { class = "PRIEST" } },
        { text = "Do rogues often hide behind your benches?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Zaldimar never seems to come down for his supper.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Warriors must cause you some trouble, Melika.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will you let my beast eat in the yard, at least?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is anyone in Goldshire in danger, Melika?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the cellar folk eat with the other guests, Melika?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You seem to notice everything about your guests, Melika.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
      },
    },

    kitchen = {
      lines = {
        { id = "k_default", text = "Mutton stew, this morning's bread, and a cheese that's better than both. Dobbins has the ale, but don't let him choose it for you." },
        { id = "k_night", when = { timeOfDay = "night" }, text = "The kitchen's shut, but there's bread, if you don't mind yesterday's." },
      },
      choices = {
        { text = "Who does the cooking?", next = "kitchen_cook" },
        { text = "Sounds good.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen_cook = {
      lines = {
        { id = "kc_default", text = "Tomas does. He cooks, Dobbins pours, Toddrick cuts the meat and Farley talks, and I carry it all and taste the stew when Tomas isn't looking." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    news = {
      lines = {
        { id = "w_default", text = "The Westfall wagons come in short a crate or two. Everyone blames the Defias, and nobody's been wrong yet.",
          fx = { learn = { "defias" } } },
        { id = "w_hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Hogger again. The whole room wants him dead, and the whole room's scared of him, and they're the same men.",
          fx = { learn = { "hogger" } } },
        { id = "w_hogger_done", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Since Hogger went down, the hunters drink to celebrate instead of to forget, which is better for my floor." },
        { id = "w_murlocs", when = { heardClaim = "murlocs_in_elwynn" },
          text = "Remy's murlocs? He's told every table about them, and I'll believe it when one orders a drink." },
        { id = "w_lovers", when = { topicKnown = "maybell_tommy" },
          text = "Maybell Maclure's been in twice this week, both times when William Pestle was, and I clear their table slowly." },
      },
      choices = {
        { text = "Who'd know more?", next = "news_more" },
        { text = "Thanks, Melika.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_more = {
      lines = {
        { id = "nm_default", text = "Ask Farley, if you've an hour, or Remy, if you've two and don't mind hearing it twice. Ask Marshal Dughan if you want it true and short." },
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
        { id = "fa_default", text = "He's loud and kind, and he'll tell every guest his family's kept this inn since the first King Llane. I've heard it a thousand times, and it's still true." },
      },
      choices = {
        { text = "He never seems to stop talking.", next = "farley_quiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farley_quiet = {
      lines = {
        { id = "fq_default", text = "He does, when someone's crying into their ale. Then he sits down, goes quiet and listens as long as it takes, and that's when I like him best, though don't tell him I said so." },
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
        { text = "The sea's bigger than any map makes it look.", next = "BACK", fx = { affinity = 2 } },
        { text = "Nothing out there beats a bed in Goldshire.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
      },
    },

    healer = {
      lines = {
        { id = "he_default", text = "Dobbins scalded his hand on the kettle this morning and won't admit it, so go and have a look, and don't tell him I sent you." },
      },
      choices = {
        { text = "I'll see to him.", next = "BACK", reply = "Thank you, and mind you don't let on. He's proud about his kettle.", fx = { affinity = 2, align = { light = 1 }, standing = { goldshire = 1 } } },
        { text = "Dobbins is a grown man, and he can come to me himself.", next = "BACK", reply = "He won't, you know, he'll just keep scalding himself. Never mind, I'll see to it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carry plates at the Lion's Pride, and I'm Falkhaan's family. That's all anybody needs to know." } },
    advice = { { id = "tp_ad", text = "Eat before you go out, not after. You'll fight better and I'll have fewer people fainting into the stew." } },
    lions_pride = { { id = "t_inn", text = "Upstairs for sleeping, downstairs for everything else. Farley's family has kept it for generations, and he'll name them all, back to his great-great-grandfather." } },
    hogger = { { id = "t_hogger", text = "He's big and mean and lives southwest of here, so don't go alone, and don't go hungry." } },
    defias = { { id = "t_defias", text = "Red bandanas, and they don't wear them in here, which isn't the same as not being in here." } },
    murlocs_east = { { id = "t_murlocs", text = "Ask Remy, and then ask anyone else." } },
    maybell_tommy = { { id = "t_lovers", text = "Everybody knows, nobody says. That's how Goldshire keeps a secret." } },
    gold_dust = { { id = "t_dust", text = "Remy buys it. I asked him once what he does with it, and he told me, at length." } },
    _none = { { id = "t_none", text = "Ask Farley. He knows everything, and he'll tell you twice." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Faire week I carry plates till my arms shake, and the jugglers juggle my spoons whenever they think I'm not looking. I always get them back, mostly." } },
    scourge = { { id = "tp_scourge", text = "Farley's brother died of the plague in Lordaeron, and he won't talk about it, so please don't ask him. Ask me if you must, though I don't know much more than that." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor from Booty Bay once tried to pay for his supper with a parrot, and Farley made him take it back. I'd have kept it." } },
  },
}
