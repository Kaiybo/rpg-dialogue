-- Gryan Stoutmantle, Sentinel Hill. Voice: bibles/gryan.md
-- Silver Hand-trained, Westfall-born, holding his homeland together with farmers.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gryan", id = TODO_NPC("Gryan Stoutmantle"), name = "Gryan Stoutmantle", title = "The People's Militia",
  bible = "bibles/gryan.md", role = "questgiver", tier = "major",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "brave", "lawful", "kind" },
  spiritSensitive = true,
  notices = { "reputation", "paladin" },

  greetings = {
    { id = "g_hill", text = "Sentinel Hill, such as it is. Find a spot out of the wind." },
    { id = "g_sent", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") }, text = "Another one from Elwynn. Good. Come up, I'll not keep you standing." },
    { id = "g_militia", when = { questDone = TODO_QUEST("The People's Militia") }, text = "There's one of mine. Report." },
    { id = "g_hero", when = { townStanding = { town = "sentinel_hill", min = 55 } }, text = "The hill has started saying your name with mine. Mind you live up to it. I'm still trying." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Say what you came to say. Then go." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself like the Silver Hand taught you. I know the walk; I learned it in Lordaeron. Don't let anyone tell you it's for parade grounds." },
    { id = "n_hero", cat = "reputation", place = "before", when = { townStanding = { town = "sentinel_hill", min = 30 } },
      text = "Half my militia wants to follow you into Moonbrook. The other half wants to know where you were last year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gryan Stoutmantle. I was born in Westfall. I got home and found it in the hands of thieves, so I'm taking it back. One farm at a time." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Elwynn sends me volunteers now. Not soldiers. Never soldiers. Volunteers will do." },
        { id = "h_militia_before", when = { questBefore = TODO_QUEST("The People's Militia") },
          text = "My scouts have marked Defias camps from the coast to Moonbrook. I've farmers with pitchforks and not enough of them. You, though. You'd do." },
        { id = "h_militia_active", tags = { "news" }, when = { questActive = TODO_QUEST("The People's Militia") },
          text = "Bring them down and the farmers sleep a night without one eye open. That's the whole of the war, out here." },
        { id = "h_militia_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The People's Militia"), days = 3 } },
          text = "That camp's gone quiet. A man walked up the hill this morning just to say so. That's what you bought: one man not afraid for a morning." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You went under Moonbrook and walked out again. Edwin VanCleef has had his own way down there too long. Now he knows we can reach him." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 12 },
          text = "The Light didn't send me home. Westfall did. The Light just came along and made itself useful." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "A decency on you, I'd say. Out here it's rarer than iron. Don't spend it all in one place." },
      },
      choices = {
        { text = "What happened to Westfall?", next = "westfall" },
        { text = "Why doesn't Stormwind help?", next = "stormwind" },
        { text = "Who leads the Defias?", next = "leader" },
        { text = "I'm at your service.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    westfall = {
      lines = {
        { id = "w_default", key = true,
          text = "It fed the kingdom once. After the Second War the farms went fallow and the Defias moved in. Families were driven off their own land at knifepoint." },
      },
      choices = {
        { text = "And you came back for it.", next = "back" },
        { text = "I'll help you take it back.", next = "END", fx = { affinity = 2, learn = { "westfall" }, align = { order = 1 } } },
      },
    },
    back = {
      big = true,
      lines = {
        { id = "b_default", text = "I left the Third War with things I'd rather not carry. Lordaeron burned. I couldn't save it. This, I can save." },
        { id = "b_squire", when = { origin = "human_paladin_squire" },
          text = "You squired for the Silver Hand; you know what Lordaeron cost us. Some of us went home to make sure it didn't cost everything." },
      },
      choices = {
        { text = "Then let's save it.", next = "END", fx = { affinity = 2, align = { light = 1, order = 1 }, trait = { brave = 1 } } },
        { text = "You can't save everything.", next = "everything", fx = { trait = { skeptical = 1 } } },
      },
    },
    everything = {
      lines = { { id = "e_default", text = "True. So you pick something. I picked here." } },
      choices = { { text = "Fair enough.", next = "END" } },
    },
    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Westfall's own lords went rotten, and the city's busy with its own troubles. Nobody's coming. So we stopped waiting.",
          fx = { hear = "stormwind_abandoned_westfall" } },
        { id = "s_bolvar", when = { heardLine = "bolvar.t_westfall" },
          text = "The Highlord said that, did he? I believe he means it. I'll believe in his soldiers when I see them on the road." },
      },
      choices = {
        { text = "The city should be ashamed.", next = "END", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "The kingdom has bigger problems.", next = "bigger", fx = { opinion = { westfall = "patience" } } },
      },
    },
    bigger = {
      lines = { { id = "bg_default", text = "Bigger than its own breadbasket? Then it'll be hungry while it solves them." } },
      choices = { { text = "Point taken.", next = "END" } },
    },
    leader = {
      lines = {
        { id = "l_default", text = "Someone who knows Stormwind's stones too well. My scouts and the city's quieter friends are working on a name. When I have it, you'll have it." },
        { id = "l_known", key = true, when = { deed = "dungeon:The Deadmines" },
          text = "VanCleef. A stonemason once. He helped build the city that wouldn't pay him, and he's never forgiven it." },
      },
      choices = {
        { text = "I'll keep my ears open.", next = "END", fx = { learn = { "defias" } } },
      },
    },
  },

  topics = {
    defias = {
      { id = "tp_defias", text = "Not common thieves. Organized, fed, armed, and angry. Anyone who tells you otherwise hasn't been to Moonbrook.",
        fx = { hear = "defias_trained" } },
    },
    westfall = { { id = "tp_westfall", text = "Good land. Tired land. It'll grow again if we let it." } },
    people_militia = { { id = "tp_militia", text = "Farmers, mostly. Some old soldiers. All of them braver than they've any reason to be." } },
    harvest_watchers = { { id = "tp_watchers", text = "Scarecrows that walk. Ask Saldean about them; he'll talk till sundown." } },
    moonbrook = { { id = "tp_moonbrook", text = "Their town now. Don't go in alone, and don't go in at night." } },
    riverpaw = { { id = "tp_gnolls", text = "The gnolls run with the thieves. Captain Danuvin's dealing with them." } },
    _none = { { id = "tp_none", text = "I've a war to run with a hill and some farmers. That's not part of it." } },
  },
}
