-- Marshal's Refuge: the Marshal Expedition's last camp at the crater's northern rim. Voice: bibles/ungoro.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "williden", id = TODO_NPC("Williden Marshal"), name = "Williden Marshal",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "warm" }, values = { "curious", "responsible" },
  notices = { "level", "kit" },

  greetings = {
    { id = "g_refuge", text = "Welcome, welcome! You made it up the rim in one piece. That puts you ahead of most of my expedition." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece! The crater must like you. It doesn't like many." },
  },

  notice = {
    { id = "n_young", cat = "level", when = { maxLevel = 50 },
      text = "You're braver than you are seasoned, friend. Stay near the rim until you've grown into the crater." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Raptors? Or the plants? Don't laugh, the plants bite here too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Williden Marshal, leader of the Marshal Expedition. My sister and I brought scholars and explorers down into Un'Goro for crystals and rare plants. The crater had other plans. We lost our base camps and fell back up here." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("Williden's Journal") },
          text = "My journal! Somewhere back in the old camp. Everything we learned before we ran is in those pages." },
        { id = "h_salvation", when = { questActive = TODO_QUEST("Expedition Salvation") },
          text = "Our supplies are scattered across the crater. Every crate you bring back is another week we can stay. Another week of discovery." },
      },
      choices = {
        { text = "What's dangerous down there?", next = "danger" },
        { text = "I'll help the expedition.", next = "END", fx = { affinity = 2, standing = { marshals_refuge = 1 } } },
      },
    },
    danger = {
      big = true,
      lines = {
        { id = "d_default", text = "Everything. Raptors that hunt in packs. Stegodons that charge anything that moves. Pterrordax overhead. And the devilsaurs. There's one the size of a house we call King Mosh. If the ground shakes, don't stop to look. Run." },
      },
      choices = { { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not sure! But if it lives in the crater, it probably bites." } },
  },
}

P:NPC {
  key = "linken", id = TODO_NPC("Linken"), name = "Linken",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "earnest" }, values = { "brave", "honorable" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_hello", text = "Hello, traveler! I'm sure I know something important. I just can't remember what. Have we met?" },
    { id = "g_back", when = { metBefore = true }, text = "You! I remember you! That's a good sign, isn't it? I'm remembering things!" },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Do you know me? No? Pity. I'm not much for gadgets, I think. I think I'm a warrior. It feels right." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Like me! I'm almost sure I'm a warrior. The sword feels right in my hand, anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me Linken. I think it's my name. I came to this crater on a mission, from somewhere far away. Then my raft broke up in the marsh, something hit my head, and the rest went with the raft." },
        { id = "h_secret", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("It's a Secret to Everybody") }, { questActive = TODO_QUEST("Linken's Sword") } } },
          text = "You found my things? My sword! I'd know it anywhere. Well. I'd know it here." },
        { id = "h_adventure", when = { any = { { questActive = TODO_QUEST("Linken's Adventure") }, { questActive = TODO_QUEST("It's Dangerous to Go Alone") } } },
          text = "It's coming back. A fire elemental. Blazerunner. And a flame, a golden one, that I was meant to bring home. I think you'd better be the one to finish it. Just in case I forget again." },
      },
      choices = {
        { text = "What do you remember?", next = "memory" },
        { text = "I'll help you remember.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
    memory = {
      lines = {
        { id = "m_default", text = "Bits. Green fields. A sword. Someone telling me never to set off alone. I can't see their face. I wandered for days after the raft, and that one piece of advice walked me here." },
      },
      choices = { { text = "Then you're not alone now.", next = "END", fx = { affinity = 3 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I might have known that once! Ask me again later." } },
  },
}

P:NPC {
  key = "jdcollie", id = TODO_NPC("J.D. Collie"), name = "J.D. Collie",
  bible = "bibles/ungoro.md", role = "scholar", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "eager" }, values = { "curious", "persistent" },
  notices = { "class" },

  greetings = {
    { id = "g_cave", text = "Welcome to my cave! Mind the crystals. Some of them hum. The humming is fine. It's when they stop humming you should worry." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "SHAMAN" } },
      text = "Can you feel them? The crystals? Something in them answers to people like you. I've been trying to work out what for months." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "J.D. Collie, Marshal Expedition. I study the crystals. Every color, all over the crater, all doing different things. Put the right ones together and you get something wonderful. Put the wrong ones together and you get singed." },
        { id = "h_sense", tags = { "news" }, when = { questActive = TODO_QUEST("Making Sense of It") },
          text = "I've got notes, I've got samples, I've got theories. What I need is someone to help me make sense of all of it. That's you, if you're willing." },
        { id = "h_linken", when = { any = { { questActive = TODO_QUEST("A Gnome's Assistance") }, { questActive = TODO_QUEST("Linken's Memory") } } },
          text = "Linken! Poor fellow. I think the crystals might help him. Or at least they won't make it worse. Probably." },
        { id = "h_aquementas", when = { questActive = TODO_QUEST("Aquementas") },
          text = "There's a water spirit called Aquementas. It may be able to help with what Linken needs. Be polite. Spirits that old take offense easily." },
      },
      choices = { { text = "I'll gather crystals.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea! But give me a week and a crystal, and I'll have a theory." } },
  },
}

P:NPC {
  key = "spraggle", id = TODO_NPC("Spraggle Frock"), name = "Spraggle Frock",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "anxious" }, values = { "loyal", "kind" },
  notices = { "weary" },

  greetings = {
    { id = "g_hello", text = "Oh, hi, hello! Welcome to the Refuge! Did you come up from the south? Did you see a goblin? Skinny, loud, name of Ringo?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Oh no, you got hurt down there too? Sit. Drink something. Everybody keeps getting hurt down there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Spraggle Frock, Marshal Expedition. I run supplies. Or I did, before the camps fell. Now I mostly worry. About Ringo, mostly. He went off toward the volcano and he hasn't come back." },
        { id = "h_lost", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Lost!") }, { questActive = TODO_QUEST("A Little Help From My Friends") } } },
          text = "You found him? Is he alright? He's dried out like a husk? Oh, that's so Ringo. Bring him home. Please." },
        { id = "h_pterrordax", when = { questActive = TODO_QUEST("Beware of Pterrordax") },
          text = "The pterrordax keep swooping on the supply runs. Big, angry, flying lizards. Thin them out, and the runners can breathe again." },
      },
      choices = { { text = "I'll look for Ringo.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_steamwheedle", text = "I came out from Gadgetzan. Steady work, they said. Now I sleep on a ledge above dinosaurs." } },
    _none = { { id = "tp_none", text = "Sorry, I don't know! Ask Williden? He knows things." } },
  },
}
