-- King Anduin Wrynn, ten years old, Stormwind Keep. Voice: bibles/anduin.md
-- Trying to be the king the kingdom needs while his father is missing.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "anduin", id = TODO_NPC("King Anduin Wrynn"), name = "King Anduin Wrynn",
  bible = "bibles/anduin.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "wonder", "far", "form" },

  greetings = {
    { id = "g_formal", text = "Welcome to Stormwind Keep! Um, I mean, be welcome; I think that's how you're supposed to say it." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I mean, the crown recognizes you, and it's very glad you're here." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You've gone all dark and see-through! Is that the Light, only backwards? Does it hurt? Bolvar will want to know if it hurts." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = { "cat", "bear" } },
      text = "Is that- you were a person a moment ago! Can you do that whenever you like? Highlord, did you see that? Oh, he's not even looking." },
    { id = "n_pet", cat = "wonder", when = { pet = { type = "Beast" } },
      text = "Does {pet} have a title? Everyone in the Keep has one, and I could give {pet} a title, because I'm allowed." },
    { id = "n_skyborne", cat = "far", when = { race = "Skyborne" },
      text = "You're one of the elves from the sky! Lady Prestor says not to stare. I'm only staring a little." },
    { id = "n_dwarf", cat = "far", when = { race = { "Dwarf", "Gnome" } },
      text = "Did you come on the tram? I've never been on it, because kings aren't allowed, though I did ask." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "You just went dark! Can you do it again? Slowly, so I can see?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm the king, at least until my father comes home. Everyone's been very kind about it, though I don't think I'm very good at it yet." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "You're a paladin. Bolvar says paladins are the Light's hands. Do your hands feel any different?" },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The priests at the Cathedral let me sit in on lessons sometimes. Don't tell Lady Prestor. She thinks it's a waste of a king's time." },
        { id = "h_hero", when = { minLevel = 40 },
          text = "The Highlord reads your name out at council sometimes. I always sit up straighter when he does." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "It's you! I asked the guards to tell me if you came, and they did, so I'm not supposed to run but I nearly did." },
      },
      again = { { id = "h_again", text = "Do you have another question? I like questions, and hardly anybody asks me any." } },
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
        { id = "f_default", text = "Every day. Everyone says he's coming home, and I say it too when the people are frightened, because it helps them. I think it helps me, too." },
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
      lines = { { id = "fu_default", text = "I read, and I watch the guards change, and I sneak into the Cathedral when Bolvar's at council. Don't tell anyone that last one; you're the second person who knows." } },
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
        { text = "Prayers won't bring him home, Your Majesty, but the Regent's soldiers might.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The Light hears you without the words.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    prayer_said = {
      lines = { { id = "ps_default", text = "Light, keep him safe wherever he is, and bring him home. There, I'll say it every night, and thank you. Only don't tell Lady Prestor, because she says prayers are for people without armies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bolvar = {
      lines = { { id = "bo_default", text = "Kind, and tired, though he thinks I don't notice he's tired. He reads me stories about my father when nobody's watching, and they're all about battles, but I like the ones where Father wins." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    prestor = {
      lines = { { id = "pe_default", text = "She's very clever, but she doesn't laugh much, so I try to make her laugh at dinner. It hasn't worked yet, though Bolvar laughs, so it's not all wasted." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "You can tell me what you really think of her.", tag = "Persuade", next = "prestor_true",
          check = { pass = { any = { { disposition = { min = 60 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "prestor_proper", fx = { affinity = -1 } } },
      },
    },
    bless = {
      lines = { { id = "bl_default", text = "Really? Here, in the throne room? Bolvar does it before council sometimes, so go on, and I'll stand very still. Kings are good at standing still." } },
      choices = {
        { text = "Light keep you, Your Majesty.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "Kings make their own luck, Your Majesty. You don't need my blessing.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "Usually, \"but what about the people who aren't here?\" They hate that one." } },
      choices = {
        { text = "Keep asking it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Learn when to stay quiet, Your Majesty, because courts punish awkward questions.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    prestor_true = {
      big = true,
      lines = {
        { id = "pt_default", text = "Promise you won't tell? I don't like the way she looks at me when she thinks I'm not looking, as if I were a sum she's working out. It's silly, I know, because she's never been anything but kind." },
        { id = "pt_father", text = "And when anyone talks about Father coming home she goes very still and very polite, and the hair on my arms stands up. Bolvar says that's only because I'm tired, so it probably is." },
      },
      choices = {
        { text = "It isn't silly to trust your own feelings.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I won't tell anyone, Your Majesty.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    prestor_proper = {
      lines = {
        { id = "pp_default", text = "Lady Prestor is a valued advisor to the crown, and the crown is very grateful for her counsel. That's what I'm meant to say, and I'm saying it." },
        { id = "pp_default2", text = "I'm not supposed to talk about my advisors with people. Bolvar says it's the first rule of being king, and I've already broken lots of the others today." },
      },
      choices = {
        { text = "Fair enough, Your Majesty.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear a lot at council, because everyone forgets I'm there. Ask me about any of it and I'll tell you, as long as it isn't a secret." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You can ask me about anything here, and I'll tell you the parts Bolvar skips, too." },
    },
    westfall = { { id = "tp_westfall", text = "I asked about Westfall at council. Everyone went quiet. That's how I know it's bad." } },
    defias = { { id = "tp_defias", text = "Bolvar won't say much about them when I'm in the room, but I hear anyway. I'm small, not deaf." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall showed it to me once. I wasn't allowed to touch it. I touched it a little." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid; I'm only ten. But I'll ask Bolvar for you, if you like." } },
  },
}
