-- Antonio Perelli, the traveling salesman of Elwynn's roads. Voice: bibles/road_peddler.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "perelli", id = TODO_NPC("Antonio Perelli"), name = "Antonio Perelli", title = "Traveling Salesman",
  bible = "bibles/road_peddler.md", role = "vendor", tier = "service",
  communities = {}, temper = { "cheerful" }, values = { "practical", "freedom" },
  impression = {
    first = "Antonio Perelli sells odds and ends from a pack on his back and talks the whole time he does it. He seems to know every road in Elwynn and every danger on it.",
    third = "{name} met Antonio Perelli, a talkative peddler who walks Elwynn's roads.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a customer on the open road! Come, come, I carry a little of everything." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again! The road is long, but it keeps bringing me back to good customers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Antonio Perelli, traveling salesman, at your service. Goldshire to Eastvale and back again, and I sell whatever I carry to whoever stops to look." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Hm, you've quick hands, friend, so let's keep them where I can see them while you browse, eh? No offense meant." },
      },
      again = {
        { id = "h_again", text = "What else? My feet need the rest anyway." },
        { id = "h_again2", text = "Ask away, ask away. Talking's free, even if the goods aren't." },
      },
      choices = {
        { text = "Let's see what you carry.", next = "BUSINESS" },
        { text = "Isn't the road dangerous alone?", next = "danger" },
        { text = "Why not keep a shop in town?", next = "shop" },
        { text = "Safe travels.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Dangerous? Gnolls in the hills, Defias by the Jasperlode Mine, and murlocs if you wander near the lake. I walk fast and I smile at everyone, and so far that's kept me alive." } },
      choices = {
        { text = "You should hire a guard.", next = "danger_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_guard = {
      lines = { { id = "dg_default", text = "With what, my good looks? A guard costs more than I make, and the marshals have their hands full already. I trust the Light and my legs." } },
      choices = {
        { text = "The marshals should patrol the roads properly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A man's safety is his own business.", next = "BACK", fx = { align = { order = -1 }, trait = { independent = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "A shop sits still, and customers have to come to it. I'd rather go to them, and besides, Farley would charge me rent for a corner of his inn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've walked these roads since before the walls of Stormwind were rebuilt, and I'll walk them after." } },
    defias = { { id = "tp_defias", text = "They robbed me once and left me my boots. I've decided to call that manners." } },
    _none = { { id = "tp_none", text = "Never heard of it, friend, and I've heard of most things." } },
  },
}
