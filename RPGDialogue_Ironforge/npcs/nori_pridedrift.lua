-- Nori Pridedrift, wandering Coldridge Valley with his Scalding Mornbrew. Voice: bibles/nori_pridedrift.md
-- Always running late, always short of mugs, always sure his brew is the best thing in the valley.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nori_pridedrift", id = TODO_NPC("Nori Pridedrift"), name = "Nori Pridedrift",
  bible = "bibles/nori_pridedrift.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "flustered" }, values = { "craft", "friendly" },
  notices = { "speed", "cold" },

  impression = {
    first = "He worries about his mugs more than his customers.",
    third = "{name} met Nori Pridedrift, who carries hot Scalding Mornbrew around Coldridge Valley and counts every one of his mugs.",
  },

  greetings = {
    { id = "g_brew", text = "Mind the pot, it's scaldin'! That's the whole point o' mornbrew, mind." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are! I don't suppose ye've seen a stray mug lyin' about, have ye?" },
    { id = "g_run", when = { questActive = TODO_QUEST("Scalding Mornbrew Delivery") }, text = "Why are ye still standin' here? It's goin' cold, run!" },
    { id = "g_mug", when = { questActive = TODO_QUEST("Bring Back the Mug") }, text = "Ye've got my mug? Oh, bless ye, I'm down tae three." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' I've lost two mugs in that time. I'm no' sayin' it's yer doin', but I'm no' sayin' it isn't." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye ran my brew tae Durnan when ye were green as a sprout, an' now look at ye. I'd let ye carry the whole pot." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk over their mornbrew have been sayin' kind things about ye. That's the best place fer news, over a hot cup." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "They tell me ye told somebody a tale that didn't hold. Just don't tell me ye returned a mug when ye didn't." },
  },

  notice = {
    { id = "n_fast", cat = "speed", when = { class = { "ROGUE", "HUNTER" } },
      text = "Ye've got quick feet, I can see it. Quick feet beat strong arms in my trade, for mornbrew's no good cold." },
    { id = "n_cold", cat = "cold", when = { race = { "Gnome", "Human", "NightElf" } },
      text = "Ye're shiverin'. A cup o' mornbrew would sort that, if I had one tae spare, which I don't, but I will tomorrow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nori Pridedrift, an' this is Scalding Mornbrew, the finest thing tae happen tae a cold mornin' since fire. Everyone in the valley drinks it, an' everyone in the valley wants it now." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Scalding Mornbrew Delivery") },
          text = "Gah, I was meant tae have this cup tae Durnan Furcutter in Anvilmar ages ago, but Grelin up by the troll caves wanted his first. Ye look fast; d'ye think ye could get it there before it cools?" },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Scalding Mornbrew Delivery") },
          text = "Anvilmar's northeast, dug intae the mountain, an' Durnan's inside. Don't stop tae fight anythin', for Durnan didn't order it chilly." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bring Back the Mug"), days = 3 } },
          text = "My mug, home safe! Ye've no idea how many o' these walk off wi' recruits who swear they'll bring them back." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf who knows the cold! Ye'll appreciate a proper mornbrew, then, an' no' just drink it tae stay alive." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, now, the pot's waitin'." },
        { id = "h_again2", text = "Go on. I've a minute before somebody shouts fer a cup." },
      },
      choices = {
        { text = "What's in Scalding Mornbrew?", next = "brew" },
        { text = "Why do you worry so much about mugs?", next = "mugs" },
        { text = "You must have a few regular customers.", next = "customers" },
        { text = "Couldn't a mage just warm the cup?", next = "mage", when = { class = "MAGE" } },
        { text = "I can run it for you.", next = "BUSINESS" },
        { text = "I'll let you get on, Nori.", next = "END" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "Now that's a family secret, an' I'll take it tae my grave. I'll tell ye this much: it's hot, it's dark, an' it'll make yer beard stand up straight." },
      },
      choices = {
        { text = "Then what makes it better than ale in the morning?", next = "brew_ale" },
        { text = "I don't have a beard.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    brew_ale = {
      lines = { { id = "ba_default", text = "Ale in the mornin' makes a dwarf sleepy by noon, an' mornbrew keeps him swingin' an axe till supper. The Thunderbrews down in Kharanos don't like me sayin' it, so I say it quietly." },
      },
      choices = {
        { text = "The Thunderbrews must see you as a rival.", next = "brew_rival" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew_rival = {
      big = true,
      lines = { { id = "br_default", text = "A rival? Me? I sell a few cups in a cold valley, an' they've a whole distillery. But I'll admit I'd love tae see a mornbrew stall in Kharanos one day, right next tae their door." },
      },
      choices = {
        { text = "Go for it. A good brew earns its place anywhere.", next = "BACK", reply = "Och, ye're kind tae say it, an' maybe one day I will, if I can ever get the mornin' brew tae Coldridge before it's cold, never mind Kharanos.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Mind your own valley, Nori, because Kharanos is their ground.", next = "BACK", reply = "Aye, aye, ye're right, an' the Thunderbrews would have my mugs in the snow by noon, but a dwarf can dream o' a wee stall while he's pourin'.", fx = { align = { order = 1 } } },
        { text = "Something else, Nori.", next = "BACK" },
      },
    },
    mugs = {
      lines = { { id = "m_default", text = "Because I've a handful o' them, an' every one I lose is a cup I cannae sell. The recruits wander off wi' them up the hills, an' the troggs don't return anythin'." },
      },
      choices = {
        { text = "Why not use cheaper cups?", next = "mugs_cheap" },
        { text = "I'll bring back any I find.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    mugs_cheap = {
      lines = { { id = "mc_default", text = "Cheaper cups crack when the brew goes in, for it's that hot. These were made in Ironforge tae take the heat, an' I paid more fer them than fer the pot." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "c_default", text = "Durnan in Anvilmar, every mornin' without fail, an' Grelin out by the troll caves, for he says it keeps him awake through the watch. Sten Stoutarm drinks it standin' up at his post, which I take as a compliment." },
      },
      choices = {
        { text = "So Grelin drinks it on watch.", next = "customers_grelin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_grelin = {
      lines = { { id = "cg_default", text = "Aye, an' that's why I'm always late fer Durnan, for Grelin's on the way an' he's no' a patient dwarf before his cup. Don't tell Durnan I put Grelin first." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Ye'd think so, but every mage who's tried has boiled it dry or frozen it solid. Mornbrew wants tae be scalding, no' magicked." },
      },
      choices = {
        { text = "Then I'll leave it to the pot.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I make mornbrew an' I carry it round the valley before it goes cold. That's the whole of me, near enough." } },
    advice = { { id = "tp_ad", text = "Drink it hot an' bring back the mug. That's all I ask of anybody." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay sends up coffee beans now an' then, an' they're bitter as a pirate's heart. I put them in the brew anyway, an' nobody's noticed." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells hot cocoa that's mostly water, an' I'd be ashamed tae serve it. Come by my stand an' I'll show ye what a hot drink should be." } },
    everlook = { { id = "tp_everlook", text = "Everlook should have the best hot drinks in the world, bein' that cold, but the goblins water everythin' down. I'd open a stand there if I could stand the goblins." } },
    _none = { { id = "tp_none", text = "No idea, friend, but ask me again after a cup. Everythin's clearer after a cup." } },
  },
}
