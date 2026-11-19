-- Dun Morogh, two more quest givers: Foreman Stonebrow of the Miners' League at Gol'Bolar Quarry (Those Blasted Troggs!)
-- and Felix Whindlebolt, a gnome refugee at Anvilmar (A Refugee's Quandary). Voices: bibles/dunmorogh_more.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Foreman Stonebrow
---------------------------------------------------------------------------
P:NPC {
  key = "dm_stonebrow", id = TODO_NPC("Foreman Stonebrow"), name = "Foreman Stonebrow",
  title = "Miners' League",
  bible = "bibles/dunmorogh_more.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "furious", "proud" }, values = { "work", "craft" },
  notices = { "class", "race" },

  impression = {
    first = "His rage at the troggs made me worry for his heart.",
    third = "{name} met Foreman Stonebrow of the Miners' League, who ran Gol'Bolar Quarry until the troggs took it.",
  },

  greetings = {
    { id = "g_default", text = "Look at that, look at it! The troggs are smashin' another barrel o' my powder down in the quarry, an' I'm standin' up here like a statue watchin' it happen!" },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Tell me ye've been down there breakin' trogg skulls, for nothin' else will calm me." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the troggs have dug another tunnel in that time. They've no respect for a survey line." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A rifle on yer back! Good, for mine shakes in my hands these days, an' a foreman wi' a shaky aim is no use to anyone." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' Khaz Modan, an' ye'll know what it means to see good stone given to beasts. It makes my beard itch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Foreman Stonebrow, Miners' League, an' that was my quarry before those Light-blasted troggs turned it into a wreck. I'd wring every one o' their scrawny necks myself, but all this stress an' anger can't be good for my health, an' my aim's no good anymore." },
        { id = "h_help", tags = { "news" }, when = { questActive = TODO_QUEST("Help for the Quarry") },
          text = "Somebody finally sent help! Took them long enough, but I'll not complain, not while there are troggs in my quarry." },
        { id = "h_troggs", tags = { "news" }, when = { questActive = TODO_QUEST("Those Blasted Troggs!") },
          text = "The Rockjaw skullthumpers, they're the worst o' them, an' they're the ones smashin' my powder kegs. Six of them, an' I'll pay ye, just hurt them, kill them!" },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Those Blasted Troggs!"), days = 3 } },
          text = "Six skullthumpers fewer, an' the quarry's a little quieter for it. I've not felt this calm in weeks, an' I nearly don't know what to do wi' myself." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, I'm countin' troggs." },
        { id = "h_again2", text = "Ask away, but if one o' those troggs touches that blue powder barrel I'm goin' to scream." },
      },
      choices = {
        { text = "Where did the troggs come from?", next = "troggs" },
        { text = "What did the quarry dig, before?", next = "quarry" },
        { text = "Why not go down yourself?", next = "aim" },
        { text = "What about the blasting powder?", next = "powder" },
        { text = "Gnomeregan's troggs came from below too, Foreman.", next = "gnome", when = { race = "Gnome" } },
        { text = "I've swung a pick in a quarry myself, Foreman.", next = "dw_pick", when = { race = "Dwarf" } },
        { text = "I'll go and hurt some troggs.", next = "END" },
      },
    },

    troggs = {
      lines = { { id = "tr_default", text = "From below, from somewhere deep we never dug, an' they came up all at once like water through a cracked dam. One mornin' my lads were cuttin' stone, an' by noon we were runnin' up the road wi' troggs behind us throwin' our own picks." } },
      choices = {
        { text = "Did anyone die?", next = "troggs_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_dead = {
      big = true,
      lines = { { id = "td_default", text = "Two, an' a third who'll never swing a pick again. The League wants me to reopen the quarry once it's clear, an' some o' my lads say they'll never go down there again, while the rest want to go down wi' torches an' bury every trogg in the stone they stole." } },
      choices = {
        { text = "Clear it out and reopen it. The stone's yours.", next = "BACK", reply = "Aye, that's what I say, an' the League will be glad o' it, but I'll be the one tellin' the widows the quarry's open again, an' that's no small thing.", fx = { align = { honor = -1 }, learn = { "troggs" } } },
        { text = "Honor your dead first. The stone can wait.", next = "BACK", reply = "Ye're right, an' I'm ashamed I needed tellin', so we'll raise a stone for them at the lip o' the quarry before a single pick goes down there again.", fx = { align = { honor = 1 }, learn = { "troggs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quarry = {
      lines = { { id = "qu_default", text = "Granite for Ironforge, the good grey stuff that takes a chisel like butter. Half the new stair in the Commons came out o' Gol'Bolar, an' I'll tell ye which half if ye've an afternoon free." } },
      choices = {
        { text = "I'd like to hear about it sometime.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    aim = {
      lines = { { id = "ai_default", text = "Because I'd miss, an' the trogg wouldn't. My eyes have gone cloudy from forty years o' stone dust, an' the healer says another bout o' rage like this one might stop my heart, so here I stand, shoutin' at them from a safe distance." } },
      choices = {
        { text = "Then let me do the fighting for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Try shouting less, then.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    powder = {
      lines = { { id = "po_default", text = "Ach, the powder. Quarrymaster Thesten's been sayin' the troggs carried off kegs of it, an' I'd rather not think what a trogg does wi' blastin' powder. Speak to him if ye've a stomach for it, he's just over there." } },
      choices = {
        { text = "I'll talk to Thesten.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnome = {
      lines = { { id = "gn_default", text = "Aye, an' I've thought on that more than once. Yer people tried to drive them out wi' some clever contraption an' poisoned their own city doin' it, an' I'll not be tryin' that here, I promise ye. Plain steel an' honest anger, that's my method." } },
      choices = {
        { text = "That's probably wise.", next = "BACK", fx = { affinity = 1, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_pick = {
      lines = {
        { id = "dwp_default", text = "Have ye, now? Then ye'll know what it does tae a dwarf's heart tae see good stone left half cut, wi' the wedges still in it an' troggs squattin' on the ledges. I had a crew o' twenty in that quarry, an' every one o' them could split a block straighter than a Stormwind mason with a ruler." },
        { id = "dwp_miner", when = { origin = { "dwarf_ironforge_miner", "dwarf_quarry_foreman" } }, text = "Aye, I can see it in yer shoulders, an' ye'll know what it does tae a dwarf's heart tae see good stone left half cut, wi' the wedges still in it an' troggs squattin' on the ledges. Ye'd have fit right in wi' my crew o' twenty." },
      },
      choices = {
        { text = "Where's your crew now?", next = "dw_pick_crew" },
        { text = "Something else, Foreman.", next = "BACK" },
      },
    },
    dw_pick_crew = {
      lines = {
        { id = "dwpc_default", text = "Scattered tae Kharanos an' the city, drinkin' too much an' waitin' for word that it's safe tae go back. Two o' them didnae run fast enough when the troggs came up, an' I'll see their names cut intae the quarry wall the day we take it back, if I have tae cut them myself." },
      },
      choices = {
        { text = "Then I'll help you take it back.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else, Foreman.", next = "BACK" },
      },
    },
  },

  topics = {
    troggs = { { id = "tp_troggs", text = "Filthy, stupid, strong as rams, an' they'll eat the boots off yer feet if ye stand still. Don't stand still." } },
    _none = { { id = "tp_none", text = "I don't know an' I don't care, not while there's troggs in my quarry." } },
  },
}

---------------------------------------------------------------------------
-- Felix Whindlebolt
---------------------------------------------------------------------------
P:NPC {
  key = "dm_felix", id = TODO_NPC("Felix Whindlebolt"), name = "Felix Whindlebolt",
  bible = "bibles/dunmorogh_more.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "nervous", "gentle" }, values = { "family", "invention" },
  notices = { "race", "level" },

  impression = {
    first = "He apologized three times for asking me to fetch his things.",
    third = "{name} met Felix Whindlebolt at Anvilmar, a gnome refugee whose belongings were carried off by trolls.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Hello, hello, sorry, I didn't see you there, I was trying to remember everything I've lost and it's taking rather a long time." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back, usually. Well, the dwarves do, but they're paid to." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Were you in Gnomeregan? Did you see the lift go? No, don't tell me, I'll cry, and the dwarves will stare." },
    { id = "n_level", cat = "level", when = { minLevel = 20 },
      text = "You've grown so strong since Coldridge! I remember when you were frightened of the wolves. Well, I don't, but I'm sure you were." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Felix Whindlebolt, refugee, formerly of the Gnomeregan Institute of Applied Gear-Work, Second Wing. We tried to drive the troggs out, and it all went so horribly wrong, and now we gnomes are scattered all over Dun Morogh, and I lost all my belongings on the way." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Refugee's Quandary") },
          text = "My box, my chest and my bucket of bolts, the trolls took all three back to their camps southwest of Anvilmar. I'm no adventurer, and I'd only get my head knocked in, so I'd be so grateful if you could fetch them." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("A Refugee's Quandary") },
          text = "My bucket of bolts! I've counted them twice and they're all here, every one, even the bent one I was saving. You're a hero, and I'm going to tell everyone." },
      },
      again = {
        { id = "h_again", text = "What else? I'm sorry, I talk too much when I'm nervous, and I'm always nervous." },
        { id = "h_again2", text = "Oh, ask anything, it takes my mind off the trolls." },
      },
      choices = {
        { text = "What happened in Gnomeregan?", next = "gnomeregan" },
        { text = "What's so special about a bucket of bolts?", next = "bolts" },
        { text = "How did the trolls get your things?", next = "trolls" },
        { text = "Where will you go now?", next = "future" },
        { text = "We'll get our city back, Felix.", next = "gnome", when = { race = "Gnome" } },
        { text = "Take care of yourself, Felix.", next = "END" },
      },
    },

    gnomeregan = {
      lines = { { id = "gn_default", text = "There was a siren, and green light coming up the stairwells, and somebody shouting that the High Tinker had a plan. Then we were running, all of us, and I grabbed what I could, and I didn't even think to grab my good spectacles." } },
      choices = {
        { text = "What became of the gnomes who stayed?", next = "stayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed = {
      big = true,
      lines = { { id = "st_default", text = "The ones who stayed got sick, and the sickness changed them, and now they wander the halls and don't remember us. Some say we should leave them be, and some say we should go back and drag them out, and I don't know, I just don't know." } },
      choices = {
        { text = "Go back for them. No one should be left behind.", next = "BACK", reply = "Do you really think so, because I've wanted to hear someone say it, and I'm frightened, but I think I'd go if somebody went with me.", fx = { align = { light = 1 }, learn = { "gnomeregan" } } },
        { text = "They're lost, Felix. Save the living instead.", next = "BACK", reply = "Maybe you're right, and I know I should listen, but my own cousin is down there somewhere, and I don't know how to stop looking for him.", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bolts = {
      lines = { { id = "bo_default", text = "They're Institute bolts, machined to a tolerance you couldn't see without a lens, and I've been collecting them since I was an apprentice. Without them, I'm just a gnome with a screwdriver, and there are an awful lot of those in Dun Morogh just now." } },
      choices = {
        { text = "I'll find them for you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trolls = {
      lines = { { id = "tr_default", text = "I was resting by the road with my things beside me, and I'm afraid I fell asleep, and when I woke up the Frostmane were running off into the snow with all of it. I shouted at them, which I'm told was very brave and also very silly." } },
      choices = {
        { text = "It was a little of both.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "frostmane" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    future = {
      lines = { { id = "fu_default", text = "Ironforge, I suppose, to Tinker Town, where Mekkatorque is gathering everyone who's left. The dwarves have been very kind, though they keep offering me ale for breakfast, and I'm not sure I'll ever get used to that." } },
      choices = {
        { text = "You'll find your feet in Tinker Town.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnome = {
      lines = { { id = "gg_default", text = "Do you really think so? Then I'll believe it too, at least until supper, and maybe longer if somebody else says it. Thank you, it helps to hear it from one of our own." } },
      choices = {
        { text = "We will, I promise you that.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, with the lifts and the gears and the lovely hum. I can still hear the hum when it's quiet, so I try never to let it be quiet." } },
    _none = { { id = "tp_none", text = "Oh, I'm afraid I don't know about that. I'm sorry, I'm only a refugee." } },
  },
}
