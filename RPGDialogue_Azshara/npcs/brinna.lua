-- Brinna Valanaar, bowyer at Talrendis Point (0.72.0). Voice: bibles/brinna.md
-- Makes bows for the Sentinels on a cursed border; judges a person by how they hold one.
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "brinna", id = TODO_NPC("Brinna Valanaar"), name = "Brinna Valanaar", title = "Bowyer",
  bible = "bibles/brinna.md", role = "vendor", tier = "service",
  communities = { "talrendis_point" }, temper = { "dry", "watchful" }, values = { "craft", "dutiful" },
  notices = { "class", "kit" },
  impression = {
    first = "Brinna Valanaar makes and mends bows for the Sentinels at Talrendis Point, and she judges people by how they hold one. She won't cut wood from Azshara's trees, and she has her reasons.",
    third = "{name} met Brinna Valanaar, the bowyer at Talrendis Point.",
  },

  greetings = {
    { id = "g_default", text = "Bows, arrows, strings. If you need something else, you've come to the wrong tree." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Let me see how you're holding that bow; I'll know where you've been." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you've come back with all your fingers. That's more than some." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Sentinels say you've been useful on the border. Good. They don't say that lightly." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Your string's been waxed by somebody who cared, which is rarer than you'd think." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's in tatters. If the bow's as bad as the boots, hand it here before it snaps in your face." },
  },

  start = "hello",
  nodes = {
    op_orcs = {
      lines = {
        { id = "opo_default", text = "Some of the younger Sentinels say so, when they think I can't hear them. I've seen what orc axes do to a forest, but I've also seen that camp bury its dead with care. What do you make of the orcs?" },
      },
      choices = {
        { text = "They've their own honor. Peace with them might be possible.", next = "op_orc_peace", fx = { align = { honor = 1 }, opinion = { orcs = "respect", peace = "for" } } },
        { text = "Orcs burned Ashenvale once. Drive them out before they do it again.", next = "op_orc_drive", fx = { affinity = 1, align = { honor = -1 }, opinion = { orcs = "hate" } } },
        { text = "They're cutting our forest. That's all I need to know.", next = "op_orc_drive", fx = { affinity = 1, opinion = { orcs = "hate", ashenvale = "wrong" } }, when = { race = "NightElf" } },
        { text = "I'd rather talk about bows.", next = "BACK" },
      },
    },
    op_orc_peace = {
      lines = {
        { id = "opop_default", text = "Possible, perhaps. I'll keep my arrows fletched while we find out, and I'll tell the young ones you agree with them, which they'll enjoy far too much." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_orc_drive = {
      lines = {
        { id = "opod_default", text = "That's the Sentinel's answer, and it's the one I give when the Captain asks. Keep it, but don't let it make you careless; the orcs can hate us back just as well." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brinna Valanaar. I keep the Sentinels at Talrendis armed, which means a great many bows and a great many broken strings, because the satyrs and the naga keep them busy." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah. You'll have heard what this land was, then, and you'll understand why I don't love it." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it short; strings don't wax themselves." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Where do you get your wood?", next = "wood" },
        { text = "What do the Sentinels face here?", next = "border" },
        { text = "What makes a good bow?", next = "bow", when = { class = "HUNTER" } },
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "Farewell, Brinna.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "From Ashenvale, across the bridge, never from here. The trees of Azshara grew up over what the Highborne left behind, and I won't put a bow made from that wood in a Sentinel's hands." } },
      choices = {
        { text = "Is that superstition, or something more?", next = "wood_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Call it what you like. I've seen a bow of local yew split in the cold for no reason, and I've seen a satyr laugh when it happened, and that's enough for me." } },
      choices = {
        { text = "Good. Some lines should never be crossed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wood is wood. Fear wastes good timber.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    border = {
      lines = { { id = "b_default", text = "Satyrs in the woods, naga on the shore, and an orc camp to the north that we watch and that watches us. The Sentinels let the old tauren by the road be, so long as he keeps his promises." } },
      choices = {
        { text = "And the orcs?", next = "border_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    border_orcs = {
      lines = { { id = "bo_default", text = "They lost warriors to an elf mage of their own choosing, I hear, and they've been quiet since. I'd almost pity them, if they weren't cutting down Ashenvale on the other side of the river." } },
      choices = {
        { text = "Should the Sentinels make peace with that camp?", next = "op_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bow = {
      lines = { { id = "bw_default", text = "The wood matters, the string matters more, and the archer matters most. A good bow is one you've stopped noticing, the way you stop noticing your own arm." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A bowyer from Ashenvale, sent to the border because the Sentinels here break more bows than anyone." } },
    advice = { { id = "tp_ad", text = "Unstring your bow every night. A bow that's always bent forgets how to straighten." } },
    sentinels = { { id = "tp_sent", text = "My sisters on the wall. I make their bows, and they keep me alive; it's a fair trade." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask the Sentinels; they stand around long enough to hear everything." } },
  },
}
