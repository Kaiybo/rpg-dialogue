-- Zenn Foulhoof, the satyr by the road east of Dolanaar (0.72.0). Voice: bibles/zenn.md
-- Classic: Zenn's Bidding (gives), Seek Redemption! (the Council's punishment ends at him, in fel cones).
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zenn", id = TODO_NPC("Zenn Foulhoof"), name = "Zenn Foulhoof",
  bible = "bibles/zenn.md", role = "questgiver", tier = "quest",
  communities = { "teldrassil_wilds" }, temper = { "sly", "cheerful" }, values = { "ambitious", "secretive" },
  notices = { "class", "greenness" },
  impression = {
    first = "Zenn Foulhoof is a satyr who smiles too much and asks for too little, and he calls it a bargain. Every kind word he gave me came with a hook in it.",
    third = "{name} met Zenn Foulhoof, a smiling satyr living just off the road east of Dolanaar who wanted errands run and no questions asked.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, a fresh face! Come closer, little one, I don't bite, whatever the Sentinels have told you." },
    { id = "g_bidding", when = { questActive = TODO_QUEST("Zenn's Bidding") }, text = "Fangs, feathers and silk, my busy little bee. Two of each, and quietly, if you please." },
    { id = "g_frog", when = { questDone = TODO_QUEST("Seek Redemption!") }, text = "You! You fed me those cones and smiled while you did it. I will have my vengeance, mark me." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you come back to old Zenn? How touching, though I can't think why you would." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "My, you've grown teeth since you first fetched for me. That's a pity, because the gullible ones are so much more pleasant." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word in the forest says you've been telling folk pretty stories, my friend. You'll go far, and I say that with real admiration." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Running about helping the Dolanaar lot, are we? There's no profit in kindness, little one, but you'll learn." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Don't sniff at me like that, because I've bathed this very month." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Well now, there's a smell I know. Your little friend and I would have plenty to talk about, I think." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "So young, and so far from the Sentinels' skirts! Nobody's told you about satyrs yet, have they? Good." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "o_zenn_foulhoof_harmless", tags = { "news" }, when = { opinion = { topic = "zenn_foulhoof", stance = "harmless" } },
          text = "Oh, you're the one who called me harmless in front of the Council. I could weep with gratitude, if satyrs did that sort of thing." },
        { id = "o_zenn_foulhoof_hard", tags = { "news" }, when = { opinion = { topic = "zenn_foulhoof", stance = "hard" } },
          text = "Ah, here comes the one who wants me run off the island! Do sit down; I'm told I'm much less frightening up close." },
        { id = "h_default", key = true,
          text = "Zenn Foulhoof, at your service, and you at mine, I hope. I have a little business in this forest, and a little business needs a little help." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Zenn's Bidding") },
          text = "Eager for work, I see, and lucky for you I always have some. Fangs, feathers and silk, from the beasts around Dolanaar, and nobody needs to know who wanted them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Zenn's Bidding") },
          text = "Nightsaber fangs, strigid owl feathers and webwood silk, two of each. Don't dawdle, because I'm not a patient satyr." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Zenn's Bidding"), days = 3 } },
          text = "Who'd have guessed that I, Zenn Foulhoof, would have one of the forest's own fetching for me? This world is full of surprises, and I do love a surprise." },
        { id = "h_redeem", tags = { "news" }, when = { questActive = TODO_QUEST("Seek Redemption!") },
          text = "Back so soon, and with something in your pack? Is that a snack for old Zenn? You shouldn't have, and if it's another acorn, you really shouldn't have." },
        { id = "h_frog", tags = { "news" }, when = { questRecent = { TODO_QUEST("Seek Redemption!"), days = 3 } },
          text = "My tongue still tastes of smoke and pondwater, and it's your doing. I hope the Council patted your head, because that's all you'll get from them." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "One of the kaldorei, and alone on the road! Your elders have told you terrible things about me, I expect, and half of them are even true." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Oh, you I like already. You've been reading the books they burn, haven't you, and you look none the worse for it." },
      },
      again = {
        { id = "h_again", text = "What else, little one? Zenn has all day and nowhere he's welcome." },
        { id = "h_again2", text = "Go on, ask. I may even answer honestly, if it suits me." },
      },
      choices = {
        { text = "What business does a satyr have in this forest?", next = "business" },
        { text = "I'm surprised the night elves let you stay here.", next = "council" },
        { text = "Your kind weren't always satyrs, I've heard.", next = "satyrs" },
        { text = "You were one of us once.", next = "kin", when = { race = "NightElf" } },
        { text = "You reek of fel, Zenn.", next = "druid_z", when = { class = "DRUID" } },
        { text = "What do you know of my sort of magic?", next = "lock_z", when = { class = "WARLOCK" } },
        { text = "The Council knows I helped you.", next = "caught", when = { any = { { questActive = TODO_QUEST("Seek Redemption!") }, { questDone = TODO_QUEST("Seek Redemption!") } } } },
        { text = "What do you want me to fetch?", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },

    business = {
      lines = {
        { id = "bu_default", text = "Little charms, little cures, little favours for folk who can't ask the priestesses. A fang here and a feather there, and nobody gets hurt who matters." },
      },
      choices = {
        { text = "Who are these folk who can't ask the priestesses?", next = "business_who" },
        { text = "Those creatures belong to the forest. I won't kill for your trinkets.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A fang's a fang. If you pay, I'll fetch.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    business_who = {
      lines = {
        { id = "bw_default", text = "Now that would be telling, and I'd have no customers left if I told. Let's say not everyone in Teldrassil is as pure as the Temple would like." },
      },
      choices = {
        { text = "You're lying to me.", next = "business_lie" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    business_lie = {
      lines = {
        { id = "bl_default", text = "Lying is such an ugly word, little one. I prefer to say I'm generous with the truth, and I give it out a little at a time so it lasts." },
      },
      choices = {
        { text = "Then I'll be stingy with my trust.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Goodbye, Zenn.", next = "END" },
      },
    },

    council = {
      lines = {
        { id = "co_default", text = "Let? Nobody lets a satyr do anything, little one. The Council of the Forest finds me tiresome rather than dangerous, and I work very hard to keep it that way." },
      },
      choices = {
        { text = "Tiresome? You're a satyr. You should be driven out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If you've done no harm, they've no right to chase you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Council must wonder what you're up to.", next = "council_think" },
      },
    },
    council_think = {
      lines = {
        { id = "ct_default", text = "Trading in nonsense, which suits me nicely. Syral Bladeleaf passes their orders round Dolanaar, and if he ever learns what I really do, I suppose I'll find out how patient they are." },
      },
      choices = {
        { text = "I could tell Syral myself.", next = "council_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_tell = {
      lines = {
        { id = "cl_default", text = "You could, and he'd thank you, and then he'd ask why you know so much about my business. That's how I keep friends in this forest, little one: I make sure they have something to lose." },
      },
      choices = {
        { text = "That sounds like a threat.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'll be going.", next = "END" },
      },
    },

    satyrs = {
      big = true,
      lines = {
        { id = "sa_default", text = "Ten thousand years ago the Highborne chose power, and some of us were given horns and hooves for our trouble. Your priestesses call it a curse, though I've always thought it a very honest shape." },
      },
      choices = {
        { text = "Honest? You traded your people for demons.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power's power. I can't blame you for taking it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Do you remember who you were?", next = "satyrs_before" },
      },
    },
    satyrs_before = {
      lines = {
        { id = "sb_default", text = "Every night, little one, and I'd thank you not to ask about it again. Fetch for me, or don't, but don't pity me, because I'd charge you for that as well." },
      },
      choices = {
        { text = "I won't pity you, then. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Goodbye, Zenn.", next = "END" },
      },
    },

    kin = {
      big = true,
      lines = {
        { id = "ki_default", text = "One of you? I was something far grander than a young kaldorei hunting owls for Dolanaar. But yes, we shared a cradle once, your people and mine, and look how differently we turned out." },
      },
      choices = {
        { text = "You chose that shape. I choose mine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Our elders made mistakes too. Everyone knows it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_z = {
      lines = {
        { id = "dz_default", text = "And you reek of moss and good intentions, which is worse to my nose, believe me. Don't tell Athridas where I sleep, druid, and I won't tell him how much you enjoyed this chat." },
      },
      choices = {
        { text = "I'll tell him whatever I like.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock_z = {
      lines = {
        { id = "lz_default", text = "Enough to know you'll be lonely in Darnassus, and that the kaldorei will smile at you the way they smile at me. Come and talk to Zenn when it gets too quiet, because I never mind your sort." },
      },
      choices = {
        { text = "I'm nothing like you, satyr.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Perhaps we do have something in common.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = {
        { id = "ca_default", text = "Do they? Then you'd better make your peace with them, hadn't you? I won't hold it against you, little one, because everyone has to eat." },
        { id = "ca_done", when = { questDone = TODO_QUEST("Seek Redemption!") },
          text = "Oh, they know, and now I know you'd poison a friend for their good opinion. I've learned something about you, and I never forget a lesson." },
      },
      choices = {
        { text = "You were never my friend, Zenn.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It wasn't personal. The Council asked.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll be going.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A satyr with a quiet life and a great many acquaintances. Anything more costs extra, little one." } },
    advice = { { id = "tp_ad", text = "Never eat anything a stranger hands you in the woods. I learned that one with a bellyache that lasted a fortnight, and I'm giving it to you for free." } },
    satyrs = { { id = "tp_satyrs", text = "Most of my cousins are rude, loud and fond of fire. I'm the charming one, and you'll find I'm also the only one who talks.", next = "satyrs" } },
    fel_moss = { { id = "tp_felmoss", text = "Ugly stuff, and nothing to do with me, whatever the druids whisper. Ask the grells in Fel Rock where it comes from." } },
    teldrassil = { { id = "tp_tree", text = "A very large tree full of very proud people. I'd have chosen somewhere warmer myself." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion, the Legion, everyone's always worried about the Legion. I'm only a humble satyr with a fondness for the forest, little one, and I've no idea what you're implying." } },
    highborne = { { id = "tp_highborne", text = "The Highborne were such fun, little one, before your people took offence at a few small bargains. I knew one or two of them, socially, a long time ago." } },
    elune = { { id = "tp_elune", text = "Elune and I aren't on speaking terms, little one, which is her loss. I can be very good company." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids' green dream, all leaves and naps. I've never cared for it, and I believe the feeling is mutual." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if I had, you couldn't afford it." } },
  },
}
