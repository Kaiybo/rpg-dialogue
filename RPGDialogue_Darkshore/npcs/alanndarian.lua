-- Alanndarian Nightsong of Auberdine: strider stew and the sickly deer (0.72.0). Voice: bibles/alanndarian.md
-- Classic: Easy Strider Living; The Principal Source (turn-in), Gathering the Cure, Curing the Sick (with the Cenarion Circle).
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "alanndarian", id = TODO_NPC("Alanndarian Nightsong"), name = "Alanndarian Nightsong",
  bible = "bibles/alanndarian.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "warm", "brisk" }, values = { "healing", "hospitality" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Alanndarian Nightsong stirs a pot of strider stew with one hand and mixes salve for sick deer with the other. She feeds anyone who sits still long enough, and she means to cure half of Darkshore while she does.",
    third = "{name} met Alanndarian Nightsong of Auberdine, a cook with a secret strider stew who is working with the Cenarion Circle to cure Darkshore's sickly deer.",
  },

  greetings = {
    { id = "g_hello", text = "Do you smell that? Fresh strider stew, my own recipe, and no, you can't have it for free." },
    { id = "g_strider", when = { questActive = TODO_QUEST("Easy Strider Living") }, text = "The pot is empty and I'm hungry, {name}! Strider meat, five good cuts, if you please." },
    { id = "g_cure", when = { questActive = TODO_QUEST("Gathering the Cure") }, text = "Earthroot and lunar fungus, and mind the moonkin in those caves. They've been short-tempered lately." },
    { id = "g_deer", when = { questActive = TODO_QUEST("Curing the Sick") }, text = "Ten doses, ten deer. Every one you reach is one less I lie awake over." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the stew's been made and eaten three times since. Sit down; there's a fourth." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, grown broad as a strider since you first fetched meat for my pot. I'd like to think my stew had something to do with it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Half of Auberdine says you've been helping out, and the other half hasn't noticed yet. Come and eat; you've earned it." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you'll know to brown the strider before it ever sees the water. Don't tell anyone I told you." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You're an herbalist, aren't you? Then I'll never have to beg anyone for earthroot again, if you'll be my friend." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 20, resting = true },
      text = "You look half starved, sitting there. Strider stew is the answer to most of life's troubles, and most of Darkshore's too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Alanndarian Nightsong. I cook, mostly, and lately I've been doctoring the deer of Darkshore too, because something has made them sick and nobody else was doing it, at least until the Cenarion Circle took an interest." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Easy Strider Living") },
          text = "Perhaps you'd like to learn my strider stew? First prove you can handle the beasts: bring me a few cuts of their meat, and I may be persuaded to show you how it's done." },
        { id = "h_strider_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Easy Strider Living"), days = 3 } },
          text = "Fantastic meat! Now try a bowl and tell me honestly what you think, though if you say it needs salt, we will be having words." },
        { id = "h_source", tags = { "news" }, when = { questActive = TODO_QUEST("The Principal Source") },
          text = "You're the one the Cenarion Circle sent from Moonglade? Wonderful! Have you the water sample Dendrite Starblaze promised me?" },
        { id = "h_source_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Principal Source"), days = 3 } },
          text = "By Elune, this water is disgusting, and no wonder the deer are sick. Something is fouling the falls, and through them the whole of Darkshore's water." },
        { id = "h_cure_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gathering the Cure"), days = 3 } },
          text = "This is enough for ten good doses of salve, at least to start. Imagine a cure that could undo any poison at all without knowing what it was! I can dream, can't I?" },
        { id = "h_sick_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Curing the Sick"), days = 5 } },
          text = "The deer by the river are standing straight again, and one ate from my hand this morning. Thank you, {name}, and tell Dendrite that Auberdine thanks the Circle too." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren in Auberdine! Are you here for the Circle too? You must be, because nobody comes this far for the weather." },
      },
      again = {
        { id = "h_again", text = "What else, {name}? I've a pot to stir, so talk while I do it." },
        { id = "h_again2", text = "Go on, then. The deer won't cure themselves, but they can wait a moment." },
      },
      choices = {
        { text = "What's wrong with the deer?", next = "deer" },
        { text = "What's in the strider stew?", next = "stew" },
        { text = "How did the Cenarion Circle get involved?", next = "circle" },
        { text = "What's fouling Cliffspring Falls?", next = "falls", when = { questDone = TODO_QUEST("The Principal Source") } },
        { text = "Could I heal the deer myself?", next = "heal_a", when = { class = { "DRUID", "PRIEST", "SHAMAN", "PALADIN" } } },
        { text = "Have you work for me?", next = "BUSINESS" },
        { text = "Goodbye, Alanndarian.", next = "END" },
      },
    },

    deer = {
      lines = {
        { id = "de_default", text = "They stagger and grow thin, and their eyes go dull, and then they lie down by the water and don't get up. It started by the river north of here, and now they're sick as far south as the Ashenvale border." },
      },
      choices = {
        { text = "Is it the same madness as the bears?", next = "deer_bears" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deer_bears = {
      lines = {
        { id = "db_default", text = "Tharnariun thinks his bears and my deer share a sickness, and I think he's half right. The water's poisoned, but there's something else at work too, something that wants Darkshore sick." },
      },
      choices = {
        { text = "Something that wants it? Who?", next = "deer_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deer_who = {
      big = true,
      lines = {
        { id = "dw_default", text = "I don't know, and I'm a cook, not a Sentinel. But there are those in Darnassus who see the signs and those who look away, and I know which I'd rather be." },
      },
      choices = {
        { text = "Then I won't look away either.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Darnassus will act when it's sure. Trust the elders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stew = {
      lines = {
        { id = "st_default", text = "Strider, browned first, then the roots I won't name, and a long slow simmer while I insult the pot. The secret's in the insults, I think; the striders certainly respond to them." },
      },
      choices = {
        { text = "You're keeping the roots a secret?", next = "stew_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stew_secret = {
      lines = {
        { id = "ss_default", text = "Of course, because a cook with no secrets is just someone with a pot. Bring me strider meat and I'll teach you the recipe, roots and all, but not the insults; those you'll have to invent yourself." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Goodbye, Alanndarian.", next = "END" },
      },
    },

    circle = {
      lines = {
        { id = "ci_default", text = "I wrote to Moonglade when the first deer died, and I didn't expect an answer, honestly. Dendrite Starblaze sent one, and then he sent helpers, and that's how I came to be mixing salves instead of soups." },
      },
      choices = {
        { text = "Do you trust the Circle?", next = "circle_trust" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    circle_trust = {
      lines = {
        { id = "ct_default", text = "I trust anyone who answers a letter about sick deer. That's a short list in this world, so I'm keeping them on it." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
        { text = "Goodbye, Alanndarian.", next = "END" },
      },
    },

    falls = {
      big = true,
      lines = {
        { id = "fa_default", text = "Something in the cave behind the falls, where naga have taken up living. Whatever they're doing in there, it runs out with the water and into every stream in Darkshore." },
      },
      choices = {
        { text = "Then the naga must be driven out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The cure comes first. The deer can't wait.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal_a = {
      lines = {
        { id = "ha_default", text = "You could ease one, I expect, but the sickness comes back with the next drink of water. My salve stays in the blood longer, so take that with you and use your gifts on the ones too far gone for it." },
      },
      choices = {
        { text = "I'll do both, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A cook in Auberdine who got into the doctoring business by accident. The deer don't seem to mind that I'm not qualified." } },
    advice = { { id = "tp_ad", text = "Never drink from a stream in Darkshore until you've seen a deer drink from it and walk away. And eat something, would you?" } },
    cenarion_circle = { { id = "tp_circle", text = "They answer letters, and they send help. I can't say that of most people.", next = "circle" } },
    _none = { { id = "tp_none", text = "I've no idea, {name}, but I can tell you how to cook it, whatever it is." } },
  },
}
