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
    hello = {
      lines = {
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
        { text = "That's oddly comforting.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    dead_priest = {
      lines = {
        { id = "dp_default", text = "Maybe it does, but I didnae see it, an' maybe I wasnae far enough in. Don't go tellin' the Cathedral I said so." },
      },
      choices = {
        { text = "Your secret's safe. The Light knows anyway.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf far from the mountain, watchin' thieves for the humans. I got killed for it, an' then I got better." } },
    advice = { { id = "tp_ad", text = "If yer friend's caught, go in after him. But bring a paladin." } },
    defias = { { id = "tp_defias", text = "They don't fight fair an' they don't leave witnesses, an' I'm the exception, which I'm very proud of." } },
    tome_of_divinity = { { id = "tp_tome", text = "Whatever's in that book, it brought me back. I'll read it myself one day, maybe." } },
    _none = { { id = "tp_none", text = "I was dead for a bit. I've missed some news." } },
  },
}
