-- King Anduin Wrynn, ten years old, Stormwind Keep. Voice: bibles/anduin.md
-- Trying to be the king the kingdom needs while his father is missing.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "anduin", id = TODO_NPC("King Anduin Wrynn"), name = "King Anduin Wrynn",
  bible = "bibles/anduin.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "wonder", "far" },

  greetings = {
    { id = "g_formal", text = "Welcome to Stormwind Keep. Um. Be welcome. That's how you say it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I mean. The crown recognizes you." },
  },

  notice = {
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = { "cat", "bear" } },
      text = "Is that- you were a person! Can you do that whenever you like? Highlord, did you see? Oh. He's not looking." },
    { id = "n_pet", cat = "wonder", when = { pet = { type = "Beast" } },
      text = "Does {pet} have a title? Everyone in the Keep has a title. I could give {pet} one. I'm allowed." },
    { id = "n_skyborne", cat = "far", when = { race = "Skyborne" },
      text = "You're one of the elves from the sky! Lady Prestor says not to stare. I'm only staring a little." },
    { id = "n_dwarf", cat = "far", when = { race = { "Dwarf", "Gnome" } },
      text = "Did you come on the tram? I've never been on the tram. Kings aren't allowed. I asked." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm the king. For now. Until my father comes back. Everyone's been very kind about it." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "You're a paladin. Bolvar says paladins are the Light's hands. Do your hands feel any different?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The priests at the Cathedral let me sit in on lessons sometimes. Don't tell Lady Prestor. She thinks it's a waste of a king's time." },
        { id = "h_hero", when = { minLevel = 40 },
          text = "The Highlord reads your name out at council sometimes. I always sit up straighter when he does." },
      },
      choices = {
        { text = "Do you miss your father?", next = "father" },
        { text = "What's it like being king?", next = "king" },
        { text = "Long live the king.", next = "END", fx = { affinity = 1 } },
      },
    },
    father = {
      big = true,
      lines = {
        { id = "f_default", text = "Every day. Everyone says he's coming home. I say it too, when the people are frightened. It helps them. I think it helps me." },
      },
      choices = {
        { text = "He'd be proud of you.", next = "END", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Keep saying it. Kings have to.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    king = {
      lines = {
        { id = "k_default", text = "Mostly listening. The Highlord talks, Lady Prestor talks, the nobles talk. I listen. Then I ask a question and they all go quiet." },
      },
      choices = {
        { text = "That sounds like a good king.", next = "END", fx = { affinity = 1 } },
        { text = "What do you ask?", next = "ask" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "Usually, \"but what about the people who aren't here?\" They hate that one." } },
      choices = { { text = "Keep asking it.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    bolvar = {
      { id = "ta_bolvar", text = "He's kind to me, and he's tired all the time. I try not to make him more tired. It's harder than it sounds." },
    },
    king_anduin = {
      { id = "ta_self", text = "That's me, I suppose. It still sounds like someone else's name." },
    },
    varian = {
      { id = "ta_varian", text = "My father. He'll come home. Everyone says so. Except the ones who stop talking when I walk in." },
    },
    little_secret = {
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "Sometimes I hide in the library so nobody can find me to bow. The librarians know. They don't tell." },
    },
    my_trade = {
      { id = "ta_trade", text = "Listening, mostly. Everyone tells me what they want. Lord Bolvar says the trick is hearing what they need." },
    },
    background = {
      { id = "ta_bg", text = "I was crowned because my father didn't come home. I wear the crown, but in my head it's still his." },
    },
    westfall = { { id = "tp_westfall", text = "I asked about Westfall at council. Everyone went quiet. That's how I know it's bad." } },
    defias = { { id = "tp_defias", text = "Bolvar won't say much about them when I'm in the room. I hear anyway. I'm small, not deaf." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall showed it to me once. I wasn't allowed to touch it. I touched it a little." } },
    _none = { { id = "tp_none", text = "I don't know. I'm only ten. But I'll ask Bolvar for you, if you like." } },
  },
}
