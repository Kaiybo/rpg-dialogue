-- Marshal Marris, by the bridge in Lakeshire. Voice: bibles/marris.md
-- Too many orcs, too few guards, and one name he can't stop saying: Tharil'zun.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marris", id = TODO_NPC("Marshal Marris"), name = "Marshal Marris",
  bible = "bibles/marris.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "brave", "lawful" },
  notices = { "soldier", "trophy" },

  greetings = {
    { id = "g_watch", text = "Eyes east. Always east." },
    { id = "g_menace", when = { questActive = TODO_QUEST("Blackrock Menace") }, text = "Back from the valley? Good. How many?" },
    { id = "g_keeshan", when = { questDone = TODO_QUEST("Missing In Action") }, text = "You brought Keeshan home. I won't forget it." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 18 },
      text = "You hold that blade like someone who's been in a shield wall. I could use ten of you. I'll take one." },
    { id = "n_trophy", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Blackrock Menace") },
      text = "That's Blackrock work on your armor. And Blackrock blood on your sleeve. Good trade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marris, Marshal of Lakeshire. I've a guard stretched across a lake and orcs who don't sleep. What do you need?" },
        { id = "h_menace", when = { questBefore = TODO_QUEST("Blackrock Menace") },
          text = "The Blackrock have dug in at Render's Valley. Every raid on this town starts there. I want their numbers down before they come for the bridge again." },
        { id = "h_menace_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackrock Menace"), days = 3 } },
          text = "Quieter nights this week. My guards actually slept. One of them snored. I've never been so glad to hear it." },
        { id = "h_keeshan", tags = { "news" }, when = { questActive = TODO_QUEST("Missing In Action") },
          text = "Corporal Keeshan was taken when Stonewatch fell. He's alive, if the scouts are right, held up at Render's Rock. Bring him home." },
        { id = "h_keeshan_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Missing In Action"), days = 3 } },
          text = "Keeshan's sleeping it off in the barracks. He told me what you did. Twice. He doesn't tell anything twice." },
        { id = "h_tharilzun", when = { questActive = TODO_QUEST("Tharil'zun") },
          text = "Tharil'zun. He leads them. Take friends. Take more friends than you think you need." },
        { id = "h_tharilzun_done", tags = { "news" }, when = { questDone = TODO_QUEST("Tharil'zun") },
          text = "Without Tharil'zun the valley's just a camp full of angry orcs. Angry orcs I can handle. Organized ones were killing us." },
        { id = "h_count", when = { metBefore = true }, text = "Twelve guards on the morning roll. Twelve on the evening. Days like that, I thank the Light out loud." },
      },
      choices = {
        { text = "What happened at Stonewatch?", next = "stonewatch" },
        { text = "How bad is it?", next = "bad" },
        { text = "I'll keep my eyes east.", next = "END" },
      },
    },
    stonewatch = {
      big = true,
      lines = {
        { id = "sw_default", text = "We held the Keep with a platoon. They came with an army. Good soldiers died on those walls. The rest of us fell back to the lake." },
      },
      choices = {
        { text = "Then we take it back.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "You did what you could.", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    bad = {
      lines = {
        { id = "b_default", text = "Orcs east, gnolls south, murlocs in the water, a broken bridge and a magistrate who writes letters. Bad enough." },
      },
      choices = { { text = "Sounds like you need help.", next = "END", fx = { learn = { "blackrock" } } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "Disciplined, which is the worst thing an orc can be. Someone's teaching them." } },
    everstill_bridge = { { id = "tp_bridge", text = "Without it my guards walk the long way round the lake. Oslow knows. Oslow knows I know." } },
    morganth = { { id = "tp_morganth", text = "A tower full of gnolls and something worse at the top. Not until Render's Valley is done." } },
    _none = { { id = "tp_none", text = "Ask the magistrate. He likes questions. I like answers with a body count." } },
  },
}
