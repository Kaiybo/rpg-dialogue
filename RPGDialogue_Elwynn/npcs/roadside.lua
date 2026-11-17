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
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A fellow in Darkshire sold it to me for a pair of boots, and he seemed very glad to be rid of it, which I'll admit was a bad sign. I've carried it since, and it hasn't done anything strange yet, except the humming." } },
      choices = {
        { text = "Best to leave a strange crystal alone, Antonio.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A humming crystal is worth studying. I'll take a closer look.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Afraid's a strong word, but I've never sold anything to a demon, and I've no wish to start, because I don't know what they pay in. I'll stick to customers with honest coins, if you don't mind." } },
      choices = {
        { text = "My demon will stay back. You'll deal only with me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Demons pay in power, Antonio. You'd be surprised.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Antonio Perelli, traveling salesman, at your service. Goldshire to Eastvale and back again, and I sell whatever I carry to whoever stops to look." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Hm, you've quick hands, friend, so let's keep them where I can see them while you browse, eh? No offense meant." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll want something rare, I can tell. I've a crystal from Duskwood that hums in the dark, though I'm not sure it's meant to." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock on my road, and with something at your heel, I see. I'll sell you anything you like, but I'd ask you to keep it out of my packs." },
      },
      again = {
        { id = "h_again", text = "What else? My feet need the rest anyway." },
        { id = "h_again2", text = "Ask away, ask away. Talking's free, even if the goods aren't." },
      },
      choices = {
        { text = "Let's see what you carry.", next = "BUSINESS" },
        { text = "Isn't the road dangerous alone?", next = "danger" },
        { text = "Why not keep a shop in town?", next = "shop" },
        { text = "Where did a crystal from Duskwood come from?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are you afraid of my demon, Antonio?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
    _none = { { id = "tp_none", text = "Can't say I know it, and believe me, a man on this road hears a great deal." } },
  },
}
