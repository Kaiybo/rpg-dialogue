-- Supervisor Raelen, Eastvale Logging Camp. Voice: bibles/raelen.md
-- A lumber order, a deadline, and wolves sitting on the wood.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raelen", id = TODO_NPC("Supervisor Raelen"), name = "Supervisor Raelen",
  bible = "bibles/raelen.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "sharp" }, values = { "lawful", "ambitious" },
  notices = { "idle", "build" },

  greetings = {
    { id = "g_busy", text = "Make it quick. That order won't fill itself." },
    { id = "g_bundles", when = { questActive = TODO_QUEST("A Bundle of Trouble") }, text = "Bundles. Do you have bundles? Then why are you talking?" },
    { id = "g_after", when = { questDone = TODO_QUEST("A Bundle of Trouble") }, text = "Order went out on time. Barely. I don't thank people. Consider this the closest I get." },
  },

  notice = {
    { id = "n_drunk", cat = "idle", when = { drunk = { min = 1 } },
      text = "You're drunk. On my camp. In the middle of the day. Do you know what an axe does to a drunk's foot?" },
    { id = "n_shoulders", cat = "build", when = { class = "WARRIOR" },
      text = "Look at those shoulders. Ever swing an axe at something that isn't trying to kill you? Pays steady." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Supervisor Raelen. I make sure the wood gets cut, stacked and shipped on time. Everybody else makes sure it doesn't." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Bundle of Trouble") },
          text = "Wolves and bears up north ran my lads off. The wood's cut. It's lying there. Nobody will go and fetch it. And the order's due." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Bundle of Trouble") },
          text = "Eight bundles. North, where the animals are. Not kindling, not twigs. Bundles." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Bundle of Trouble"), days = 2 } },
          text = "Wagon's loaded. If the buyer complains about bark, that's on him." },
        { id = "h_rainer", key = true, text = "I told the deputy about the animals. Days ago. Rainer, his name is. Has anyone seen him since? Anyone at all?" },
        { id = "h_frontier", when = { questDone = TODO_QUEST("Protect the Frontier") },
          text = "Fewer wolves this week. Somebody's been busy. If that was you, the lads are grateful. I'm too busy to be." },
        { id = "h_daylight", when = { timeOfDay = "day", metBefore = true },
          text = "Daylight's still on us, so the axes should be going. Hear that? Neither do I. Excuse me a moment. CHOP." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly. Daylight's money." },
        { id = "h_again2", text = "Still here? Then make it count." },
      },
      choices = {
        { text = "Where's the deputy?", next = "rainer" },
        { text = "Who's all this lumber for?", next = "order" },
        { text = "What's chasing your workers off?", next = "animals" },
        { text = "Rainer says someone should tell you where Westbrook is.", next = "rainer_heard", when = { heardLine = "rainer.h_raelen" } },
        { text = "Your lads look done in. Let me tend them.", next = "priest", when = { class = "PRIEST" } },
        { text = "Westfall folk would work for you.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    rainer = {
      lines = {
        { id = "r_default", text = "Westbrook, apparently. The other end of the forest. I asked a deputy for help and got directions to a different deputy." },
      },
      choices = {
        { text = "Want me to have a word with him?", next = "rainer_word", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sounds like you'll have to manage.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    rainer_word = {
      lines = {
        { id = "rw_default", text = "Tell him the bears are east. East. And ask whether the army owns a map. I'd buy them one if they'd use it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rainer_heard = {
      lines = {
        { id = "rh_default", text = "Oh, does he. I know where Westbrook is. I wrote to the deputy whose name I had. Next time I'll write to Guard Thomas. He's on a bridge, at least." },
      },
      choices = {
        { text = "Thomas is closer.", next = "BACK", fx = { affinity = 1 } },
        { text = "You could just write to Dughan.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    order = {
      lines = {
        { id = "o_default", text = "Buyers. More of them than I can count. Orders come in faster than my lads can swing. Miss a deadline and the next order goes to someone else." },
      },
      choices = {
        { text = "Why not hire more lads?", next = "order_hire" },
        { text = "I could swing an axe.", next = "order_axe", when = { class = "WARRIOR" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    order_hire = {
      lines = {
        { id = "oh_default", text = "With who? The army's taken half the strong backs in Elwynn abroad, and the other half want to be adventurers. No offence." },
      },
      choices = {
        { text = "None taken.", next = "BACK", fx = { affinity = 1 } },
        { text = "Some taken.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    order_axe = {
      lines = {
        { id = "ox_default", text = "Could you? Pay's steady, and no tree's ever stabbed a lumberjack in the back. Come and see me when you're tired of glory." },
      },
      choices = { { text = "I'll keep it in mind.", next = "BACK", fx = { affinity = 2 } } },
    },

    animals = {
      lines = {
        { id = "a_default", text = "Wolves and bears, bolder every week. Thomas says something deeper in the forest has them riled. I say something has them hungry, and my lads look like supper." },
      },
      choices = {
        { text = "Something in the forest?", next = "animals_cause" },
        { text = "I'll thin them out.", next = "BACK", fx = { affinity = 1, standing = { eastvale = 1 } } },
      },
    },
    animals_cause = {
      lines = {
        { id = "ac_default", text = "Don't ask me. I count logs, not omens. Ask Thomas on the bridge, or the mage in that tower. He's nearer the omens than I am." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "Can you do it without stopping them? No? Then do it quick, at the midday break. Bless the axes while you're there. They need it more." },
      },
      choices = {
        { text = "Axes and men, both.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { eastvale = 1 } } },
        { text = "The men first. Then your deadline.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "Send them. I don't care where they're from if they can lift. A few came through already. They don't complain about anything. I've started to worry about them." },
      },
      choices = {
        { text = "They've seen worse than a deadline.", next = "BACK", fx = { affinity = 1, learn = { "westfall" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I run the camp. That's the story. It ships at sundown. Next question." } },
    advice = { { id = "tp_ad", text = "Know your deadline. Then pretend it's a day sooner." } },
    eastvale = { { id = "tp_eastvale", text = "Best timber in Elwynn. Worst luck. Write that on my stone." } },
    kobolds = { { id = "tp_kobolds", text = "Not my problem until they start eating lumber. Give it time." } },
    _none = { { id = "tp_none", text = "Does it ship? No? Then I don't know about it." } },
  },
}
