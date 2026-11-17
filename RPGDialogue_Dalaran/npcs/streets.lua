-- Dalaran's rebuilt streets: Brammold Deepmine, Lizi Silverstone (Eclipse with Shears) and Pollero Rene (Path of Renewal).
-- Documentation on these three is thin: they talk about their work, their street and their neighbours. Voice: bibles/dalaran.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_brammold", id = TODO_NPC("Brammold Deepmine"), name = "Brammold Deepmine",
  bible = "bibles/dalaran.md", role = "vendor", tier = "service",
  communities = { "dalaran" }, temper = { "gruff", "chatty" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "Brammold Deepmine sells old things to wizards and seems to enjoy the haggling more than the money. A dwarf among magi, and not the least bit bothered by it.",
    third = "{name} met Brammold Deepmine, a dwarf who deals in antiques in Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Antiques, old an' odd, {g:lad|lass}. Look all ye like, but mind yer beard near the humming shelf." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Well, a beard in Dalaran! Come in, come in, and mind the shelves." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' I've three new old things in since, if ye follow me. Have a look, an' I'll give ye an honest price." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear somebody in the city got taken in by a smooth tongue. I sell honest antiques at honest prices, friend, an' I'd like it tae stay that way in here." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf among the wizards! Ye'll want an ale and a quiet word after a day of this lot, I'll wager." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brammold Deepmine, dealer in antiques. Dalaran's full of old things, friend, and half of them hum, so I sell the quiet half and keep a wary eye on the rest." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus, eh? Then don't go pokin' the humming ones. Last fellow who did lost an eyebrow, and I lost a customer." },
      },
      again = { { id = "h_again", text = "Anything else catch yer eye? Take yer time; good stone an' old silver don't rush, an' neither do I." } },
      choices = {
        { text = "Where do your antiques come from?", next = "where" },
        { text = "What's a dwarf doing among wizards?", next = "dwarf" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Good day.", next = "END" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Here and there, from magi clearing out their cellars and families who'd rather have coin than grandfather's candlesticks. The city's being put back together, and folk find all sorts when they move the stones." },
      },
      choices = {
        { text = "Anything that hums is staying on that shelf, then?", next = "where_hum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_hum = {
      lines = {
        { id = "wu_default", text = "On that shelf, under that cloth, with the Kirin Tor's leave written in my ledger. I'm an honest trader, and I've no wish to explain to an archmage why my stock got up and walked off." },
      },
      choices = { { text = "Wise man.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "Sellin' to them, mostly, and some of them pay in gold that doesn't vanish by morning. Ironforge has its Explorers' League and I've got my table; we both like old things, and I like mine with a price on." },
      },
      choices = {
        { text = "Gold that stays gold. Can't argue with that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Old things, odd things and the occasional heirloom. The stories come free; the candlesticks don't." } },
    explorers_league = { { id = "tp_league", text = "Good folk, if they'd stop diggin' long enough to sell anything. I do the sellin' for them, in a manner of speaking." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye. If it isn't old, or dug from under a mountain, I don't know about it." } },
  },
}

P:NPC {
  key = "dal_lizi", id = TODO_NPC("Lizi Silverstone"), name = "Lizi Silverstone",
  bible = "bibles/dalaran.md", role = "scholar", tier = "service",
  communities = { "dalaran", "kirin_tor" }, temper = { "chatty" }, values = { "curious", "learned" },
  notices = { "race" },

  impression = {
    first = "Lizi Silverstone of the Kirin Tor talks quickly and works quicker, with two cats underfoot that she insists aren't hers. She seems happiest when something needs fixing.",
    third = "{name} met Lizi Silverstone, a gnome of the Kirin Tor at Eclipse with Shears in Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Hello! Watch your feet; there's a cat under them, probably, at roughly a seventy percent likelihood." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "Oh, a fellow gnome! Come in, and step over Beepo; he won't move." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "From Gnomeregan? Me too, once, a long time before it all went wrong. We'll not talk about it, and we'll both feel better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lizi Silverstone, Kirin Tor, late of Gnomeregan's arcane workshops! And yes, those two are Beepo and Niko, and no, they aren't mine; they belong to the shop, or the shop belongs to them, depending on whom you ask." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "Another magus! Don't mind the mess; half this street was rubble not long ago, and the other half still thinks it is." },
      },
      again = { { id = "h_again", text = "Anything else? Be quick, Niko's eyeing my notes, and I've only got two copies of each, which is one fewer than I'd like." } },
      choices = {
        { text = "A gnome in the Kirin Tor?", next = "gnome" },
        { text = "Why are there so many cats in Dalaran?", next = "cats" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Plenty of us came to Dalaran to study, long before the dome went up, and the Kirin Tor never minded the height so long as the sums came out. A few more of us came to stay after Gnomeregan." },
      },
      choices = {
        { text = "Do you miss Gnomeregan?", next = "gnome_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_miss = {
      lines = {
        { id = "gm_default", text = "Every day, and I'd rather fix this city than cry about that one. Besides, these stones don't glow green at night, which already puts Dalaran ahead." },
      },
      choices = { { text = "That's a good way to see it.", next = "BACK", fx = { affinity = 1 } } },
    },
    cats = {
      lines = {
        { id = "ca_default", text = "Nobody knows! Since the dome came down, there's one in every doorway that's been rebuilt, as if they'd been waiting for someone to put the roofs back on." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, once. I won't talk about it here, if it's all the same." } },
    _none = { { id = "tp_none", text = "No idea! Ask in the Citadel, they love a question, nearly as much as a gnome loves a spare gear." } },
  },
}

P:NPC {
  key = "dal_pollero", id = TODO_NPC("Pollero Rene"), name = "Pollero Rene",
  bible = "bibles/dalaran.md", role = "scholar", tier = "service",
  communities = { "dalaran", "kirin_tor" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "Pollero Rene of the Kirin Tor keeps an eye on the Path of Renewal and speaks of it like a gardener speaks of a bed that's only just been planted. A cat named Zara keeps him company, on her own terms.",
    third = "{name} met Pollero Rene, a magus of the Kirin Tor who watches over Dalaran's Path of Renewal.",
  },

  greetings = {
    { id = "g_default", text = "Good day. Mind the fresh paving." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the street's had two new stretches of paving in that time. Mind them, please, for they're still fresh." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you've been kind to someone in the city. These streets are coming back slowly, and a kind word helps them along." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Pollero Rene, of the Kirin Tor. I keep watch on the Path of Renewal, which is a grand name for a street that's still half scaffolding." },
        { id = "h_helped", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") },
          text = "You're the one Modera speaks of. The street's been calmer since you went up the Citadel, and I've slept better for it." },
      },
      again = { { id = "h_again", text = "Anything else? Zara's waiting for her share of my attention." } },
      choices = {
        { text = "Why call it the Path of Renewal?", next = "name" },
        { text = "Is that your cat?", next = "zara" },
        { text = "Good day.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "Because every stone on it was laid after the fall, I'd say, and because someone on the council likes grand names. Every one of us who walks it lost something when the city broke." },
      },
      choices = {
        { text = "What did you lose?", next = "name_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_lost = {
      lines = {
        { id = "nl_default", text = "More than I'd tell a stranger, and less than many. That's why I walk it every day; it's a good street for remembering and then getting on with things." },
      },
      choices = { { text = "Then I'll leave you to it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    zara = {
      lines = {
        { id = "za_default", text = "That's Zara, and she belongs to nobody, which she'd tell you herself if she cared to. She chose this street before any of us did." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's beyond my street, I'm afraid. Try the Citadel." } },
  },
}
