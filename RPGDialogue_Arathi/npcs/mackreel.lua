-- Foggy MacKreel: one of Longbraid's dwarves, stranded on the broken Thandol Span and worried mainly about his moonshine.
-- Voice: bibles/mackreel.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ar_mackreel", id = TODO_NPC("Foggy MacKreel"), name = "Foggy MacKreel",
  bible = "bibles/mackreel.md", role = "soldier", tier = "quest",
  communities = { "thandol_span" }, temper = { "jovial", "cowardly" }, values = { "friendly", "practical" },
  notices = { "drink", "travel" },

  impression = {
    first = "Foggy MacKreel is stranded on a broken piece of the Thandol Span and seems far more worried about a moonshine debt than about the drop beneath him. I'm fairly sure he slept through the explosion.",
    third = "{name} met Foggy MacKreel, a dwarf of Longbraid's stranded on the broken Thandol Span with a jug of moonshine and no way down.",
  },

  greetings = {
    { id = "g_default", text = "Well, hello there! Ye found yer way out here, an' that's the easy part; the way back's a tricky wee path after a dram or two." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I'd offer ye a seat, but there's only the one, an' it's a long way down." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' I'm still here, which tells ye how the rescue's goin'." },
    { id = "g_active", when = { questActive = TODO_QUEST("MacKreel's Moonshine") }, text = "Take that moonshine tae Bilger in Southshore, an' hurry! He's countin' the minutes, an' so am I." },
    { id = "g_drunk", when = { drunk = true }, text = "Ye've had a nip yerself, I see! Good, then ye'll understand me better than most." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "Is that MacKreel's finest I smell on ye, or some lesser brew? Either way, ye're among friends." },
    { id = "n_travel", cat = "travel", when = { mounted = true },
      text = "Ye didnae jump that gap on a horse, did ye? By my beard, that's the bravest daft thing I've seen all year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Foggy MacKreel, one o' Longbraid's lads, at yer service. Had quite a bit o' the ol' moonshine the other night, an' the noggin hurts somethin' fierce, but I'll live." },
        { id = "h_before", when = { questBefore = TODO_QUEST("MacKreel's Moonshine") },
          text = "Oh my, look at the time! I promised Brewmeister Bilger in Southshore I'd repay my debt wi' a batch o' moonshine, an' there's scarcely a quarter hour before I'm overdue." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("MacKreel's Moonshine"), days = 3 } },
          text = "Bilger got it in time? Ha! Then my name's good in Southshore for another month, an' that's a fine thing for a dwarf who cannae leave this rock." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Don't tell Longbraid ye saw me, for he'd have my head if he knew I'd passed out on watch." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Oh, ye're Horde. Well, I've no axe handy an' nowhere tae run, so we'd best be friendly, hadn't we?" },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere tae be, as ye can see." },
        { id = "h_again2", text = "Go on, then. Talkin's better than lookin' down." },
      },
      choices = {
        { text = "You look like you've been stranded up here a while.", next = "stranded" },
        { text = "The Span looks like it was blown apart.", next = "span" },
        { text = "Tell me about this moonshine.", next = "moonshine" },
        { text = "Who's Brewmeister Bilger to you?", next = "bilger" },
        { text = "How do I get back down?", next = "down" },
        { text = "Share that jug with a fellow dwarf?", next = "kin", when = { race = "Dwarf" } },
        { text = "Take care up here, Foggy.", next = "END" },
      },
    },

    stranded = {
      lines = {
        { id = "st_default", text = "I was on watch, which is tae say I was sittin' wi' the jug, an' I nodded off. When I woke up, the bridge on both sides o' me was gone, an' here I am." },
      },
      choices = {
        { text = "So you slept through the explosion.", next = "stranded_slept" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stranded_slept = {
      lines = {
        { id = "ss_default", text = "Felt like a whole brigade o' siege engines passed overhead, all that rumblin', but I put it down tae the moonshine. Now that I say it out loud, I suppose it wasnae the moonshine." },
      },
      choices = {
        { text = "You should tell Longbraid what happened.", next = "stranded_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stranded_tell = {
      big = true,
      lines = {
        { id = "st2_default", text = "Tell him I was drunk on watch while the Dark Irons blew the Span? He'd throw me off it himself, an' I'd no' blame him." },
      },
      choices = {
        { text = "The truth is owed to the dead, Foggy.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your secret's safe. It changes nothing now.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    span = {
      lines = {
        { id = "sp_default", text = "Dark Irons, they say, wi' powder enough tae crack a mountain. Longbraid's lads are holdin' the edge o' Dun Modr, an' I'm holdin' this bit, for all the good it does." },
      },
      choices = {
        { text = "Did you see any Dark Irons?", next = "span_see" },
        { text = "Something else.", next = "BACK" },
      },
    },
    span_see = {
      lines = {
        { id = "sw_default", text = "No' a one, which tells ye somethin' about how sharp my watch was. If ye see Rhag Garmason on the Wetlands side, tell him I'm alive, an' leave the rest out." },
      },
      choices = { { text = "Something else, Foggy.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },

    moonshine = {
      lines = {
        { id = "mo_default", text = "MacKreel's Moonshine, my own recipe, an' it'll warm ye tae the toes on a brisk day. Bilger says it's the best in Lordaeron, an' he's a brewmeister, so he'd know." },
      },
      choices = {
        { text = "What's in it?", next = "moonshine_in" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonshine_in = {
      lines = {
        { id = "mi_default", text = "Barley, a wee bit o' Arathi heather an' three winters o' patience in the cask. The rest is a family secret, an' the family's mostly me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    bilger = {
      lines = {
        { id = "bi_default", text = "The brewmeister at Southshore, an' my creditor, which is a fancy word for a dwarf ye owe money. I pay him in moonshine when I can, an' I can mostly remember tae." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kin = {
      lines = {
        { id = "ki_default", text = "For a fellow dwarf, aye, just the one, for there's only the one jug an' Bilger's waitin' on the rest. Here's tae Longbraid, an' tae the Span, an' tae no' lookin' down." },
      },
      choices = {
        { text = "To the Span, and to the lads who held it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    down = {
      lines = {
        { id = "dn_default", text = "Same way ye came up, I'd imagine, an' I'd love tae know how that was. I've thought about jumpin', but I've thought about the bottom more." },
      },
      choices = {
        { text = "I'll send help when I can.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've a fine view from up here, if nothin' else, an' I hear the odd bit o' news shouted across the gap. Ask." } },
    background = { { id = "tp_bg", text = "One o' Longbraid's lads, an' a brewer on the side. The brewin' goes better than the soldierin'." } },
    advice = { { id = "tp_ad", text = "Never drink on watch. I'm livin' proof o' why, an' I'm stuck here provin' it." } },
    thandol_span = { { id = "tp_span", text = "Broken on both sides o' me, as ye can see. It's no' a view I'd recommend." } },
    magni = { { id = "tp_magni", text = "The King'll be angry about the Span, an' rightly, but I didnae blow it up. I was asleep at the time, which I'm told is a poor excuse." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best moonshine south o' the Wetlands, an' I owe a man there more than I'd like tae say. He's patient, but no' that patient." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer'll fly me off this bridge, if I can only get one tae stop laughin' at me. I've been waitin' a week now." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Bilger, he knows everythin', or says he does after a pint." } },
  },
}
