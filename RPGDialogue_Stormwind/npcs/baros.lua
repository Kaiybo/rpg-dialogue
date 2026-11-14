-- Baros Alexston, City Architect, City Hall in Cathedral Square. Voice: bibles/baros.md
-- Built Stormwind beside VanCleef. Took the post when VanCleef took to the hills.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baros", id = TODO_NPC("Baros Alexston"), name = "Baros Alexston", title = "City Architect",
  bible = "bibles/baros.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "ambitious", "honest" },
  notices = { "westfall", "stone" },

  greetings = {
    { id = "g_plans", text = "Careful of the plans. Those are the Mage Quarter's new drains." },
    { id = "g_letter", when = { questActive = TODO_QUEST("The Unsent Letter") }, text = "A letter? For me? From whom? Let me sit down first." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Unsent Letter") }, text = "You. Yes. I've thought about that letter every day since." },
  },

  notice = {
    { id = "n_westfall", cat = "westfall", when = { visited = "Sentinel Hill" },
      text = "You've Westfall dust on your boots. I'd know it anywhere. I grew up in it, on the Alexston farm. Is the old house still standing?" },
    { id = "n_dwarf", cat = "stone", when = { race = "Dwarf" },
      text = "A dwarf! Tell me honestly. The Cathedral's flying buttresses. Too much? Every dwarf I ask says too much." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Baros Alexston, City Architect. Every street you walked to get here, someone drew first. Usually me." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("The Unsent Letter") },
          text = "Edwin's hand. I'd know it in the dark. We drew half this city together, once. He never sent it. Of course he never sent it." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Unsent Letter"), days = 3 } },
          text = "I'll see the right people read it. Then I'll go home and not sleep. He wrote it and never sent it. That's Edwin all over." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "You've been under Moonbrook. Did you see the work down there? Don't answer. I know it was good work. That's what hurts." },
        { id = "h_masons", when = { heardLine = "gryan.l_known" },
          text = "Stoutmantle told you about the Stonemasons, then. Yes. I was one. I took the post when Edwin took the road. Ask me which of us was the coward." },
      },
      choices = {
        { text = "You knew VanCleef?", next = "edwin", when = { any = { { deed = "dungeon:The Deadmines" }, { questActive = TODO_QUEST("The Unsent Letter") }, { heardLine = "gryan.l_known" } } } },
        { text = "Tell me about the city.", next = "city" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    edwin = {
      big = true,
      lines = {
        { id = "e_default", text = "We rebuilt this city together, and the nobles wouldn't pay. Edwin raised his voice and got a riot. I kept my head down and got this office." },
      },
      choices = {
        { text = "You made the right choice.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "He had a point about the nobles.", next = "point", fx = { align = { honor = 1, order = -1 } } },
      },
    },
    point = {
      lines = { { id = "p_default", text = "He did. That's the trouble with Edwin. He always had a point, and he always took it too far." } },
      choices = { { text = "...", next = "END" } },
    },
    city = {
      lines = {
        { id = "c_default", text = "The orcs burned the old Stormwind to the ground. Every wall you see is new. Ask who was paid for them, and watch the room go quiet." },
      },
      choices = { { text = "It's beautiful work.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    defias = {
      { id = "tp_defias", text = "Masons, once. Some of the best I ever worked with. I'd thank you not to call them common anything." },
    },
    westfall = { { id = "tp_westfall", text = "Home, once. The Alexston farm. I haven't been back. I should." } },
    _none = { { id = "tp_none", text = "If it isn't built of stone, I'm afraid I've no opinion worth having." } },
  },
}
