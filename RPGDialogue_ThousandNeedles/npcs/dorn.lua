-- Dorn Plainstalker, waiting in a small cave in the Weathered Nook above the Needles. Voice: bibles/dorn.md
-- A cryptic tauren who tests spirit, body and mind, beginning with a leap nobody wants to take.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dorn", id = TODO_NPC("Dorn Plainstalker"), name = "Dorn Plainstalker",
  bible = "bibles/dorn.md", role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class", "level" },
  impression = {
    first = "Dorn Plainstalker waits in a cave on the Weathered Nook and offers tests of spirit, body and mind to whoever finds him. He speaks as if he already knows how each test will end, and he will not say.",
    third = "{name} met Dorn Plainstalker in the Weathered Nook, the cryptic tauren who sets tests of faith, endurance, strength and lore.",
  },

  greetings = {
    { id = "g_nook", text = "You've found the Nook. Most walk right past it, as most walk past the Earth Mother's quieter gifts, which tells me something about you already." },
    { id = "g_faith", when = { questActive = TODO_QUEST("Test of Faith") }, text = "The planks overlook the Needles. Step off them, if you have faith." },
    { id = "g_endurance", when = { questActive = TODO_QUEST("Test of Endurance") }, text = "The Roguefeather Den, west of Freewind. Take friends, and bring me Grenka's claw." },
    { id = "g_strength", when = { questActive = TODO_QUEST("Test of Strength") }, text = "Your body has endured. Now show me it can overcome." },
    { id = "g_lore", when = { questActive = TODO_QUEST("Test of Lore") }, text = "The mind is the last of the facets, and the longest road. Follow it where it leads you." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and you return. That was not certain, and I'm glad of it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've changed since you stood on my planks. The body shows it, and I suspect the spirit does too." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID", "PRIEST" } },
      text = "You already listen to things others can't hear. The test of faith may be easier for you, or it may be much harder." },
    { id = "n_young", cat = "level", when = { maxLevel = 24 },
      text = "You're young to have found me. The tests will wait for you, {class}; they're patient, and so am I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "So you've sought me out, or perhaps something brought you to me. Many facets make up a being: the spirit, the body and the mind. I test them, if you'll let me, and those who fail learn how vast the Nether is." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Test of Faith") },
          text = "If you agree, I'll test some of the facets within you. Pass, and you'll grow stronger, and fail, and you'll learn how vast the Nether is. The first test is of faith, and it begins at the edge of those planks." },
        { id = "h_faith_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Test of Faith"), days = 3 } },
          text = "You took the leap with no promise that you would live. We only see how strong our spirits are when we face something we can't foresee, and yours held." },
        { id = "h_endurance_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Test of Endurance"), days = 3 } },
          text = "Grenka was powerful, and you outlasted her. You've shown strength of spirit and endurance of body, and the next test is waiting for you." },
        { id = "h_final", when = { questDone = TODO_QUEST("Final Passage") },
          text = "Spirit, body and mind, all tested and all found sound. You don't need me anymore, though I'll still be here, watching the Needles." },
      },
      again = {
        { id = "h_again", text = "What else? Ask carefully, young one, because the questions you choose are a test too." },
        { id = "h_again2", text = "Go on. The Nook is quiet, and so am I, and the wind in the Needles is in no hurry either." },
      },
      choices = {
        { text = "Why test anyone at all?", next = "why" },
        { text = "Tell me about the leap.", next = "leap" },
        { text = "Something must come after the tests.", next = "after" },
        { text = "You said failing teaches the vastness of the Nether?", next = "nether" },
        { text = "I took the leap. Why did I live?", next = "lived", when = { questDone = TODO_QUEST("Test of Faith") } },
        { text = "I'm ready to be tested.", next = "BUSINESS" },
        { text = "Farewell, Dorn.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Some facets a people's traditions can measure, and some we can only hope are there. My tests are for the second kind, the things the elders can't see in you and you might not see in yourself, as the Earth Mother sees the seed before the grass." } },
      choices = {
        { text = "And what if I don't believe in any of it?", next = "believe" },
        { text = "Something else, Dorn.", next = "BACK" },
      },
    },
    believe = {
      lines = { { id = "b_default", text = "It doesn't always matter what you believe. It matters that you believe in something, because a spirit with nothing to stand on falls whether there are planks under it or not." } },
      choices = {
        { text = "Then what should I believe in?", next = "believe_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    believe_end = {
      big = true,
      lines = { { id = "be_default", text = "That's not mine to give you. The Earth Mother, the Light, your own two hands, or the friend beside you; I've seen all of them hold, and I've seen all of them fail the ones who held them loosely." } },
      choices = {
        { text = "Then I'll hold my faith tightly.", next = "BACK", reply = "Then hold it, and it will hold you, and the next test will show us both whether your grip is as strong as your words.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Faith that has to be gripped isn't worth much.", next = "BACK", reply = "You may be right, young one, but I have seen loose faith slip away in the first hard wind, so I will wait and see.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leap = {
      lines = { { id = "l_default", text = "There are planks at the cliff's edge, and below them the Needles and a long fall. Step off, and you'll find out what your faith is made of before you reach the bottom." } },
      choices = {
        { text = "That sounds like a good way to die.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll take the leap.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    after = {
      lines = { { id = "a_default", text = "Endurance against the Roguefeather harpies, then strength, then lore, which will take you to Braug Dimspirit in Stonetalon and further than that. Each test asks something different, and none of them ask what you expect." } },
      choices = { { text = "That's a long road. Something else.", next = "BACK" } },
    },
    nether = {
      lines = { { id = "n_default", text = "Did I? Then I meant it. Some who come here go on to see places no tauren has a name for, and some only learn how small they are, and both are lessons." } },
      choices = {
        { text = "That's not much of an answer.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'd rather be the first kind.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    lived = {
      lines = { { id = "li_default", text = "Because you leapt. Your mind is open, and your spirit is ready for what is to come, and that's all I'll tell you about it." } },
      choices = { { text = "Then test me further.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a tauren who sits in a cave and tests travelers. Where I came from matters less than where you're going." } },
    advice = { { id = "tp_ad", text = "When you don't know what's below you, step anyway, but step on purpose." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother tests every one of her children, and I only pass her tests along. Spirit, body and mind, and she watches how you take each one." } },
    cairne = { { id = "tp_cairne", text = "Cairne passed every test the Earth Mother set him, and he still says he is learning. Remember that when you reach the test of lore." } },
    centaur = { { id = "tp_centaur", text = "The Galak believe the canyons belong to them, and they test anyone who walks here with a spear. Their tests are simpler than mine, and much less kind." } },
    razorfen = { { id = "tp_razorfen", text = "The quilboar warrens at the canyon's northern edge have grown cold, and the dead walk among the thorns now. Whoever passes my tests may find a harder one waiting there." } },
    _none = { { id = "tp_none", text = "That's not one of the facets I test. Ask at Freewind Post, and walk with the Earth Mother on the way." } },
  },
}
