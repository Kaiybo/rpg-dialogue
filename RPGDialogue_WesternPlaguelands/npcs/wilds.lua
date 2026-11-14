-- The farms and hills of the Western Plaguelands: the ghosts, the dying and the hidden. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "janice", id = TODO_NPC("Janice Felstone"), name = "Janice Felstone",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "felstone_field" }, temper = { "cowardly" }, values = { "loving" },
  notices = { "stealth" },

  greetings = {
    { id = "g_john", text = "John? John, is that you? Oh... no. No, you're someone else. Have you seen him?" },
    { id = "g_cold", text = "It's so cold in the house. Why is it so cold? I lit the fire... didn't I?" },
    { id = "g_free", when = { questDone = TODO_QUEST("Two Halves Become One") }, text = "You came back. I remember you now. I remember everything. It's quieter, remembering." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Someone's there. I can't see you. I can't see anything clearly anymore. But I know." } },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The package has to go before the plague comes. It's by the horse in the barn... isn't it? Am I too late?" },
        { id = "h_charm", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Good Luck Charm") }, { questActive = TODO_QUEST("Two Halves Become One") } } },
          text = "John has the other half of our charm. Bring it, and we'll be together, and nothing can touch us. Not the ghouls. Not the cold. Hurry, John. Please." },
        { id = "h_ghoul", when = { questActive = TODO_QUEST("Two Halves Become One") },
          text = "There's something in the fields. It keeps calling. It sounds a little like John, if John had forgotten all his words." },
        { id = "h_free", when = { questDone = TODO_QUEST("Two Halves Become One") },
          text = "I can see you properly now, and I know what's in the fields, and what I am. It's all right. Soon I'll rest; thank you, stranger." },
        { id = "h_cold", when = { metBefore = true },
          text = "So much to do: pack the cart, feed the horse, write to Emma in Stormwind. Did I write to Emma? Someone should tell her I'm sorry." },
      },
      choices = {
        { text = "I'll find your package.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Who is John?", next = "john", when = { questBefore = TODO_QUEST("Two Halves Become One") } },
        { text = "Rest now.", next = "END", when = { questDone = TODO_QUEST("Two Halves Become One") }, fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    john = {
      lines = {
        { id = "j_default", text = "My John went to see about the noise in the field, and he hasn't come back in. He has the other half of our charm. Tell him to come in, it's getting dark." },
      },
      choices = {
        { text = "I'll look for him.", next = "END", fx = { affinity = 2 } },
        { text = "(Say nothing.)", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't... I can't think about that now. The plague is coming. Can't you smell it?" } },
  },
}

P:NPC {
  key = "mulgris", id = TODO_NPC("Mulgris Deepriver"), name = "Mulgris Deepriver",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "writhing_haunt", "cenarion_circle" }, temper = { "steady" }, values = { "compassionate", "proud" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_dying", text = "Come closer. My voice doesn't carry anymore. Neither do my legs." },
    { id = "g_back", when = { metBefore = true }, text = "You returned. I'm still here. Not for long. Let's not waste it." },
    { id = "g_dead", when = { any = { { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
      text = "(The tauren lies still. Whatever he was holding onto, he's let it go.)" },
  },

  notice = {
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "Yes, I speak your tongue. We aren't beasts, whatever your soldiers say. Put that aside. The land is dying, and it doesn't care whose flag you fly." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you feel it too: the land screaming under the plague. I came to quiet it. I failed. Perhaps you won't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mulgris Deepriver, of the Cenarion Circle. I came to heal these lands, and the plague took me instead. I'll pass soon; the beasts out there suffer on, and don't understand why." },
        { id = "h_wolves", tags = { "news" }, when = { questActive = TODO_QUEST("The Wildlife Suffers Too") },
          text = "The diseased wolves, between Northridge and Dalson's Tears, can't be cured. I tried until it took me too. Give them a quick end; it's the only mercy left out there." },
        { id = "h_rest", when = { questRecent = { TODO_QUEST("The Wildlife Suffers Too"), days = 2 } },
          text = "I felt them go. Quiet, at last. Thank you. There are others still suffering... and I've a little breath left to ask." },
        { id = "h_dead", when = { any = { { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
          text = "(The tauren druid lies unmoving on his bed of straw. His eyes are closed. He looks, for the first time, like he isn't in pain.)" },
        { id = "h_home", when = { metBefore = true },
          text = "I dream of Mulgore. The grass, the wind, the long sky. The Earth Mother will take me home. I'm sure of it. I'm less sure about the land I'm leaving." },
      },
      choices = {
        { text = "I'll ease their suffering.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Can nothing be done for you?", next = "cure", when = { ["not"] = { questActive = TODO_QUEST("Glyphed Oaken Branch") } } },
      },
    },
    cure = {
      big = true,
      lines = {
        { id = "c_default", text = "Nothing. I've known for weeks. Don't grieve for me, little one. Grieve for the wolves, if you must grieve. Then go and help them. That's better than grief.", fx = { learn = { "cenarion_circle" } } },
      },
      choices = {
        { text = "I'll do what you ask.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "It isn't fair.", next = "END", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Arch Druid Hamuul will hear I fell here. Tell him I wasn't alone at the end. You'll be telling the truth." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "The great pots. I felt them from Moonglade. I came because of them. They've won this round." } },
    _none = { { id = "tp_none", text = "I don't have breath to spend on that. Forgive me." } },
  },
}

P:NPC {
  key = "marlene", id = TODO_NPC("Marlene Redpath"), name = "Marlene Redpath",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "sorrow_hill" }, temper = { "gentle" }, values = { "loving" },
  notices = { "class" },

  greetings = {
    { id = "g_pamela", text = "Have you come from the east? From Darrowshire? Please, have you seen a little girl?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Did you... no. I'll let you speak first." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You carry the Light. I can feel it, like a lamp in the window. It's been so long since anyone brought a lamp here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Marlene Redpath. When the battle came to Darrowshire, I hid my niece Pamela, and then... I don't know. I only want to know what became of her." },
        { id = "h_search", tags = { "news" }, when = { questActive = TODO_QUEST("Little Pamela") },
          text = "Darrowshire is east, past Gahrron's Withering. Look for a little girl with a doll. She'd never let go of that doll. Please." },
        { id = "h_found", when = { questDone = TODO_QUEST("Auntie Marlene") },
          text = "You found her. You found my Pamela. Whatever she is now, she remembered me. That's... that's enough. That has to be enough." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange Historian") },
          text = "Joseph's ring is under his monument among the graves. Take it to the strange gnome in Andorhal; she says she can help him. I don't understand how, but I want to believe her." },
        { id = "h_house", when = { metBefore = true },
          text = "This was a good house, once. Joseph used to stop here on the road to Darrowshire. He'd bring Pamela, and she'd chase the chickens. There are no chickens now." },
      },
      choices = {
        { text = "I'll look for Pamela.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "What happened at Darrowshire?", next = "darrowshire" },
      },
    },
    darrowshire = {
      lines = {
        { id = "d_default", text = "The dead came for the town, and everyone fought. Farmers, shopkeepers, children with sticks. We lost. I remember the noise. I don't remember the end. Maybe that's a mercy." },
      },
      choices = { { text = "I'm sorry.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I only know Darrowshire, and the road there, and Pamela." } },
  },
}

P:NPC {
  key = "kirsta", id = TODO_NPC("Kirsta Deepshadow"), name = "Kirsta Deepshadow",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "northridge_hills" }, temper = { "sharp" }, values = { "loyal", "secretive" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_hurt", text = "Ow. Sorry. Hello. Don't mind me, I'm just bleeding quietly." },
    { id = "g_back", when = { metBefore = true }, text = "You found the camp again. Either you're good, or I'm getting sloppy. Let's say you're good." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like someone who's been trained not to be seen. Who trained you? Never mind. I don't want to know. Professional courtesy." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Forsaken? Out here? Keep your voice down. The Crusade would love to find us both, and they wouldn't ask which of us to burn first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kirsta Deepshadow, scout. I was sent to test Hearthglen's defenses, and they tested me back. Somebody in Stormwind thinks that little town matters; not my job to ask why." },
        { id = "h_business", tags = { "news" }, when = { questActive = TODO_QUEST("Unfinished Business") },
          text = "Their camp's south of here, by the little barricade. Medics, hunters, magi, knights. Thin them out. Then we'll talk about the real job." },
        { id = "h_elling", when = { heardLine = "elling.h_default" },
          text = "You've been to Stormwind? Trade District? Then you've probably had the cheese. Don't look at me like that. Everyone's had the cheese." },
        { id = "h_crusade", when = { metBefore = true },
          text = "I believe in the Light as much as anyone in Stormwind. But I watched them hang a farmer for not praying loud enough. That's not the Light. That's a uniform." },
      },
      choices = {
        { text = "Who sent you?", next = "who" },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Elling. I mean... Stormwind. I report to Stormwind. Forget the first word. I've lost a lot of blood." },
      },
      choices = {
        { text = "Forgotten.", next = "END", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Elling Trias? The cheesemaker?", next = "cheese" },
      },
    },
    cheese = {
      lines = {
        { id = "c_default", text = "Lovely man. Wonderful cheddar. Nothing else to say about him. Nothing at all. Are we done? We're done." },
      },
      choices = { { text = "We're done.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Tougher than I gave them credit for. Crueler, too. Hearthglen's full of them." } },
    _none = { { id = "tp_none", text = "That's above my pay. Most things are." } },
  },
}

P:NPC {
  key = "eva_sarkhoff", id = TODO_NPC("Eva Sarkhoff"), name = "Eva Sarkhoff",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "gentle" }, values = { "dutiful", "loving" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_formal", text = "Good day to you. Forgive the state of the grounds. We are no longer able to keep them." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Lucien will be glad. He doesn't say so. He was trained not to." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You're... risen. Like the ones who came to the keep. No. No, your eyes are your own. Forgive me. I still flinch." },
    { id = "n_warlock", cat = "class", when = { class = { "WARLOCK", "MAGE" } },
      text = "You study the arts. So did the young ones who came to the keep, every day, to learn. Please. Be careful what you learn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Eva Sarkhoff, and this is my husband, Lucien. We served House Barov for many years. I was head maid. Lucien was Master Barov's butler. We kept the house, until the house became something else." },
        { id = "h_butcher", tags = { "news" }, when = { questActive = TODO_QUEST("Doctor Theolen Krastinov, the Butcher") },
          text = "Krastinov. The Butcher. He is still in there, doing what he did to us. Please end him. And burn what's left of us, if you find it. We'd like to stop being here." },
        { id = "h_bag", tags = { "news" }, when = { questActive = TODO_QUEST("Krastinov's Bag of Horrors") },
          text = "The Butcher answered to another: Kirtonos. To call him, you'll need what Jandice Barov carries. She was such a quiet girl, once. Bring it to me." },
        { id = "h_herald", tags = { "news" }, when = { questActive = TODO_QUEST("Kirtonos the Herald") },
          text = "Kirtonos. He is the last of them, for us. When he falls, I think we can finally go." },
        { id = "h_done", when = { questDone = TODO_QUEST("Kirtonos the Herald") },
          text = "It's lighter now. I can feel the edges of things going soft. Thank you, truly. Lucien says thank you too. He means it more than he can show." },
        { id = "h_months", when = { metBefore = true },
          text = "We hid in the walls for six months. We stole bread from the kitchen we'd once run. We watched them come every day to learn. I thought, if we're quiet enough, it will pass. It didn't pass." },
      },
      choices = {
        { text = "What happened to you?", next = "story" },
        { text = "I'll help you rest.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
      },
    },
    story = {
      big = true,
      lines = {
        { id = "s_default", text = "They found us. The Butcher kept us for weeks and wouldn't let us die. When he was finished, he let us die, and then woke us, and gave us to the ghouls. I'm sorry. That's not a thing to say to a guest.", fx = { learn = { "scholomance" } } },
      },
      choices = {
        { text = "He'll answer for it.", next = "END", fx = { affinity = 3, align = { light = 1 } } },
        { text = "(Take her hand, if you can.)", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    scholomance = { { id = "tp_scholomance", text = "It was a house. A fine one. The Barovs gave it away for a promise, and everyone in it paid." } },
    _none = { { id = "tp_none", text = "I'm afraid I wouldn't know, {g:sir|madam}. We didn't hear much news, in the walls." } },
  },
}
