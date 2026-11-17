-- Supervisor Raelen, Eastvale Logging Camp. Voice: bibles/raelen.md
-- A lumber order, a deadline, and wolves sitting on the wood.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raelen", id = TODO_NPC("Supervisor Raelen"), name = "Supervisor Raelen",
  bible = "bibles/raelen.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "sharp" }, values = { "lawful", "ambitious" },
  notices = { "idle", "build" },
  impression = {
    first = "Supervisor Raelen measures the world in bundles and deadlines, and I fell short on both before I'd said a word. She will never say thank you, but I think she keeps count.",
    third = "{name} met Supervisor Raelen of the Eastvale Logging Camp, for whom the lumber order comes before everything.",
  },

  greetings = {
    { id = "g_busy", text = "Make it quick, will you, because that order won't fill itself." },
    { id = "g_bundles", when = { questActive = TODO_QUEST("A Bundle of Trouble") }, text = "Do you have my bundles? Then why are you standing there talking?" },
    { id = "g_after", when = { questDone = TODO_QUEST("A Bundle of Trouble") }, text = "The order went out on time, barely. I don't thank people, so consider this the closest I get." },
  },

  notice = {
    { id = "n_drunk", cat = "idle", when = { drunk = { min = 1 } },
      text = "You're drunk, on my camp, in the middle of the day. Do you know what an axe does to a drunk man's foot?" },
    { id = "n_shoulders", cat = "build", when = { class = "WARRIOR" },
      text = "Look at those shoulders. Ever swing an axe at something that isn't trying to kill you? It pays steady." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fight the bears, and then cut the wood, if you've an arm left, because the order's due and my lads are scared. I'd pay you for one and thank you for the other." } },
      choices = {
        { text = "I'll clear the bears and help with the wood.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight the bears. Your lads can cut their own wood.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Enough that my lads count them before they start work, and stop working when they lose count. The wolves came after the bears, following the scraps, so clear the one and the other will scatter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} could earn its keep up north. I'd pay it in scraps if it weren't against my principles." },
      },
      choices = {
        { text = "I'll thin them so your lads can work safely.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt them, but for the hides, not your order.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Defias are, and they're selling it in Westfall for twice what Stormwind pays me, which is the only part of it I admire. If you know anyone who knows anyone, I'd like a word with them." } },
      choices = {
        { text = "I'll help you catch them and hand them to the Guard.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find them, but I'll settle it my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd rather have anything that keeps the orders on time, but I know a spell can't tell good grain from bad, and my lads can. Still, if you've a spell that keeps wolves off the cut wood, I'd pay for it." } },
      choices = {
        { text = "Your lads' craft is worth more than a spell, Raelen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic's faster and cheaper. You should try it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sent word to the deputy at Westbrook, and Rainer wrote back that I'd got the wrong end of the forest. Meanwhile my lads are getting chewed on and the order's due, and nobody in Stormwind cares about lumber until the beams don't come." } },
      choices = {
        { text = "Stormwind owes you protection. I'll see it given.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait on Stormwind. Arm your lads and fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Raelen.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Can you carry wood? No, never mind; I'd rather you scared the bears off, and you'd have the lads' thanks, which is all I've got to give." },
        { id = "h_default", text = "Supervisor Raelen. I make sure the wood gets cut, stacked and shipped on time. Everybody else makes sure it doesn't." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Bundle of Trouble") },
          text = "The wolves and bears up north ran my lads off the cut wood, and now it's lying there with nobody willing to fetch it. And the order's due." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Bundle of Trouble") },
          text = "Eight bundles, from up north where the animals are. Not kindling and not twigs, mind; proper bundles." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Bundle of Trouble"), days = 2 } },
          text = "Wagon's loaded. If the buyer complains about bark, that's on him." },
        { id = "h_rainer", key = true, text = "I told the deputy about the animals days ago; Rainer, his name is. Has anyone seen him since? Anyone at all?" },
        { id = "h_frontier", when = { questDone = TODO_QUEST("Protect the Frontier") },
          text = "Fewer wolves this week, so somebody's been busy. If that was you, the lads are grateful, and I'm too busy to be." },
        { id = "h_daylight", when = { timeOfDay = "day", metBefore = true },
          text = "Daylight's still on us, so the axes should be going. Hear that? Neither do I, so excuse me a moment while I go and shout at somebody." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You'll want to steer clear of the stacks, because I've had enough timber walk off this camp at night." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at my logging camp. I don't suppose you could turn a tree into planks with a wave of your hand?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. If you're here to fight bears, good; if you're here to cut wood, better, but I'll take either." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The bears and wolves up north are your trade, I'd think, and they're my problem." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it; daylight's money." },
        { id = "h_again2", text = "If you're still here, you'd better make it count." },
      },
      choices = {
        { text = "Where's the deputy?", next = "rainer" },
        { text = "Who's all this lumber for?", next = "order" },
        { text = "What's chasing your workers off?", next = "animals" },
        { text = "Rainer says someone should tell you where Westbrook is.", next = "rainer_heard", when = { heardLine = "rainer.h_raelen" } },
        { text = "Your lads look done in. Let me tend them.", next = "priest", when = { class = "PRIEST" } },
        { text = "Westfall folk would work for you.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Is someone stealing timber from the camp at night?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you rather have magic than honest lumberjacks?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you rather I cut wood or fight bears?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How many bears are we talking about, Raelen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has Stormwind sent you any protection, Raelen?", next = "xapala", when = { class = "PALADIN" } },
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
        { id = "rw_default", text = "Tell him the bears are east of him, east! And ask whether the army owns a map, because I'd buy them one if they'd use it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rainer_heard = {
      lines = {
        { id = "rh_default", text = "Oh, does he? I know where Westbrook is; I wrote to the deputy whose name I had. Next time I'll write to Guard Thomas, who's at least on a bridge in the right half of the forest." },
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
        { id = "oh_default", text = "With whom? The army's taken half the strong backs in Elwynn abroad, and the other half want to be adventurers, no offence meant." },
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
        { id = "ac_default", text = "Don't ask me; I count logs, not omens. Ask Thomas on the bridge, or the mage in that tower, who's nearer the omens than I'll ever be." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "Can you do it without stopping them? No? Then be quick about it at the midday break, and bless the axes while you're there, because they need it more." },
      },
      choices = {
        { text = "Axes and men, both.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { eastvale = 1 } } },
        { text = "The men first. Then your deadline.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "Send them; I don't care where they're from as long as they can lift. A few came through already, and they don't complain about anything, which has me worried about them." },
      },
      choices = {
        { text = "They've seen worse than a deadline.", next = "BACK", fx = { affinity = 1, learn = { "westfall" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I run the camp, and that's the whole story. The order ships at sundown, so next question." } },
    advice = { { id = "tp_ad", text = "Know your deadline. Then pretend it's a day sooner." } },
    eastvale = { { id = "tp_eastvale", text = "Best timber in Elwynn and the worst luck to go with it. You can write that on my stone." } },
    kobolds = { { id = "tp_kobolds", text = "Not my problem until they start eating lumber. Give it time." } },
    _none = { { id = "tp_none", text = "Does it ship? If it doesn't, I don't know about it, and I don't need to." } },
  },
}
