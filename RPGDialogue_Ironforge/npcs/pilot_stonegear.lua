-- Pilot Stonegear ("Stone"), Steelgrill's Depot, beside his siege engine Trollplow. Voice: bibles/pilot_stonegear.md
-- Ironforge Siege Brigade. Thinks about cannons first and comfort second; argues engines with Bellowfiz.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pilot_stonegear", id = TODO_NPC("Pilot Stonegear"), name = "Pilot Stonegear",
  bible = "bibles/pilot_stonegear.md", role = "soldier", tier = "quest",
  communities = { "dunmorogh" }, temper = { "brash" }, values = { "brave", "craft" },
  notices = { "soldier", "craft" },

  impression = {
    first = "Pilot Stonegear drives a siege engine called Trollplow and would sooner talk about its cannon than anything else alive. He tested my nerve before he'd give me work, and seemed pleased with what he found.",
    third = "{name} met Pilot Stonegear of the Ironforge Siege Brigade, who loves his siege engine Trollplow and its cannon above all things.",
  },

  greetings = {
    { id = "g_depot", text = "Mind the treads, {g:lad|lass}! Trollplow doesn't stop fer pedestrians." },
    { id = "g_back", when = { metBefore = true }, text = "Ha! Back fer more, are ye? Good; I like a face that comes back." },
    { id = "g_den", when = { questActive = TODO_QUEST("The Grizzled Den") }, text = "Been tae the Grizzled Den yet? Those wendigos can be fierce, so don't come back wi' half yer manes an' none o' yer own hair." },
    { id = "g_ore", when = { questActive = TODO_QUEST("Search for Incendicite") }, text = "Where's that ore? Trollplow's cannon is waitin', an' so am I." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' I've had naught but Fizzer's engine talk tae listen to. Thank the mountain ye're back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown some grit since I first sent ye after wendigos. I said I'd see great things from ye, an' I'm startin' tae." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "They tell me ye've been makin' friends round Kharanos. Good, but don't let it soften ye." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "Word is ye've been leanin' on folk. Try leanin' on Trollplow an' see who gives first." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's someone wi' a soldier's stance. Ye'd do all right in the Brigade, if ye didn't mind the noise." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye've ore dust on yer boots, which means ye can work a vein. I may have use fer that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Pilot Stonegear, Ironforge Siege Brigade, an' this beauty is Trollplow. Drivin' a siege engine isn't fer everyone, for it takes an iron grip an' nerves o' steel, an' I've got both." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Grizzled Den") },
          text = "How's yer mettle, then? I want tae make Trollplow a bit cosier inside, an' a rug o' wendigo manes from the Grizzled Den west o' Kharanos would do it nicely." },
        { id = "h_den_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Grizzled Den"), days = 3 } },
          text = "Those manes make a fine rug on Trollplow's deck, an' my feet haven't been this warm since the Second War. Ye've grit, I'll say that." },
        { id = "h_search", tags = { "news" }, when = { questActive = TODO_QUEST("Stonegear's Search") },
          text = "Ye're here about the task, eh? Good tae see blood that burns at the thought o' adventure. I've heard rumours of a rare ore, an' I want it." },
        { id = "h_ore_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Search for Incendicite"), days = 5 } },
          text = "Incendicite! I've found a lad brave enough tae try smeltin' it, an' let's hope he doesn't blow himself up before he gets it right." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Ye'll be wantin' tae tell me how tae improve Trollplow's engine, then. Save it fer Bellowfiz; he's the one who cares about engines." },
      },
      again = {
        { id = "h_again", text = "What else? Trollplow's listenin' too." },
        { id = "h_again2", text = "Go on, then, but make it quick; I've a cannon tae polish." },
      },
      choices = {
        { text = "Tell me about Trollplow.", next = "trollplow" },
        { text = "You and Bellowfiz argue a lot.", next = "fizzer" },
        { text = "What's the Siege Brigade doing out here?", next = "brigade" },
        { text = "This incendicite. Is it safe?", next = "incendicite", when = { questDone = TODO_QUEST("Stonegear's Search") } },
        { text = "I know my way around a mine.", next = "miner", when = { profession = "Mining" } },
        { text = "Got any work for me?", next = "BUSINESS" },
        { text = "Mind the treads, Stone.", next = "END" },
      },
    },
    trollplow = {
      lines = { { id = "t_default", text = "She's a steam-driven siege engine wi' a cannon on the front that could knock a troll back tae his grandmother's hut. She's no' pretty, an' she's no' quiet, but she's never failed me." },
      },
      choices = {
        { text = "Why call her Trollplow?", next = "trollplow_name" },
        { text = "Cannon over armour, then?", next = "trollplow_armour" },
      },
    },
    trollplow_name = {
      lines = { { id = "tn_default", text = "Because that's what she does tae Frostmane, an' they know it. One look at her comin' up the road an' they scatter like snow off a roof." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    trollplow_armour = {
      lines = { { id = "ta_default", text = "No! Armour an' cannon both, an' that's where Fizzer an' I part ways. Some fools are strippin' armour off their engines tae make them lighter, an' I call that nonsense." },
      },
      choices = {
        { text = "Speed wins fights, so lighter is smarter.", next = "trollplow_debate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trollplow_debate = {
      big = true,
      lines = { { id = "td_default", text = "Speed wins races, {g:lad|lass}, no' fights. When the shells start flyin', I want plate between me an' the enemy, no' a lighter engine an' a prayer." },
      },
      choices = {
        { text = "You're right. Stand firm and let them break on you.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd still rather outrun trouble than stand in it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fizzer = {
      lines = { { id = "f_default", text = "Bellowfiz? He thinks a good steam engine is the finest sound in the world, an' I say it's a Crater Cannon goin' off. We've had the same argument fer years, an' neither o' us has won it yet." },
      },
      choices = {
        { text = "But you're friends?", next = "fizzer_friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fizzer_friends = {
      lines = { { id = "ff_default", text = "Don't tell him, but aye. There's nobody I'd sooner have drivin' beside me when the trolls come down the hill, even if he talks about carburettors the whole way." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    brigade = {
      lines = { { id = "b_default", text = "Keepin' the roads clear o' Frostmane an' troggs, an' keepin' the engines ready in case Ironforge needs them in a hurry. Most o' the army's spread thin, so the Brigade does what it can from here." },
      },
      choices = {
        { text = "Spread thin how?", next = "brigade_thin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brigade_thin = {
      lines = { { id = "bt_default", text = "Loch Modan, the Wetlands, Gnomeregan's doorstep, an' everywhere the Dark Irons are pokin' their heads up. There's more trouble than dwarves, an' that's the truth o' it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    incendicite = {
      lines = { { id = "i_default", text = "Safe? It's volatile stuff, an' it'll take yer eyebrows off if ye smelt it wrong. But done right, it'd make cannon shells that hit like a hammer from the Great Forge itself." },
      },
      choices = {
        { text = "Worth the risk, then.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = { { id = "mi_default", text = "Do ye, now? Then ye'll know what I mean when I say there's ore in the Wetlands I'd give my left boot fer. Ask me about it when ye're ready fer a trip." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Siege Brigade, since I was old enough tae lift a shell. Trollplow's my third engine an' my favourite." } },
    advice = { { id = "tp_ad", text = "Nerves o' steel an' an iron grip. If ye've got one, work on the other." } },
    _none = { { id = "tp_none", text = "No idea. Ask me about cannons an' I'll talk till the sun goes down." } },
  },
}
