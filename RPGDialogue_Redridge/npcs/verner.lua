-- Verner Osgood, Lakeshire's blacksmith. Voice: bibles/verner.md
-- All his iron goes to the Guard; the gnolls take his horses.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "verner", id = TODO_NPC("Verner Osgood"), name = "Verner Osgood",
  bible = "bibles/verner.md", role = "blacksmith", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "honest", "stern" },
  notices = { "kit", "mount" },

  greetings = {
    { id = "g_forge", text = "The forge is hot, so make it quick or make it useful." },
    { id = "g_shoes", when = { questActive = TODO_QUEST("The Price of Shoes") }, text = "Did Argus get my note? He'll grumble; he always grumbles." },
    { id = "g_yowler", when = { questDone = TODO_QUEST("Howling in the Hills") }, text = "I haven't heard a howl in a week, and my horses are sleeping. So am I, for once." },
  },

  notice = {
    { id = "n_shoes", cat = "mount", when = { mounted = true },
      text = "Hold that animal still; its front left shoe's loose, and I can hear it from here. No, I haven't got iron for it, which is rather the point." },
    { id = "n_kit", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "You're coming apart at every rivet. The Guard gets my iron first, by order, but I can at least tell you what's wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Osgood, the smith. The Guard takes every scrap of iron I've got, and I'm meant to shoe the town's horses with what's left, which is nothing." },
        { id = "h_shoes", when = { questBefore = TODO_QUEST("The Price of Shoes") },
          text = "Smith Argus in Goldshire owes me, and he's got iron. If someone carried a note down to him, I might see horseshoes this side of winter." },
        { id = "h_shoes_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Price of Shoes") },
          text = "Go to the smithy in Goldshire. Hand him the note and stand there till he reads it, or he'll use it to light the forge." },
        { id = "h_return", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Verner"), days = 3 } },
          text = "Shoes! Real shoes, from real iron, so he came through after all. Don't tell him I said so, or he'll be unbearable." },
        { id = "h_scales", when = { questActive = TODO_QUEST("Underbelly Scales") },
          text = "Underbelly scales, from the black whelps that wander south of the lake. Argus wants paying, and scales are the only coin I've got." },
        { id = "h_gnolls", when = { questBefore = TODO_QUEST("A Baying of Gnolls") },
          text = "The gnolls up in the hills take any horse that wanders off, and then they eat it. I've stopped naming the foals." },
        { id = "h_baying", when = { questActive = TODO_QUEST("A Baying of Gnolls") },
          text = "Brutes and mystics, on the ridge north of my stable. Clear them off before they clear off with another horse." },
        { id = "h_yowler", when = { questActive = TODO_QUEST("Howling in the Hills") },
          text = "Yowler's the big one who leads the pack. Bring me proof he's done and I'll sleep through the night for the first time since spring." },
        { id = "h_argus", when = { heardLine = "argus.s_default" },
          text = "Argus told you never to let the apprentice near the quench? He learned that from me, though he'll never admit it." },
        { id = "h_horse", when = { metBefore = true }, text = "Shod a grey mare this morning, the best-tempered beast in Lakeshire and better company than most of its people. Don't tell Argus I said anything nice about anything." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and hammer at once, though I can't promise you'll hear the talk." },
        { id = "h_again2", text = "Go on, then. The iron's not getting any hotter while you think." },
      },
      choices = {
        { text = "Let's see what you've got.", next = "BUSINESS" },
        { text = "How do you know Argus?", next = "argus" },
        { text = "Why are your horses in danger?", next = "gnolls" },
        { text = "Where does all your iron go?", next = "iron" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Will you shoe my warhorse?", next = "warhorse", when = { class = "PALADIN", minLevel = 40 } },
        { text = "Good luck with the horses.", next = "END" },
      },
    },

    argus = {
      lines = {
        { id = "a_default", text = "We go back far enough to have argued about everything twice. He's quicker and I'm better, and we've never settled which matters more." },
      },
      choices = { { text = "Which is it?", next = "which" } },
    },
    which = {
      lines = { { id = "wh_default", text = "Better, obviously. Ask Argus and he'll say quicker, and he'll say it faster than I just did, which is his whole trouble." } },
      choices = {
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
        { text = "Will he send you shoes?", next = "bill" },
      },
    },
    bill = {
      lines = {
        { id = "bl_default", text = "He'll send them, if someone carries my note, and then he'll send a bill. I know him." },
        { id = "bl_done", when = { questDone = TODO_QUEST("Return to Verner") },
          text = "He sent them: fifty shoes in a crate, and a note on top asking to be paid. Paid, as if we'd never met!" },
      },
      choices = {
        { text = "How will you pay him?", next = "scales" },
        { text = "He's a businessman.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    scales = {
      lines = {
        { id = "sc_default", text = "Underbelly scales off the black whelps south of the lake. They're worth more than coin to a smith, and I've no coin. Where black whelps come from, I'd rather not think." },
      },
      choices = {
        { text = "I'll hunt some whelps.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnolls = {
      lines = {
        { id = "gn_default", text = "Redridge gnolls, brutes and mystics, up on the ridge north of my stable. A horse strays a yard past the fence and it's somebody's supper.",
          fx = { learn = { "redridge_gnolls" } } },
      },
      choices = {
        { text = "Who leads them?", next = "yowler" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yowler = {
      lines = {
        { id = "y_default", text = "That's Yowler. You'll know his howl, louder than the rest and closer than it should be, and with the army busy with orcs, nobody's coming for a gnoll that steals horses." },
        { id = "y_done", when = { questDone = TODO_QUEST("Howling in the Hills") },
          text = "Yowler did, until you went up there. The ridge has been quiet since, and the horses noticed before I did." },
      },
      choices = {
        { text = "Somebody just did.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    iron = {
      lines = {
        { id = "i_default", text = "To the Guard, by order. Every nail I make walks out of here on a soldier's boot. The horses get the scraps." },
      },
      choices = {
        { text = "Doesn't that leave the town short?", next = "iron_short" },
        { text = "The Guard needs it more.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "The town's horses matter as much as the Guard's boots.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    iron_short = {
      lines = { { id = "is_default", text = "Oslow wants rivets, Marris wants mail, and the horses want shoes, but I've one anvil and two hands. Somebody always goes without." } },
      choices = {
        { text = "That's a hard trade.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = { { id = "sm_default", text = "Then you know the worst sound in the trade: a hot forge with nothing in it. Where do you get your iron, these days?" } },
      choices = {
        { text = "I mine my own.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "Stormwind, at a price.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    warhorse = {
      lines = { { id = "wr_default", text = "That animal came out of thin air, and it'll go back into it. It can find its own shoes. Mine are for horses that eat hay." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "It's a gift of the Light, smith.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Then it can go unshod, for all I care.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Half the town comes past this forge for something, and they all talk while they wait. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "Smith, and the stable with it. If I had to keep one, I'd keep the horses." } },
    advice = { { id = "tp_ad", text = "Stable your horse at night, because gnolls don't knock." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Horse thieves with fur, and Yowler leads them right into my paddock." } },
    blackrock = { { id = "tp_blackrock", text = "They've got good steel, and I'd love to know where they get it, because it isn't from me." } },
    everstill_bridge = { { id = "tp_bridge", text = "Oslow keeps asking for nails. I keep asking for iron. We stare at each other." } },
    _none = { { id = "tp_none", text = "Can you shoe it? If not, I can't help you." } },
  },
}
