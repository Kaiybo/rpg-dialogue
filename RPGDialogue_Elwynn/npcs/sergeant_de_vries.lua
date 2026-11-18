-- Sergeant De Vries, morale officer and drink seller inside Westbrook Garrison. Voice: bibles/sergeant_de_vries.md
-- Keeps an undermanned garrison's spirits up with a cask, a joke and a sharp eye for who's flagging.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sergeant_de_vries", id = TODO_NPC("Sergeant De Vries"), name = "Sergeant De Vries",
  title = "Morale Officer",
  bible = "bibles/sergeant_de_vries.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "warm" }, values = { "loyal", "friendly" },
  notices = { "kit", "drink" },

  impression = {
    first = "Sergeant De Vries is Westbrook's morale officer, which seems to mean he sells the drink and listens to the complaining. He is better at the second part than he lets on.",
    third = "{name} met Sergeant De Vries, morale officer of Westbrook Garrison, who keeps tired soldiers going with drink and good humour.",
  },

  greetings = {
    { id = "g_cask", text = "Come in, come in! Something to wet your throat? Morale's my job, and thirst is the enemy of morale." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew you'd miss the place; nobody leaves Westbrook for good." },
    { id = "g_apple", when = { questActive = TODO_QUEST("An Apple Treat") }, text = "You're fetching those apples for the lads' treat, then? Don't let me keep you from it." },
    { id = "g_apple_done", when = { questDone = TODO_QUEST("An Apple Treat") }, text = "Still grateful for those apples you fetched for the lads, friend. Small treats like that are half my job." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the lads have been asking after you, or at least one of them has. Welcome back to Westbrook." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've filled out since you first came through that door, friend. You've the look of someone the lads would follow now." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word down the road says you've done right by folk. That's good for morale too, you know, even mine." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "Heard you've been leaning on people. Not in my room, friend; this is where the lads come to get away from that." },
  },

  notice = {
    { id = "n_weary", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look done in, and your kit looks worse. Sit down a moment; the smith can wait until you've had a drink." },
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "Somebody's started early, I see! Well, I won't tell Deputy Rainer if you won't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sergeant De Vries, morale officer of Westbrook Garrison. I keep the drink flowing and the lads smiling, and some weeks the drink's the easier half." },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "A fighter, by the look of you. You'll know, then, that a soldier marches on his stomach and fights on whatever's in his cup." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Quiet night, so far. The gnolls usually wait till the small hours, and so do I before I pour the strong stuff." },
      },
      again = {
        { id = "h_again", text = "Anything else? The cask's not going anywhere." },
        { id = "h_again2", text = "Go on, friend. I've time for a chat; it's a good part of the job." },
      },
      choices = {
        { text = "What does a morale officer do?", next = "job" },
        { text = "Your soldiers look worn thin, Sergeant.", next = "lads" },
        { text = "What's for sale?", next = "BUSINESS" },
        { text = "What's Deputy Rainer like to serve under?", next = "rainer" },
        { text = "What's in the cask today?", next = "cask" },
        { text = "Human ale? Ye'd best have something stronger.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Do the soldiers ever come to you for prayers?", next = "prayers", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I've seen recruits look younger than I'd like.", next = "young", when = { race = "Human" } },
        { text = "Take care, Sergeant.", next = "END" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "Pour, listen and notice. A lad who stops eating, a lad who stops writing home, a lad who drinks too fast; I see it first, and I tell Deputy Rainer before it turns into something worse." },
      },
      choices = {
        { text = "And what do you do about it?", next = "job_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_how = {
      big = true,
      lines = { { id = "jh_default", text = "A kind word, mostly, or an extra night off when I can wangle one. Some officers say a firm hand does it better, and I'll admit they're not always wrong." },
      },
      choices = {
        { text = "Kindness first. Frightened men break faster.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A firm hand. Soft treatment makes soft soldiers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lads = {
      lines = { { id = "l_default", text = "Tired, and too few of them. With the kingdom's strength stretched so far from home, Westbrook gets what's left, and the gnolls and the Defias know it." },
      },
      choices = {
        { text = "Then I'll lend a hand outside.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Gnolls and Defias both? Which is worse?", next = "lads_enemy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lads_enemy = {
      lines = { { id = "le_default", text = "The gnolls are worse for the farms, friend, because they come in packs and take whatever's loose. The Defias are worse for the lads, because half of them used to be honest stonemasons, and it's a hard thing to fight a man you might have bought a drink for." } },
      choices = {
        { text = "Did you know any of them?", next = "lads_mason" },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    lads_mason = {
      lines = { { id = "lm_default", text = "One or two came through Goldshire when they were still building the city walls, cheerful sorts with stone dust in their beards. Then the Crown didn't pay them, and now they wear red masks in Westfall, and I don't like to think too hard about which of them I've seen on a wanted poster." } },
      choices = {
        { text = "They were cheated. I can understand them.", next = "BACK", fx = { align = { order = -1 } },
          reply = "So can I, friend, on the quiet nights. Doesn't make them any less dangerous on the road." },
        { text = "Cheated or not, they're outlaws now. They hang.", next = "BACK", fx = { align = { order = 1 } },
          reply = "That's the law, and I'm a sergeant of it. I just hope I'm not the one who has to watch." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rainer = {
      lines = { { id = "ra_default", text = "Rainer's a good man who's been given too much ground and too few men, so he writes reports instead of sleeping. He'll never say thank you, but he signs my requests for extra rations without reading them, which is the same thing in a deputy." } },
      choices = {
        { text = "Does Stormwind ever answer his reports?", next = "ra_reports" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ra_reports = {
      lines = { { id = "rr_default", text = "Stormwind answers with more forms, friend, and the odd recruit who's never held a sword. The lads joke that the reports go straight into Lady Prestor's fireplace, though I'd never say that where the Marshal could hear." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "stormwind_guard" } } } },
    },
    cask = {
      lines = { { id = "ca_default", text = "Elwynn cider, mostly, pressed from orchards just down the road, and a little Thunder Ale that comes from Ironforge by way of the Goldshire inn. The cider's for the lads, and the Thunder Ale's for the days the lads have earned it." } },
      choices = {
        { text = "And the apples? Something about an apple business?", next = "apple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apple = {
      lines = { { id = "ap_default", text = "Ha, you've heard about that. It's a small thing, friend, a treat for the lads that I need a willing pair of legs for, and small things are half of what keeps a garrison going. Ask me properly and I'll tell you what I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "I keep the Thunder Ale for exactly your sort, friend, because a dwarf who's handed cider looks at you like you've insulted his mother. Don't tell the lads, but you'll get the good cask." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    prayers = {
      lines = { { id = "pr_default", text = "More than they'd admit, {class}. They come to me because I'm here and the chapel in Goldshire's a walk, and I do my best, but I'm a sergeant with a cask, not a priest. If you've a blessing to spare for the lads, they'd be glad of it." } },
      choices = {
        { text = "I'll say a word for them before I go.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } },
          reply = "Thank you. I'll let them think it was my idea; it's good for my reputation." },
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = { { id = "yo_default", text = "So have I, friend, and some of them have lied about their age to me with their mothers' letters still in their pockets. I pour them milk with a splash of cider and call it a soldier's drink, and I watch them twice as closely as the rest." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A sergeant of the Stormwind Guard, posted to Westbrook. I'm better with a cask than a sword, and the captain knew it." } },
    advice = { { id = "tp_ad", text = "Eat something before you drink something. You'd be amazed how many soldiers never learn it." } },
    defias = { { id = "tp_defias", text = "Some of them were honest masons once. That's the worst of it, friend." } },
    rainer = { { id = "tp_rainer", text = "Too much ground, too few men, and a stack of reports. A good man, all the same." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask Deputy Rainer; he's the one with the reports." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire's at Goldshire I lose most of the garrison to it on their days off, and they come back with sore heads and a story apiece. Good for morale, I tell the deputy, and he pretends to believe me." } },
    booty_bay = { { id = "tp_booty_bay", text = "I tasted rum from Booty Bay once that took the varnish off a table, and I've wanted a cask for the garrison ever since. Deputy Rainer says no, very firmly." } },
    varian = { { id = "tp_varian", text = "The lads ask me about the king, because I'm the morale officer and they think I know things. I pour them a drink and tell them he'll be back, and I hope I'm not a liar." } },
  },
}
