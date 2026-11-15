-- The wastes: Kum'isha the Collector near the Rise of the Defiler, the bloodmages Drazial and Lynnore by the northern pass, and Daio the Decrepit in the Tainted Scar. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kumisha", id = TODO_NPC("Kum'isha the Collector"), name = "Kum'isha the Collector",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "major",
  communities = { "blasted_lands" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  notices = { "race", "money" },

  impression = {
    first = "Kum'isha the Collector is a broken draenei who sneers that every race smells of greed, then sends you looking for crystals. Under the contempt there is a homesickness so old it has gone hard.",
    third = "{name} met Kum'isha the Collector, a Lost One who searches the Blasted Lands for draenethyst to carry him home.",
  },

  greetings = {
    { id = "g_default", text = "Another one, come to stare at the broken draenei. Stare, then, and be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you still smell of it. They always do." },
    { id = "g_sphere", when = { questDone = TODO_QUEST("To Serve Kum'isha") }, text = "You. The one who brought Kum'isha the sphere. I have not decided yet whether to despise you less." },
  },

  notice = {
    { id = "n_rich", cat = "money", when = { money = { min = 1000000 } },
      text = "Your purse is heavy, and you carry it the way they all do, as if it were part of your body. I could smell it before I could see you." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people's axes knew mine long before either of us set foot on this world, and I have not forgotten, whatever your warchief tells you now." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, all gears and greed in a very small parcel. Do not touch anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I have heard orcs call the stench of humans sickening, and humans call the stench of orcs wretched, yet to me every race of these lands gives off the same odour: the foul, dizzying scent of greed. I am Kum'isha, and I collect." },
        { id = "h_fragments", when = { questActive = TODO_QUEST("Everything Counts In Large Amounts") },
          text = "Fragments, flawed and cloudy, will not take Kum'isha home, but they may yet serve my people in other ways. Bring what you find, and spare me the drooling." },
        { id = "h_sphere_wait", when = { questActive = TODO_QUEST("To Serve Kum'isha") },
          text = "A flawless sphere, {race}. Draenei have spent whole lives searching for just one, and you think you will stumble on it on an afternoon's walk. We shall see." },
        { id = "h_sphere_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("To Serve Kum'isha"), days = 7 } },
          text = "I hold it still, the sphere you brought, and I have not slept. Perhaps a rift can be opened now; perhaps my people will go home after all this." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night the Portal is only a shadow against the stars, and I can almost pretend it leads somewhere I would want to go." },
      },
      again = {
        { id = "h_again", text = "More? Ask, then. I have walked these wastes long enough to have patience, if not manners." },
        { id = "h_again2", text = "You are still here. Speak, {race}, or go and dig." },
      },
      choices = {
        { text = "Who are you, really?", next = "who" },
        { text = "What do you collect?", next = "draenethyst" },
        { text = "Why do you say everyone smells of greed?", next = "greed" },
        { text = "What do you give for the fragments?", next = "junk" },
        { text = "The Light could mend what was done to you.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Orcs came through that Portal too, draenei.", next = "orc", when = { race = "Orc" } },
        { text = "I'll keep my eyes open for crystals.", next = "END", fx = { affinity = 1 } },
      },
    },

    who = {
      lines = {
        { id = "w_default", text = "A draenei, once, as you would know if you had ever seen one whole. Now one of the broken ones, the lost, stranded on the wrong side of a door that will not open, with nothing but red dust and greedy strangers for company." },
      },
      choices = {
        { text = "Where is home?", next = "who_home" },
        { text = "How did you get here?", next = "who_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_home = {
      big = true,
      lines = { { id = "wh_default", fx = { learn = { "dark_portal" } },
        text = "Beyond that door, on the world the orcs called Draenor, if any of it still stands. It was greed that took me from my home, {race}, and it will be greed that takes me back." } },
      choices = {
        { text = "Whose greed took you from home?", tag = "Persuade", next = "greed_own",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("To Serve Kum'isha") }, { trait = "kind" } } } },
          fail = { next = "who_sneer", fx = { affinity = -1 } } },
        { text = "I hope you find your way back.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Some doors are better left shut.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    who_how = {
      lines = { { id = "wo_default", text = "That is not a tale I tell to strangers in the dust. Kum'isha is here, Kum'isha cannot leave, and Kum'isha does not care to remember the road between." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    greed_own = {
      big = true,
      lines = {
        { id = "go_default", text = "Mine, {race}. Before I smelled greed on every race of this world, I smelled it on myself every morning, and I followed it further than I should have, and it left me here. Now you know why I hate the smell so." },
      },
      choices = {
        { text = "Then you know it can be overcome.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You still collect. Has anything changed?", next = "greed_still" },
      },
    },
    greed_still = {
      lines = { { id = "gs_default", text = "Everything and nothing. I collect so I can leave, which is the one greed I permit myself; whether that makes me better or only more honest, I leave for wiser heads." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who_sneer = {
      lines = { { id = "ws_default", text = "You would like that, would you not, a sad story to carry home with the loot. Kum'isha gives you crystals to find, not his life." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    draenethyst = {
      lines = {
        { id = "d_default", fx = { learn = { "draenethyst" } },
          text = "Draenethyst, the crystal of my people, scattered across these lands in shards. The flawed fragments are common enough, but a flawless sphere is among the rarest things on this world, and with enough of them a rift might be opened." },
      },
      choices = {
        { text = "Where would I find a sphere?", next = "draenethyst_where" },
        { text = "A rift? To where?", next = "who_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    draenethyst_where = {
      lines = { { id = "dw_default", text = "Anywhere and nowhere: in the belly of a beast, in an ogre's pouch, in the hoard of the black drake that circles the Portal. Draenei have searched lifetimes for a single sphere and met horrible ends with their purpose unfulfilled." } },
      choices = {
        { text = "Then I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll find one.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    greed = {
      big = true,
      lines = { { id = "g_default", text = "Do you doubt it? Look at what runs your life, {race}: the gold you count, the land you fight over, the trinkets you strip from the dead. All of it is runoff from the greed that decides your every step." } },
      choices = {
        { text = "Is nobody free of it, then?", next = "greed_others" },
        { text = "Not everyone. Some fight for others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You're right. Coin decides everything.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    greed_others = {
      lines = { { id = "go2_default", text = "Perhaps, somewhere, and yet you came to the broken draenei because you heard he pays. Bring me a sphere for nothing, then, and I will believe you." } },
      choices = {
        { text = "Fair point.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    junk = {
      lines = { { id = "j_default", text = "Clothes, mostly, and odds and ends I have gathered from the dead out here, and you will snatch them up like a starving dog. Bring a fragment, take your junk, and do not thank me." } },
      choices = {
        { text = "That's fair trade.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "I don't need a reward.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Mend? You think a prayer will make me whole, little priest, when nothing short of home could. Keep your Light for those who still have a shape worth saving." } },
      choices = {
        { text = "Every shape is worth saving.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Perhaps you're right. Some things stay broken.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "or_default", text = "They did, and before that they came to my people with axes, and before that they were something else entirely. You have changed, I am told; so have I, and neither of us for the better." } },
      choices = {
        { text = "My people are free now. We've changed.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "What's done is done. I won't apologise.", next = "BACK", fx = { align = { honor = -1 }, affinity = -2 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Kum'isha has walked these wastes for a long time and listened to every fool who passed. Choose, then, and I will tell you what I have heard." } },
    background = {
      { id = "tp_bg", text = "Kum'isha the Collector, broken, lost, and far from home. That is all a stranger needs.", next = "who" },
      { id = "tp_bg2", text = "I was something once. Now I collect, and wait." },
    },
    advice = { { id = "tp_ad", text = "Count your coins less and watch the sky more, {race}. The drake over the Portal does not care how rich you are." } },
    draenethyst = { { id = "tp_draenethyst", text = "The crystal of my people. Find it, bring it, and take your junk.", next = "draenethyst" } },
    dark_portal = { { id = "tp_portal", text = "A door, and on the far side of it, everything I have lost. I look at it every day." } },
    burning_legion = { { id = "tp_legion", text = "Older than greed, and hungrier. Even I do not walk into the Scar." } },
    _none = { { id = "tp_none", text = "Kum'isha does not care. Bring crystals or leave." } },
  },
}

P:NPC {
  key = "drazial", id = TODO_NPC("Bloodmage Drazial"), name = "Bloodmage Drazial",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "eager" }, values = { "curious", "ambitious" },
  notices = { "class", "pet" },

  impression = {
    first = "Bloodmage Drazial studies the beasts of the Blasted Lands with the delight of a man unpacking presents, and he looks at people the same way. He called me a test subject and meant it as a compliment.",
    third = "{name} met Bloodmage Drazial, an elven bloodmage studying the strength of the Blasted Lands' beasts.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a fresh specimen! Forgive me; I mean a fresh visitor, of course." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite test subject returns. How is the constitution?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Look at the shoulders on you; my sister may keep her basilisk brains, I'd sooner study you." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Your beast hasn't been changed by the Portal yet, which makes it a perfect control for my study. Don't let it eat anything out here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bloodmage Drazial, at your service. The beasts of these lands show preternatural strength, speed and endurance, quite unlike anything in nature, and I mean to bottle every bit of it." },
        { id = "h_boar", when = { questActive = TODO_QUEST("A Boar's Vitality") },
          text = "Three boar lungs, two scorpok pincers and a basilisk brain, and you'll be my first test subject for the elixir. Try not to be eaten before then; it would spoil the data." },
        { id = "h_jowls", when = { questActive = TODO_QUEST("Snickerfang Jowls") },
          text = "The snickerfang hyenas have jaws that could crack an ogre's skull, and I want to know why. Bring me their jowls, please, and as fresh as you can." },
        { id = "h_drank", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Boar's Vitality"), days = 3 } },
          text = "Tell me honestly, do you feel invulnerable yet? The boars do, and nothing out here has managed to prove them wrong." },
      },
      again = {
        { id = "h_again", text = "Another question? Splendid; curiosity is the first sign of a healthy subject." },
        { id = "h_again2", text = "Go on. My sister says I talk too much, so let's prove her right." },
      },
      choices = {
        { text = "What happened to the beasts here?", next = "beasts" },
        { text = "What do your elixirs do?", next = "elixirs" },
        { text = "Who's the other bloodmage?", next = "sister" },
        { text = "Strength in a bottle? I'm listening.", next = "warrior", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", fx = { learn = { "dark_portal" } },
          text = "Our theory is that the energy released when the Dark Portal opened soaked into them, and forced them to change into what you see. The boars are so tough that nothing else bothers hunting them, and the scorpoks strike faster than the eye can follow." },
      },
      choices = {
        { text = "Is that energy dangerous to us?", next = "beasts_danger" },
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    beasts_danger = {
      lines = { { id = "bd_default", text = "Probably, in time, and in large doses. That's why we distil it from the beasts first, rather than licking the rocks like some of the ogres seem to." } },
      choices = {
        { text = "Fel is fel. Bottling it doesn't make it clean.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Power is power. Use it while you can.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs = {
      lines = { { id = "e_default", text = "Each takes one gift from these beasts and lends it to you for an hour or so: the boar's endurance, the hyena's strength, the scorpok's quickness. The first is free, for science, and the rest you'll pay for in organs." } },
      choices = {
        { text = "Any side effects?", next = "elixirs_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs_side = {
      lines = { { id = "es_default", text = "None that have lasted, so far, and the subjects have stopped complaining about the taste. Do keep a record of anything unusual, though; it all goes in the notes." } },
      choices = {
        { text = "I'll keep notes.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = { { id = "s_default", text = "Lynnore, my sister. She studies the mind and spirit of the beasts and leaves me the body, which she considers the lesser half of the work; I consider it the half that bites." } },
      choices = {
        { text = "Do you two get along?", next = "sister_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister_along = {
      lines = { { id = "sa_default", text = "We've shared a camp in the Blasted Lands without killing each other, which in this place counts as devotion. Don't tell her I said that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warrior = {
      lines = { { id = "w_default", text = "I thought you might be. The snickerfang's strength in a single draught; you'll swing that weapon like you were born to it, at least until it wears off." } },
      choices = {
        { text = "Sign me up.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'd rather earn my strength.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A bloodmage, which means I study what's in the blood and the bone. The rest is footnotes.", next = "beasts" } },
    advice = { { id = "tp_ad", text = "Never fight a Blasted Lands boar fairly; they don't tire, and you will." } },
    dark_portal = { { id = "tp_portal", text = "The source of everything interesting in these lands. Also everything dangerous, but that's usually the same list." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Ask my sister; she's better at abstractions." } },
  },
}

P:NPC {
  key = "lynnore", id = TODO_NPC("Bloodmage Lynnore"), name = "Bloodmage Lynnore",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "steady" }, values = { "curious", "wise" },
  notices = { "class" },

  impression = {
    first = "Bloodmage Lynnore speaks of basilisks with more respect than she shows most people. She is cool, clever and fond of her brother in a way she would never admit to his face.",
    third = "{name} met Bloodmage Lynnore, an elven bloodmage studying the minds and spirits of the Blasted Lands' beasts.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. I'm observing." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your mind's still in one piece, I trust?" },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You'll understand my work better than my brother does; you also believe there's more to a creature than its meat." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and a thinking one, I hope. My compounds sharpen the mind as well as any study, and far more quickly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bloodmage Lynnore. My brother Drazial studies the strength of the beasts here, and I study what he overlooks: their minds, and the spirit that lets them heal and endure beyond anything their bodies should allow." },
        { id = "h_brains", when = { questActive = TODO_QUEST("The Basilisk's Bite") },
          text = "Ten basilisk brains and two vulture gizzards, as fresh as you can manage. The brains are the point; the gizzards are only there to hold the solution together." },
        { id = "h_vulture", when = { questActive = TODO_QUEST("Vulture's Vigor") },
          text = "The vultures here should have died of the taint years ago, and instead they thrive on it. Their gizzards hold the secret, and I'd like ten of them." },
        { id = "h_tasted", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Basilisk's Bite"), days = 3 } },
          text = "You've had a taste of the redstone basilisk's mind now. Did you notice how much quicker your thoughts ran?" },
      },
      again = {
        { id = "h_again", text = "Something else? Ask precisely, please; I find vague questions tiring." },
        { id = "h_again2", text = "Go on, then. The basilisks will keep." },
      },
      choices = {
        { text = "What's special about the basilisks?", next = "basilisks" },
        { text = "What do you mean by the spirit of a beast?", next = "spirit" },
        { text = "Your brother says you look down on his work.", next = "brother" },
        { text = "A beast's spirit is the Light's work, not yours.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll leave you to observe.", next = "END" },
      },
    },
    basilisks = {
      lines = { { id = "b_default", text = "The redstone basilisks have flourished here more than any other creature, and I've watched them hunt: they plan, they wait, they lay traps. Their thinking is more complex than that of some humanoids I could name." } },
      choices = {
        { text = "Some humanoids like ogres?", next = "basilisks_ogres" },
        { text = "And you want their brains.", next = "basilisks_brains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basilisks_ogres = {
      lines = { { id = "bo_default", text = "Ogres, yes, and a good many adventurers. I didn't say which; you may draw your own conclusions." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    basilisks_brains = {
      lines = { { id = "bb_default", text = "I must study them, and I can't study them while they're attached to a basilisk that wants to eat me. The compound I make from them is my thanks; more of it can always be made, for a price." } },
      choices = {
        { text = "Science is a bloody business.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "s_default", text = "Some of these creatures recover from wounds faster than flesh should allow, as if something untied to their bodies were mending them. Call it spirit, call it will; the vultures have more of it than anything I've ever seen." } },
      choices = {
        { text = "Can it be bottled for us?", next = "spirit_bottle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_bottle = {
      lines = { { id = "sb_default", text = "For a while, yes; that's what the vulture's gizzard compound does. It won't make you a better person, only a quicker-mending one, which in the Blasted Lands is the more useful of the two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "br_default", text = "Drazial says a great many things, most of them loudly. I don't look down on his work; I only think it's the easy half, which is a different thing entirely." } },
      choices = {
        { text = "He's fond of you, you know.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Perhaps. If it is, the Light has been very generous to vultures and very stingy with the people out here. I only measure what I find, priest; the theology I leave to you." } },
      choices = {
        { text = "Then measure carefully. Some things shouldn't be tampered with.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Measure away. The Light can take care of itself.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An elf of Quel'Thalas who would rather watch a basilisk think than listen to most people talk. You may take that personally.", next = "basilisks" } },
    advice = { { id = "tp_ad", text = "Don't meet a basilisk's eyes, and don't assume it's stupid because it's scaly." } },
    dark_portal = { { id = "tp_portal", text = "Whatever came out of it changed everything living here. I'd like to know what it would do to a thinking creature, and I'm afraid I already do." } },
    _none = { { id = "tp_none", text = "That's outside my study. My brother will happily guess, if you want a guess." } },
  },
}

P:NPC {
  key = "daio", id = TODO_NPC("Daio the Decrepit"), name = "Daio the Decrepit",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "tainted_scar" }, temper = { "steady" }, values = { "patient", "cunning" },
  notices = { "class", "race" },

  impression = {
    first = "Daio the Decrepit is an old man at a demon altar in the Tainted Scar, smiling as if the place were a garden. He speaks plainly about the price of power, and I believe he has paid it.",
    third = "{name} met Daio the Decrepit, an old warlock who teaches the binding of demons from an altar in the Tainted Scar.",
  },

  greetings = {
    { id = "g_default", text = "You are certainly a long way from home, {race}. Come closer; the demons won't bite while I'm watching." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still alive. The Scar hasn't had you yet, then." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ah, one of us. I can see what you've already paid for your power in your eyes, and it isn't nearly enough yet." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Light, here? You must be very brave or very lost. The demons in the Scar can smell it on you, so mind yourself." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daio, they call me, and the Decrepit, which I've earned. I teach suppression and control to those who would master demons rather than serve them, and I teach them sacrifice, which is the lesson nobody wants." },
        { id = "h_bindings", when = { questActive = TODO_QUEST("The Prison's Bindings") },
          text = "The blood of the Wildspawn satyr, from Dire Maul's Warpwood Quarter, fifteen measures of it. Once it clots, it will bind the shards and power the prison." },
        { id = "h_suppression", when = { questActive = TODO_QUEST("Suppression") },
          text = "The prison is ready, and now the hard part: find a Doomguard Commander in the Scar and take it. Bring friends who can keep you alive, because it will want nobody dead but you." },
        { id = "h_bound", tags = { "news" }, when = { questRecent = { TODO_QUEST("Suppression"), days = 7 } },
          text = "You've a Doomguard in your keeping now, and the knowledge to call it. Remember what it costs every time you do, and never assume it has forgiven you." },
      },
      again = {
        { id = "h_again", text = "More questions? Good; the ones who stop asking are the ones the demons keep." },
        { id = "h_again2", text = "Speak. I've nowhere to be, and the Scar is very quiet company." },
      },
      choices = {
        { text = "What would I have to sacrifice?", next = "sacrifice" },
        { text = "How do you conjure a demon?", next = "conjure" },
        { text = "Why live here, of all places?", next = "scar" },
        { text = "I have come to learn, Daio.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "You trade in damnation, old man.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll leave you to your altar.", next = "END" },
      },
    },
    sacrifice = {
      big = true,
      lines = { { id = "s_default", text = "That is for the demon you wish to conjure and enslave to decide, not me. We wield dark powers and we pay grossly for them, and the only warlocks who last are the ones who know the price before they open the book." } },
      choices = {
        { text = "What did you pay?", tag = "Intimidate", next = "daio_price",
          check = { pass = { any = { { class = "WARLOCK" }, { disposition = { min = 65 } }, { questDone = TODO_QUEST("Suppression") } } } },
          fail = { next = "daio_grin", fx = { affinity = -1 } } },
        { text = "No power is worth that.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Any price is worth paying for real power.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, taint = 2 } },
      },
    },
    daio_price = {
      big = true,
      lines = { { id = "dp_default", text = "My name, among decent people, and every friend who knew it. I live at a demon's altar in a scar in the earth because nowhere else would have me, and I'd tell you it was worth it, but I've stopped lying to students." } },
      choices = {
        { text = "Then why teach it?", next = "daio_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daio_why = {
      lines = { { id = "dw_default", text = "Because you'll learn it anyway, from a book or a cultist or a voice in the dark, and I'd rather you learned it from someone who'll tell you the price." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    daio_grin = {
      lines = { { id = "dg_default", text = "Ask me that again when you've paid something of your own, and perhaps I'll answer. Until then, mind your tongue in my Scar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    conjure = {
      lines = { { id = "c_default", text = "First you build a prison to confine the beast, because a demon called without one is a demon loose. The bindings, the casing, the crystal; only when all three are ready do you go looking for what you mean to put inside." } },
      choices = {
        { text = "And then?", next = "conjure_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    conjure_then = {
      lines = { { id = "ct_default", fx = { learn = { "burning_legion" } },
        text = "Then you go into the Scar and find a Doomguard, one of the Legion's commanders, and you hold the prison steady while it tries to tear you in half. Most fail at that part, and most of those don't come back to complain." } },
      choices = {
        { text = "I'll bring friends.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar = {
      lines = { { id = "sc_default", fx = { learn = { "tainted_scar" } },
        text = "Because the demons are here, and the lessons are here, and nobody from Nethergarde will come this far to tell me to stop. The Scar has a lord, and the lord leaves an old man alone as long as he's no trouble." } },
      choices = {
        { text = "Who is its lord?", next = "scar_lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar_lord = {
      lines = { { id = "sl_default", text = "Kazzak, a great doomlord of the Legion, who walks the Scar as if he owned the world, and perhaps one day he will. I don't stand in his way, and I'd advise you to follow my example." } },
      choices = {
        { text = "Someone should stand in his way.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Wise advice.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    warlock = {
      lines = { { id = "w_default", text = "So you have found me, and you've come to learn suppression and control. I will teach you much more than that, and you'll curse me for some of it, which is how you'll know it was worth learning." } },
      choices = {
        { text = "Teach me, then.", next = "conjure", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "I trade in honesty, which looks like damnation to people who'd rather not know the price of things. Go back to your temple, if you like; the demons won't be any fewer for your disapproval." } },
      choices = {
        { text = "The Light will see them banished, and you with them.", next = "BACK", fx = { align = { light = 2 }, affinity = -2 } },
        { text = "Perhaps knowing the enemy is no sin.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An old man with older habits. What I was before the Scar doesn't matter now, and it wouldn't help you." } },
    advice = { { id = "tp_ad", text = "Never call anything you can't send back. Write that inside your eyelids." } },
    burning_legion = { { id = "tp_legion", text = "Masters to some, enemies to most, and teachers to a few of us. They don't care which, which is the first thing to understand about them." } },
    tainted_scar = { { id = "tp_scar", text = "My home, my classroom, and very probably my grave. It suits me better than you'd think.", next = "scar" } },
    _none = { { id = "tp_none", text = "Ask the demons. They know everything, and they lie about all of it." } },
  },
}
