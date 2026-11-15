-- Sven Yorgen, his camp by the Hushed Bank. Voice: bibles/sven.md
-- Remembers the forest green. Lost his family to riders in black. Wants a name.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sven", id = TODO_NPC("Sven Yorgen"), name = "Sven Yorgen",
  bible = "bibles/sven.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "sharp" }, values = { "stern", "honest" },
  notices = { "kit", "grief" },

  greetings = {
    { id = "g_camp", text = "Sit by the fire or move along. I don't care which." },
    { id = "g_figure", when = { questActive = TODO_QUEST("The Shadowy Figure") }, text = "Well? Who was it? Who was at my farm?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Morbent Fel") }, text = "It's done. I keep waiting to feel something about it." },
    { id = "g_armed", when = { questActive = TODO_QUEST("Armed and Ready") }, text = "You've brought it. Let me see it. Let me hold it a moment." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You're not ready for what's in these woods. Neither was I. Get that armor seen to before you go further." },
    { id = "n_grief", cat = "grief", when = { deaths = { min = 15 } },
      text = "You've been killed a lot; I can see it on you. People who keep coming back get a hollow look. My wife said I had it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sven Yorgen. I remember when this forest was green. Nobody believes me anymore. That's all right. I barely believe it." },
        { id = "h_farm", when = { questBefore = TODO_QUEST("The Shadowy Figure") },
          text = "I came home and they were gone. My wife. My children. Riders in black, the tracks said. And something watching from the barn." },
        { id = "h_dig", when = { questActive = TODO_QUEST("Sven's Revenge") },
          text = "Behind the old stump, by my barn. He buried something there and ran. I was too busy chasing riders to dig. Dig for me." },
        { id = "h_jitters", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Sven") },
          text = "Jitters. A thief who hid in my barn and watched. He brought this on us. Him and his kind. Don't tell me he's sorry." },
        { id = "h_proving", when = { questActive = TODO_QUEST("Proving Your Worth") },
          text = "His dead guard the crypt south of his house. Break them. Then I'll believe you can break him." },
        { id = "h_seeking", when = { questActive = TODO_QUEST("Seeking Wisdom") },
          text = "Bishop Farthing, in the Cathedral. Stormwind forgot us. He didn't. Give him the book and tell him what you mean to do." },
        { id = "h_morbent", when = { questActive = TODO_QUEST("Morbent Fel") },
          text = "Morbent Fel. He sits in Forlorn Rowe like a spider. Everything rotten in these woods has a thread running back to someone like him." },
        { id = "h_revenge", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morbent Fel"), days = 3 } },
          text = "I went back to the farm last night. Sat on the porch. Couldn't go in. Maybe next time." },
        { id = "h_jitters_heard", when = { heardLine = "jitters.s_default" },
          text = "He told you he just watched? He just watched. As if that makes it smaller. It makes it bigger." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. Pray if you want. I stopped. I'll stand next to you while you do it, though. That's as far as I go." },
        { id = "h_quiet", when = { metBefore = true }, text = "You came back. Most don't. Sit if you like. I don't talk much. The forest does it for me." },
      },
      again = {
        { id = "h_again", text = "What else." },
        { id = "h_again2", text = "Ask, then. The fire's not going anywhere. Neither am I." },
      },
      choices = {
        { text = "What happened to your family?", next = "family" },
        { text = "What do you want?", next = "want" },
        { text = "Who keeps this camp with you?", next = "camp" },
        { text = "What was the forest like, before?", next = "green" },
        { text = "Who is Morbent Fel?", next = "morbent", when = { questDone = TODO_QUEST("Return to Sven") } },
        { text = "Jitters is sorry, Sven.", next = "jitters", when = { questDone = TODO_QUEST("Return to Sven") } },
        { text = "Let me pray for them with you.", next = "priest", when = { class = "PRIEST" } },
        { text = "I lost a farm too. In Westfall.", next = "farmer", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    family = {
      big = true,
      lines = {
        { id = "f_default", text = "They were looking for something. A scythe, something out of Roland's Doom. They tore the farm apart looking, and killed everyone in it." },
      },
      choices = {
        { text = "I'm sorry, Sven.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then we find the riders.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 }, learn = { "dark_riders" } } },
        { text = "Where were you?", next = "family_away" },
      },
    },
    family_away = {
      lines = {
        { id = "fa_default", text = "Darkshire. Buying things for the children. I told them I'd be back soon. I was. Not soon enough." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What did you find?", next = "family_found" },
      },
    },
    family_found = {
      lines = {
        { id = "ff_default", text = "Riders' tracks heading east, toward Deadwind. And a man by my barn, digging. I went after the riders. I should have caught the digger. He was slower.",
          fx = { learn = { "dark_riders" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    want = {
      lines = { { id = "w_default", text = "A name. Then another. Then whoever's at the top of the list. Then I'll sleep." } },
      choices = {
        { text = "Revenge won't bring them back.", next = "back", fx = { align = { light = 1 } } },
        { text = "I'll help you get it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "No. But it'll stop them taking someone else's. That'll have to do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "c_default", text = "Lars and me, and whoever the Carevins send down with supplies. Lars hunts. The wolves hunt Lars. It evens out." },
      },
      choices = {
        { text = "Who are the Carevins to you?", next = "camp_carevins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_carevins = {
      lines = {
        { id = "cc_default", text = "Darkshire folk who'd rather fight than wait. They send food and flash powder. I don't ask what they want for it. So far, nothing.",
          fx = { learn = { "carevins" } } },
      },
      choices = {
        { text = "Good people are rare out here.", next = "BACK", fx = { affinity = 1 } },
        { text = "Everyone wants something.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    green = {
      lines = {
        { id = "gr_default", text = "Green. Birdsong at dawn. You could see the sky from my porch. Then the dark came over the trees, slow, like a bruise, and stayed." },
      },
      choices = {
        { text = "Will it ever lift?", next = "green_lift" },
        { text = "Something else.", next = "BACK" },
      },
    },
    green_lift = {
      lines = {
        { id = "gl_default", text = "Ask the stargazer in Darkshire. He thinks it can be measured. I think it can be outlived. One of us is a fool." },
      },
      choices = {
        { text = "Maybe neither of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    morbent = {
      big = true,
      lines = {
        { id = "mo_default", text = "A necromancer in the house above Raven Hill. I've watched those riders go up to his door and talk. He's their friend. That makes him mine to kill.",
          fx = { learn = { "morbent_fel", "dark_riders" } } },
      },
      choices = {
        { text = "Can he even be killed?", next = "morbent_wards" },
        { text = "Then let's kill him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    morbent_wards = {
      lines = {
        { id = "mw_default", text = "Not with plain steel. He's wrapped himself in spells. Bishop Farthing in Stormwind might know a way. He's kind, and he remembers us." },
        { id = "mw_bane", when = { questDone = TODO_QUEST("Armed and Ready") },
          text = "Not with plain steel. With what you brought back, yes. Holy iron off a sunken ship, hammered by a dwarf. Strange world. Use it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    jitters = {
      lines = {
        { id = "ji_default", text = "Sorry. He brought them to my door, and then he wrote it all down, neat, like a ledger. Don't carry his apologies here." },
      },
      choices = {
        { text = "He prayed for your wife.", next = "jitters_prayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jitters_prayed = {
      big = true,
      lines = {
        { id = "jp_default", text = "...He wrote that too. I read it twice. I don't know what to do with it. Leave it with me a while." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } } },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Pray, then. I'll listen. I grieve every night, priest. In the morning I sharpen things. The Light can have the nights. I need the mornings." },
      },
      choices = {
        { text = "Then I'll pray at night, for you.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Hate will hollow you out.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { stern = 1 } } },
      },
    },
    farmer = {
      lines = {
        { id = "fm_default", text = "Westfall. I heard. Thieves in the fields and the Crown looking the other way. At least you've a field left to be angry about." },
      },
      choices = {
        { text = "Barely.", next = "BACK", fx = { affinity = 2, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I farmed southeast of here. A wife, two children, a barn. Now I've a camp, a friend who hunts, and a list." } },
    advice = { { id = "tp_ad", text = "Don't chase two things at once. I did, the night I came home. I caught neither." } },
    worgen = { { id = "tp_worgen", text = "They came after the riders. Or with them. Same night, near enough. I stopped telling them apart." } },
    defias = { { id = "tp_defias", text = "Thieves. One of them hid in my barn. Ask him how brave the Brotherhood is." } },
    stalvan = { { id = "tp_stalvan", text = "The tutor? Before my trouble. Everyone in Duskwood has a murder. That one's Smitts's." } },
    morbent_fel = {
      { id = "tp_morbent_next", when = { questDone = TODO_QUEST("Return to Sven") }, text = "The riders' friend on the hill. Ask what you want to know.", next = "morbent" },
      { id = "tp_morbent", text = "A man in a house above the graves. The dead walk because he wants them to. That's enough to know." },
    },
    dark_riders = { { id = "tp_riders", text = "Black horses, black cloaks. Out of Deadwind Pass. Somebody sends them. I'll find out who." } },
    carevins = { { id = "tp_carevins", text = "They feed this camp. Elaine sends whoever's passing. I don't know why they bother. I'm glad they do." } },
    _none = { { id = "tp_none", text = "Don't know. Don't care. Unless it wears black and rides." } },
  },
}
