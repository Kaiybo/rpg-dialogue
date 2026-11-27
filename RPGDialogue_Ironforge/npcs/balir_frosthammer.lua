-- Balir Frosthammer, by the camp at Anvilmar in Coldridge Valley. Voice: bibles/balir_frosthammer.md
-- Shorthanded and worried: the troggs overran the western camp, and he fears it's happening everywhere.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "balir_frosthammer", id = TODO_NPC("Balir Frosthammer"), name = "Balir Frosthammer",
  bible = "bibles/balir_frosthammer.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "gruff" }, values = { "duty", "loyal" },
  notices = { "kit", "race" },

  impression = {
    first = "He hasn't forgiven himself for the camp he lost to troggs.",
    third = "{name} met Balir Frosthammer, a worried dwarf at Anvilmar whose western camp was overrun by troggs.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my friend! Come, grab a hammer, an' let's go teach those troggs some manners." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm short o' arms, but I'm not that short. Go on, then." },
    { id = "g_post", text = "I hope ye're here tae lend us a hand, for we're short o' strong arms an' long on troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any sign o' them in the hills on yer way in?" },
    { id = "g_threat", when = { questActive = TODO_QUEST("A New Threat") }, text = "Tenacious wee buggers, these troggs, aren't they? Keep at it." },
    { id = "g_after", when = { questDone = TODO_QUEST("A New Threat") }, text = "The hills have been quieter since ye went through them. Quieter, I said, no' quiet." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were ye? The troggs weren't, I can tell ye that much." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at ye now. When ye first came tae me ye could barely hold off a trogg, an' now I'd put ye on the wall at Ironforge." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk in the valley say ye've been a help tae them. Good, because we need every hand we can get." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "They tell me ye've been throwin' yer weight about. Save it fer the troggs, {g:lad|lass}, for they're the ones that deserve it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's half hangin' off ye. The troggs'll find every gap in it, so get it mended before ye go back up the hill." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Good tae see a proper dwarf lookin' fer work. The gnomes do their best, but they blow over in a stiff wind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Balir Frosthammer. The troggs came up out o' the ground a few nights back an' overran our camp to the west, an' I've been countin' what we lost ever since." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A New Threat") },
          text = "They've been seen all over the hills to the southeast an' by the frozen lake, an' they're no' slowin' down. I need somebody tae drive them back, an' I need them today." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A New Threat") },
          text = "I need the ordinary troggs an' the big burly ones both, six o' each, for the burly ones lead an' the rest follow. That should teach them tae keep their heads down." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A New Threat"), days = 3 } },
          text = "That's done the trick fer now, an' by Magni's beard, I'm grateful. But if it's like this all over Dun Morogh, we've trouble ahead of us." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, eh? The Light's welcome in Coldridge, though I'd settle fer a strong arm under it." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, an' just the sort I need. Pick up an axe, lift it high, an' bring it down on a trogg." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, for they could come back any night." },
        { id = "h_again2", text = "Ask away. I'll keep one eye on the hill while ye do." },
      },
      choices = {
        { text = "Something seems to have gone wrong at the western camp.", next = "camp" },
        { text = "Where are the troggs coming from?", next = "where" },
        { text = "Surely the King has heard about this by now.", next = "king" },
        { text = "A dwarf should be out there, not waiting on recruits.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I'll drive them back.", next = "BUSINESS" },
        { text = "How are the new recruits shaping up?", next = "d0_recruits" },
        { text = "Coldridge is a cold place to learn soldiering.", next = "d0_valley" },
        { text = "Farewell, Balir.", next = "END" },
      },
    },
    d0_recruits = {
      lines = { { id = "d0re_default", text = "Green as spring moss, most o' them, an' keen as mustard. Sten Stoutarm sends them tae me, I send them up intae the hills, an' the ones that come back wi' all their fingers I send on tae Grelin Whitebeard by the troll caves." } },
      choices = {
        { text = "What's waiting at the troll caves?", next = "d0_recruits_caves" },
        { text = "Keen recruits beat bored veterans any day.", next = "BACK" },
      },
    },
    d0_recruits_caves = {
      lines = { { id = "d0rc_default", text = "Frostmane, holed up at the north end o' the valley, wi' Grik'nir the Cold sittin' in the back o' the cave like he owns the mountain. Grelin's been watchin' them for weeks, an' they've had his journal off him, which he's no' happy about." } },
      choices = {
        { text = "Then Grik'nir can expect a visit.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else, Balir.", next = "BACK" },
      },
    },
    d0_valley = {
      lines = { { id = "d0va_default", text = "It is, an' it's meant tae be. A recruit who learns in the snow cannae be surprised by it later, an' Anvilmar has the only warm fire for a mile, so they learn tae earn it." } },
      choices = {
        { text = "What does the valley teach them first?", next = "d0_valley_first" },
        { text = "Gnomes were sent here too, after Gnomeregan.", next = "d0_valley_gnomes", when = { race = "Gnome" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    d0_valley_first = {
      lines = { { id = "d0vf_default", text = "Tae keep their feet on ice an' their wits when a wolf comes at them. Thran Khorman an' the others in the hall teach the rest, but the valley teaches that first lesson for nothin', an' it never goes easy on anybody." } },
      choices = {
        { text = "Free lessons are always the hardest kind.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d0_valley_gnomes = {
      lines = { { id = "d0vg_default", text = "Aye, an' I'll say this for yer folk: ye complain about the cold louder than anybody, an' ye never once quit on it. Half the gnome recruits I've had came through wi' scorch marks an' nae eyebrows, an' every one o' them passed." } },
      choices = { { text = "Eyebrows grow back. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "c_default", text = "We'd a camp o' supply tents in the hills, wi' a few lads tae guard it. The troggs came at night, more than we'd ever seen at once, an' the lads ran fer their lives an' left everythin' behind." },
      },
      choices = {
        { text = "Did everyone get out?", next = "camp_lads" },
        { text = "Then we'll take the camp back.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    camp_lads = {
      lines = { { id = "cl_default", text = "Everyone, thank the mountain, though one o' them still won't sleep wi' the lamp out. I was the one who put that camp there, so that's on my head, no' theirs." },
      },
      choices = {
        { text = "You couldn't have known they'd come.", next = "camp_blame" },
        { text = "Something else, Balir.", next = "BACK" },
      },
    },
    camp_blame = {
      big = true,
      lines = { { id = "cb_default", text = "Maybe no', but a commander's meant tae know, an' I'm the closest thing Coldridge has. What would ye have done, then, in my boots?" },
      },
      choices = {
        { text = "Pulled everyone back behind Anvilmar's walls. Lives first.", next = "BACK", reply = "Aye, an' I tell myself the same every night, but Anvilmar's walls didnae save the lads already out at the camp, an' that's what keeps me up.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Held the camp. Running teaches the troggs that it works.", next = "BACK", reply = "That's what my gut said, an' I didnae listen, so maybe ye're right, an' maybe that's why the troggs keep comin' back hungrier every time.", fx = { align = { honor = -1 } } },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Out o' the ground, from cracks an' caves that weren't there last year. Sten Stoutarm at the post says they come through Coldridge Pass as well, an' Mountaineer Thalos has his hands full keepin' that tunnel." },
      },
      choices = {
        { text = "It's strange they'd come up now, after so long.", next = "where_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_why = {
      lines = { { id = "ww_default", text = "Nobody knows, an' that's what frightens me. The scholars in Ironforge argue about it, an' meanwhile it's lads like mine who meet them in the dark." },
      },
      choices = {
        { text = "Then somebody should find out.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I hope so. I've sent word, an' Mountaineer Grelin up by the troll caves has sent his own reports, so I can only pray the King an' the Senate are takin' steps." },
      },
      choices = {
        { text = "The Senate will act. Trust in the proper channels.", next = "BACK", reply = "I hope ye're right, I truly do, but the Senate has a way o' takin' steps so slow ye'd think they were climbin' the mountain backwards.", fx = { align = { order = 1 } } },
        { text = "Don't wait on the Senate. Act now, on your own.", next = "BACK", reply = "Dinnae tempt me, because I've half a mind tae do just that, an' Grelin would have my beard for it, but the troggs dinnae wait on anybody's leave.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Aye, an' I'd be out there now if somebody didnae have tae stand here an' send the recruits where they're needed. Ye're right, though, an' it stings tae hear it." },
      },
      choices = {
        { text = "Then I'll go in your place.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "Ye've a strong arm an' a good heart, an' that's all a dwarf needs in a friend." },
    },
    grievance = {
      { id = "dp_gv", text = "Ye've been no help at all, an' I've got troggs enough tae deal with." },
    },
    background = { { id = "tp_bg", text = "I keep the camps an' the recruits in Coldridge. Lately that means countin' what the troggs took." } },
    advice = { { id = "tp_ad", text = "Kill the burly ones first. The rest lose their nerve once the big ones fall." } },
    troggs = { { id = "tp_troggs", text = "They're everywhere this year, an' I'd give a month's pay tae know why.", next = "where" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The troggs came up out o' Gnomeregan first, an' now they're in my valley burnin' my camp. If the gnomes couldnae hold them wi' all their machines, I'd like tae know what I'm supposed tae do wi' an axe." } },
    magni = { { id = "tp_magni", text = "The King's got troubles enough without hearin' about one burnt camp in Coldridge. Still, I'd like him tae know, an' I'd like him tae send more than one envoy." } },
    scourge = { { id = "tp_scourge", text = "They say the dead walk in the north o' Lordaeron, an' I believe it, for I've seen the faces on the refugees. I'll take troggs over that, an' I never thought I'd say so." } },
    _none = { { id = "tp_none", text = "I couldnae say. Ask Sten Stoutarm at the post; he hears everythin' that comes through on the mail." } },
  },
}
