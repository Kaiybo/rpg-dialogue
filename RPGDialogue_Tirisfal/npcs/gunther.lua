-- Gunther Arcanus, alone on the island of Gunther's Retreat. Voice: bibles/gunther.md
-- A Kirin Tor necromancer who broke free of the Lich King and thought he was the only one.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gunther", id = TODO_NPC("Gunther Arcanus"), name = "Gunther Arcanus",
  bible = "bibles/gunther.md", role = "scholar", tier = "quest",
  communities = { "gunthers_retreat" }, temper = { "wary", "sharp" }, values = { "proud", "curious" },
  notices = { "arcane", "race" },
  impression = {
    first = "Gunther Arcanus spent years on his island believing every other walking corpse belonged to the Lich King. He speaks like a Dalaran scholar and watches like a cornered animal, and he is lonelier than he lets on.",
    third = "{name} met Gunther Arcanus, a free-willed necromancer of the old Kirin Tor, living alone on an island in Tirisfal.",
  },

  greetings = {
    { id = "g_wary", text = "Stand where I can see you, and keep your hands away from my books." },
    { id = "g_back", when = { metBefore = true }, text = "You again. My servants let you through, which means I must have told them to, though I don't remember deciding it." },
    { id = "g_proof", when = { questActive = TODO_QUEST("Proving Allegiance") }, text = "The altar is off the southern shore. Light the candle, and we'll see whose servant you are." },
    { id = "g_free", when = { questDone = TODO_QUEST("Proving Allegiance") }, text = "Ah, the one who proved there are more of us. Come in, and mind the zombies; they're slow to change their opinions." },
    { id = "g_away", when = { away = 14 }, text = "It's been {away}, and I spent most of it wondering whether I'd dreamt you. That's what this island does to a mind." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since you last stood on my shore. Whatever you've been studying, it agrees with you." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You carry yourself like someone who was taught in a proper tower. Dalaran, or one of its pale imitations? No, don't tell me, I'd only be disappointed either way." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're breathing. Nobody breathing has rowed out to this island in years, and the last ones who did were carrying torches." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gunther Arcanus, and this island is mine. If the Lich King sent you, you may tell him I'm not coming back, and I have a great many corpses to prove it." },
        { id = "h_book", tags = { "news" }, when = { questActive = TODO_QUEST("Return the Book") },
          text = "My book! So you're the thief who took it. But there's a new enchantment on the pages, and I know the hand that wove it... Bethor? Bethor is free?" },
        { id = "h_proven", tags = { "news" }, when = { questRecent = { TODO_QUEST("Proving Allegiance"), days = 3 } },
          text = "Lillith Nefara is gone, and you're the one who sent her. I really believed I was the only one of us who had broken free, and you've made a fool of me in the best possible way." },
        { id = "h_gem", when = { questActive = TODO_QUEST("The Prodigal Lich Returns") },
          text = "Take the gem to Bethor, and tell him to speak into it when he can. I've had no one to talk to but zombies for years, and their conversation is very poor." },
        { id = "h_forsaken", when = { race = "Scourge", questBefore = TODO_QUEST("Return the Book") },
          text = "You walk like one of the dead and look at me like one of the living. Either you're a very clever puppet or something I didn't think existed, and I'm not yet sure which." },
        { id = "h_mage", when = { class = "MAGE", questDone = TODO_QUEST("Proving Allegiance") },
          text = "A mage, and a free one. Sit, if you can find a chair that isn't holding up a stack of notes, and tell me what they teach in the towers now." },
      },
      again = {
        { id = "h_again", text = "Well? I've had years of silence, so I can certainly spare a moment more." },
        { id = "h_again2", text = "Go on. The zombies won't interrupt; I've taught them that much." },
      },
      choices = {
        { text = "Why do you live out here alone?", next = "alone" },
        { text = "Did you have friends, before all this?", next = "bethor" },
        { text = "What were you, before the plague?", next = "dalaran" },
        { text = "Lillith Nefara. Who was she?", next = "lillith", when = { questDone = TODO_QUEST("Proving Allegiance") } },
        { text = "I was Kirin Tor too, before I died.", next = "kirin", when = { class = "MAGE", race = "Scourge" } },
        { text = "Necromancy, then. Is that what you study?", next = "necro", when = { class = { "WARLOCK", "PRIEST" } } },
        { text = "What do you want from me?", next = "BUSINESS" },
        { text = "I'll leave you to your island.", next = "END" },
      },
    },

    alone = {
      lines = { { id = "al_default", text = "When I woke from the Lich King's grip, every other walking corpse I met still belonged to him. I assumed I was the only one, so I found an island, raised servants who would never betray me, and stopped expecting visitors." } },
      choices = {
        { text = "You never thought there might be others?", next = "alone_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_others = {
      lines = { { id = "ao_default", text = "Hope is a dangerous habit for a man alone on an island, {class}. Anyone who rowed out here was either a living zealot with a torch or a Scourge agent with a smile, and I had no third column in my ledger." } },
      choices = {
        { text = "There's a whole city of us under Lordaeron now.", next = "alone_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_city = {
      big = true,
      lines = { { id = "ac_default", text = "A city of free dead, under a queen who was a ranger. Bethor writes of it as though it were perfectly ordinary, and I'm still trying to decide whether it's the best news I've ever heard or the most frightening." } },
      choices = {
        { text = "It's both. Come and see it for yourself.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stay on your island. Queens make poor masters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bethor = {
      lines = { { id = "be_default", text = "Bethor, Thule Ravenclaw and I were students together in Dalaran, and we bound our apprentice wands into one as a token of friendship. We were very young and very sure of ourselves, which is how most foolish things begin." } },
      choices = {
        { text = "And Thule?", next = "thule" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thule = {
      lines = { { id = "th_default", text = "Thule went to the Scourge with his eyes open, before any plague touched him, and he's somewhere in Silverpine now doing their work. Bethor and I died and came back; Thule simply chose, and I find that much harder to forgive." } },
      choices = {
        { text = "Would you face him, if it came to it?", next = "thule_face" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thule_face = {
      big = true,
      lines = { { id = "tf_default", text = "I'd like to say yes, and I'd like to mean it. But I remember him laughing at Bethor's terrible jokes, and I don't know what I'd do with a memory like that in the middle of a duel." } },
      choices = {
        { text = "Then let someone else do it. Old friends shouldn't.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He chose the Scourge. Remember that, not the jokes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dalaran = {
      lines = { { id = "da_default", text = "A student of the Kirin Tor, and a better one than my tutors liked to admit. My field was the boundary between life and death, which Dalaran pretended was not a field at all." } },
      choices = {
        { text = "Necromancy is forbidden in Dalaran, isn't it?", next = "necro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    necro = {
      lines = { { id = "ne_default", text = "It is, which is why I studied it in a cellar, by candlelight, like every other interesting thing in Dalaran. The irony is not lost on me that it's the forbidden work that's kept me alive, in a manner of speaking." } },
      choices = {
        { text = "And the servants on the shore?", next = "necro_servants" },
        { text = "Something else.", next = "BACK" },
      },
    },
    necro_servants = {
      lines = { { id = "ns_default", text = "Farmhands and fishermen, mostly, who drowned or sickened in the plague years and had no one to bury them. They guard the island and ask for nothing, and I tell myself that's better than lying in the reeds." } },
      choices = {
        { text = "They deserve better than guard duty.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "The dead should be useful. I agree.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    lillith = {
      lines = { { id = "ll_default", text = "A Scourge agent who kept that altar off my southern shore, and who whispered across the water to me on bad nights. She knew I was free, and she never stopped trying to make me doubt it." } },
      choices = {
        { text = "She won't whisper anymore.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kirin = {
      lines = { { id = "ki_default", text = "Then you know the smell of the Violet Citadel's library and the sound of a tutor sighing at your handwriting. I'd given up thinking I'd ever speak to anyone who remembered either." } },
      choices = {
        { text = "I remember the sighing best of all.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Dalaran's gone, Gunther. Let it go.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Kirin Tor once, a corpse briefly, and a free man since, if a man is what I am. That's the short version, and the long one is mostly cellars." } },
    advice = { { id = "tp_ad", text = "Never trust a friend who hasn't died. That's a joke, mostly, but it's served me well." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The last living men who rowed out here wore red and carried torches, and they called me an abomination before they'd even reached the beach. My servants sent them home, those who could still swim." } },
    _none = { { id = "tp_none", text = "I've been on this island too long to know about that. Ask someone in Brill, if Brill is still there." } },
  },
}
