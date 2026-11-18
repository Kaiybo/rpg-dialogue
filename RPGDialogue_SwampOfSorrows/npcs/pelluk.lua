-- Pelluk, a Lost One of the Harborage, Swamp of Sorrows (Forever only). Voice: bibles/pelluk.md
-- Quest: Taking the Bait Back. Year 1: the Lost Ones' origins are not known to anyone here, and Pelluk won't say.
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sos_pelluk", id = TODO_NPC("Pelluk"), name = "Pelluk",
  bible = "bibles/pelluk.md", role = "questgiver", tier = "quest",
  temper = { "gentle", "anxious" }, values = { "community", "patient", "practical" },
  notices = { "stare", "fisher", "light" },

  impression = {
    first = "Pelluk is one of the Lost Ones who live at the Harborage, a hunched, quiet fisher who speaks slowly and watches whether you flinch. He talks about bait and nets the way other people talk about bread.",
    third = "{name} met Pelluk, a Lost One fisher at the Harborage in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_default", text = "You stopped. Most travellers walk faster when they see us, so I thank you for stopping." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to the Harborage. That is a kind thing, and not a common one." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Taking the Bait Back") }, text = "Did you find it? The nets are empty without it, and the little ones are hungry." },
    { id = "g_after", when = { questDone = TODO_QUEST("Taking the Bait Back") }, text = "Friend of the Harborage! The nets came up full this morning, and I thought of you." },
  },

  notice = {
    { id = "n_stare", cat = "stare", when = { maxLevel = 40, race = { "Human", "Gnome" } },
      text = "You are staring. It is all right; everyone stares, and you are at least doing it politely." },
    { id = "n_fisher", cat = "fisher", when = { profession = { "Fishing" } },
      text = "You carry a fishing pole like someone who uses it. Good; then you will understand what was taken from us." },
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "There is a brightness about you, like something I remember and cannot name. Please, stand a little closer to the fire; I like to see it." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Pelluk. I fish for the Harborage, and I mend the nets, and when the bait runs short I go hungry before the others do." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Taking the Bait Back") },
          text = "Our bait was taken, the good bait we gathered and kept, and without it the nets catch nothing worth eating. I am not a fighter, but perhaps you would help me take it back." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Taking the Bait Back") },
          text = "Bring back what you can of it. Even half would feed the Harborage for a while, and the rest we can gather again, slowly." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Taking the Bait Back"), days = 3 } },
          text = "We fished all night with what you brought back, and there was enough for everyone and some to smoke for later. The elders asked me who had helped us, and I told them your name." },
        { id = "h_done", when = { questDone = TODO_QUEST("Taking the Bait Back") },
          text = "The bait is kept closer now, in baskets by the fire, and someone watches it at night. We learned that from you, and from losing it." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde travellers come through from Stonard sometimes to trade for fish. They are not gentle, but they are fair, and fair is enough." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask? I am in no hurry." },
        { id = "h_again2", text = "Ask, if you like. The nets will wait." },
        { id = "h_again3", text = "Something more, friend?" },
      },
      choices = {
        { text = "What is the Harborage?", next = "harborage" },
        { text = "Who took your bait?", next = "bait" },
        { text = "Where do your people come from?", next = "origin" },
        { text = "What's the fishing like in this swamp?", next = "fishing" },
        { text = "I'm a fisher too. What do you use?", next = "xfish", when = { profession = { "Fishing" } } },
        { text = "I'll help you.", next = "BUSINESS" },
        { text = "Farewell, Pelluk.", next = "END" },
      },
    },

    harborage = {
      lines = {
        { id = "ha_default", text = "A place where those of us who have not gone wild can live in peace. We keep the old ways as best we can, we fish, we trade a little, and we stay out of everyone's wars." },
      },
      choices = {
        { text = "Gone wild? What do you mean?", next = "harborage_remember" },
        { text = "Do the Horde and Alliance leave you alone?", next = "harborage_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harborage_remember = {
      lines = {
        { id = "hr_default", text = "Some of our people have forgotten too much of who they were. At Fallow Sanctuary to the south there are others like us who have gone that way, and they are angry and do not know why. We do not go near them, and you should not either." },
      },
      choices = {
        { text = "Can nothing be done for them?", next = "harborage_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harborage_help = {
      lines = {
        { id = "hh_default", text = "Perhaps once something could have been done, and perhaps one day again. For now we keep our own minds as best we can, and we grieve for theirs." },
      },
      choices = {
        { text = "They're still your kin. Don't give up on them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they attack you, defend yourselves.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    harborage_war = {
      lines = {
        { id = "hw_default", text = "Mostly, because we have nothing either of them wants. Stonard trades with us, and the Alliance travellers on the road nod and keep walking, and that suits us very well." },
      },
      choices = {
        { text = "Neutrality is wise. Stay out of their quarrels.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Sooner or later, you'll have to choose a side.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bait = {
      lines = {
        { id = "ba_default", text = "Thieves who came while we slept, and took the baskets we had filled over many days. I do not know why anyone would want fish bait, but hunger makes strange thieves of everyone." },
        { id = "ba_done", when = { questDone = TODO_QUEST("Taking the Bait Back") },
          text = "It is back now, thanks to you, and I have stopped being angry with the thieves. It is hard to stay angry with a full belly." },
      },
      choices = {
        { text = "Thieves deserve what they get.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe they were just as hungry as you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    origin = {
      lines = {
        { id = "or_default", text = "From very far away, and a long time ago, or so it feels. We do not speak of it, not because it is secret, but because it hurts, and because some of us cannot remember it whole." },
      },
      choices = {
        { text = "I'm sorry. I didn't mean to pry.", next = "origin_sorry" },
        { text = "Surely someone remembers.", next = "origin_press" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_sorry = {
      lines = {
        { id = "os_default", text = "You did not pry; you asked, and asking is how friends begin. Ask me about fish instead, and I will talk until you beg me to stop." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    origin_press = {
      lines = {
        { id = "op_default", text = "The elders remember more than I do, and they say less than I do, so you see the trouble. Let it be, friend; there are some nets that cannot be mended by pulling." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fishing = {
      lines = {
        { id = "fi_default", text = "Better than it looks in water this dark. The lake gives up fat fish if you know the deep places, and the bait is everything, so losing it hurt us badly." },
      },
      choices = {
        { text = "What lives in the deep places?", next = "fishing_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fishing_deep = {
      lines = {
        { id = "fd_default", text = "Fish, and crocolisks who also like fish, and sometimes something larger that takes the whole line and the pole and very nearly the fisher. We leave the deepest water alone at night." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xfish = {
      lines = {
        { id = "xf_default", text = "A paste of swamp snails and old fish, left in the sun for two days, then rolled in moss. It smells worse than anything you have ever smelled, and the fish love it beyond reason." },
      },
      choices = {
        { text = "I'll try it. Thank you, Pelluk.", next = "BACK", fx = { affinity = 2 } },
        { text = "I think I'll stick to my own.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fish, I mend nets, I keep the fire. Before the Harborage there is not much I wish to tell." } },
    advice = { { id = "tp_ad", text = "Keep your bait where you can see it, and your friends where they can see you." } },
    _none = { { id = "tp_none", text = "I do not know that, friend. I know fish, and a little about nets." } },
  },
}
