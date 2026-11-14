-- Marshal McBride, Northshire Abbey. Voice: bibles/mcbride.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mcbride", id = TODO_NPC("Marshal McBride"), name = "Marshal McBride",
  bible = "bibles/mcbride.md", role = "questgiver", tier = "major",
  communities = { "northshire" }, temper = { "steady", "sharp" },
  notices = { "greenness", "kit", "follow_through" },

  greetings = {
    { id = "g_brief", text = "Recruit. Make it quick." },
    { id = "g_reports", text = "If it's the mine, I've read the reports. If it isn't, speak up." },
    { id = "g_regular", when = { timesTalked = { min = 4 } }, text = "You again. Good. Means you're still alive." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "Quietly. The brothers are at prayers." },
    { id = "g_count", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } }, text = "Count's not done, recruit." },
    { id = "g_echo", when = { questObjective = { TODO_QUEST("Skirmish at Echo Ridge"), left = { min = 1 } } }, text = "Echo Ridge isn't going to clear itself." },
  },

  notice = {
    { id = "n_kit_broken", cat = "kit", place = "before", when = { durability = { max = 0.25 } },
      text = "Before you say anything, get that armor to a smith. I don't send recruits out held together with string." },
    { id = "n_kit_naked", cat = "kit", place = "replace", when = { nearlyNaked = true },
      text = "Where is your armor, recruit? No. I don't want to know. Go and find some." },
    { id = "n_green_deaths", cat = "greenness", place = "after", when = { band = "Greenhorn", deaths = { min = 3 } },
      text = "You keep coming back down that hill in worse shape than you went up. They carry candles, recruit. Not swords." },
    { id = "n_ressick", cat = "greenness", place = "before", when = { resSick = true },
      text = "You look like the brothers just finished with you. Sit down before you fall down." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I can still hear you breathing, recruit. Stand where I can see you." },
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } }, text = "Keep that thing off my maps. The last one set fire to a requisition." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The garrison's spread thin, so I'll be brief. What do you need?" },
        { id = "h_from_willem", key = true, when = { questRecent = { TODO_QUEST("A Threat Within"), days = 1 }, metBefore = false },
          text = "Willem sent you up, then. Stand where the light's on you. Let's see what I'm working with." },
        { id = "h_return", tags = { "news" }, priority = 15, when = { metBefore = true, daysSince = { min = 7 } },
          text = "Thought we'd lost you to Goldshire. What brings you back up the hill?" },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf who talks to the weather. I've had stranger recruits this year. Not many." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A hunter. Good. I've wolves on one side and kobolds on the other, and I'd like both of them counted from a distance." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Skyborne. I'm told the Kirin Tor vouched for your people. Out here the kobolds will judge you on your own." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "A long way from your forests. If you're lost, Goldshire's south. If you're not, I've work." },
        { id = "h_champion", when = { band = "Champion" },
          text = "You're a long way past kobolds. If you're visiting the Abbey, the brothers will be pleased. I'll be suspicious." },
        { id = "q_kobold_before", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup"), band = "Greenhorn" },
          text = "There's a kobold camp in the woods north of here, and they're getting bold. I need it thinned." },
        { id = "q_kobold_progress", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } },
          text = "That count isn't done. They multiply in those woods faster than I can find recruits." },
        { id = "q_kobold_ready", when = { questReady = TODO_QUEST("Kobold Camp Cleanup") },
          text = "That's the count? Good. Hand it in properly and I'll sign it off." },
        { id = "q_kobold_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Kobold Camp Cleanup"), days = 2 } },
          text = "First quiet night the brothers have had in a week. They'll pray for you. I'll settle for you staying sharp." },
        { id = "q_echo_active", when = { questActive = TODO_QUEST("Investigate Echo Ridge") },
          text = "My scouts say there's more of them than we thought. Go and see. Count, don't charge." },
        { id = "q_echo_later", when = { questLater = { TODO_QUEST("Skirmish at Echo Ridge"), days = 5 } },
          text = "Echo Ridge has gone quiet. They always come back, mind. Fewer, since you went through." },
        { id = "q_thieves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 2 } },
          text = "Willem's tally of bandanas is the only thing in this valley growing faster than the kobolds. Your doing, I hear." },
        { id = "e_dughan_thieves", tags = { "news" }, when = { heardLine = "dughan.d_common_thieves" },
          text = "Dughan told you they're common thieves? Common thieves don't drill. Someone is training them.",
          fx = { hear = "defias_trained" } },
      },
      choices = {
        { text = "Reporting for duty, Marshal.", next = "orders",
          fx = { align = { order = 2 }, trait = { stern = 1 }, affinity = 1 },
          journal = { first = "Reported to Marshal McBride. He looked at me like a man counting how many of us come back.",
                      third = "{name} reported to Marshal McBride at Northshire Abbey." } },
        { text = "Kobolds? You need soldiers for kobolds?", next = "kobolds", fx = { trait = { witty = 1 }, affinity = -1 } },
        { text = "I've run vermin off a farm before. These can't be worse.", next = "orders",
          when = { origin = "human_westfall_farmhand" }, fx = { affinity = 1 } },
        { text = "What do you make of the Defias in the valley?", next = "defias" },
      },
    },

    kobolds = {
      lines = {
        { id = "k_default", text = "Laugh if you like. They've moved into Echo Ridge Mine, and they come out bolder every week. I'd rather laugh after." },
      },
      choices = {
        { text = "Fair enough. Point me at them.", next = "orders", fx = { affinity = 1 } },
        { text = "I'll see for myself.", next = "END" },
      },
    },

    orders = {
      lines = {
        { id = "o_default", text = "Good. I've more work than hands. Let's see what fits you." },
        { id = "o_kobolds", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup") },
          text = "Kobold camp, north woods. Thin it out, then report to me. Not to the brothers." },
        { id = "o_done_here", when = { questDone = TODO_QUEST("Skirmish at Echo Ridge") },
          text = "Nothing left here that needs you. Marshal Dughan in Goldshire can use a recruit who finishes things." },
      },
      choices = {
        { text = "Show me the work.", next = "BUSINESS" },
        { text = "Understood.", next = "END" },
      },
    },

    defias = {
      big = true,
      lines = {
        { id = "d_default", key = true,
          text = "They're in the valley and they're organized. A thief with a cause is still a thief. Some of them were honest men, once.",
          fx = { hear = "defias_trained", learn = { "defias" } } },
        { id = "d_kind", when = { alignment = { axis = "light", min = 30 } },
          text = "You'll want to tell me they're desperate men. Some are. Desperate men still put knives in my recruits.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Then give them a chance to surrender first.", next = "END",
          fx = { align = { light = 3 }, trait = { kind = 1 }, opinion = { defias = "mercy" } },
          journal = { first = "Told McBride the Defias should get a chance to surrender. He didn't argue. He didn't agree either.",
                      third = "{name} told McBride the Defias deserved a chance to surrender." } },
        { text = "A thief's a thief. I'll treat them like one.", next = "END",
          fx = { align = { order = 3 }, trait = { stern = 1 }, opinion = { defias = "hardline" }, affinity = 1 },
          journal = { first = "McBride asked about the Defias. I told him a thief's a thief. He nodded like I'd passed something.",
                      third = "{name} told McBride the Defias should be treated as thieves, nothing more." } },
        { text = "Who's organizing them? That's who I'd want.", next = "END",
          fx = { align = { honor = -2 }, trait = { curious = 1 }, opinion = { defias = "follow_the_leaders" } },
          journal = { first = "Asked McBride who's behind the Defias. He didn't know. He didn't like not knowing.",
                      third = "{name} asked Marshal McBride who leads the Defias. He had no answer." } },
      },
    },
  },

  topics = {
    kobolds = { { id = "t_kobolds", text = "Vermin with candles and shovels. Don't underestimate the shovels." } },
    echo_ridge = { { id = "t_echo", text = "An old mine north of here. The kobolds took it, and they dig deeper every week." } },
    defias = { { id = "t_defias", text = "Organized, and closer to the Abbey than I like. Ask Willem. He's been counting bandanas.", fx = { hear = "defias_trained" } } },
    hogger = { { id = "t_hogger", text = "Dughan's problem, thank the Light. Don't go near him at your size." } },
    _none = { { id = "t_none", text = "Not a garrison matter. Ask the brothers. They read." } },
  },
}
