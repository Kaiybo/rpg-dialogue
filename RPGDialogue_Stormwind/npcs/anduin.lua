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
      again = { { id = "h_again", text = "Do you have another question? I like questions. Nobody asks me any." } },
      choices = {
        { text = "Do you miss your father?", next = "father" },
        { text = "What do you do when you're not being king?", next = "fun" },
        { text = "Would you like a prayer for your father?", next = "prayer", when = { class = "PRIEST" } },
        { text = "What's the Highlord like?", next = "bolvar" },
        { text = "Do you like Lady Prestor?", next = "prestor" },
        { text = "Would you like a paladin's blessing?", next = "bless", when = { class = "PALADIN" } },
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
        { text = "He'd be proud of you.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Keep saying it. Kings have to.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    king = {
      lines = {
        { id = "k_default", text = "Mostly listening. The Highlord talks, Lady Prestor talks, the nobles talk. I listen. Then I ask a question and they all go quiet." },
      },
      choices = {
        { text = "That sounds like a good king.", next = "BACK", fx = { affinity = 1 } },
        { text = "What do you ask?", next = "ask" },
      },
    },
    fun = {
      lines = { { id = "fu_default", text = "Read. Watch the guards change. Sneak into the Cathedral when Bolvar's at council. Don't tell anyone that last one. You're the second person who knows." } },
      choices = { { text = "Your secret's safe, Your Majesty.", next = "BACK", fx = { affinity = 2 } } },
    },
    prayer = {
      big = true,
      lines = { { id = "pr_default", text = "Would you? A short one. One I can remember at night, when the Keep's quiet and I'm not supposed to be awake." } },
      choices = {
        { text = "\"Light, keep him safe, wherever he is, and bring him home.\"", next = "prayer_said",
          fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } },
          journal = { first = "Taught the boy king a prayer for his father. He said it back to me twice, to be sure he had it.",
                      third = "{name} taught King Anduin a prayer for his missing father." } },
        { text = "The Light hears you without the words.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    prayer_said = {
      lines = { { id = "ps_default", text = "Light, keep him safe, wherever he is, and bring him home. There. I'll say it every night. Thank you. Don't tell Lady Prestor. She says prayers are for people without armies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bolvar = {
      lines = { { id = "bo_default", text = "Kind. Tired. He thinks I don't notice he's tired. He reads me stories about my father when nobody's watching. They're all about battles. I like the ones where Father wins." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    prestor = {
      lines = { { id = "pe_default", text = "She's very clever. She doesn't laugh much. I try to make her laugh at dinner. It hasn't worked yet. Bolvar laughs, though, so it's not all wasted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bless = {
      lines = { { id = "bl_default", text = "Really? Here, in the throne room? Bolvar does it before council sometimes. Go on. I'll stand very still. Kings are good at standing still." } },
      choices = { { text = "Light keep you, Your Majesty.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } } },
    },
    ask = {
      lines = { { id = "a_default", text = "Usually, \"but what about the people who aren't here?\" They hate that one." } },
      choices = { { text = "Keep asking it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    westfall = { { id = "tp_westfall", text = "I asked about Westfall at council. Everyone went quiet. That's how I know it's bad." } },
    defias = { { id = "tp_defias", text = "Bolvar won't say much about them when I'm in the room. I hear anyway. I'm small, not deaf." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall showed it to me once. I wasn't allowed to touch it. I touched it a little." } },
    _none = { { id = "tp_none", text = "I don't know. I'm only ten. But I'll ask Bolvar for you, if you like." } },
  },
}
