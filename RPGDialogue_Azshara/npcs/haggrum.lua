-- Haggrum Bloodfist, Ag'tor's brother at Valormok (0.72.0). Voice: bibles/haggrum.md
-- The brother who still smiles; survived the elf's betrayal and keeps the camp's spirits up.
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haggrum", id = TODO_NPC("Haggrum Bloodfist"), name = "Haggrum Bloodfist",
  bible = "bibles/haggrum.md", role = "soldier", tier = "quest",
  communities = { "valormok" }, temper = { "jovial", "steady" }, values = { "loyal", "brave" },
  notices = { "class", "weary" },
  impression = {
    first = "Haggrum Bloodfist is Ag'tor's brother and the only orc in Valormok who still smiles, though he was there when the elf turned her magic on them. He remembers when he and his brother had this wilderness to themselves.",
    third = "{name} met Haggrum Bloodfist, Ag'tor's brother and the cheerful heart of Valormok.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar, friend! Sit, if you can find a rock that isn't wet." },
    { id = "g_betrayed", when = { questActive = TODO_QUEST("Betrayed") }, text = "My brother's sent you after the elf, hasn't he? Good. Bring her down, and I'll smile twice as wide." },
    { id = "g_done", when = { questDone = TODO_QUEST("Betrayed") }, text = "There's the one who settled our debt with the elf! My brother sleeps now, and so do I." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the camp's been dull without a new face. Tell me something that isn't about naga." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The grunts say you've been a help. In Valormok that's high praise, because they don't say much of anything." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you leaned on one of ours. Don't; my brother's lost enough of them without you scaring the rest." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! You stand like my brother does, all shoulders and frown. Smile, it won't kill you." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look half dead, friend, and I've seen enough of the whole kind out here. Rest by the fire a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Haggrum Bloodfist, brother to Ag'tor, who runs this camp. He does the frowning and I do the smiling, and between us we make one decent orc, though we both bleed for the Horde the same." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Betrayed") },
          text = "If my brother tells you about the elf, listen to him. He doesn't speak of it often, and when he does, he means every word." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Betrayed"), days = 3 } },
          text = "You brought back the elf's head, and my brother cut one more mark into that post, a good one this time. I haven't seen him stand that straight in a year." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Another orc of Durotar! Tell me, is the Valley of Strength still as loud as it was? I miss the noise." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll! Good, you'll know how to laugh at a bad situation; my brother never learned." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've got all evening and a full pot, and an orc never turns away a guest at his fire." },
        { id = "h_again2", text = "Go on. Talking keeps the cold off." },
      },
      choices = {
        { text = "How do you still smile out here?", next = "smile" },
        { text = "What happened with the elf's expedition?", next = "betrayal" },
        { text = "You seem to think well of Ag'tor.", next = "brother" },
        { text = "What was Azshara like before?", next = "before" },
        { text = "Warriors don't smile. Why do you?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "The spirits here must trouble you.", next = "spirits", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "What can I do for Valormok?", next = "BUSINESS" },
        { text = "Farewell, Haggrum.", next = "END" },
      },
    },
    smile = {
      lines = { { id = "s_default", text = "Because if I don't, nobody will, and a camp with no laughter in it is a camp waiting to be buried. I grieve the twelve as much as my brother does, I just do it with my mouth turned the other way." } },
      choices = {
        { text = "That takes its own kind of strength.", next = "smile_stance" },
        { text = "Doesn't it feel like pretending?", next = "smile_stance" },
      },
    },
    smile_stance = {
      big = true,
      lines = { { id = "ss_default", text = "Some days it is pretending, and I pretend until it isn't. The grunts need one orc in this camp who believes we'll all go home, and it isn't going to be Ag'tor." } },
      choices = {
        { text = "Hope is a weapon too. Keep it sharp.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "False hope gets orcs killed, Haggrum.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    betrayal = {
      lines = { { id = "b_default", text = "We guarded the elf's people into the ruins, on Belgrom's orders, and when she found what she wanted she turned on us. I was at the back with the packs, which is the only reason I'm here to tell you about it." } },
      choices = {
        { text = "I'm sorry, Haggrum.", next = "betrayal_sorry" },
        { text = "Why did Belgrom trust her?", next = "betrayal_belgrom" },
      },
    },
    betrayal_sorry = {
      lines = { { id = "bs_default", text = "So am I, friend, every day. Ag'tor cut their names into the post, and I sit by it sometimes and tell them the camp news, which is mostly about Kurll's milk." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    betrayal_belgrom = {
      big = true,
      lines = { { id = "bb_default", text = "Belgrom thought the elves' magic could serve the Horde, and the Warchief allowed it, so who am I to say? But I've not trusted a robe since, and I don't think I ever will." } },
      choices = {
        { text = "Belgrom was wrong. Some allies aren't worth having.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Orders are orders. The Horde must take its chances.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "br_default", text = "Stubborn, honorable and far too hard on himself, and the best orc I know. He thinks every death in this camp is his to carry, and I keep telling him he's only got two arms." } },
      choices = { { text = "He's lucky to have you.", next = "BACK", fx = { affinity = 1 } } },
    },
    before = {
      lines = { { id = "bf_default", text = "Before the camp, my brother and I would come out here alone, scouting, and camp in the wilderness with nobody for miles. Eternal autumn, they call it, and it was beautiful, if you didn't look too closely at the ruins." } },
      choices = {
        { text = "And now?", next = "before_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_now = {
      lines = { { id = "bn_default", text = "Now there are naga in the water, satyrs in the woods and an elf's grave-markers by our fire. Look at it now, I tell my brother, and he never laughs, but I keep saying it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "Because a frown never turned an axe, friend, and a smile has turned a few duels my way when the other orc wondered what I knew that he didn't. Try it sometime." } },
      choices = { { text = "Maybe I will.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "Every night, a little. There's an old sorrow in this ground, older than us and older than the elves' mistakes, and I talk over it with stories so the grunts don't hear it." } },
      choices = { { text = "Keep telling stories, Haggrum.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An orc of Durotar, brother to Ag'tor, survivor of a bad day in the ruins. I'd tell you more, but it's all sad and I'm saving my good stories." } },
    advice = { { id = "tp_ad", text = "Laugh when you can, friend. Azshara will give you plenty of reasons not to." } },
    rimtori = { { id = "tp_rim", text = "The elf who killed my brother's warriors. I don't say her name at the fire, and I'd thank you not to either." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave us Valormok and told us to make something of it, and my brother has. I'd follow Thrall anywhere, and my brother would follow him into the sea." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "The elves named this land after their queen, and she drowned with her city. I wonder what kind of queen gets a whole land named for her and still ends up at the bottom of the sea." } },
    tyrande = { { id = "tp_tyrande", text = "The night elf priestess sends Sentinels to watch us from Talrendis, and they watch very well. I'd watch us too, if I were them." } },
    booty_bay = { { id = "tp_booty_bay", text = "I went to Booty Bay once, with my brother, before he got serious. We lost all our coin and one of his teeth, and he laughed the whole way home." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Jediga; she knows everything and charges for half of it, which is not the orcish way, but it works for her." } },
  },
}
