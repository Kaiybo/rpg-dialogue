-- Brother Danil, general supplies, Northshire Abbey. Voice: bibles/danil.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "danil", id = TODO_NPC("Brother Danil"), name = "Brother Danil",
  bible = "bibles/danil.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "sharp" },
  notices = { "purse", "kit" },

  greetings = {
    { id = "g_faithful", text = "Supplies for the faithful, and for anyone else with coin." },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Browsing is free. Everything else, regrettably, is not." },
    { id = "g_regular", when = { timesTalked = { min = 6 } }, text = "My best customer! Don't tell the others." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "I don't sell trousers. I wish I did, for your sake." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bread, water, a little thread. The Abbey's stores are humble, but honest." },
        { id = "h_rich", when = { money = { min = 100000 } }, text = "Ten gold on you, at least. I can hear it. The Abbey roof leaks, you know." },
        { id = "h_roof", when = { metBefore = true }, text = "The roof leaked on the bread again. I've told the Brothers. They told me to pray. I prayed. It rained." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Just looking.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "t_none", text = "I keep the stores, not the secrets. Ask Brother Neals." } },
  },
}
