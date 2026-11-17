-- Arei, the spirit of an Ancient of War, called up by the purified flute in Irontree Woods.
-- Voice: bibles/arei.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "arei", id = TODO_NPC("Arei"), name = "Arei",
  bible = "bibles/arei.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "calm", "patient" }, values = { "wise", "nature" },
  notices = { "class", "fel" },

  impression = {
    first = "Arei is the spirit of an ancient who fought for this forest long ago, still bound here and still carrying its pain. He asked to be led home with a patience that put me to shame.",
    third = "{name} met the spirit of Arei, an ancient of Felwood who asked to be led away to rest.",
  },

  greetings = {
    { id = "g_default", text = "You called with the flute, little one, and I have come. Speak, and do not be afraid of me." },
    { id = "g_active", when = { questActive = TODO_QUEST("Ancient Spirit") }, text = "Walk on, and I will follow. My roots are not as quick as they were." },
    { id = "g_away", when = { away = 14 }, text = "Seasons pass quickly for me, and you have been away only {away}. Still, I noticed." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown, the way a sapling does when no one is watching. I am glad to see it." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of Cenarius's children, still walking the old paths. The forest knows your step, druid, even sick as it is." },
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You carry a little of what burned this place. I can feel it from here, the way a tree feels smoke before it sees flame." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Arei, and I stood in this forest when it was green and peaceful, before the Legion came. The infernals and the skull of Gul'dan spared nothing here, and even as a spirit I am bound to bear what this land suffers." },
        { id = "h_free", tags = { "news" }, when = { questActive = TODO_QUEST("Ancient Spirit") },
          text = "Lead me out of this place, little one, toward the east, where the trees are still whole. Once I am free, find the druid Kayneth Stillwind at Forest Song, and tell him what you have done." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, come to listen to an old tree. Few of your kind walk Irontree now, and those who do weep, which is right, but it does not heal anything." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A child of the kaldorei. Your people planted the seeds my kin grew from, long ago, and now the seeds are poisoned, and I do not blame you for it." },
      },
      again = {
        { id = "h_again", text = "What else, little one? I am patient, though this place is not." },
        { id = "h_again2", text = "Ask. A spirit has more time than it wants." },
      },
      choices = {
        { text = "What was Felwood like before?", next = "before" },
        { text = "Something terrible happened to you here.", next = "fall" },
        { text = "Where do you want to go?", next = "home" },
        { text = "What did the flute do to you?", next = "flute" },
        { text = "Can Felwood be healed?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I carry fel, but I'll still lead you home.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Rest a while, Arei.", next = "END" },
      },
    },
    before = {
      lines = {
        { id = "b_default", text = "Streams ran clear through meadows of tall grass, and the summer sun was gentle because the wind always tempered it. The songbirds were so loud in the mornings that the young treants complained of it." },
      },
      choices = {
        { text = "It sounds beautiful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall = {
      lines = {
        { id = "f_default", text = "The demons came through these woods on their way to the mountain, and the skull of Gul'dan poisoned everything it touched. My kin and I fought, and we fell, and the sickness took our bodies and twisted them into the things you see walking Irontree now." },
      },
      choices = {
        { text = "So the corrupted ancients are your kin.", next = "fall_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall_kin = {
      lines = {
        { id = "fk_default", text = "They were, and some still are, in whatever remains of them beneath the bark. The druids at the Emerald Sanctuary have been putting them to rest, one by one, which is a kindness, though it is a hard one to watch." },
      },
      choices = {
        { text = "Is it really a kindness?", next = "fall_mercy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall_mercy = {
      big = true,
      lines = {
        { id = "fm_default", text = "A tree that cannot be healed should be cut, so that the rest of the forest can grow. I would rather my kin be ended cleanly than walk on in pain, but I do not ask you to agree with an old tree." },
      },
      choices = {
        { text = "Ending suffering is mercy. I agree.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some might still be saved. Cutting is too easy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "ho_default", text = "Away from here, to the east and south, where Ashenvale's trees still remember what it is to be whole. Once I am free of this place, I can finally rest." },
      },
      choices = {
        { text = "Who will I find there?", next = "kayneth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kayneth = {
      lines = {
        { id = "k_default", text = "A druid named Kayneth Stillwind, at Forest Song. He will understand what you have done, and he will see that it is remembered." },
      },
      choices = {
        { text = "I'll find her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flute = {
      lines = {
        { id = "fl_default", text = "The flute was tied to us by the satyrs, and Eridan Bluewind cut that tie with the water of Elune. Now it only calls, and does not bind, and that is why I could come to you as myself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xd_default", text = "One day, perhaps, if enough of you keep trying, and every kind deed here is a seed. But I have watched druids weep over this forest for years, and weeping is not the same as tending." },
      },
      choices = {
        { text = "Then I'll tend it patiently, root by root.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then burn the worst of it and let it regrow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "Then you will lead me, and I will follow, and neither of us will speak of it. The forest has been harmed by worse than you, and helped by fewer." },
      },
      choices = {
        { text = "Thank you, Arei.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was an ancient of this forest, a guardian among many. Now I am a memory with roots." } },
    advice = { { id = "tp_ad", text = "Every kind deed here is a seed, little one. Plant as many as you can before you leave." } },
    burning_legion = { { id = "tp_bl", text = "They passed through here once, and the forest will remember it longer than any of you will live." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids try, and I love them for it. They are young, even the old ones." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is the mother of every tree that stood in this forest, and I felt it groan when the demons came. I would give my last root to feel it whole again." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I dreamed green once, as all the ancients do, before the fel came into my roots. Now I dream of fire, and I do not sleep if I can help it." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the last of this forest's children with clear eyes. I watched their cousins go mad, and I could do nothing, and I remember every one of them." } },
    scourge = { { id = "tp_scourge", text = "The Legion's dead marched through this forest on their way to Hyjal, and the ground still carries their rot. I can feel it, deep, where the roots go." } },
    _none = { { id = "tp_none", text = "That is not a thing a tree would know, little one." } },
  },
}
