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
    first = "Foreman Stonebrow stood at the lip of Gol'Bolar Quarry shaking his fist at the troggs below, and he was angry enough that I worried for his heart. He'd have gone down there himself, he said, if his aim were what it used to be.",
    third = "{name} met Foreman Stonebrow of the Miners' League, who ran Gol'Bolar Quarry until the troggs took it.",
  },

  greetings = {
    { id = "g_default", text = "Look at that, look at it! There goes another barrel o' powder, an' I'm standin' up here like a statue watchin' it happen!" },
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
        { id = "h_again2", text = "Ask away, but if one o' them touches that blue barrel I'm goin' to scream." },
      },
      choices = {
        { text = "Where did the troggs come from?", next = "troggs" },
        { text = "What did the quarry dig, before?", next = "quarry" },
        { text = "Why not go down yourself?", next = "aim" },
        { text = "What about the blasting powder?", next = "powder" },
        { text = "Gnomeregan's troggs came from below too, Foreman.", next = "gnome", when = { race = "Gnome" } },
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
      lines = { { id = "td_default", text = "Two, an' a third who'll never swing a pick again. The League wants me to reopen the quarry once it's clear, an' half my lads say they'll never go down there again, an' the other half want to go down wi' torches an' bury every trogg in the stone they stole." } },
      choices = {
        { text = "Clear it out and reopen it. The stone's yours.", next = "BACK", fx = { align = { honor = -1 }, learn = { "troggs" } } },
        { text = "Honor your dead first. The stone can wait.", next = "BACK", fx = { align = { honor = 1 }, learn = { "troggs" } } },
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
    first = "Felix Whindlebolt is a gnome refugee who fled Gnomeregan with nothing, and then lost even that to the Frostmane trolls. He apologized three times for asking me to fetch his things back.",
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
          text = "Felix Whindlebolt, refugee, formerly of the Gnomeregan Institute of Applied Gear-Work, Second Wing. We drove the troggs out, and then it all went so horribly wrong, and now we gnomes are scattered all over Dun Morogh, and I lost all my belongings on the way." },
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
        { text = "Go back for them. No one should be left behind.", next = "BACK", fx = { align = { light = 1 }, learn = { "gnomeregan" } } },
        { text = "They're lost, Felix. Save the living instead.", next = "BACK", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
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
        { text = "We will. I promise.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, with the lifts and the gears and the lovely hum. I can still hear the hum when it's quiet, which is why I try not to let it be quiet." } },
    _none = { { id = "tp_none", text = "Oh, I'm afraid I don't know about that. I'm sorry, I'm only a refugee." } },
  },
}
