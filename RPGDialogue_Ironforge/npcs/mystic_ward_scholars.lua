-- The Mystic Ward's quieter doors: Talvash del Kissel, a gnome jeweler whose good name was ruined by a rumour of a cursed
-- necklace (The Shattered Necklace chain, Uldaman; Return of the Ring), and Tymor, a dwarf student of the arcane who wants
-- rubbings of the Highborne runes at Eldarath in Azshara (Arcane Runes). Voices: bibles/mystic_ward_scholars.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Talvash del Kissel
---------------------------------------------------------------------------
P:NPC {
  key = "talvash", id = TODO_NPC("Talvash del Kissel"), name = "Talvash del Kissel",
  bible = "bibles/mystic_ward_scholars.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "vain", "wounded" }, values = { "craft", "reputation" },
  notices = { "craft", "purse" },

  impression = {
    first = "His workbench is very clean and very empty.",
    third = "{name} met Talvash del Kissel, a gnome jeweler in the Mystic Ward whose name was ruined by a rumour that his work was cursed.",
  },

  greetings = {
    { id = "g_default", text = "A customer? A real one? Come in, come in, mind the empty cases, they used to be full and they will be again." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my favorite patron, and very nearly my only one! What can Talvash del Kissel do for you today?" },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Jewelcrafting", "Blacksmithing", "Mining", "Engineering" } },
      text = "You work with your hands, I can see it in the calluses. Then you'll know what it means when someone tells the world your work is rotten, and it isn't." },
    { id = "n_rich", cat = "purse", when = { money = { min = 200000 } },
      text = "That purse looks heavy, friend, and I'm not hinting, but I do have a commission book with a great many blank pages in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Talvash del Kissel, jeweler of great renown here in Ironforge. Well, former renown, I suppose, since a competitor's chicanery has left me without a copper to my good-though-currently-sullied name." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("The Shattered Necklace") },
          text = "Where did you get that? Let me see it. TdK, yes, that's my mark, and that's my setting, and the gems are gone, every one, and so is the paladin who bought it, I suppose." },
        { id = "h_price", tags = { "news" }, when = { questActive = TODO_QUEST("Lore for a Price") },
          text = "Five silver bars, that's all I ask, and then I'll tell you everything about that necklace. I have an order to finish, the first in what seems like an eternity, and I can't finish it with wishes." },
        { id = "h_back", tags = { "news" }, when = { questActive = TODO_QUEST("Back to Uldaman") },
          text = "Find the gems, find the paladin, and use the phial when you have them. And when you tell this story, you tell it right: Talvash del Kissel does not make cursed jewelry." },
        { id = "h_restored", when = { questDone = TODO_QUEST("Restoring the Necklace") },
          text = "The necklace is whole again and it glows like the day I made it, and not one curse in it anywhere. I've had three customers this week, and I'm sure it's because of you." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("Return of the Ring") },
          text = "My ring! Out of a Sparklematic, of all the undignified places. Keep it if you like, it's yours fair and square, but I could make it so much better, for a modest fee." },
      },
      again = {
        { id = "h_again", text = "What else? I have nothing but time, sadly, so take as much of it as you like." },
        { id = "h_again2", text = "Go on, ask. A jeweler with no customers is a very good listener." },
      },
      choices = {
        { text = "What happened to your reputation?", next = "rumor" },
        { text = "Who is this competitor?", next = "competitor" },
        { text = "Tell me about the necklace.", next = "necklace" },
        { text = "Why does your mark turn up in odd places?", next = "mark" },
        { text = "I found your ring in Gnomeregan.", next = "ring", when = { questDone = TODO_QUEST("Return of the Ring") } },
        { text = "I'll come back when I'm buying.", next = "END" },
      },
    },

    rumor = {
      lines = { { id = "ru_default", text = "A paladin bought one of my finest necklaces and went down into Uldaman wearing it, and he never came back up. Then a competitor of mine started telling everyone that my necklace cursed him, and nobody, but nobody, buys cursed jewelry." } },
      choices = {
        { text = "Could it have been cursed?", next = "curse" },
        { text = "Something else, Talvash.", next = "BACK" },
      },
    },
    curse = {
      big = true,
      lines = { { id = "cu_default", text = "Cursed! Uldaman killed him, and anyone who's been down there will tell you it doesn't need help from a necklace. I've half a mind to start a rumour of my own about my competitor's rings, and see how he likes it." } },
      choices = {
        { text = "Don't stoop to his level. Let the truth clear you.", next = "BACK", reply = "The truth, my friend, is a very slow horse, and rumour has already lapped it twice around Ironforge, but very well, I shall try to be dignified about it.", fx = { align = { honor = 1 } } },
        { text = "Do it. Fight a rumour with a better rumour.", next = "BACK", reply = "Oh, I like you, and I've a few lovely little whispers already drafted about his rings, though I suppose a jeweler of my standing should hesitate a moment.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    competitor = {
      lines = { { id = "co_default", text = "I won't say his name in my own shop, because it would only give him the pleasure of being talked about. He works across the Ward and makes rings as fat as sausages, and the nobles from Stormwind buy them by the boxful." } },
      choices = {
        { text = "Jealousy doesn't suit you, Talvash.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    necklace = {
      lines = { { id = "ne_default", text = "Three gems, a ruby, a sapphire and a topaz, set in silver with a little enchantment woven through the setting to make the stones sing in candlelight. It was the best thing I ever made, and now it's in pieces somewhere under the Badlands." } },
      choices = {
        { text = "Can it be restored?", next = "restore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    restore = {
      lines = { { id = "re_default", text = "If someone found the gems, yes, and I'd reassemble it so it glowed brighter than before. All I'd ask in return is that whoever found them tells every tavern from here to Stormwind that Talvash del Kissel does not make cursed items." } },
      choices = {
        { text = "I'll tell them myself.", next = "BACK", fx = { affinity = 2, learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mark = {
      lines = { { id = "ma_default", text = "Because I've sold a great many pieces over the years, and adventurers lose things, and machines swallow them, and trolls wear them in their ears. TdK, the seal of Ironforge and the initials, and I put it on everything, so it always finds its way home." } },
      choices = {
        { text = "That's a clever habit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ring = {
      lines = { { id = "ri_default", text = "Out of a Sparklematic 5200, which I'm told cleans things, though what it was doing with my ring I'll never know. It was an early piece and a simple design, and I'm far better now, as you've seen." } },
      choices = {
        { text = "I'll keep it as it is, thanks.", next = "BACK" },
        { text = "It's a fine ring. Thank you, Talvash.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    uldaman = { { id = "tp_uldaman", text = "A hole in the Badlands full of stone giants and troggs and dead paladins, and my best work is somewhere in it." } },
    _none = { { id = "tp_none", text = "I couldn't say. Is it made of silver? If it's made of silver, I'm interested." } },
  },
}

---------------------------------------------------------------------------
-- Tymor
---------------------------------------------------------------------------
P:NPC {
  key = "tymor", id = TODO_NPC("Tymor"), name = "Tymor",
  bible = "bibles/mystic_ward_scholars.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "earnest", "absent" }, values = { "knowledge", "curious" },
  notices = { "class", "race" },

  impression = {
    first = "He asked whether I'd been to Azshara before he asked my name.",
    third = "{name} met Tymor, a dwarf student of the arcane in the Mystic Ward who collects the runes of the old elves of Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Oh, a visitor, an' ye've not knocked anythin' over yet. Come in, but mind the papers on the floor, they're in order, even if it doesnae look it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye're back! I've worked out two more glyphs since last time, an' I'm fair burstin' to tell someone." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "Ye've the arcane about ye, I can feel it on the back o' my neck. Ye'll understand these runes better than most dwarves, then, an' ye'll understand why they frighten me a wee bit." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf! Can ye read the old script? No, I suppose yer people put it away a long time ago, an' I think I understand why." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tymor, student o' the arcane, an' aye, a dwarf, before ye say it. I've an interest in Azshara, back when the elves practised their magic there openly, an' they left runes in public places for anyone to ponder, an' I mean to ponder every one o' them." },
        { id = "h_burden", tags = { "news" }, when = { questActive = TODO_QUEST("Passing the Burden") },
          text = "So ye've come about Azshara! Good, good, I hoped somebody would. Pull up a crate, for I've a drawin' kit an' a task for ye." },
        { id = "h_runes", tags = { "news" }, when = { questActive = TODO_QUEST("Arcane Runes") },
          text = "Four runes at the Ruins o' Eldarath, an' I need a rubbin' of each: Beth'Amara, Jin'yael, Markri an' Sael'hai. Then signal Pilot Xiggs from the wee island off the southern point, an' he'll fly ye out before the naga notice." },
        { id = "h_runes_done", tags = { "news" }, when = { questDone = TODO_QUEST("Arcane Runes") },
          text = "The rubbin's are up on the wall, all four, an' I've been starin' at them for three nights runnin'. I think they're rules, laws o' magic, an' I think the elves who wrote them were very sure o' themselves." },
      },
      again = {
        { id = "h_again", text = "What else? Ask away, I love a question." },
        { id = "h_again2", text = "Go on, the runes have waited ten thousand years, they can wait a wee bit more." },
      },
      choices = {
        { text = "Why does a dwarf study elven magic?", next = "why" },
        { text = "What do the runes say?", next = "runes" },
        { text = "Who else wants the ruins?", next = "rivals" },
        { text = "Who is Pilot Xiggs?", next = "xiggs" },
        { text = "I can read a little of that arcane script.", next = "mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "I'll leave you to your runes.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wy_default", text = "Because the Explorers' League digs up our past, an' our past keeps bumpin' into everybody else's. The Titans, the elves, the old empires, they're all tangled together, an' I'd like to understand the knot before somebody pulls it too hard." } },
      choices = {
        { text = "That's a dangerous knot to pick at.", next = "danger" },
        { text = "Something else, Tymor.", next = "BACK" },
      },
    },
    danger = {
      big = true,
      lines = { { id = "da_default", text = "Aye, it is. The elves who wrote these runes thought magic was as holy as their moon goddess, an' look what became of their land. Some o' my friends say I should burn the rubbin's an' study somethin' safe, like rocks, but ye cannae learn from a mistake ye refuse to read." } },
      choices = {
        { text = "Some knowledge is better left buried. Burn them.", next = "BACK", reply = "Ye sound like my friends, an' they mean well, but burnin' them wouldnae make the danger go away, it would only make sure we didnae know it was comin'.", fx = { align = { order = 1 }, learn = { "highborne" } } },
        { text = "Read everything. Ignorance is the real danger.", next = "BACK", reply = "That's what I keep sayin', an' it's good tae hear it from somebody who's seen the world, so I'll keep rubbin' runes until my fingers turn black.", fx = { align = { order = -1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    runes = {
      lines = { { id = "ru_default", text = "Rules, mostly, or insights, carved where every passer-by could read them, like a notice board for wizards. One says somethin' about the cost o' drawin' power from a well, an' I've read it forty times an' I still cannae decide whether it's a warnin' or a boast." } },
      choices = {
        { text = "Maybe it's both.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "eldarath" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rivals = {
      lines = { { id = "ri_default", text = "The Explorers' League isn't the only one interested in Eldarath, I'll tell ye that much. There are naga all over those ruins, an' they don't let anyone near the runes without a fight, an' I've heard there are others diggin' who aren't so friendly either." } },
      choices = {
        { text = "I'll watch my back.", next = "BACK", fx = { learn = { "explorers_league" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xiggs = {
      lines = { { id = "xi_default", text = "Pilot Xiggs Fuselighter, a gnome who flies anywhere for a fee, an' lands nearly anywhere for a bigger one. He's waitin' off the coast o' Azshara for whoever I send, an' he's never once dropped a passenger, an' for a gnome pilot that's near a miracle." } },
      choices = {
        { text = "That's reassuring.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mage = {
      lines = { { id = "mg_default", text = "Do ye, now? Then come an' look at this one, the long curl here, for I think it's a word for well, but it could be source, or it could be thirst. If it's thirst, I'd like to know what the elves were thirsty for." } },
      choices = {
        { text = "It's thirst. And I think you know for what.", next = "BACK", fx = { affinity = 2, learn = { "highborne" } } },
        { text = "It's well, Tymor. Nothing more.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    eldarath = { { id = "tp_eldarath", text = "Ruins in Azshara, full o' runes an' naga. I'd give my left boot to see them myself, but my knees disagree." } },
    _none = { { id = "tp_none", text = "I don't know that one, but if it's written down somewhere, I'd like to read it." } },
  },
}
