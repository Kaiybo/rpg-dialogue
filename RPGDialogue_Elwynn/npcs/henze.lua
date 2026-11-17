-- Henze Faulk, on the stone ring outside Heroes' Vigil. Voice: bibles/henze.md
-- Killed by the Defias saving his friend; brought back by a young paladin's Symbol of Life.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "henze", id = TODO_NPC("Henze Faulk"), name = "Henze Faulk",
  bible = "bibles/henze.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "brave", "honest" },
  spiritSensitive = true,
  notices = { "paladin" },
  impression = {
    first = "Henze Faulk jokes about having been dead the way other folk joke about the weather, and I think it helps him. He went in after his friend Gazin once, and he'd plainly do it again.",
    third = "{name} met Henze Faulk, the dwarf who went after his friend Gazin and was caught by the Defias for it.",
  },

  greetings = {
    { id = "g_low", text = "Still breathin', just about. Don't make me laugh, it hurts." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Symbol of Life") }, text = "Ah, my favourite paladin! Ye're the only one I've got, mind." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", questActive = TODO_QUEST("The Symbol of Life") },
      text = "Is that the Symbol of Life ye've got there? Then mind yer aim. I'd rather not come back halfway." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, I reckon a wolf's nose would've had me in an hour, an' I'd have been a deal less dead for it. Gazin did his best, but Gazin couldn't smell a fire in a hayloft." } },
      choices = {
        { text = "A friend who comes for you matters more than any nose.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Gazin should've left you. Two dead men help nobody.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I went in alone and quiet, which is fine for a rogue an' daft for a dwarf. If I'd had a warrior at my back, makin' noise at the front door, I'd have walked out the back with Gazin an' all." } },
      choices = {
        { text = "Next time, call for help before you go in.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Alone was brave, Henze. That counts for something.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, easily, for I left boot prints like a ram on a snowfield. Gazin found me in the end, but a beast with a good nose would've found me before I was quite so dead, I'd wager." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that your {pet}? Grand beast. Ye keep it close, now, the Defias don't play fair with animals either." },
      },
      choices = {
        { text = "I'd have come for you, Henze, Defias or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd have let Gazin sort out his own mess.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cold, an' boring, an' then suddenly very warm an' very loud, which is how I ended up lyin' here. The Defias have folk watchin' the watchers, so if ye ever do that work, look behind ye more than ye look ahead." } },
      choices = {
        { text = "I'd serve the king's eyes proudly, Henze.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd never spy for nobles. The work's thankless and deadly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Nothin' but cold an' quiet, which I'll admit was peaceful after the Defias. If there's somethin' waitin' on the other side wi' horns like yer friend there, I'm glad I didnae stay long enough tae meet it." } },
      choices = {
        { text = "The dead deserve their peace. I'll not disturb it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Death's just a door. Some of us go through on purpose.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, if Gazin needed me, though my knees say otherwise. The Defias have men in every hollow from here tae Westfall, an' they don't take prisoners; they take what's in yer pockets an' leave ye for the crows." } },
      choices = {
        { text = "Then I'll go in with you next time, Henze.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the Defias to the army. You've done enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Henze.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ah, now, I said I'd bring one next time, an' here ye are, a mite late but welcome all the same." },
        { id = "h_default", text = "Henze Faulk. Gazin an' me were watchin' the Defias for the king's advisors, an' when they near enough caught Gazin, I went in after him. They caught me properly." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Symbol of Life"), days = 3 } },
          text = "I was dead, I know I was: cold an' quiet an' nothin'. Then there was you, an' a light, an' a terrible taste in my mouth, so thank ye, an' I mean it." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Symbol of Life"), days = 7 } },
          text = "Gazin's still feelin' guilty, so tell him to stop. I'd go in after him again; I'd just bring a paladin next time." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Ye wouldnae have a drop of somethin' warmin' on ye, for medicinal purposes? Strictly medicinal." },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf talkin' to the elements! My granddad would've fallen off his stool. I'm just glad somebody's listenin' to the ground. It's got plenty to say." },
        { id = "h_dead", when = { metBefore = true }, text = "Still dead-ish? No, still alive; I check every mornin'. It's a good habit once ye've been the other thing." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. If ye've come to read me the last rites, ye're late. Somebody already read me the first ones again." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye walk like Gazin does, quiet as a cat. Are ye one o' the king's eyes as well, or just a thief wi' good manners?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Is that a demon ye've got wi' ye? I've been dead once already, so I'd be obliged if ye'd keep it from takin' an interest." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'd have been handy in that Defias camp, so ye would; I could've done with someone bigger than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Is that a dwarven rifle, or a bow? Either way, I like a body who hits things from a distance." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf! I was dead a good while, so I've missed who's been comin' an' goin', but you're a fine surprise to wake up to." },
      },
      again = {
        { id = "h_again", text = "What else? I'm no' goin' anywhere, mind, since my legs are still on strike." },
        { id = "h_again2", text = "Go on, then, since talkin' keeps me warm." },
      },
      choices = {
        { text = "What was it like?", next = "dead" },
        { text = "What were you and Gazin doing out here?", next = "defias" },
        { text = "Why here, of all places?", next = "place" },
        { text = "How's Gazin?", next = "gazin" },
        { text = "Let me tend to your wounds.", next = "heal", when = { class = "PRIEST" } },
        { text = "Need a drink, kinsman?", next = "drink", when = { race = "Dwarf" } },
        { text = "The stone remembers you, Henze. It told me where you fell.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What was it like watching the Defias for the king?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you remember anything from when you were dead, Henze?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What went wrong when you went in after Gazin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter have tracked you to the Defias camp?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you go back into Defias country, Henze?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a druid have found you sooner, out there in the dark?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Rest easy, Henze.", next = "END" },
      },
    },

    dead = {
      big = true,
      lines = {
        { id = "d_default", text = "Quiet, not bad nor good, just quiet, like the forge on a holiday. I didnae mind it, though I mind bein' back less." },
      },
      choices = {
        { text = "The priests say the Light waits there.", next = "dead_priest", when = { class = "PRIEST" } },
        { text = "I'm glad you're back.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That's oddly comforting.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },
    dead_priest = {
      lines = {
        { id = "dp_default", text = "Maybe it does, but I didnae see it, an' maybe I wasnae far enough in. Don't go tellin' the Cathedral I said so." },
      },
      choices = {
        { text = "Your secret's safe. The Light knows anyway.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Maybe there's nothing waiting there at all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    defias = {
      lines = {
        { id = "df_default", text = "Watchin' them for the king's advisors. Notes, names, who meets who in the woods. They caught Gazin first, an' I couldnae leave him." },
      },
      choices = {
        { text = "What did you find?", next = "defias_found" },
        { text = "You were brave.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    defias_found = {
      lines = {
        { id = "dfo_default", text = "Enough to get killed for. The rest's in Gazin's head an' the advisors' desks now. Ask him at the Cathedral, if ye want the dull parts." },
      },
      choices = {
        { text = "Do the advisors ever act on it?", next = "defias_advisors" },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    defias_advisors = {
      lines = {
        { id = "da_default", text = "They read it, I'm told. What happens after it's read is above a dwarf lyin' on a rock. I'd like to think somebody's doin' somethin'." },
      },
      choices = {
        { text = "Somebody should.", next = "BACK", fx = { learn = { "defias" }, align = { order = -1 } } },
        { text = "These things take time.", next = "BACK", fx = { learn = { "defias" }, align = { order = 1 } } },
      },
    },

    place = {
      lines = {
        { id = "pl_default", text = "Heroes' Vigil. A stone for the folk who died when the orcs came through Goldshire in the first war. Fittin' place to die, I thought, while I was doin' it." },
      },
      choices = {
        { text = "Who holds the island now?", next = "place_wizards" },
        { text = "Less fitting now?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    place_wizards = {
      lines = {
        { id = "pw_default", text = "Rogue wizards, mutterin' an' glowin' an' generally unpleasant. They let a dyin' dwarf lie, an' I'll no' thank them for it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gazin = {
      lines = {
        { id = "gz_default", text = "Up at the Cathedral in Stormwind, last I heard, by the altar. Prayin' for me, likely. Tell him it worked an' he can stop." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } } },
    },

    heal = {
      lines = {
        { id = "he_default", text = "Kind of ye. The paladin's Light did the big work, so yours can do the small, an' my ribs'll thank ye loudly." },
      },
      choices = {
        { text = "Hold still.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Rest will mend your ribs better than my prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = {
        { id = "dr_default", text = "Strictly medicinal, ye understand, an' ah, I see ye've nothin'. Then tell me a joke from home, which is near as good." },
      },
      choices = {
        { text = "What's a dwarf's favourite stone? The one with ale under it.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Maybe later.", next = "BACK" },
      },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Did it now? Then it's a better friend than the Defias were. My granny used to say the stone hears everythin' an' tells nobody; I'm glad it made an exception." } },
      choices = {
        { text = "It only speaks to those who listen.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "It mostly complains, if I'm honest.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf far from the mountain, watchin' thieves for the humans. I got killed for it, an' then I got better." } },
    advice = { { id = "tp_ad", text = "If yer friend's caught, go in after him. But bring a paladin." } },
    defias = { { id = "tp_defias", text = "They don't fight fair an' they don't leave witnesses, an' I'm the exception, which I'm very proud of." } },
    tome_of_divinity = { { id = "tp_tome", text = "Whatever's in that book, it brought me back. I'll read it myself one day, maybe." } },
    _none = { { id = "tp_none", text = "I was dead for a bit. I've missed some news." } },
  },
}
