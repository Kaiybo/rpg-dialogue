-- Stonard: the Horde's fortress in the Swamp of Sorrows. Voice: bibles/swampofsorrows.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ruag", id = TODO_NPC("Dispatch Commander Ruag"), name = "Dispatch Commander Ruag",
  bible = "bibles/swampofsorrows.md", role = "soldier", tier = "major",
  communities = { "stonard" }, temper = { "methodical" }, values = { "dutiful", "practical" },
  notices = { "kit", "class" },

  greetings = {
    { id = "g_hall", text = "Another pair of boots, good. I send them out, and the swamp sends back what's left of the maps." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and dry-ish, so report." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Mud to the knees and armor in pieces, so you've been doing real work. Get mended." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! I need eyes that read tracks in mud, and my scouts would be glad of the company." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dispatch Commander Ruag. Stonard is the Horde's eyes in these lands; from here we scout what nobody has charted, and we send word back faster than anyone else can." },
        { id = "h_aggrogosh", when = { heardLine = "aggrogosh.h_default" },
          text = "You've come from Grom'gol? Aggro'gosh pushes his caravans through jungle and over mountains to reach us. Every one that arrives, I count too." },
        { id = "h_disgraced", tags = { "news" }, when = { questActive = TODO_QUEST("The Disgraced One") },
          text = "There's an orc out in the swamp who left in disgrace, and he may still be useful, so go and find out." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Missing Orders") },
          text = "Orders went out and never arrived, which happens in this swamp, but it still has to be fixed." },
      },
      choices = {
        { text = "Why scout a swamp?", next = "scout" },
        { text = "Send me out.", next = "END", fx = { affinity = 1, standing = { stonard = 1 } } },
      },
    },
    scout = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the Dark Portal isn't far, and neither are the ogres or the old temple. A Horde that knows the ground wins fights before they start." },
      },
      choices = { { text = "Makes sense.", next = "END", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not charted yet, so do you want the job?" } },
  },
}

P:NPC {
  key = "felzerul", id = TODO_NPC("Fel'zerul"), name = "Fel'zerul",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "grim" }, values = { "loyal", "sharp" },
  notices = { "class" },

  greetings = {
    { id = "g_temple", text = "You feel it too? The swamp hums near the Pool of Tears, because something old is awake down there." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, then, so you'll know the difference between power you hold and power that holds you. The trolls in that temple forgot it." },
    { id = "n_troll", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear the spirits, so you know that down by the temple they aren't speaking, they're screaming." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Fel'zerul, and the Warchief sent me to watch the Temple of Atal'Hakkar. The trolls who built it worshipped something terrible, and something there is stirring." },
        { id = "h_pool", tags = { "news" }, when = { questActive = TODO_QUEST("Pool of Tears") },
          text = "The Pool of Tears hides what's left of the temple's outer works. Bring me what the old priests left behind." },
        { id = "h_exile", when = { any = { { questActive = TODO_QUEST("The Atal'ai Exile") }, { questActive = TODO_QUEST("Return to Fel'Zerul") } } },
          text = "One of the Atal'ai was cast out by his own, and an exile knows what the faithful won't say, so find him." },
        { id = "h_temple", when = { questActive = TODO_QUEST("The Temple of Atal'Hakkar") },
          text = "Into the temple, then, and bring enough friends, and then bring more than that." },
      },
      choices = { { text = "What's stirring?", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Fools! I walk the same road they did, and I stopped where the Warchief told us to, but they didn't." } },
    _none = { { id = "tp_none", text = "Ask me about the temple instead, because that I know too much about." } },
  },
}

P:NPC {
  key = "helgrum", id = TODO_NPC("Helgrum the Swift"), name = "Helgrum the Swift",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "restless" }, values = { "loyal", "brave" },
  notices = { "kit" },

  greetings = {
    { id = "g_post", text = "Can't stand still in this place, because the mud's always trying to keep you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough road? The roads out of here are all rough, and Neeka would laugh at your boots." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Helgrum the Swift, and they call me that because I'm fast, not because I'm clever. Neeka Bloodscar's the clever one, and she's out there somewhere." },
        { id = "h_neeka", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Neeka Bloodscar") }, { questActive = TODO_QUEST("Report to Helgrum") } } },
          text = "Neeka's been out a long while, and if you find her, she'll have a report for me; she always does." },
        { id = "h_fast", when = { metBefore = true }, text = "I ran to the edge of the swamp and back this morning, before breakfast, and don't ask me why, because I wasn't thinking. I'm the swift one, remember." },
      },
      choices = { { text = "I'll look for her.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, but ask Neeka when she's back, because she knows things." } },
  },
}

P:NPC {
  key = "bengor", id = TODO_NPC("Bengor"), name = "Bengor",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "stoic" }, values = { "proud", "dutiful" },
  notices = { "weary" },

  greetings = {
    { id = "g_cough", text = "Don't look at me like that; it's the swamp air, and everyone coughs here." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like I feel, so sit, and we'll be sick together and say nothing about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bengor's my name. I've served the Horde longer than you've been alive, and I'll keep serving until something stops me, and nothing has yet." },
        { id = "h_orders", when = { questActive = TODO_QUEST("The Missing Orders") },
          text = "Somebody carried those orders into the swamp and didn't carry them out, so find out what happened." },
        { id = "h_talker", tags = { "news" }, when = { questActive = TODO_QUEST("The Swamp Talker") },
          text = "Find the Swamp Talker for me, because I want to know if the stories are true before I'm done." },
      },
      choices = {
        { text = "Are you ill?", next = "ill" },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    ill = {
      lines = { { id = "i_default", text = "I'm old, old and stubborn, and if it's an illness, it's going to have to try harder." } },
      choices = { { text = "Fair enough.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Before my time, or after it, but either way, not mine." } },
  },
}

P:NPC {
  key = "karakul", id = TODO_NPC("Innkeeper Karakul"), name = "Innkeeper Karakul",
  bible = "bibles/swampofsorrows.md", role = "innkeeper", tier = "service",
  communities = { "stonard" }, temper = { "gruff" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Boots off by the door, because the mud stays outside, even if you don't have to." },
    { id = "g_home", when = { homeInn = { "Stonard" } }, text = "Back in Stonard, then. Your bed's dry, and that's the best thing anyone can say in this swamp." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half-drowned and half-dead, so sit and eat, in that order." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Slow down, because if you fall in the swamp drunk, the crocolisks get supper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Karakul. Scouts come back muddy and hungry, and I send them out fed, which isn't glory, but it keeps the Horde walking." },
        { id = "h_mud", when = { metBefore = true }, text = "The scouts track half the swamp in on their boots, so I've started charging them a bucket of water each, and they pay in mud." },
      },
      choices = { { text = "Just a meal, thanks.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I feed scouts, and the scouts know things, so ask them." } },
  },
}
