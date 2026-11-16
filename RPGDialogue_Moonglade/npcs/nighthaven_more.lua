-- Nighthaven, the people earlier passes skipped (0.38.0): the tauren druid trainer and the Cenarion Circle's supplier. Voice: bibles/nighthaven.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "lorelae", id = TODO_NPC("Lorelae Wintersong"), name = "Lorelae Wintersong", title = "Cenarion Supplier",
  bible = "bibles/nighthaven.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "gracious" }, values = { "dutiful", "nature" },
  impression = {
    first = "Lorelae Wintersong keeps the Cenarion Circle's goods in Nighthaven, sold to those who've earned the Circle's trust. She keeps careful track of who has.",
    third = "{name} met Lorelae Wintersong, who sells the Cenarion Circle's supplies in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Good evening, traveller. The Circle's wares are here for those who have earned them." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Let me see if the Circle thinks better of you than it did last time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Lorelae, and I keep the Circle's supplies in Nighthaven. Most of what I hold is for friends of the Circle, and friendship, as Remulos says, is grown and not bought." },
        { id = "h_cond", when = { race = "NightElf" }, text = "One of our own, come home to the glade. Walk with Elune, sister or brother, and take your time here." },
      },
      again = {
        { id = "h_again1", text = "Anything else I can help you with?" },
        { id = "h_again2", text = "Yes?" },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What does the Circle sell?", next = "goods" },
        { text = "How does one earn the Circle's trust?", next = "trust" },
        { text = "It's good to be in the glade again.", next = "elf", when = { race = "NightElf" } },
        { text = "Thank you, Lorelae.", next = "END" },
      },
    },
    goods = {
      lines = {
        { id = "goods_default", text = "Patterns and formulas the druids have shared, mostly, and things the Circle needs made. Most of them I can only offer to those the Circle trusts, and the Circle is slow to trust." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = {
        { id = "trust_default", text = "By helping where the world is sick, in Felwood and Silithus and wherever else the land cries out. The druids remember who came to help, and so do I." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    elf = {
      lines = {
        { id = "elf_default", text = "It always is, and the glade knows its own. Stay for the lake at moonrise, if you can spare the time." },
      },
      choices = {
        { text = "I might. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the Circle's stores, and I keep them honestly." } },
    _none = { { id = "tp_none", text = "That I couldn't tell you, I'm afraid." } },
  },
}
