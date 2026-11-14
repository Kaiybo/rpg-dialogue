-- More of Eastvale and the farms: Sara Timberlain and Gerard Tiller.
-- Voices: bibles/sara.md, bibles/gerard.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sara Timberlain: turns Defias bandanas into fine linen.
P:NPC {
  key = "sara", id = TODO_NPC("Sara Timberlain"), name = "Sara Timberlain",
  bible = "bibles/sara.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "steady" }, values = { "ambitious", "witty" },
  notices = { "craft", "red" },

  greetings = {
    { id = "g_loom", text = "Careful, that's a warp thread you're standing on." },
    { id = "g_bandanas", when = { questActive = TODO_QUEST("Red Linen Goods") }, text = "Bandanas? Any red ones? Only the red ones." },
    { id = "g_after", when = { questDone = TODO_QUEST("Red Linen Goods") }, text = "My best customer of thieves' laundry. Hello again." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Feel this. That's Defias linen, washed twice. Nobody would believe where it came from. That's the beauty of it." },
    { id = "n_red", cat = "red", when = { questObjective = { TODO_QUEST("Red Linen Goods"), left = { max = 2 } } },
      text = "Nearly six. I can see the red poking out of your pack from here. Lovely colour, isn't it? Shame about the people inside it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sara Timberlain. The loggers cut wood; I cut cloth. Somebody in this camp has to make something you'd want to wear." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Red Linen Goods") },
          text = "The Defias in Elwynn wear the best red linen I've ever seen. Wasted on thieves. Bring me their bandanas and I'll make something honest of them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Red Linen Goods") },
          text = "Six. Red, not burlap; the Northshire lot wear sacks on their heads, and I can't do anything with sacks." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Red Linen Goods"), days = 3 } },
          text = "A sash and a shirt out of six thieves' bandanas. If any of them come asking for their linen back, send them to me." },
        { id = "h_thread", when = { metBefore = true }, text = "Ran out of blue thread halfway through a hem. Finished it in brown. Nobody's noticed. You didn't either, until I told you." },
      },
      choices = {
        { text = "Isn't that a little grim?", next = "grim" },
        { text = "I'll keep an eye out for red.", next = "END" },
      },
    },
    grim = {
      lines = { { id = "g_default", text = "Grim is leaving good cloth on a dead thief. I'm practical. Raelen says so, and she says almost nothing nice." } },
      choices = { { text = "Ha. Fair.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Dreadful people. Excellent taste in fabric. Life's complicated." } },
    eastvale = { { id = "tp_eastvale", text = "Sawdust in everything. My thread, my bread, my hair." } },
    _none = { { id = "tp_none", text = "Can I sew it? No? Then I've no opinion." } },
  },
}

-- Gerard Tiller: farming is thirsty work.
P:NPC {
  key = "gerard", id = TODO_NPC("Gerard Tiller"), name = "Gerard Tiller",
  bible = "bibles/gerard.md", role = "farmer", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "honest" },
  notices = { "drink" },

  greetings = {
    { id = "g_thirst", text = "Got any water? Farming's thirsty work." },
    { id = "g_again", when = { questDone = TODO_QUEST("Give Gerard a Drink") }, text = "My water-bringer! Got any more? I've got apples." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Somebody's had something stronger than water. Lucky you. I'm out here with a hoe and a dry throat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gerard. I work the vines. Sun's hot, rows are long, and the well's a long walk. A man could die of thirst out here. Slowly." },
        { id = "h_trade", tags = { "news" }, when = { questActive = TODO_QUEST("Give Gerard a Drink") },
          text = "Spring water. The good stuff. Bring me a flask and I'll give you an apple. Fair trade. Best trade in Elwynn." },
        { id = "h_lovers", when = { topicKnown = "maybell_tommy" },
          text = "Miss Maybell goes down to the river most evenings. Says she's counting grapes. There are no grapes by the river. I don't say anything. Not my business." },
        { id = "h_vines", when = { metBefore = true }, text = "The vines are coming on. Another month and we'll have grapes, if the crows don't find them first. The crows always find them first." },
      },
      choices = {
        { text = "Here, have a drink.", next = "BUSINESS" },
        { text = "Keep at it, Gerard.", next = "END" },
      },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_lovers", text = "I see things from the vines. I don't say things. That's how a vine-hand keeps his job." } },
    _none = { { id = "tp_none", text = "Couldn't say. Got any water?" } },
  },
}
