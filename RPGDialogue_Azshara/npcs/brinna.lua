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
    { id = "g_default", text = "Bows, arrows, strings, as the Sentinels have carried since the War of the Ancients. If you need something else, you've come to the wrong tree." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Let me see how you're holding that bow; I'll know where you've been." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you've come back with all your fingers. That's more than some." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Sentinels say you've been useful on the border. Good. They don't say that lightly." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Your string's been waxed by somebody who cared, and I see that seldom among the younger races." },
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
        { id = "opod_default", text = "That's the Sentinel's answer, and it's the one I give when our captain asks. Keep it, but don't let it make you careless; the orcs can hate us back just as well." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dd_spirits = {
      lines = {
        { id = "dd_spirits_1",
          text = "They trouble every kaldorei who lives here, though most of my sisters won't admit it. These trees grew up through the bones of Queen Azshara's city, and when the wind moves through them, sometimes it sounds like the old court laughing." },
        { id = "dd_spirits_2",
          text = "That's why I won't cut a bow from Azshara's wood, {class}. A bow should be quiet in the hand, and I'd not trust one grown from that soil to stay quiet when it mattered." },
      },
      choices = {
        { text = "The dead deserved rest, even the Highborne.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Highborne earned their torment. I did it for you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Brinna.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_spirits", when = { questDone = TODO_QUEST("Spiritual Unrest") },
          text = "Loh'atu tells me you laid some of the Highborne spirits to rest near the point. I didn't think I'd ever say this, but the woods feel a little less watched tonight, and I thank you for it." },
        { id = "h_default", key = true, text = "I am Brinna Valanaar. I keep the Sentinels at Talrendis armed, which means a great many bows and a great many broken strings, because the satyrs and the naga keep them busy on what was once the edge of Zin-Azshari." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah. You'll have heard what this land was, then, and you'll understand why I don't love it." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it short; strings don't wax themselves." },
        { id = "h_again2", text = "Go on, but briefly; the Highborne talked too much, and look what became of them." },
      },
      choices = {
        { text = "Do the Highborne spirits trouble you?", next = "dd_spirits", when = { questDone = TODO_QUEST("Spiritual Unrest") } },
        { text = "Where do you get your wood?", next = "wood" },
        { text = "The Sentinels must face a good deal here.", next = "border" },
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
        { text = "Good. I wouldn't touch that cursed wood either.", next = "BACK", reply = "Nor will I, and that's one of my lines. I'll carry wood from Ashenvale until the satyrs stop laughing.", fx = { align = { order = 1 } } },
        { text = "Wood is wood. Fear wastes good timber.", next = "BACK", reply = "Maybe, until your bow splits mid-draw with a satyr in front of you. Fear's cheaper than a funeral.", fx = { align = { order = -1 } } },
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
      lines = { { id = "bo_default", text = "They lost a dozen warriors to an elf mage they'd hired, I hear, and they've been quiet since. I'd almost pity them, if they weren't cutting down Ashenvale on the other side of the river." } },
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
    elune = { { id = "tp_elune", text = "I carve a moon into every bow I make, small, under the grip where only the archer sees it. Elune guides the arrow, and I only make the wood straight." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande is the finest archer I've ever seen, and I've seen a great many. I made her a bowstring once, and I still think of it." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "These trees grew in the gardens of the queen's own city, and I won't cut them for bows. Some of them remember her, and I don't want her name in my wood." } },
    loramus = { { id = "tp_loramus", text = "There is a hermit on an island in the bay, one of our people, who walks with demons on leashes. The Sentinels pretend he is not there, and I pretend with them." } },
    thrall = { { id = "tp_thrall", text = "The orcs at Valormok cut our trees, and their warchief calls it trade. I call it theft with a peace treaty attached." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask the Sentinels; they stand around long enough to hear everything, and they forget nothing for ten thousand years." } },
  },
}
