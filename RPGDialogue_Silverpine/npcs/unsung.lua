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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll know which mushrooms the spirits like, I expect, and I'd love to know, because I've three here I can't put a name to." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, come to see my mushrooms! I keep them in the dark under the stairs, and they grow better here than anything I tried to grow in life." },
      },
      choices = {
        { text = "Shall I tell you which caps are safe for the living, Gwyn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the mushrooms grow from the plague, Gwyn?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "Where do you find them?", next = "where" },
        { text = "Why mushrooms, of all things?", next = "why" },
        { text = "Which of your mushrooms would a rogue want, Gwyn?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mushrooms grow where demons have walked, Gwyn?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, please do, dear, since I can't taste the difference anymore and I'd hate to poison a guest. The grey ones from Lordamere Lake are fine for the dead, but I had an orc go a shade greener after eating one, which I didn't think was possible." } },
      choices = {
        { text = "Mark the dangerous ones, Gwyn. Your customers deserve it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the living learn for themselves, Gwyn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Some of them, I think, because the ones off the crypt walls are a funny colour, and those I sell only to the apothecaries. The ones from the old logs by the lake are clean as you like, so buy those, dear, and don't ask about the others." } },
      choices = {
        { text = "Then sell only the clean ones, Gwyn, and mark the rest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell them all. The buyer can take care.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The pale caps that grow along the lake shore, because they'll put a living man to sleep for a day and leave a dead one feeling nothing at all. I sell them for cooking, mind, and I don't ask what my customers cook." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You've a cutpurse's way of looking at my stall, counting what's on it and what's under it. Everything under it is poisonous, dear, so I'd stick to what's on top." },
      },
      choices = {
        { text = "A sleeping guard is better than a dead one.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A dead guard never wakes up, Gwyn.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where do you find them all?", next = "where" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, as it happens, and they come up black and smelling of brimstone, so I leave them for the bats. Do keep your little friend off my stall; one trod on a whole tray of caps the last time a warlock stopped by." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "They do, and they come up black and stinking of brimstone, which is more than I can say for the caps that grow on the dead. Keep your little friend off my stall, though, because one trod on a whole tray last week." },
      },
      choices = {
        { text = "I'll keep it off your stall, Gwyn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp goes where it likes, Gwyn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why mushrooms, of all things?", next = "why" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in mail and furs with totems knocking about your belt? Come here and let me at least fix how all that's tied on." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You change shape, I'm told, so tell me, what happens to the robe?" },
      },
      choices = {
        { text = "What's wrong with how I dress, Andrea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you believe it simply comes back, Andrea?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your clothes.", next = "BUSINESS" },
        { text = "Were you a tailor in life?", next = "past" },
        { text = "Where do you get cloth out here?", next = "cloth" },
        { text = "These robes should hold an enchantment well, Andrea.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "My demon keeps scorching my robes, Andrea.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing a little thought couldn't fix, dear, and everything that matters to me. You've a totem knocking against your hip with every step, and in Silverpine you'll want to walk quietly, so let me sew you a loop, and you'll thank me when the worgen don't hear you coming." } },
      choices = {
        { text = "Sew it, then. Good work deserves respect.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My gear suits me fine. Leave it be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I would not, because nothing in my trade simply comes back, and I've spent a lifetime mending what didn't. But I watched one of your sort turn into a bear by the Sepulcher gate and come back without a stitch out of place, so I suppose I must, and I find it very upsetting." } },
      choices = {
        { text = "There's no trick to it. It's honest magic.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Every craft has its secrets. I'll keep mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They'll hold one well enough, provided you don't cast through the sleeves and singe the cuffs, which every mage does sooner or later. I sewed for more Dalaran folk than I care to remember, and not one of them kept a clean cuff." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You wore the violet once, I'd wager, and you stood straighter in it than you're standing now. A robe that fits will make you look like a mage again rather than a corpse in borrowed cloth." },
      },
      choices = {
        { text = "I'll take your advice and stand straighter.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Looks don't win fights, Andrea.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Were you a tailor in life?", next = "past" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Then wear black, since it hides scorch marks far better than grey, and stop letting the thing stand so close. Your demon has terrible manners, and I'd say so to its face if it had a proper one." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc in cloth robes, scorched by his own demon, is a sight I didn't expect in the Sepulcher. Wear black, which hides the marks, and keep the creature a few paces off." },
      },
      choices = {
        { text = "I'll teach the demon some manners, Andrea.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Its manners suit me well enough, Andrea.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do you get cloth out here?", next = "cloth" },
      },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want water and food like any of the living, and I've both, though the water tastes of the crypt." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll be going into the forest, I expect, so buy what you need now, because the forest won't sell you anything." },
      },
      choices = {
        { text = "Could the spirits clean your water, Harly?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is anything in Silverpine still worth saving, Harly?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What makes the forest so dangerous?", next = "forest" },
        { text = "Where should I go from here?", next = "roads" },
        { text = "What does Dalaran owe this forest, Harly?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Which way through Silverpine keeps me out of sight?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They could try, and I'd charge you the same either way. The Sepulcher's water comes from a well the dead have used for a year, and I've had no complaints, though most of my customers can't taste anything." } },
      choices = {
        { text = "I'll clean it for nothing. The living need it too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then the living can fetch their own water.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "The trees, maybe, if you can get the worgen out of them, and Lordamere Lake, if you can get the Dalaran mages off its shore. As for the rest, I count crates for a living, friend, so I'll leave the saving to someone with better odds." } },
      choices = {
        { text = "Then I'll save what I can, odds or no odds.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Save what's useful and let the rest burn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A great deal, since it was a Dalaran archmage who brought the worgen here, and Dalaran mages still squat at Ambermill as if nothing happened. If you've got their kind of magic, use it to clean up their kind of mess." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "If you were Kirin Tor before you died, you'll know Arugal's name, and you'll know the Council never sent anyone to answer for him, only more mages to dig at Ambermill. That should tell you all you need to know about Dalaran's gratitude." },
      },
      choices = {
        { text = "I'll help clean up their mess, for the Sepulcher.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll look after myself first, Harly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What makes the forest so dangerous?", next = "forest" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not the roads, because the worgen watch roads the way you'd watch a door. Go through the trees and keep the lake in sight, and you'll see more than you're seen, mostly." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Not the roads, and not upwind of anything with a nose, because the worgen can smell a Forsaken a long way off. Go through the trees with the lake in sight, and walk soft." },
      },
      choices = {
        { text = "I'll take the trees and stay hidden.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll take the road and face what comes.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Where should I go from here?", next = "roads" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I count crates for a living, so I wouldn't know. Ask the High Executor." } },
  },
}
