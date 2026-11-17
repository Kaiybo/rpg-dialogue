-- Dorion, hunter trainer in the Cenarion Enclave, and his wolf Shadow (0.72.0). Voice: bibles/dorion.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "dorion", id = TODO_NPC("Dorion"), name = "Dorion", title = "Hunter Trainer",
  bible = "bibles/dorion.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "dry" }, values = { "patience", "loyalty" },
  notices = { "pet", "class" },
  impression = {
    first = "Dorion trains hunters in the Enclave with a grey wolf named Shadow lying across his feet. He says more to the wolf than to his students, and the wolf seems to listen better.",
    third = "{name} met Dorion, a hunter trainer of the Cenarion Enclave who keeps a wolf called Shadow.",
  },

  greetings = {
    { id = "g_hello", text = "Shadow's decided you're harmless. I'll take her word for it, for now." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Back for more, hunter? Good, then let's see what the forest has taught you since I last did." },
    { id = "g_away", when = { away = 14 }, text = "Shadow noticed you were gone {away} before I did. She always does." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10, class = "HUNTER" }, text = "You've grown into your bow since we last met. Shadow has stopped watching your hands, which means she trusts them." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you've been leaning on folk about the city. A good hunter doesn't need to frighten what it isn't hunting, remember that." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has a good coat and clear eyes, so you're feeding it properly. Shadow wants to say hello, if you don't mind her sniffing." },
    { id = "n_nopet", cat = "class", when = { class = "HUNTER", pet = false },
      text = "No companion with you today? A hunter alone is only half a hunter. Shadow thinks so too, and she's never wrong about these things." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Dorion, and I teach hunters here at the Enclave, as I taught them in Ashenvale before the tree was planted. This is Shadow, who teaches them more than I do, so mind your manners around her and she'll mind hers around you." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Then sit, and tell me what you've tracked and what's tracked you, and I'll tell you what you did wrong." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Enclave visiting the hunters? Shadow can tell, you know. She sniffs at druids as if she's not sure which one of you is the wolf." },
      },
      again = {
        { id = "h_again", text = "Something else? Shadow's in no hurry, and neither am I." },
        { id = "h_again2", text = "Ask. I'm listening, and so is she." },
      },
      choices = {
        { text = "Tell me about Shadow.", next = "shadow" },
        { text = "What makes a good hunter?", next = "hunting" },
        { text = "How do I bond with a beast?", next = "bond", when = { class = "HUNTER" } },
        { text = "I'd like to train.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Goodbye, Dorion.", next = "END" },
      },
    },
    shadow = {
      lines = {
        { id = "sh_default", text = "I found her in Ashenvale as a pup, half drowned in Lake Falathim, and she's been at my heels ever since. She's grey at the muzzle now, but she still beats me up the Enclave stairs." },
      },
      choices = {
        { text = "May I stroke her?", next = "shadow_stroke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_stroke = {
      lines = {
        { id = "ss_default", text = "Ask her, not me. Hold out the back of your hand and wait; if she leans in, you've your answer." },
      },
      choices = {
        { text = "She's leaning in.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Goodbye, Dorion.", next = "END" },
      },
    },
    hunting = {
      big = true,
      lines = {
        { id = "hu_default", text = "Patience, mostly, and respect for what you kill. The forest feeds the hunter who takes what he needs, and it starves the one who takes for pride." },
      },
      choices = {
        { text = "I hunt only what I need.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The strong hunt as they please.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bond = {
      lines = {
        { id = "bo_default", text = "Feed it before you feed yourself, and never ask it to fight something you wouldn't. A beast will forgive you a great deal, but not being used." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A hunter who got too old to range far and too stubborn to stop. So I teach." } },
    advice = { { id = "tp_ad", text = "Watch your companion's ears. They'll hear trouble a full breath before you do." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Shadow might know, but she isn't saying, and nightsabers keep their secrets longer than elves do." } },
  },
}
