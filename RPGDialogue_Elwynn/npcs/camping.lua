-- Sam Sarsaparilla: the adventurer camped on the road by Goldshire (Forever's camping). Voice: bibles/camping.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sam", id = TODO_NPC("Sam Sarsaparilla"), name = "Sam Sarsaparilla",
  bible = "bibles/camping.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cheerful" }, values = { "friendly", "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_fire", text = "Well, hello there! Pull up a log; the fire's going and the kettle's nearly there." },
    { id = "g_back", when = { metBefore = true }, text = "There's my favorite passer-by! The fire's still warm, so sit." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? Then you're halfway to a camp already, because everything starts with a fire." },
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! You'll want to learn to pitch a tent. Rest by a fire with a tent beside it and you'll feel like a new person." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sam Sarsaparilla, adventurer, or trying to be. Mostly I walk a long way and then sit by a fire, which is the best part." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "The Marshal sent you to check on me? Ha! Fair enough, with strangers on the road and all, so sit down and I'll show you how harmless I am." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire a while. No, longer than that. You'll feel it when you've properly rested." },
        { id = "h_far", when = { minLevel = 25 },
          text = "Look at the boots on you. Those have been somewhere. Sit down and tell me where; I've only got as far as this log." },
      },
      again = {
        { id = "h_again", text = "What else? There's tea, if you're staying a while." },
        { id = "h_again2", text = "Go on, the kettle won't boil any faster for you leaving." },
      },
      choices = {
        { text = "Why camp, with an inn right there?", next = "why" },
        { text = "How does a camp work?", next = "camp" },
        { text = "Where are you headed?", next = "road" },
        { text = "The Marshal sent me to check on you.", next = "marshal", when = { questActive = TODO_QUEST("The Adventurer") } },
        { text = "Let me bless the fire.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've slept rough from here to the jungle.", next = "far", when = { minLevel = 25 } },
        { text = "Enjoy the fire.", next = "END" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "Inns are lovely, but they're for stopping. A camp's for going on. And anyone walking past can share your fire, which is how you meet people worth knowing." } },
      choices = {
        { text = "Who shares your fire?", next = "why_share" },
        { text = "Teach me.", next = "camp", fx = { affinity = 2, learn = { "camping" } } },
      },
    },
    why_share = {
      lines = {
        { id = "ws_default", text = "Anyone! A dwarf with a fishing rod last night. A gnome who asked whether the fire was running properly. Each of them left the camp a little better." },
      },
      choices = {
        { text = "That sounds nice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Or they ate your food.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    camp = {
      lines = {
        { id = "c_default", text = "Start with a campfire. Any cook can learn to build one. Then every trade adds something around it, and everyone who sits down gets the good of it." },
      },
      choices = {
        { text = "What can my trade add?", next = "camp_trade" },
        { text = "And then?", next = "camp_rest" },
      },
    },
    camp_trade = {
      lines = {
        { id = "ct_default", text = "Ask the trainers in Goldshire. Michelle Belle at the inn knows kits, Lee Brown knows fish, and Helene and Adele out by the lake know hides." },
        { id = "ct_lw", when = { profession = "Leatherworking" },
          text = "A tent, you lucky thing. Adele Fielder by the lake will show you. Rest beside a tent and you wake up feeling twice as clever." },
        { id = "ct_fish", when = { profession = "Fishing" },
          text = "A fish bowl, and don't laugh, because a happy camp's a strong camp. Lee Brown on the lake pier will teach you." },
        { id = "ct_aid", when = { profession = "First Aid" },
          text = "A first aid kit. Michelle Belle upstairs at the inn will show you. Somebody always needs one by the second night." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
    camp_rest = {
      lines = {
        { id = "cr_default", text = "Then you sit, properly sit. A few minutes by the fire and you'll feel it settle in you: rested, sharper and ready for the road." },
      },
      choices = {
        { text = "Why not in town?", next = "camp_town" },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    camp_town = {
      lines = {
        { id = "cw_default", text = "Folk in town don't care for campfires in the square, and fair enough. Out here nobody minds but the wolves, and the wolves don't vote." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    road = {
      lines = {
        { id = "r_default", text = "Wherever the road goes, Westfall next maybe, or Redridge. I hear the lake there's lovely, if you don't mind gnolls." },
      },
      choices = {
        { text = "Alone?", next = "road_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_alone = {
      lines = {
        { id = "ra_default", text = "Never alone at a campfire; that's the whole trick of it. You light it, and people come." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    marshal = {
      lines = {
        { id = "m_default", text = "And here I am, checking back! Tell McBride I'm harmless, and he's welcome at the fire any evening he likes." },
      },
      choices = { { text = "I'll tell him.", next = "BUSINESS", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Bless away! A fire that's been prayed over feels warmer. That might be in my head. I don't mind if it is." },
      },
      choices = {
        { text = "Light keep this fire, and all who sit by it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Fire keeps us warm, and prayers have nothing to do with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    far = {
      lines = {
        { id = "f_default", text = "Then you should be teaching me! Sit down and tell me the strangest thing you ever cooked over a fire, and I'll tell you mine after." },
      },
      choices = {
        { text = "Raptor, once. Don't.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I don't talk about it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Not much of a story yet! That's why I'm out here. Ask me again in a year." } },
    advice = { { id = "tp_ad", text = "Sit down more. Everybody who's in a hurry ends up at the spirit healer." } },
    camping = {
      { id = "tp_camping", text = "A campfire first; any cook can learn it. Then a tent if you work leather, a fish bowl if you fish. The more trades at a fire, the better the rest." },
      { id = "tp_camping2", text = "Sit down and I'll walk you through it.", next = "camp" },
    },
    _none = { { id = "tp_none", text = "No idea! I've only just got here, so ask in Goldshire." } },
  },
}
