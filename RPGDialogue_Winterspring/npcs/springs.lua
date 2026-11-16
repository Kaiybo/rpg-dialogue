-- Winterspring's wilds: the hot springs and the E'ko witch doctor. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "donova", id = TODO_NPC("Donova Snowden"), name = "Donova Snowden",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "warm" }, values = { "curious", "protective" },
  notices = { "race", "class" },

  impression = {
    first = "Donova Snowden studies the hot springs and the creatures around them, and she is worried sick about the Winterfall furbolgs. Something is poisoning them, and she means to find out what.",
    third = "{name} met Donova Snowden, a warm-hearted dwarf naturalist studying the hot springs of Winterspring.",
  },

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
    dwarf_dn = {
      lines = {
        { id = "ddn_default", text = "Aye, an' we're the only two daft enough! The cold's no bother tae a Dun Morogh lass; it's the furbolgs I worry about, for they used tae trade wi' me for honey an' now they throw rocks." },
        { id = "ddn_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A bear tracker from back home, eh? Then ye'll know a beast that's sick from one that's angry, an' the Winterfall are both, which is the worst o' the lot." },
      },
      choices = {
        { text = "I'll find who's brewing their firewater.", next = "who", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I cannae prove it yet, but the Deadwood in Felwood went the same way, an' Felwood stinks o' demons from end tae end. If somebody's brewin' that poison wi' fel in it, I'll find out who, an' I'll not be gentle about it." } },
      choices = {
        { text = "Whoever's poisoning them deserves no mercy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel's just a tool. Blame the brewer, not the power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll keep my nose open for it.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tae find where the firewater's comin' from, an' who's bringin' it. Somebody's sellin' it tae them, I'm sure o' that, an' a quiet pair o' eyes would learn more in one night than I've learned in a month o' sittin' by these springs." } },
      choices = {
        { text = "I'll find your seller, quietly.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather walk in and ask them straight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let me think on it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd like tae think not, because they were peaceable enough before the firewater came, an' a sober furbolg's no' a bad neighbour. But some o' them have drunk so long they've forgotten what they were, an' I don't know if prayer or medicine reaches that far." } },
      choices = {
        { text = "Then we try. Whoever was turned can be turned back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then stop the brewing, and the drinkers with it, quickly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, is it? Then mebbe ye can tell me what's in the firewater the Winterfall are drinkin', because it smells of somethin' a good deal worse than whisky." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, aye? Good, because the Winterfall camps are thick wi' furbolgs, an' I'd rather someone crept in quiet than went bashin' through like a dwarf in a china shop." },
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
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, an' in this cold! Ye'll want tae see the Winterfall, then, because whatever's in that firewater is eatin' 'em from the inside, an' it's a sorry thing tae watch." },
      },
      again = { { id = "h_again", text = "Aye? The spring's warm; take yer time." } },
      choices = {
        { text = "What were the Winterfall like before?", next = "before" },
        { text = "Why study hot springs?", next = "springs" },
        { text = "Who'd brew something like that?", next = "who" },
        { text = "The furbolgs' sickness. Can I feel it?", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "A dwarf this far north? You and me both.", next = "dwarf_dn", when = { race = "Dwarf" } },
        { text = "Do you think the firewater is demonic?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why sneak into the Winterfall camps?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Are the Winterfall beyond saving, Donova?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
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
      choices = {
        { text = "No creature should be judged by its worst week.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "A creature's worst week tells you what it's capable of.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    springs = {
      lines = { { id = "s_default", text = "Because they're warm in a place that isnae, an' life gathers round warm things. Ye learn a land by where it chooses tae live." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Somebody who wants the Winterfall angry an' doesnae care what it costs them. I've a list o' guesses. None of 'em are good, an' none of 'em are proof." } },
      choices = {
        { text = "Tell me your best guess. I won't hold you to it.", tag = "Persuade", next = "who_guess",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "curious" }, { class = "DRUID" } } } },
          fail = { next = "who_proof", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "d_default", text = "Then ye'll feel it worse than me. It's like the woods are holdin' their breath. Go gentle near the dens; whatever's in them isnae all furbolg any more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    who_guess = {
      lines = {
        { id = "wg_default", text = "Between us, then, an' only as a guess: that goo smells like the water out o' Felwood, sick an' sweet at once, so I'd look south before I'd look anywhere else. Whoever's brewin' it wants the furbolgs mad an' doesnae care who they bite." },
      },
      choices = {
        { text = "Then I'll keep an eye to the south.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "A guess is a start.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_proof = {
      lines = {
        { id = "wp_default", text = "Guesses get folk killed up here, so I keep mine in my notebook till I've proof. Bring me somethin' I can test, an' then we'll talk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've studied these springs an' everythin' that drinks from 'em for a good long while. Ask me about any o' these." },
    },
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

  impression = {
    first = "Witch Doctor Mau'ari speaks of herself by name and bargains in spirits and juju. She has been up in the ice long enough to stop complaining about the cold, though not to stop feeling it.",
    third = "{name} met Witch Doctor Mau'ari, the playful troll witch doctor of Winterspring who trades in E'ko and juju.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor come all dis way to see Mau'ari! Smart, you are, or maybe lost, but either way, sit." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, up here in de ice! You be feelin' de cold in your tusks, eh? Mau'ari feel it too." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "DRUID" } },
      text = "You know de spirits. Den you know what Mau'ari be talkin' about when she say every beast got a little magic left in it." },
  },

  start = "hello",
  nodes = {
    hunter_ma = {
      lines = {
        { id = "hma_default", text = "Ha! Every beast carry it, mon, and dat one carry plenty, but Mau'ari ain't gonna take it from a beast dat still be breathin' and followin' you round. Keep it close; a hunter's companion be better juju than anything Mau'ari make." },
      },
      choices = {
        { text = "Good. Hands off, witch doctor.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Then I'll bring you E'ko from the wild ones.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mau'ari ask de spirits nice, and dey give a little and go home, mon. You chain your demon and make it work, and one day it remember every lash, and dat be why Mau'ari only bargain with spirits who can say no." } },
      choices = {
        { text = "Maybe you're right. Chains breed resentment.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A chained demon is a useful demon.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "We all make our bargains.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "De E'ko, mon, de spirit-bits of every beast in Winterspring, and a little patience from Mau'ari. Every charm Mau'ari make, a creature give something for it, and dat be a fair trade, unlike your arcane, which take and take and never say thank you." } },
      choices = {
        { text = "A fair trade is always the better way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The arcane owes thanks to nobody.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll bring you some E'ko.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ah, a warlock come up de mountain! Mau'ari feel de demon on you, mon, cold as dis snow and twice as hungry, so you be careful which spirit you be feedin'." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, way up here in de ice! You be a long way from your warm towers, mon, but Mau'ari like a visitor who know dat magic got a cost." },
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
        { text = "Does my beast carry E'ko too?", next = "hunter_ma", when = { class = "HUNTER", pet = true } },
        { text = "Is your juju so different from my magic?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What does your juju cost?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll bring E'ko.", next = "END", fx = { affinity = 2 } },
      },
    },
    eko = {
      lines = { { id = "e_default", text = "It be de little bit of spirit every beast carry, and when dey fall, it linger. Mau'ari's charm catch it before it blow away on de wind." } },
      choices = {
        { text = "Taking a beast's spirit doesn't sit right with me.", next = "eko_right", fx = { align = { light = 1 } } },
        { text = "A spirit's no use to anyone, blowing on the wind.", next = "eko_right", fx = { align = { light = -1 } } },
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
    knows = {
      { id = "tp_knows", text = "Mau'ari know many t'ings, mon, and some of dem she even tell. Ask about any of dese." },
    },
    background = { { id = "tp_ba", text = "Mau'ari be a witch doctor, and dat's de story; de rest she keep, like a good charm." } },
    advice = { { id = "tp_ad", text = "Wear two pairs of socks, mon. De spirits don't care, but your toes will." } },
    echo_isles = { { id = "tp_echo_isles", text = "De islands, warm and green, Mau'ari remember dem well. She come up here anyway, because de magic in de snow be stranger." } },
    _none = { { id = "tp_none", text = "Mau'ari know many t'ings, but not dat one, mon." } },
  },
}
