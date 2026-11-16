-- The Searing Gorge off the road: Dorius Stonetender's last dig. Voice: bibles/gorge_roads.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dorius", id = TODO_NPC("Dorius Stonetender"), name = "Dorius Stonetender",
  bible = "bibles/gorge_roads.md", role = "scholar", tier = "quest",
  communities = { "thoriumpoint" }, temper = { "eager" }, values = { "curious", "loyal" },
  notices = { "race" },

  impression = {
    first = "Dorius Stonetender is chasing the Suntara Stones through the Searing Gorge, and he won't leave his missing team behind.",
    third = "{name} met Dorius Stonetender, Curator Thorius's brother, digging for the Suntara Stones in the Searing Gorge.",
  },

  greetings = {
    { id = "g_gorge", text = "Keep yer voice down, friend! The Dark Irons have patrols on every ridge, an' I'd like tae keep my head." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dorius Stonetender, of the Explorers' League, an' I came here for the Suntara Stones. My team went ahead an' never came back, an' I'll no' leave the Gorge without them." },
        { id = "h_stones", when = { questActive = TODO_QUEST("Suntara Stones") },
          text = "Ye'll walk wi' me, then? Good, for I've a feelin' the Dark Irons have been waitin' for me as much as I've been lookin' for them." },
      },
      again = {
        { id = "h_again", text = "What else? We cannae linger here long." },
        { id = "h_again2", text = "Quickly, friend, ask an' then keep yer eyes on the ridge." },
      },
      choices = {
        { text = "What are the Suntara Stones?", next = "stones" },
        { text = "What happened to your team?", next = "team" },
        { text = "Does your brother know you're here?", next = "thorius" },
        { text = "I'm a dwarf of Ironforge. I'll stand with you.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Be careful, Dorius.", next = "END" },
      },
    },
    stones = {
      lines = { { id = "s_default", text = "Old stones o' power from the legends, an' the scholars call them a fairy tale. I say legends are just finds nobody's dug up yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    team = {
      lines = { { id = "t_default", text = "They went deeper intae the Gorge after a lead, an' the Dark Irons took them. I hear they're bein' worked like slaves, an' it's eatin' me alive." } },
      choices = {
        { text = "Why not wait for help from Ironforge?", next = "team_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    team_wait = {
      lines = { { id = "tw_default", text = "Because help from Ironforge takes months, an' my lads havenae got months. If I'm a fool for goin', then I'm a fool." } },
      choices = {
        { text = "A leader goes after his people. You're right.", next = "team_end", fx = { align = { honor = 1 } } },
        { text = "Dead leaders save no one. Wait for an army.", next = "team_end", fx = { align = { honor = -1 } } },
        { text = "What if it's a trap?", next = "team_end" },
      },
    },
    team_end = {
      lines = { { id = "te_default", text = "Then it's a trap, an' I'll walk intae it wi' my eyes open. If anythin' happens, tell my brother I was thinkin' o' him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },
    thorius = {
      lines = { { id = "th_default", text = "Thorius knows I'm diggin', but no' how deep. He keeps the museum in Ironforge, an' he worries more than a curator ought." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Then I'm glad o' ye, kinsman, more than I can say. We'll bring my lads home, or we'll try." } },
      choices = { { text = "We'll bring them home.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldnae tell ye. Ask me about stones, or the Dark Irons." } },
  },
}
