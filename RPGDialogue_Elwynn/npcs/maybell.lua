-- Maybell Maclure, Maclure Vineyards. Voice: bibles/maybell.md
-- In love with a Stonefield. The families mustn't know. Billy is her little brother.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maybell", id = TODO_NPC("Maybell Maclure"), name = "Maybell Maclure",
  bible = "bibles/maybell.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" }, values = { "kind", "romantic" },
  notices = { "stealth", "craft" },
  impression = {
    first = "Maybell Maclure blushes easily and lies badly, and both have to do with a boy across the river. By her own account she has never been very good at rules.",
    third = "{name} met Maybell Maclure, who counts grapes by the river while thinking of a Stonefield she isn't allowed to see.",
  },

  greetings = {
    { id = "g_hush", text = "Shh, not so loud, please! They'll hear you up at the house." },
    { id = "g_news", when = { questActive = TODO_QUEST("Young Lovers") }, text = "Did you find him? Oh, tell me he's all right." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "Oh! It's you, hello. I'm not blushing, it's only the sun." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Where did you- oh, you frightened me! How do you do that, and could you possibly teach me?" },
    { id = "n_herbs", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom. Tommy Joe picks it by the river for me. He thinks I don't know he picks the same patch every time." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "You vanished, just like that! Oh, I do wish I could manage that." },
  },

  start = "hello",
  nodes = {
    xpt_maybell = {
      big = true,
      lines = { { id = "xpt_maybell_default", text = "I think about it every time one rides past, and then I think about Tommy Joe on the other side of the river and I stay put. Running off is only romantic if you're running toward something, and he's right here." } },
      choices = {
        { text = "Your family needs you. Don't throw that away lightly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Follow your heart, Maybell. Rules are no reason to stay.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Maybe, but don't tell Pa! I've never been very good at rules, and your spirits wouldn't tell, would they?" } },
      choices = {
        { text = "Tell your father the truth, Maybell. It's the honest way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep it secret. Love is worth a little lying.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Pa says warlocks deal with things that ought to stay in the dark, and he says the same about the Stonefields, so I suppose I'm used to being told who I can't talk to. I've never been very good at rules, though, and you seem nice enough." } },
      choices = {
        { text = "You should choose your friends yourself, Maybell.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your Pa only wants you safe. Listen to him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Maybell.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No, nobody, not really. It's only that the murlocs sometimes come up the bank at dusk, and I'm meant to be counting grapes, and nobody would think to look for me if they got me." } },
      choices = {
        { text = "I'll keep watch by the river while you're there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You shouldn't be out there at all, Maybell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No reason, no reason at all, only that sometimes a girl wants to walk by the river without her whole family knowing. You must know which way the wind blows and where the brambles are thinnest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, look at {pet}! If it came with me to the river, I'd never be frightened of the murlocs again." },
      },
      choices = {
        { text = "I'll not help you sneak about, Maybell.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep downwind and step on the grass. You'll do fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because there's someone on the Stonefield side who'd like to hear from me, and Pa reads every letter that leaves the house. I know it isn't proper, but proper hasn't done much for me so far." } },
      choices = {
        { text = "Tell your Pa the truth, Maybell. Secrets only fester.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Proper be hanged. Love finds its own way across rivers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I'd like to know if they're happy, I suppose, though Pa would say it doesn't matter as long as they give milk." } },
      choices = {
        { text = "It matters. Happy beasts make a good farm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Your Pa's right. A farm runs on work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not lie, exactly, only not say anything, if anyone asks. I know that's a lot to ask of a paladin, but it's not a crime to love someone, is it, only to get caught?" } },
      choices = {
        { text = "I won't lie for you, Maybell. I'm sorry.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your secret's safe with me. Love's no crime.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Maybell.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_maybell", tags = { "news" }, when = { party = { race = "Human", gender = "male" } },
          text = "Is that your companion? {companion} is very handsome, if you don't mind me saying, though not as handsome as Tommy Joe, and please don't tell my father I said either of those things." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You won't tell Pa I've been at the river, will you? You've got an honest face, and that's the trouble with honest faces." },
        { id = "h_default", text = "Maclures and Stonefields don't speak. That's the rule, older than me. I've never been very good at rules." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Young Lovers") },
          text = "There's someone across the river I'm not allowed to see. If anyone asks, I'm out here counting grapes." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "He'll be down by the river near the Stonefield farm. Tell Tommy Joe I'm thinking of him, and please don't let anyone hear you say it." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Young Lovers"), questBefore = TODO_QUEST("The Escape") },
          text = "He spoke to his Gramma? Oh, either that's very good news or very, very bad, and I can't tell which." },
        { id = "h_escape", tags = { "news" }, when = { questActive = TODO_QUEST("The Escape") },
          text = "Is that it, the potion? My hands are shaking, so give it here quickly before I lose my nerve." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "I keep waiting for someone to catch me. Then I think of him, and I find I don't much care." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 7 } },
          text = "I hate lying to my family, I really do. But it's a smaller lie than pretending I don't love him." },
        { id = "h_far", when = { minLevel = 25, questDone = TODO_QUEST("The Escape") },
          text = "You came all the way back here? From wherever adventurers go? Then you should know: nobody's caught us yet." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Oh, a druid! Are you one of those who can talk to the animals? I've always wondered if the cows have opinions." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage! Do you know any spells that could carry a letter across the river without anyone seeing?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Could you stand at the river crossing for a bit? Only if anyone comes, you could look terribly fierce." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You must be good at going places without being seen, and I'd love to know how you do it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock? Oh, you won't tell Pa I spoke to you, will you? He thinks I'm wicked enough already." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You talk to spirits? Could you, perhaps, tell me whether a certain boy is thinking of me?" },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, though; Billy's somewhere about, and Billy hears everything." },
        { id = "h_again2", text = "Yes? Only keep your voice down, please." },
        { id = "h_again3", when = { questDone = TODO_QUEST("The Escape") }, text = "Ask me anything you like. I'm in a very good mood, which I know is suspicious." },
      },
      choices = {
        { text = "Would you want to know what the cows think?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why do the families fight?", next = "feud" },
        { text = "Is there someone special you're not meant to see?", next = "tommy" },
        { text = "Billy must be your brother.", next = "billy" },
        { text = "Billy says you go to the river a lot.", next = "billy_river", when = { heardLine = "billy.m_river" } },
        { text = "You look as if the river went well.", next = "escape", when = { questDone = TODO_QUEST("The Escape") } },
        { text = "Shall I bless the two of you? Quietly.", next = "priest", when = { class = "PRIEST" } },
        { text = "I could teach you to move unseen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You should tell your family the truth.", next = "truth", fx = { opinion = { maybell_tommy = "honest" } } },
        { text = "Why would you need a letter carried in secret?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Something seems to be bothering you down by the river.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do you want to know how to go unseen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You want me to lie for you, Maybell.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would talking to me make you wicked, Maybell?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'd wager there's a boy across the river, Maybell.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Would you ever run off with a company of adventurers, Maybell?", next = "xpt_maybell", when = { party = true } },
        { text = "Your secret's safe with me.", next = "END", fx = { affinity = 1, opinion = { maybell_tommy = "romantic" } } },
      },
    },

    feud = {
      lines = {
        { id = "f_default", text = "I asked once, when I was twelve, and got sent to bed without supper for it. I've stopped asking since." },
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
        { id = "tj_default", text = "Tommy Joe Stonefield. He's kind, and he stands at the river pretending to mend a fence, and he's terrible at pretending. All of Elwynn knows, except our families." },
      },
      choices = {
        { text = "How did you two meet?", next = "tommy_meet" },
        { text = "He's a Stonefield, though.", next = "tommy_stonefield", fx = { align = { order = 1 } } },
        { text = "His family name shouldn't matter to anyone.", next = "tommy_stonefield", fx = { align = { order = -1 } } },
        { text = "He sounds lovely.", next = "BACK", fx = { affinity = 1, learn = { "maybell_tommy" } } },
      },
    },
    tommy_meet = {
      lines = {
        { id = "tm_default", text = "Across a fence. That's all I'll say, or I'll go red, and Billy will see, and ask why, and then the whole vineyard knows." },
      },
      choices = {
        { text = "I won't press.", next = "BACK", fx = { affinity = 1 } },
        { text = "Go on, I won't tell a soul. How did it start?", tag = "Persuade", next = "tommy_fence",
          check = { pass = { any = { { disposition = { min = 62 } }, { class = "PRIEST" }, { opinion = { topic = "maybell_tommy", stance = "romantic" } } } } },
          fail = { next = "tommy_red", fx = { affinity = -1 } } },
      },
    },
    tommy_stonefield = {
      lines = {
        { id = "ts_default", text = "And I'm a Maclure, and neither of us picked it. I'm not giving him up for something somebody's great-grandfather decided." },
      },
      choices = {
        { text = "Good for you.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Feud or no feud, your families deserve the truth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    billy = {
      lines = {
        { id = "b_default", text = "My little brother, and the worst-kept secret-keeper in Elwynn. If Billy ever finds out about Tommy Joe, the vineyard hears it by supper." },
        { id = "b_necklace", when = { questDone = TODO_QUEST("Lost Necklace") },
          text = "And now Auntie Bernice thinks he stole her necklace, which he didn't, probably. He's been very nice to me all week, though, and that's a bad sign." },
      },
      choices = {
        { text = "Did he take it?", next = "billy_took", when = { questDone = TODO_QUEST("Lost Necklace") } },
        { text = "Little brothers are like that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    billy_took = {
      lines = {
        { id = "bt_default", text = "I don't ask Billy questions I don't want answered; it's how we get along. You could try it yourself." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    billy_river = {
      lines = {
        { id = "br_default", text = "He said that, to you? Oh, he'll get me caught! No, don't tell me what else he said, or I'll only lie awake worrying." },
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
        { id = "e_default", text = "It was quiet, and nobody saw. I could hear my own heart over the water, and he'd brought peacebloom from the same patch as always." },
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
        { text = "Some secrets are worth keeping, if they keep you happy.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    priest = {
      big = true,
      lines = {
        { id = "p_default", text = "A blessing, from a priest? Oh, I'd like that, but quietly. If anyone asks, you were blessing the grapes." },
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
        { id = "ro_default", text = "Could you? No, I'd better not. If I learned to vanish I'd never come home, and then they'd blame the Stonefields for stealing me, so it has to be something smaller." },
      },
      choices = {
        { text = "Smart girl.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
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
    tommy_fence = {
      lines = {
        { id = "tf_default", text = "There was a storm, and half our fence went into the river, and he was on the other bank mending theirs. He waded over and fixed ours too, without a word, and then he stood there dripping and asked if I liked peacebloom." },
        { id = "tf_after", text = "I said I'd never thought about it, which was a lie, and he's brought me some every week since. If Pa ever asks who mended that fence so well, I'll just have to blush and say the Light did it." },
      },
      choices = {
        { text = "That's the sweetest thing I've heard all week.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tommy_red = {
      lines = {
        { id = "tr_default", text = "No, no, I'm already going red, look. If I start telling it I'll never stop, and Billy's somewhere behind those vines." },
        { id = "tr_default2", text = "I don't know you well enough for that one, I'm sorry. It's the only thing in the whole vineyard that's just mine." },
      },
      choices = {
        { text = "Keep it, then. I won't pry.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't get much past the vineyard, but you'd be surprised what people say over the grapes. Ask me about any of this, only quietly, please." },
    },
    background = { { id = "tp_bg", text = "I'm a Maclure. I grew up in the vines. That's all there is, apart from one boy across the river, and I'm not telling you about him." } },
    advice = { { id = "tp_ad", text = "If you love someone, find a friend who can keep a secret. Then find a second one, in case the first is Billy." } },
    maybell_tommy = {
      { id = "tp_us", text = "Is it that obvious? Don't answer that, I know it is." },
      { id = "tp_us2", text = "Him? He's... oh, ask me properly and I'll tell you.", next = "tommy" },
    },
    lions_pride = { { id = "tp_inn", text = "William Pestle works out of the inn. He's kind to me, and he never asks questions." } },
    kobolds = { { id = "tp_kobolds", text = "Billy plays near the mines, though I've told him not to. It's like telling the sun not to come up." } },
    _none = { { id = "tp_none", text = "I'm sorry, I only know about grapes and one boy across the river." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire is the one week Pa doesn't watch the river, because he's too busy selling wine. I'm not saying what I do with that week, only that I like the Faire very much." } },
    holy_light = { { id = "tp_holy_light", text = "I ask the Light every night to soften Pa's heart, and every morning he's just the same. Gramma Stonefield says the Light works slowly on stubborn men." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "Somebody told me there are Maclures and Stonefields both on the old stone at Stone Cairn Lake, side by side, and nobody minded it then. I think about that most nights." } },
  },
}
