-- Verner Osgood, Lakeshire's blacksmith. Voice: bibles/verner.md
-- All his iron goes to the Guard; the gnolls take his horses.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "verner", id = TODO_NPC("Verner Osgood"), name = "Verner Osgood",
  bible = "bibles/verner.md", role = "blacksmith", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "honest", "stern" },
  notices = { "kit", "mount" },

  impression = {
    first = "Verner Osgood has a hot forge and no iron, because the Guard takes every scrap. He seemed glad to have someone to grumble at besides his horses.",
    third = "{name} met Verner Osgood, the Lakeshire smith whose iron all goes to the Guard.",
  },

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
    op_gnolls = {
      lines = {
        { id = "op_gnolls_a", text = "Depends who's asking and how many horses they've lost. The guards say wipe out every gnoll on the ridge, and old Martie says the orcs have pushed them down off the mountains and they're as frightened as we are. What do you reckon?" },
      },
      choices = {
        { text = "Clear the ridge. They chose to raid, so they chose the sword.", next = "op_gnolls_1", fx = { opinion = { redridge_gnolls = "clear_them" }, align = { light = -1 }, affinity = 1 } },
        { text = "They're starving refugees. Push the orcs back and they'll go home.", next = "op_gnolls_2", fx = { opinion = { redridge_gnolls = "driven" }, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Kill the leaders and the rest will scatter.", next = "op_gnolls_3", fx = { opinion = { redridge_gnolls = "leaders" }, trait = { practical = 1 } } },
        { text = "I don't know enough about gnolls to say.", next = "BACK" },
      },
    },
    op_gnolls_1 = {
      lines = { { id = "op_gnolls_r1", text = "That'll please the Guard, and the horses, and me, to be honest about it. Bring me a few of their blades, and I'll melt them into shoes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_gnolls_2 = {
      lines = { { id = "op_gnolls_r2", text = "Martie'll like you, then. I'd like you better if the gnolls would like you too, and leave my paddock be while you're arguing their case." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_gnolls_3 = {
      lines = { { id = "op_gnolls_r3", text = "That's Yowler, then, and I'll say good riddance. Every gnoll that can howl louder than the rest thinks he's a king." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They take every scrap. I've a hot forge and no iron. At least my horses listen to my grumbling." } },
      choices = {
        { text = "The Guard needs it, Verner. Be patient.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Take some back. You've earned it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not unless you've seen it lying about in the hills, and you might have, because the gnolls loot every cart they catch. If you find any scrap on their bodies, bring it to me, and I'll make something useful of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has better claws than my best horseshoe nails, {class}, and I'm a little jealous of it." },
      },
      choices = {
        { text = "I'll bring you every scrap I find.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep what I find. Iron's worth coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Verner.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "If it's Guard iron, I'll know it by the stamp, and I'll not touch it, because Marris needs every scrap. But if it came off a Blackrock camp, I'll ask no questions and work it gladly." } },
      choices = {
        { text = "Orc iron only. Nothing from the Guard.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Iron is iron, Verner. Don't fuss.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why is iron so short?", next = "iron_short" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "The forge is hot enough, friend; it's the anvil that's cold for want of iron. You'd do better bringing me ore than fire." } },
      choices = {
        { text = "Then ore it is. A proper forge needs proper stock.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll melt down whatever I find, then.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you need most?", next = "iron" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I've heard that, and I've melted Blackrock blades that hissed in the quench like a cat in a bath. Bring me their steel if you like, but I'll be the one deciding what goes in the fire." } },
      choices = {
        { text = "Burn the curse out and make it clean steel.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep the hiss. A cursed edge bites deeper.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How long have you been smithing?", next = "smith" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The orcs have chased everything down from the mountains, wolves included. I don't fault the creatures much, but I've a butcher's order to fill, and they keep eating it before it reaches Lakeshire." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "You can, if you think it'll reach them, though I'd sooner you prayed the gnolls choke. I named every foal until the third one went up the hill, and since then I just call them all lad." } },
      choices = {
        { text = "Every creature deserves a prayer. I'll say one for them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to pray the gnolls choke, as you say.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Verner.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "With a hammer, and a forge, and the good sense to stay behind the stable door. If the gnolls come down for the horses while I'm here, they'll find a smith's arm is as good as a guard's, and angrier." } },
      choices = {
        { text = "I'll drive Yowler's pack off your hill myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your horses, your trouble, Verner. Build a better fence.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Verner.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've a kind way with beasts, I'll bet. I could use that; the wolves around here have taken a liking to my supplies." },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast wouldn't need shoeing, I suppose, which is a mercy, because I've no iron to do it with." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've a blessing for horses, mine could use one, because I've stopped naming the foals." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'll not ask whether your horse needs shoeing, because I've no iron to shoe it with." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My forge is hot and empty; the Guard takes every scrap. Your fire spirits might like it better than I do." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and hammer at once, though I can't promise you'll hear the talk." },
        { id = "h_again2", text = "Go on, then. The iron's not getting any hotter while you think." },
      },
      choices = {
        { text = "Why do the wolves come so close to town?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Let's see what you've got.", next = "BUSINESS" },
        { text = "How do you know Argus?", next = "argus" },
        { text = "Your horses seem to be in some danger.", next = "gnolls" },
        { text = "Where does all your iron go?", next = "iron" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Will you shoe my warhorse?", next = "warhorse", when = { class = "PALADIN", minLevel = 40 } },
        { text = "I need an edge that won't fold on an orc's skull.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I could find you iron, if you don't ask where from.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could heat your forge with a spell.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could hunters help you find iron, Verner?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Blackrock steel holds a curse well, they say.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Shall I pray for the horses you've lost, Verner?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can you keep your horses safe from the gnolls, Verner?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Guard seems to take all your iron, Verner.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { id = "sc_default", text = "Underbelly scales off the black whelps south of the lake. A smith can work them where steel won't take, and I've no coin besides. Where black whelps come from, I'd rather not think." },
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
        { text = "Are the gnolls just hungry, or something worse?", next = "op_gnolls" },
        { text = "Someone must be leading them.", next = "yowler" },
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
        { text = "That must leave the town short.", next = "iron_short" },
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
        { text = "Hay-eaters only. I'll tell the horse.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "It's a gift of the Light, smith.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Then it can go unshod, for all I care.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "So does every guard in Lakeshire, and they've had all my iron for it. Bring me a few bars from the hills and I'll put an edge on whatever you're swinging, because a warrior with a dull blade is just a man holding a bar." } },
      choices = {
        { text = "Where's the nearest ore?", next = "iron" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons hoard the best ore in Khaz Modan and smelt it with fire you can't buy in Stormwind. I'd give my best anvil for a single bar of it, and they'd still not give me one." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The orcs of that mountain to the north are forging weapons faster than I can mend them, and they have all the iron I don't. If anyone ever takes that place, I'd like the scrap." } },
    thandol_span = { { id = "tp_thandol_span", text = "The ore that used to come down from Ironforge came over the Thandol Span, and now I'm told the Dark Irons have been blasting at it. The Guard takes what little I get, so it's no matter either way." } },
    bolvar = { { id = "tp_bolvar", text = "The Guard tells me the Highlord sends his regards and requisitions all my iron. I'd send my regards back, but I've nothing left to send them in." } },
    silver_hand = { { id = "tp_silver_hand", text = "A paladin of the Silver Hand once asked me to mend his hammer, and the Light nearly blinded me while I worked. I charged him double, and he paid it without a word, which made me feel worse." } },
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
