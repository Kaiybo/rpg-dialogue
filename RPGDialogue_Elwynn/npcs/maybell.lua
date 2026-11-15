-- Maybell Maclure, Maclure Vineyards. Voice: bibles/maybell.md
-- In love with a Stonefield. The families mustn't know. Billy is her little brother.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maybell", id = TODO_NPC("Maybell Maclure"), name = "Maybell Maclure",
  bible = "bibles/maybell.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" }, values = { "kind", "romantic" },
  notices = { "stealth", "craft" },

  greetings = {
    { id = "g_hush", text = "Shh. Not so loud. They'll hear you up at the house." },
    { id = "g_news", when = { questActive = TODO_QUEST("Young Lovers") }, text = "Did you find him? Is he all right?" },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "Oh! It's you. Hello. I'm not blushing, it's the sun." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Where did you- oh! You frightened me. How do you do that? Could you teach me? Please?" },
    { id = "n_herbs", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom. Tommy Joe picks it by the river for me. He thinks I don't know he picks the same patch every time." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "You vanished! Just like that! Oh, I wish I could do that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maclures and Stonefields don't speak. That's the rule, older than me. I've never been very good at rules." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Young Lovers") },
          text = "There's someone across the river I'm not allowed to see. If anyone asks, I'm out here counting grapes." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "Down by the river, near the Stonefield farm. Tommy Joe. Tell him I'm thinking of him. Don't let anyone hear you say it." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Young Lovers"), questBefore = TODO_QUEST("The Escape") },
          text = "He spoke to his Gramma? His Gramma! Oh, either that's very good or very, very bad." },
        { id = "h_escape", tags = { "news" }, when = { questActive = TODO_QUEST("The Escape") },
          text = "Is that it? The potion? My hands are shaking. Give it here before I lose my nerve." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "I keep waiting for someone to catch me. Then I think of him, and I find I don't much care." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 7 } },
          text = "I hate lying to my family. I do. But it's a smaller lie than pretending I don't love him." },
        { id = "h_far", when = { minLevel = 25, questDone = TODO_QUEST("The Escape") },
          text = "You came all the way back here? From wherever adventurers go? Then you should know: nobody's caught us yet." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly. Billy's somewhere about, and Billy hears everything." },
        { id = "h_again2", text = "Yes? Keep your voice down." },
        { id = "h_again3", when = { questDone = TODO_QUEST("The Escape") }, text = "Ask me anything. I'm in a very good mood. It's suspicious, I know." },
      },
      choices = {
        { text = "Why do the families fight?", next = "feud" },
        { text = "Tell me about Tommy Joe.", next = "tommy" },
        { text = "Is Billy your brother?", next = "billy" },
        { text = "Billy says you go to the river a lot.", next = "billy_river", when = { heardLine = "billy.m_river" } },
        { text = "How was the river?", next = "escape", when = { questDone = TODO_QUEST("The Escape") } },
        { text = "Shall I bless the two of you? Quietly.", next = "priest", when = { class = "PRIEST" } },
        { text = "I could teach you to move unseen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You should tell your family the truth.", next = "truth", fx = { opinion = { maybell_tommy = "honest" } } },
        { text = "Your secret's safe with me.", next = "END", fx = { affinity = 1, opinion = { maybell_tommy = "romantic" } } },
      },
    },

    feud = {
      lines = {
        { id = "f_default", text = "I asked once. I got sent to bed without supper. I was twelve. I've stopped asking." },
      },
      choices = {
        { text = "Does anyone remember why it started?", next = "feud_why" },
        { text = "That's no reason to keep you apart.", next = "BACK", fx = { affinity = 1, learn = { "maybell_tommy" } } },
        { text = "Families have their reasons.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    feud_why = {
      lines = {
        { id = "fy_default", text = "Gramma Stonefield might. She's the oldest of any of them. They say she's the only Stonefield who doesn't spit when our name comes up." },
      },
      choices = {
        { text = "Then she might help you.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tommy = {
      lines = {
        { id = "tj_default", text = "He's kind. He stands at the river pretending to mend a fence, and he's terrible at pretending. All of Elwynn knows, except our families." },
      },
      choices = {
        { text = "How did you two meet?", next = "tommy_meet" },
        { text = "He's a Stonefield, though.", next = "tommy_stonefield", fx = { align = { order = 1 } } },
        { text = "He sounds lovely.", next = "BACK", fx = { affinity = 1, learn = { "maybell_tommy" } } },
      },
    },
    tommy_meet = {
      lines = {
        { id = "tm_default", text = "Across a fence. That's all I'll say, or I'll go red, and Billy will see, and ask why, and then the whole vineyard knows." },
      },
      choices = { { text = "I won't press.", next = "BACK", fx = { affinity = 1 } } },
    },
    tommy_stonefield = {
      lines = {
        { id = "ts_default", text = "And I'm a Maclure. Neither of us picked it. I'm not giving him up for something somebody's great-grandfather decided." },
      },
      choices = {
        { text = "Good for you.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    billy = {
      lines = {
        { id = "b_default", text = "My little brother, and the worst-kept secret-keeper in Elwynn. If Billy ever finds out about Tommy Joe, the vineyard hears it by supper." },
        { id = "b_necklace", when = { questDone = TODO_QUEST("Lost Necklace") },
          text = "And now Auntie Bernice thinks he stole her necklace. Which he didn't. Probably. He's been very nice to me all week, which is a bad sign." },
      },
      choices = {
        { text = "Did he take it?", next = "billy_took", when = { questDone = TODO_QUEST("Lost Necklace") } },
        { text = "Little brothers are like that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    billy_took = {
      lines = {
        { id = "bt_default", text = "I don't ask Billy questions I don't want answered. It's how we get along. You could try it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    billy_river = {
      lines = {
        { id = "br_default", text = "He said that? To you? Oh, he'll get me caught. What else did he say? No. Don't tell me. I'll only worry." },
      },
      choices = {
        { text = "He doesn't know why. Not yet.", next = "BACK", fx = { affinity = 1 } },
        { text = "You might want to bribe him.", next = "billy_pie" },
      },
    },
    billy_pie = {
      lines = {
        { id = "bp_default", text = "With what? He only takes pie, and the only pie he likes is baked at the Stonefields'. That's the whole feud in one boy's stomach." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } } },
    },

    escape = {
      lines = {
        { id = "e_default", text = "Quiet. Nobody saw. I could hear my own heart over the water. He'd brought peacebloom, the same patch as always." },
      },
      choices = {
        { text = "And the guilt?", next = "escape_guilt" },
        { text = "I'm glad.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    escape_guilt = {
      lines = {
        { id = "eg_default", text = "It sits with me at supper. But I'd rather feel guilty and have him than feel nothing at all." },
      },
      choices = {
        { text = "That's honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Guilt means you should tell them.", next = "truth", fx = { align = { order = 1 } } },
      },
    },

    priest = {
      big = true,
      lines = {
        { id = "p_default", text = "A blessing? From a priest? Oh, I'd like that. Quietly, though. If anyone asks, you were blessing the grapes." },
      },
      choices = {
        { text = "The grapes, then. And whoever's thinking of a Stonefield.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, opinion = { maybell_tommy = "romantic" } },
          journal = { first = "Blessed Maybell Maclure and her Stonefield boy, quietly. Officially I was blessing grapes.",
                      third = "{name} gave Maybell Maclure a quiet blessing among the vines." } },
        { text = "The Light would ask you to be honest with them.", next = "truth", fx = { align = { order = 1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Could you? No. If I learned to vanish, I'd never come home, and then they'd blame the Stonefields for stealing me. It has to be something smaller." },
      },
      choices = {
        { text = "Smart girl.", next = "BACK", fx = { affinity = 1 } },
        { text = "Offer stands.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    truth = {
      lines = {
        { id = "t_default", text = "You don't know my family. Some days I think the truth would be the end of us both." },
      },
      choices = {
        { text = "Or it might be the end of the feud.", next = "truth_end", fx = { trait = { kind = 1 } } },
        { text = "Then be careful.", next = "BACK" },
      },
    },
    truth_end = {
      lines = {
        { id = "te_default", text = "Some nights I believe that. Then morning comes, and I hear them at breakfast, and I lose my nerve again." },
      },
      choices = {
        { text = "Nerve comes back. Keep trying.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Maclure. I grew up in the vines. That's all there is, apart from one boy across the river, and I'm not telling you about him." } },
    advice = { { id = "tp_ad", text = "If you love someone, find a friend who can keep a secret. Then find a second one, in case the first is Billy." } },
    maybell_tommy = {
      { id = "tp_us", text = "Is it that obvious? Don't answer that. It's that obvious." },
      { id = "tp_us2", text = "Him? He's... Ask me something else. Ask me properly.", next = "tommy" },
    },
    lions_pride = { { id = "tp_inn", text = "William Pestle works out of the inn. He's kind to me. He doesn't ask questions." } },
    kobolds = { { id = "tp_kobolds", text = "Billy plays near the mines. I've told him not to. It's like telling the sun not to come up." } },
    _none = { { id = "tp_none", text = "I only know grapes and one boy across the river. Sorry." } },
  },
}
