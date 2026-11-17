-- Duthorian Rall, Cathedral of Light. Voice: bibles/rall.md
-- Tests new paladins with charity, penance and the Tome of Divinity.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rall", id = TODO_NPC("Duthorian Rall"), name = "Duthorian Rall",
  bible = "bibles/rall.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "pious", "stern", "honest" },
  spiritSensitive = true,
  notices = { "readiness", "humility" },
  impression = {
    first = "Duthorian Rall tests paladins and seems more interested in how they pass than whether they do. He speaks of the Light as a debt owed to people who can never repay it.",
    third = "{name} met Duthorian Rall in the Cathedral of Light, who tests the paladins sent to him from across the kingdom.",
  },

  greetings = {
    { id = "g_test", text = "Ready? No one ever is, so come anyway." },
    { id = "g_wilhelm", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tome of Divinity"), days = 2 } }, text = "Wilhelm sent you, and he thinks well of you. Let us see if he's right." },
    { id = "g_tome", when = { questActive = TODO_QUEST("The Tome of Divinity") }, text = "Still at your task? Good, because haste is not a virtue in this work." },
  },

  notice = {
    { id = "n_unready", cat = "readiness", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "You've come into the Cathedral in pieces. Readiness is a virtue too. Mend that, then we'll speak of the Light." },
    { id = "n_proud", cat = "humility", when = { class = "PALADIN", minLevel = 30 },
      text = "You've grown strong since your first test. Strength is the easy part. Tell me you haven't forgotten the hard part." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Service without reward. If your spirits demand the same, we may be closer than either of us thinks." } },
      choices = {
        { text = "Service without reward is the truest kind, Duthorian.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Even spirits expect something back. Nothing's free.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The Light tests everyone who walks the world, and paladins only differ in that we ask for it to be done in public. A mage is tested every time he chooses who to raise his hand against and who to spare, and some of the finest people I've known passed that test without ever setting foot in a cathedral." },
      },
      choices = {
        { text = "Then I'll choose carefully, Rall.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I choose by what works, Rall, not by tests.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Rall.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think every gift asks a debt, and yours more than most, because you're given the strength of the wild and must answer to the wild for how you use it. I'd not want to be tested by a forest, I'll tell you that." } },
      choices = {
        { text = "Every gift is a debt, and I mean to repay mine.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My gifts are mine. I owe nobody for them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Light has a use for anyone willing to stand where they're needed, and some of the bravest people I've known worked in the dark. It asks you the same thing it asks a paladin, which is who your work protects." } },
      choices = {
        { text = "My work protects people who can't protect themselves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My work protects me, Rall. That's enough for now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd test anyone who asked, though I doubt you'd enjoy it, because my tests are about what you give away and yours is a path of taking. Still, I've seen stranger roads lead back to the Light, and I won't say yours can't." } },
      choices = {
        { text = "Maybe one day I'll take your test, Rall.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll keep my road, and you can keep your tests.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not courage, and not skill, but what you lean on when both run out. A paladin can call on the Light, and a warrior can only call on the person beside him, which is why warriors make the most loyal comrades I've ever known." } },
      choices = {
        { text = "Then I'll be the comrade others lean on.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I lean on no one. My strength is my own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Patience, and how to look at a thing before you charge it, which is the hardest lesson for a paladin. I've seen Brandur Ironhammer send me dwarves who'd charge a mountain if it looked at them wrong." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a calm about it that I'd like to see in my students. You must be a patient master to raise a creature so steady." },
      },
      choices = {
        { text = "Patience is a virtue anyone can learn.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Paladins should learn from their own mistakes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Duthorian Rall. I test the paladins Brother Wilhelm and Brandur Ironhammer send me, and most pass, though not all the same way." },
        { id = "h_other", when = { ["not"] = { class = "PALADIN" } },
          text = "You're not one of mine, but the Cathedral's doors are open to everyone. Even the ones who only come to look at the windows." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "Whatever the Tome has set you to, it was never about you. It's about who you help on the way, and whether they can repay you. They shouldn't be able to." },
        { id = "h_symbol", tags = { "news" }, when = { questActive = TODO_QUEST("The Symbol of Life") },
          text = "The Symbol of Life is not a trinket. It's a promise that someone will get up again. Carry it like that." },
        { id = "h_henze", tags = { "news" }, when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Henze Faulk walks because you knelt by him. Remember how that felt. You'll need to remember it on the days the Light feels far off." },
        { id = "h_stephanie", when = { heardLine = "stephanie.h_tome" },
          text = "Stephanie put you to work, did she? Good; you'd be amazed how many great paladins started with linen for orphans." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ironforge's paladins usually go to Brandur, yet you came to me. Either you're curious or lost, and both are forgivable." },
        { id = "h_daphne", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Valor") },
          text = "Daphne Stilwell's farm stands above the Westfall shore, and the Brotherhood wants it. Stand with her, and she'll likely save you as often as you save her." },
        { id = "h_valor", when = { class = "PALADIN", minLevel = 20 },
          text = "There's another test when you're ready, a test of valor rather than compassion. Most paladins prefer it, which is exactly why it comes second." },
        { id = "h_nobility", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Nobility") },
          text = "So Arthur sent you, and not a day too soon. Much has happened lately, and not all of it in the open; the Light has enemies closer to home than you'd like, so sit." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "You were taught that the Light is a gift, I expect. I teach that it's a test. We're both right, and the novices hate it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Cathedral district. The Light doesn't mind where you've been, but it does ask where you're going." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "The Cathedral's doors are open to you as they are to everyone, though you'll understand if I stand beside them while you're here." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll fight as hard as any paladin, I don't doubt, though without the Light behind you, you'll need to be twice as careful." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The paladins I test spend their days in halls and chapels, and I sometimes wish they'd spend a week in the woods with someone like you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the Cathedral district. I test paladins, not druids, but I'd guess your goddess asks something of you the way the Light asks something of us." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The Light owes you nothing and you owe it less, I suppose, but you're welcome to watch a test." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I test paladins, not shamans, but the Light is a debt owed to people who can't repay it. I wonder what your spirits ask." },
      },
      again = {
        { id = "h_again", text = "What else? Ask it straight." },
        { id = "h_again2", text = "Go on; I've time for questions, though not for excuses." },
      },
      choices = {
        { text = "What does the Light ask of a paladin?", next = "ask" },
        { text = "Why test us at all?", next = "why" },
        { text = "Tell me about the Tome of Divinity.", next = "tome" },
        { text = "You spoke of a test of valor.", next = "valor", when = { class = "PALADIN", minLevel = 20 } },
        { text = "Henze lives. What became of the Defias script?", next = "script", when = { questDone = TODO_QUEST("The Symbol of Life") } },
        { text = "I was a squire when the Order fell.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "Do priests and paladins learn the same Light?", next = "priest", when = { class = "PRIEST" } },
        { text = "Does the Light have any use for a rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What separates a warrior from a paladin, Duthorian?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would a paladin learn from a hunter, Duthorian?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you test a warlock as you test paladins?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Light ask a debt of druids too, Duthorian?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Light ever test a mage, Rall?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do your tests ask of paladins, Duthorian?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go, Rall.", next = "END" },
      },
    },

    ask = {
      big = true,
      lines = {
        { id = "a_default", text = "Compassion, patience and bravery, in that order. Anyone can be made brave, but the other two have to be chosen, every single day." },
      },
      choices = {
        { text = "Then I choose them.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Patience is for priests. I'll take bravery and leave the rest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Bravery should come first.", next = "brave", fx = { trait = { brave = 1 } } },
      },
    },
    brave = {
      lines = { { id = "b_default", text = "Brave without patience is a dead knight. Brave without compassion is something worse. Think on it." } },
      choices = {
        { text = "Worse than dead?", next = "brave_worse" },
        { text = "I will.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Bravery's served me well enough so far.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    brave_worse = {
      lines = { { id = "bw_default", text = "Brave men without compassion are how good orders become cruel ones. You've heard what the Scarlet Crusade does in the north, I take it.",
        fx = { learn = { "scarlet_crusade" } } } },
      choices = {
        { text = "I've heard.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Someone has to burn out the plague, compassion or not.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Because a paladin left untested goes soft. The tasks keep you honest, and they keep me honest too." },
      },
      choices = {
        { text = "Who tests you?", next = "why_self" },
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why_self = {
      lines = { { id = "ws_default", text = "Every paladin I send out who comes back worse than they left. I keep count, and it's a short list, but I'd like it shorter." } },
      choices = {
        { text = "I won't be on it.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The field changes everyone, so I won't promise anything.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    tome = {
      lines = { { id = "t_default", text = "Wilhelm puts the book in your hands; I set the tasks it asks for. Charity first, then a life held in your hands. The book only says what you should already know." } },
      choices = {
        { text = "Why charity first?", next = "tome_charity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome_charity = {
      lines = { { id = "tc_default", text = "Because a paladin who won't kneel to sew a child's shirt has no business kneeling to the Light. Stephanie Turner has taught more of mine than I have." } },
      choices = { { text = "Then I'll start there.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },

    valor = {
      lines = { { id = "v_default", text = "Daphne Stilwell's farm, in Westfall above the shore, and the Defias want it. Stand with her, and afterwards her husband in Ironforge will want to hear it from you." } },
      choices = {
        { text = "Who's her husband?", next = "valor_jordan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valor_jordan = {
      lines = { { id = "vj_default", text = "Jordan Stilwell, a smith. He was meant to be one of us, before his father's craft claimed him. One of the most faithful men I know, and he never took the oath." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    script = {
      lines = { { id = "sc_default", text = "Gazin brought it here, I read it, and it went up to the King's advisors. Proof in the Brotherhood's own hand. Nobody at court can call it rumour now.",
        fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    squire = {
      lines = { { id = "sq_default", text = "Your training stopped, but your oaths didn't, so finish it here. The Order broke; the Light didn't." } },
      choices = {
        { text = "I'm ready.", next = "BACK", fx = { affinity = 3, align = { light = 1, order = 1 } } },
        { text = "My oaths broke with the Order, and I'll go my own way.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Different first lessons, that's all. You begin with mercy and learn courage, while we begin with courage and spend our lives learning mercy, so yours is the shorter road." } },
      choices = {
        { text = "It doesn't feel short.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then I'll wait for you at the end of it.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've trained paladins for this Cathedral long enough to know a good deal, and to keep most of it to myself. These, I'll speak to." },
    },
    background = { { id = "tp_bg", text = "A Knight of the Silver Hand whose work is making more of them. The rest of my story belongs to them.", next = "why" } },
    advice = { { id = "tp_ad", text = "Help someone today who can't help you back. Then do it tomorrow. That's the whole of the lesson; the rest is practice." } },
    tome_of_divinity = {
      { id = "tp_tome", text = "The Abbey's book, and it's been to the Deadmines and back. Read it slowly, because it took its time with us.", next = "tome" },
    },
    northshire_abbey = { { id = "tp_abbey", text = "It's where most of us began, and Brother Sammuel still teaches there. Listen to him; he doesn't repeat himself." } },
    defias = { { id = "tp_defias", text = "Lost men. Some can be found again, but most won't want to be." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Brave men who forgot the first virtue. I test my paladins so they never do." } },
    _none = { { id = "tp_none", text = "That's not a matter for the Cathedral. Ask in the Trade District; they'll sell you an answer." } },
  },
}
