-- The Sepulcher's shopkeepers with no quests of their own: the mushroom merchant, the
-- clothier and the general supplier. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC = P.TODO_NPC

-- Gwyn Farrow: sells mushrooms in the Sepulcher's crypts.
P:NPC {
  key = "gwyn", id = TODO_NPC("Gwyn Farrow"), name = "Gwyn Farrow", title = "Mushroom Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "cheerful" }, values = { "practical", "curious" },
  notices = { "hunger", "race" },
  impression = {
    first = "Gwyn Farrow sells mushrooms in the Sepulcher and is far more cheerful about it than anyone in a crypt has a right to be. She knows which caps grow where and which ones will kill a living customer.",
    third = "{name} met Gwyn Farrow, the Sepulcher's mushroom merchant.",
  },
  greetings = {
    { id = "g_shop", text = "Mushrooms, fresh from the damp! Well, as fresh as anything in a crypt, anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more caps? I knew you'd develop a taste for them." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Oh, you're one of the living ones! Then let me steer you toward the caps that won't make you see colours, because some of my stock is meant for stronger stomachs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Gwyn Farrow, and I sell mushrooms to the Sepulcher. They grow well in the dark and the damp, which is the only thing this forest has more of than worgen." },
      },
      choices = {
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "Where do you find them?", next = "where" },
        { text = "Why mushrooms, of all things?", next = "why" },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, dear? I've got all night, and so do the mushrooms." } },
    },
    where = {
      lines = { { id = "w_default", text = "Some grow right here in the crypts, under the stairs where it's wettest, and the best ones grow on the old logs near Lordamere Lake. I don't go out myself anymore, because the worgen near Pyrewood don't care that I'm already dead." } },
      choices = { { text = "What are the worgen, exactly?", next = "worgen" } },
    },
    worgen = {
      lines = { { id = "wg_default", text = "Wolf-men that the wizard Arugal let loose, and they've taken Shadowfang Keep and half the forest with it. The Deathstalkers hunt them, but there always seem to be more of them in the morning." } },
      choices = {
        { text = "Then they must be hunted down, every one.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Some of them might have been people once.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "y_default", text = "Because they grow without sunlight, they keep for weeks, and the dead can eat them without trouble. Before I died I grew turnips, and frankly, mushrooms are much better company." } },
      choices = { { text = "Ha, fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you, dear. Ask the High Executor; he knows everything that moves in this forest." } },
  },
}

-- Andrea Boynton: the Sepulcher's clothier.
P:NPC {
  key = "boynton", id = TODO_NPC("Andrea Boynton"), name = "Andrea Boynton", title = "Clothier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "fussy" }, values = { "proud", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Andrea Boynton sells cloth armor in the Sepulcher and cannot stand to see a garment worn badly. She was a seamstress in life, and her death did nothing to lower her standards.",
    third = "{name} met Andrea Boynton, the clothier of the Sepulcher.",
  },
  greetings = {
    { id = "g_shop", text = "Robes, gloves and boots, and none of them moth-eaten, which is rare in a crypt. Come and look." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and your clothes are worse than last time. Come in before I faint." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you'll understand my pain when I see the stitching on the Deathguards' tabards." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Good grief, you're barely wearing anything at all! I know we're dead, but have some dignity, please." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andrea Boynton, clothier, and I sell robes and cloth armor to the Sepulcher's mages and priests. Most of them come to me looking like they dressed in the dark, which I suppose they did." },
      },
      choices = {
        { text = "Show me your clothes.", next = "BUSINESS" },
        { text = "Were you a tailor in life?", next = "past" },
        { text = "Where do you get cloth out here?", next = "cloth" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick, I have hems to finish." } },
    },
    past = {
      lines = { { id = "p_default", text = "A seamstress in Lordaeron, and a good one, though nobody from those days is left to say so. I made dresses for weddings once, and now I make robes for corpses who don't care how they look." } },
      choices = { { text = "Do you miss making dresses?", next = "past_miss" } },
    },
    past_miss = {
      lines = { { id = "pm_default", text = "I miss the people who wore them, but they're dead or they're Scourge, and neither one needs a dress. So I sew for the Forsaken, and I try to make them look like they still matter." } },
      choices = {
        { text = "That's a kindness, in its way.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The dead don't need to look nice.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "c_default", text = "Wool comes from the farms in Pyrewood and Ambermill, when the Deathstalkers can get it, and the rest is linen from whatever the worgen leave behind. Dalaran's mages up at Ambermill wear lovely silk, and I try not to think about how to get it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Hems and seams are all I know, so take your question to High Executor Hadrec." } },
  },
}

-- Edwin Harly: sells general supplies in the Sepulcher.
P:NPC {
  key = "harly", id = TODO_NPC("Edwin Harly"), name = "Edwin Harly", title = "General Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "dry" }, values = { "practical" },
  notices = { "purse", "weary" },
  impression = {
    first = "Edwin Harly keeps the Sepulcher's general supplies and speaks of Silverpine as a forest that eats travelers. He is dry and blunt, and he means every warning he gives.",
    third = "{name} met Edwin Harly, who sells general supplies in the Sepulcher.",
  },
  greetings = {
    { id = "g_shop", text = "Food, water and bags, enough to get you through the forest if you're careful. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, or whatever we call it? Then the forest hasn't eaten you yet, which is good for business." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've been in the forest, I see, and the forest won that round. Stock up before you go back out." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Edwin Harly, and I keep the supplies for the Sepulcher. Silverpine is a forest that eats travelers, so everything I sell is meant to help you get out of it alive, or as alive as you were when you came in." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What makes the forest so dangerous?", next = "forest" },
        { text = "Where should I go from here?", next = "roads" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, or can I get back to counting what the last cart brought in?" } },
    },
    forest = {
      lines = { { id = "f_default", text = "The worgen first, then the gnolls in the hills, then the Dalaran mages at Ambermill, who don't want anyone near their walls. And the spiders, of course, because no forest in Lordaeron is complete without giant spiders." } },
      choices = { { text = "Why are Dalaran's mages here?", next = "forest_dalaran" } },
    },
    forest_dalaran = {
      lines = { { id = "fd_default", text = "They're building a magical barrier around their ruined city to the east, and they guard it like a dragon guards gold. Dalar Dawnweaver watches them for us, so ask him if you want the details." } },
      choices = {
        { text = "The Forsaken should break that barrier.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let the mages keep to themselves.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = { { id = "r_default", text = "North takes you back to Tirisfal and the Undercity, and south leads to Pyrewood and Shadowfang Keep, where you don't want to go yet. The road east past Lordamere Lake takes you to the Hillsbrad Foothills, where the Deathguard hold Tarren Mill." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I count crates for a living, so I wouldn't know. Ask the High Executor." } },
  },
}
