-- Winterspring's wilds: the hot springs and the E'ko witch doctor. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "donova", id = TODO_NPC("Donova Snowden"), name = "Donova Snowden",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "warm" }, values = { "curious", "protective" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_springs", text = "Welcome, welcome! Come stand by the spring. It's the only warm water for miles, an' Winterspring has more secrets than snowflakes." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then ye'll feel it too: somethin's poisonin' the furbolgs, an' it's no' natural." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, all this way north! We're a long way from Khaz Modan, the both of us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Donova Snowden's the name, an' I study the springs an' the creatures that live by 'em, though these days it's mostly the Winterfall. The furbolgs used tae keep tae themselves, but now they're drinkin' somethin' that makes 'em mad as a kicked hive." },
        { id = "h_firewater", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Winterfall Firewater") }, { questActive = TODO_QUEST("Falling to Corruption") } } },
          text = "It's firewater, an' the Winterfall are swillin' it by the barrel, but it's no' just drink; it's turnin' 'em. I want tae know who's brewin' it, an' why." },
        { id = "h_goo", when = { any = { { questActive = TODO_QUEST("Mystery Goo") }, { questActive = TODO_QUEST("Toxic Horrors") } } },
          text = "Look at this goo, an' smell it... no, on second thought, don't. Whatever's in the firewater is in this too." },
        { id = "h_chief", when = { any = { { questActive = TODO_QUEST("High Chief Winterfall") }, { questActive = TODO_QUEST("Words of the High Chief") } } },
          text = "The High Chief knows who's behind it, an' he'll no' tell us kindly, so make him tell us anyway." },
        { id = "h_linken", when = { questActive = TODO_QUEST("It's a Secret to Everybody") },
          text = "A gnome's sword, found in a crater, an' ye want me tae temper it? Well, the springs are hot enough, so leave it with me." },
      },
      again = { { id = "h_again", text = "Aye? The spring's warm; take yer time." } },
      choices = {
        { text = "What were the Winterfall like before?", next = "before" },
        { text = "Why study hot springs?", next = "springs" },
        { text = "Who'd brew something like that?", next = "who" },
        { text = "The furbolgs' sickness. Can I feel it?", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "I'll look into the furbolgs.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Shy an' gruff, an' they kept tae their dens an' left travellers be. I used tae trade them fish for news, but now they'd sooner take my arm than my fish." } },
      choices = {
        { text = "Can they be brought back?", next = "before_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_back = {
      lines = { { id = "bb_default", text = "If the drink stops, maybe, an' I'd like tae think so. A creature's no' its worst week." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } } },
    },
    springs = {
      lines = { { id = "s_default", text = "Because they're warm in a place that isnae, an' life gathers round warm things. Ye learn a land by where it chooses tae live." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Somebody who wants the Winterfall angry an' doesnae care what it costs them. I've a list o' guesses. None of 'em are good, an' none of 'em are proof." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Then ye'll feel it worse than me. It's like the woods are holdin' their breath. Go gentle near the dens; whatever's in them isnae all furbolg any more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A dwarf who likes the cold an' loves a puzzle. Winterspring has plenty o' both." } },
    advice = { { id = "tp_ad", text = "Never drink anythin' a furbolg offers ye, no' this year." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, but ask me about the springs instead, for I know the springs." } },
  },
}

P:NPC {
  key = "mauari", id = TODO_NPC("Witch Doctor Mau'ari"), name = "Witch Doctor Mau'ari",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "playful" }, values = { "mystical", "proud" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor come all dis way to see Mau'ari! Smart, you are, or maybe lost, but either way, sit." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, up here in de ice! You be feelin' de cold in your tusks, eh? Mau'ari too." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "DRUID" } },
      text = "You know de spirits. Den you know what Mau'ari be talkin' about when she say every beast got a little magic left in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mau'ari be de witch doctor up here, mon. Every creature in dis frozen place carry a little spirit, a little E'ko, and if you bring it to Mau'ari, she make you juju, good juju, mostly." },
        { id = "h_cache", tags = { "news" }, when = { questActive = TODO_QUEST("Cache of Mau'ari") },
          text = "First, Mau'ari need her cache back, because in it be de charm you need for catchin' E'ko. No charm, no E'ko, and no E'ko, no juju." },
        { id = "h_luck", when = { any = { { questActive = TODO_QUEST("A Little Luck") }, { questActive = TODO_QUEST("Luck Be With You") } } },
          text = "Luck, you want? Mau'ari got plenty, so bring de right E'ko, and maybe some find its way to you." },
        { id = "h_cold", when = { metBefore = true }, text = "Mau'ari been up here a long time, mon, long enough to stop complainin' about de cold, but not long enough to stop feelin' it." },
      },
      again = { { id = "h_again", text = "More questions? Mau'ari got answers, and some of dem even true." } },
      choices = {
        { text = "What is E'ko, exactly?", next = "eko" },
        { text = "What does the juju do?", next = "juju" },
        { text = "Why come all the way up here?", next = "why" },
        { text = "A Darkspear in the snow. Why?", next = "troll", when = { race = "Troll" } },
        { text = "I'll bring E'ko.", next = "END", fx = { affinity = 2 } },
      },
    },
    eko = {
      lines = { { id = "e_default", text = "It be de little bit of spirit every beast carry, and when dey fall, it linger. Mau'ari's charm catch it before it blow away on de wind." } },
      choices = {
        { text = "Is that right, to take it?", next = "eko_right", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eko_right = {
      lines = { { id = "er_default", text = "Better Mau'ari use it than de wind waste it, and de spirits don't mind. Mau'ari asked, and dey said yes... mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    juju = {
      lines = { { id = "j_default", text = "It make you faster, or tougher, or a little lucky, but never all at once, because even Mau'ari not dat good, not yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "De spirits up here be old and strange, and strange is interestin', where warm is just boring. Mau'ari choose interestin' every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "t_default", text = "Same reason as you be anywhere, mon: somethin' called and you answer, and de cold just come with it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Mau'ari be a witch doctor, and dat's de story; de rest she keep, like a good charm." } },
    advice = { { id = "tp_ad", text = "Wear two pairs of socks, mon. De spirits don't care, but your toes will." } },
    echo_isles = { { id = "tp_echo_isles", text = "De islands, warm and green, Mau'ari remember dem well. She come up here anyway, because de magic in de snow be stranger." } },
    _none = { { id = "tp_none", text = "Mau'ari know many t'ings, but not dat one, mon." } },
  },
}
