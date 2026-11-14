local P = RPGDialogueAPI:Pack("test.main")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mcbride", id = TODO_NPC("Marshal McBride"), name = "Marshal McBride",
  role = "questgiver", tier = "quest", communities = { "northshire" }, temper = { "steady" },
  greetings = {
    { id = "g_brief", text = "Recruit." },
    { id = "g_count", text = "Count's not done.", when = { questObjective = { TODO_QUEST("Kobold Camp Cleanup"), left = { min = 1 } } } },
  },
  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { durability = { max = 0.25 } }, text = "Get that armor fixed." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "I can still hear you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "What do you need?" },
        { id = "h_from_willem", key = true, when = { questRecent = { TODO_QUEST("A Threat Within"), days = 1 }, metBefore = false }, text = "Willem sent you up." },
        { id = "q_kobold_before", when = { questBefore = TODO_QUEST("Kobold Camp Cleanup"), band = "Greenhorn" }, text = "Kobolds north of here." },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" }, text = "A dwarf who talks to the weather." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf." },
        { id = "q_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Kobold Camp Cleanup"), days = 2 } }, text = "Quiet night, thanks to you." },
        { id = "h_align", when = { alignment = { axis = "light", min = 30 } }, text = "You've a kind streak." },
      },
      choices = {
        { text = "Reporting for duty.", next = "orders", fx = { align = { order = 2 }, trait = { stern = 1 }, affinity = 1 },
          journal = { first = "Reported to McBride.", third = "{name} reported to McBride." } },
        { text = "What about the Defias?", next = "defias" },
        { text = "[test] Back off.", tag = "Intimidate", next = "cowed", fail = { next = "angry", fx = { affinity = -2 } } },
        { text = "I'm from a farm.", when = { origin = "human_westfall_farmhand" }, next = "END" },
      },
    },
    orders = {
      lines = { { id = "o_default", text = "Kobold camp, north woods." } },
      choices = { { text = "Show me the work.", next = "BUSINESS" }, { text = "Understood.", next = "END" } },
    },
    defias = {
      big = true,
      lines = {
        { id = "d_default", key = true, text = "They're organized." },
        { id = "d_align", when = { alignment = { axis = "light", min = 1 } }, text = "Mercy, from you? Fitting." },
      },
      choices = {
        { text = "Give them a chance to surrender.", next = "END", fx = { align = { light = 3 }, opinion = { defias = "mercy" } } },
      },
    },
    cowed = { lines = { { id = "c", text = "Fine. Fine." } }, choices = { { text = "Good.", next = "END" } } },
    angry = { lines = { { id = "a", text = "Out of my sight." } }, choices = { { text = "Leave.", next = "END" } } },
  },
  topics = {
    kobolds = { { id = "t_kobolds", text = "Vermin with candles." } },
    _none = { { id = "t_none", text = "Not a garrison matter." } },
  },
}

P:NPC {
  key = "willem", id = 9002, name = "Deputy Willem", role = "questgiver", tier = "quest", communities = { "northshire" },
  nodes = { hello = {
    lines = {
      { id = "h_echo", tags = { "news" }, when = { heardLine = "mcbride.d_default" }, text = "The Marshal told you about the Defias, did he?" },
    },
    choices = { { text = "Bye.", next = "END" } },
  } },
}

-- Made by tools/new_zone.py and not written yet: the game must ignore it.
P:NPC {
  key = "scaffolded", id = 9099, name = "Unwritten Person", bible = "bibles/scaffolded.md",
  role = "questgiver", tier = "quest", communities = {}, scaffold = true,
}
