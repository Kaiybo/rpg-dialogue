-- Commander Althea Ebonlocke, the Night Watch, Darkshire. Voice: bibles/althea.md
-- Holds the town with a militia, adventurers and very little sleep.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "althea", id = TODO_NPC("Commander Althea Ebonlocke"), name = "Commander Althea Ebonlocke",
  bible = "bibles/althea.md", role = "soldier", tier = "major",
  communities = { "darkshire" }, temper = { "steady" }, values = { "brave", "lawful", "stern" },
  notices = { "soldier", "night" },

  greetings = {
    { id = "g_watch", text = "Night Watch. State your business, then be useful." },
    { id = "g_recruit", when = { questDone = TODO_QUEST("The Night Watch") }, text = "One of mine, near enough. Report." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "There's the reason half my watchers are still alive. Sit. Briefly." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN", "HUNTER" }, minLevel = 20 },
      text = "You'd make a decent watcher. We don't pay, we don't sleep, and the woods want to eat us. Interested?" },
    { id = "n_night", cat = "night", when = { timeOfDay = "night" },
      text = "Out after dark. In Duskwood. Either you're very brave or you haven't been here long. Stay in the lamplight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Commander Ebonlocke, the Night Watch. We're sworn to keep Darkshire's people alive. Some nights that's the whole of the oath, and it's plenty." },
        { id = "h_watch", tags = { "news" }, when = { questActive = TODO_QUEST("The Night Watch") },
          text = "The dead don't stay in the cemeteries out here. Thin them. Every skeleton you put down is one less at our gate." },
        { id = "h_watch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Night Watch"), days = 3 } },
          text = "My watchers slept a full night. Two of them didn't know what to do with themselves." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "An old murder. Visiting nobles, years ago. Smitts never let it go, and now neither will you. Follow it to the end." },
        { id = "h_ello", text = "The mayor writes to Stormwind. I train farmers to hold a pike. One of us will save this town, and it won't be the letters." },
        { id = "h_new", when = { maxLevel = 22 },
          text = "You're green for Duskwood. Keep to the road, keep a torch lit, and don't follow lights into the trees." },
      },
      choices = {
        { text = "What's out in the woods?", next = "woods" },
        { text = "How can I help the Watch?", next = "help" },
        { text = "I'll keep to the lamplight.", next = "END" },
      },
    },
    woods = {
      big = true,
      lines = {
        { id = "w_default", text = "Worgen. Walking dead. Ogres from the pass. And the fog, which isn't a creature but behaves like one. Pick your poison." },
      },
      choices = {
        { text = "I'll take them all.", next = "END", fx = { trait = { brave = 1 }, affinity = 1, learn = { "worgen" } } },
        { text = "How do you live like this?", next = "live" },
      },
    },
    live = {
      lines = { { id = "l_default", text = "Badly. Together. And with a lot of lamp oil." } },
      choices = { { text = "Fair.", next = "END", fx = { affinity = 1 } } },
    },
    help = {
      lines = {
        { id = "hp_default", text = "Talk to my watchers at the posts. They know what needs killing this week. It changes. It never shrinks." },
      },
      choices = { { text = "I will.", next = "END", fx = { learn = { "night_watch" }, standing = { darkshire = 1 } } } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "Volunteers, mostly. Farmers, bakers, a tanner who swears he's killed forty ghouls. He's killed six." } },
    worgen = { { id = "tp_worgen", text = "Don't ask where they came from. Ask how many. That's the useful question." } },
    stalvan = { { id = "tp_stalvan", text = "A tutor who killed the girl he taught, and the man she was to marry. Maybe more. That's the short version. The long one keeps Smitts up at night." } },
    westfall = { { id = "tp_westfall", text = "Stoutmantle runs a militia too. I'd like to meet him. I'd like to compare notes on being forgotten." } },
    _none = { { id = "tp_none", text = "Not a Watch matter. If it becomes one, it'll find me." } },
  },
}
