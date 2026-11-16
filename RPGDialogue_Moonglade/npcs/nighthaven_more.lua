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
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Circle trusts deeds, not banners or faiths, and it remembers both kinds of deed. Heal the sick lands in Felwood, and the druids will speak your name kindly, whatever it is you pray to." } },
      choices = {
        { text = "Then I'll earn it with deeds, in Felwood and beyond.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't need the Circle's trust to do good.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Circle trusts deeds, and a rogue's deeds are usually done where no one can see them, which makes the trusting harder. Cleanse a songflower in Felwood, though, and the druids will remember who did it, quiet or not." } },
      choices = {
        { text = "Then I'll do my work where the druids can see.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Deeds done unseen are still deeds, Lorelae.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the arcane borrows from the world and seldom pays it back, and the Circle has watched that debt come due before. A druid's work leaves the land as whole as it found it, and that's the only kind of craft I'm trusted to sell." } },
      choices = {
        { text = "There's wisdom in leaving the world whole.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Borrowing is how anything great gets built.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It's been done, I'm told, though not often, and never by talking. Help heal what your craft has harmed, in Felwood and wherever else the land is sick, and the druids may yet forgive the company you keep." } },
      choices = {
        { text = "Then I'll heal what I can, for the forest's sake.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Forgiveness is their concern. I'll keep my company.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Lorelae, and I keep the Circle's supplies in Nighthaven. Most of what I hold is for friends of the Circle, and friendship, as Remulos says, is grown and not bought." },
        { id = "h_cond", when = { race = "NightElf" }, text = "One of our own, come home to the glade. Walk with Elune, sister or brother, and take your time here." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Circle sells its wares to those it trusts, and trust in Moonglade is grown, not bought, but I'm glad to see what you'll grow." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. The Circle's goods are counted twice a day, and I'm the one who counts them, so I'd ask you to keep your hands where I can see them." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Most of what I hold was made by druid hands, without a spark of the arcane in it, and the Circle prefers it that way." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'll be courteous, as the Keeper asks, but the Circle's wares are for its friends, and the Circle is slow to befriend those who carry the fel." },
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
        { text = "Does the Circle trust a priest of the Horde, Lorelae?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Circle trust a rogue at all, Lorelae?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why does the Circle prefer goods without the arcane in them?", next = "xmage", when = { class = "MAGE" } },
        { text = "Could a warlock ever earn the Circle's friendship, Lorelae?", next = "xlock", when = { class = "WARLOCK" } },
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
