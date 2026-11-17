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
    first = "Balir Frosthammer lost a camp to the troggs a few nights before I met him, and he hasn't forgiven himself. He's afraid it isn't only Coldridge, and he may be right.",
    third = "{name} met Balir Frosthammer, a worried dwarf at Anvilmar whose western camp was overrun by troggs.",
  },

  greetings = {
    { id = "g_post", text = "I hope ye're here tae lend us a hand, for we're short o' strong arms an' long on troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any sign o' them in the hills on yer way in?" },
    { id = "g_threat", when = { questActive = TODO_QUEST("A New Threat") }, text = "Tenacious wee buggers, aren't they? Keep at it." },
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
          text = "The ordinary troggs an' the big burly ones both, for the burly ones lead an' the rest follow. Six o' each should teach them tae keep their heads down." },
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
        { text = "What happened at the western camp?", next = "camp" },
        { text = "Where are the troggs coming from?", next = "where" },
        { text = "Does the King know about this?", next = "king" },
        { text = "A dwarf should be out there, not waiting on recruits.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I'll drive them back.", next = "BUSINESS" },
        { text = "Farewell, Balir.", next = "END" },
      },
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
        { text = "Pulled everyone back behind Anvilmar's walls. Lives first.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Held the camp. Running teaches the troggs that it works.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Out o' the ground, from cracks an' caves that weren't there last year. Sten says they come through Coldridge Pass as well, an' Thalos has his hands full keepin' the tunnel." },
      },
      choices = {
        { text = "Why would they come up now?", next = "where_why" },
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
      lines = { { id = "k_default", text = "I hope so. I've sent word, an' Grelin's sent his reports tae the Senate, an' I can only pray the King an' the Senate are takin' steps." },
      },
      choices = {
        { text = "The Senate will act. Trust in the proper channels.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Don't wait on the Senate. Act now, on your own.", next = "BACK", fx = { align = { order = -1 } } },
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
    background = { { id = "tp_bg", text = "I keep the camps an' the recruits in Coldridge. Lately that means countin' what the troggs took." } },
    advice = { { id = "tp_ad", text = "Kill the burly ones first. The rest lose their nerve once the big ones fall." } },
    troggs = { { id = "tp_troggs", text = "They're everywhere this year, an' I'd give a month's pay tae know why.", next = "where" } },
    _none = { { id = "tp_none", text = "I couldnae say. Ask Sten; he hears everythin' that comes through on the mail." } },
  },
}
