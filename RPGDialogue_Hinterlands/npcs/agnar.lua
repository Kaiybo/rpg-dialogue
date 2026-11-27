-- Agnar Beastamer: Aerie Peak's master animal handler, who helps hatch a sprite darter egg. Voice: bibles/agnar.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hl_agnar", id = TODO_NPC("Agnar Beastamer"), name = "Agnar Beastamer",
  bible = "bibles/agnar.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "warm", "jovial" }, values = { "kind", "patient", "nature" },
  notices = { "pet", "form" },

  impression = {
    first = "He treats every creature like a favourite nephew.",
    third = "{name} met Agnar Beastamer, the Wildhammer animal handler of Aerie Peak.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Greetin's, my friend! The beasts are glad tae see ye, an' so am I. Come, meet the new hatchlin'." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The beasts are restless today, an' so am I." },
    { id = "g_default", text = "Greetin's! How can I be of service tae ye, or tae whatever's followin' ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Come in, come in, an' mind the hatchlings underfoot." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}! Two gryphon chicks hatched while ye were away, an' both o' them bit me." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown, like a chick out o' the nest. Ye'll be ready tae fly on yer own soon enough." },
    { id = "g_food", when = { questActive = TODO_QUEST("Food for Baby") }, text = "Bring me five Silvermane stalker flanks, raw an' juicy, for yer egg's gettin' close!" },
    { id = "g_word_helped", when = { word = "helped" }, text = "The riders say ye've been helpin' about the Peak. The birds have noticed, too, for they've stopped hissin' at ye." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, look at yer {pet}! Healthy coat, bright eyes, an' it's lookin' at my gryphons like they're lunch, which they're no'." },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "Now that's a fine shape ye're wearin'! I'd check yer teeth an' paws if I thought ye'd let me." },
  },

  start = "hello",
  nodes = {
    dw_spirit = {
      lines = {
        { id = "dw_spirit_default", text = "Think it? We know it. The shamans say every gryphon carries the wind in it, an' the wind remembers the rider who treated it right, so we bury our birds wi' their riders when we can." },
      },
      choices = {
        { text = "That's a fine belief, Agnar. I hope it's true.", next = "BACK", reply = "It's true enough for me, an' the birds behave like it's true. That's all a handler needs.", fx = { align = { light = 1 } } },
        { text = "A beast is a beast. Spirits are a story for children.", next = "BACK", reply = "Say that tae a gryphon an' see where ye land. Ironforge dwarves always want things they can weigh on a scale.", fx = { align = { light = -1 } } },
        { text = "Something else, Agnar.", next = "BACK" },
      },
    },
    dw_ram = {
      lines = {
        { id = "dw_ram_default", text = "Different? A ram'll butt ye an' forget it by supper, kin. A gryphon will remember ye for twenty years, an' if ye wronged it, it'll wait for the day ye're standin' near a cliff." },
      },
      choices = {
        { text = "Then I'll stay on your gryphons' good side.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Agnar Beastamer, animal handler for the Wildhammer. If it's got feathers, fur or scales an' it lives at Aerie Peak, I've fed it, mended it an' been bitten by it, though I've never yet had the luck tae raise a faerie dragon." },
        { id = "h_egg", tags = { "news" }, when = { questActive = TODO_QUEST("The Newest Member of the Family") },
          text = "Well, well, well, I haven't seen one o' these in a dragon's age! Faerie dragon, if I'm no' mistaken, o' the sprite darter variety, an' ye got it here in time, which is no small thing." },
        { id = "h_fed", tags = { "news" }, when = { questRecent = { TODO_QUEST("Food for Baby"), days = 3 } },
          text = "These flanks'll do nicely, an' if I'm no' mistaken, yer egg's just about ready tae hatch. How does it feel, knowin' ye're about tae be a parent?" },
        { id = "h_parent", tags = { "news" }, when = { questDone = TODO_QUEST("Becoming a Parent") },
          text = "How's the wee one gettin' on? If it's eatin' well an' bitin' things, then it's healthy, an' ye're doin' fine." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Ye'll know a thing or two about beasts, then, an' I'll want tae hear how ye tamed yer companion." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid at the Peak! The gryphons'll love ye, an' I'll be jealous, for they never look at me like that." },
      },
      again = {
        { id = "h_again", text = "What else? I've chicks tae feed, but they'll wait a moment." },
        { id = "h_again2", text = "Ask away, friend." },
      },
      choices = {
        { text = "Tell me about faerie dragons.", next = "faerie" },
        { text = "How do you raise a gryphon?", next = "gryphons" },
        { text = "A beast handler must have plenty to do here.", next = "work" },
        { text = "Why are you jealous of my egg?", next = "jealous", when = { questDone = TODO_QUEST("The Newest Member of the Family") } },
        { text = "How do you tame a beast like mine?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the Wildhammers think the beasts have spirits, Agnar?", next = "dw_spirit" },
        { text = "We keep rams in Dun Morogh. Is a gryphon much different?", next = "dw_ram", when = { race = "Dwarf" } },
        { text = "Thanks, Agnar.", next = "END" },
      },
    },

    faerie = {
      lines = {
        { id = "fa_default", text = "Wee dragons o' the forests, mostly in Feralas an' the night elves' woods, quick as a thought an' about as hard tae catch. They eat both meat an' greens, an' fresh flank's the best first meal for one, though I never could find out why." },
      },
      choices = {
        { text = "It's strange that they like meat.", next = "faerie_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faerie_why = {
      lines = {
        { id = "fw_default", text = "Somethin' tae do wi' Elune's plan for them, I'd guess, for they're tied up wi' the night elves' goddess somehow. Maybe they were meant tae be protectors o' some sort, an' a protector needs his meat." },
      },
      choices = {
        { text = "Protectors of what?", next = "faerie_protect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faerie_protect = {
      lines = {
        { id = "fp_default", text = "Ask a night elf, for I'm only a dwarf wi' a pail o' meat. All I know is that they're gentle when they're happy an' fierce when they're no', which is true o' most creatures, dwarves included." },
      },
      choices = { { text = "Something else, Agnar.", next = "BACK" } },
    },

    gryphons = {
      lines = {
        { id = "gr_default", text = "Slowly, an' wi' a bucket o' raw meat an' more patience than a dwarf's born wi'. A Wildhammer gryphon picks its rider as much as the rider picks it, so ye raise a chick tae trust, an' ye let it choose." },
      },
      choices = {
        { text = "And if it never chooses anyone?", next = "gryphons_none" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryphons_none = {
      big = true,
      lines = {
        { id = "gn_default", text = "Then it lives out its days at the Peak, fed an' free, an' I'll no' force it under a saddle. Some o' the riders call that wasteful, but a bird that's forced will drop ye in the first storm." },
      },
      choices = {
        { text = "You're right. A beast's choice should be respected.", next = "BACK", reply = "Aye, that's how I see it, an' it's good tae hear someone else say so. She's sat on that same ledge for a week now, glarin' at the riders, an' I'll no' be the one tae drag her off it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A bird that won't serve is a burden. Train it.", next = "BACK", reply = "Train it, ye say? Ye cannae train a gryphon that's decided against ye, an' I'll no' try. Let it be.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wk_default", text = "Feed the chicks, mend the wings, settle the quarrels between birds who've decided they hate each other. An' now an' again someone walks in wi' an egg from the far side o' the world an' asks me tae help hatch it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    jealous = {
      lines = {
        { id = "je_default", text = "Can I lie tae ye? I've handled every beast in the Hinterlands an' never once held a faerie dragon egg till ye walked in. I'd have given my best boots for it, an' ye brought it in a satchel." },
      },
      choices = {
        { text = "You helped hatch it. It's half yours.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hunter = {
      lines = {
        { id = "hu_default", text = "Same as a gryphon: food, patience, an' never once lettin' it think ye're afraid. An' ye talk tae it, even if ye feel daft, for they always know the voice that feeds them." },
      },
      choices = {
        { text = "I'll keep talking to it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "Ye've a gentle hand with the beasts, an' they know it. So do I, my friend." },
    },
    grievance = {
      { id = "dp_gv", text = "Ye've been rough with my beasts, or rough with me, an' they both remember." },
    },
    knows = { { id = "tp_knows", text = "I know beasts, the Peak's an' a few from further off. Ask about any creature ye like." } },
    background = { { id = "tp_bg", text = "Wildhammer born, an' I was raisin' gryphon chicks before I could ride one." } },
    advice = { { id = "tp_ad", text = "Feed a beast first an' ask it questions after. Works on dwarves too, an' ye can ask my wife." } },
    green_dragons = { { id = "tp_green_dragons", text = "The faerie dragons are cousins tae the great green ones, so the druids say, an' they're the sweetest beasts in the Hinterlands. The big ones are another matter entirely." } },
    wildhammer = { { id = "tp_wildhammer", text = "Every beast in Aerie Peak is a Wildhammer at heart, gryphon or hound or dragonhawk. I raise them like nephews, an' they behave about as well." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the faerie dragons come from the Dream, an' I believe it, fer they've a look in their eyes like they're seein' somethin' else. Lovely creatures, every one." } },
    _none = { { id = "tp_none", text = "No' a beast I know, friend. Ask the riders, they've seen more o' the world than me." } },
  },
}
