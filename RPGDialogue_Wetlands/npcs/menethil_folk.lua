-- Menethil Harbor folk we'd missed: Tapoke "Slim" Jahn (the Missing Diplomat's informer), Fremal Doohickey (first aid),
-- Telurinon Moonshadow (herbalism), Bethaine Flinthammer (stable master), Stuart Fleming (fishing supplies), Brahnmar (armorer).
-- Voice: bibles/menethil_folk.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_DIPLOMAT = TODO_QUEST("The Missing Diplomat")

---------------------------------------------------------------------------
-- Tapoke "Slim" Jahn
---------------------------------------------------------------------------
P:NPC {
  key = "wl_slim", id = TODO_NPC("Tapoke \"Slim\" Jahn"), name = "Tapoke \"Slim\" Jahn",
  bible = "bibles/menethil_folk.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "cowardly", "sharp" }, values = { "self", "profit" },
  notices = { "class", "race", "stealth" },

  impression = {
    first = "Tapoke Jahn, whom everyone calls Slim, is a thin, quick-eyed man who sits near the Deepwater Tavern's door with a drink he never finishes. He watches the room the way a cat watches a kitchen, and he talks the way a man talks when he's working out how far he can run.",
    third = "{name} met Tapoke \"Slim\" Jahn, a small-time rogue in Menethil Harbor who took Defias coin to help someone aboard a ship that should never have been touched.",
  },

  greetings = {
    { id = "g_default", text = "Evening, friend. No, no, sit wherever you like, I was only resting my eyes near the door." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've nothing in my pockets, I've nowhere to be, and I'm very much enjoying my drink, so let's keep it friendly." },
    { id = "g_after", when = { questDone = Q_DIPLOMAT }, text = "Ah. The one who sat on me. My ribs still remember you fondly, if you were wondering." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of the trade, then. I can always tell by the boots, and by the way you checked the windows before you checked me." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can hear you breathing, you know. Nobody in this tavern breathes that carefully unless they're up to something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tapoke Jahn, but call me Slim, everyone does, on account of my figure and my chances. I'm just a man having a quiet drink in a harbor where nothing ever happens, which is exactly how I like it." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_DIPLOMAT },
          text = "You've been talking to Mikhail at the bar, haven't you, and now you're walking over here with that look on your face. Listen, whatever he told you, I can explain, and I can explain it sitting down." },
        { id = "h_done", when = { questDone = Q_DIPLOMAT },
          text = "I told you everything I knew, and I'm still here, which means either you believed me or you think I'll lead you to someone better. Either way I'm drinking slower these days." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A fellow professional, and in Menethil of all places! Have a seat, friend, and let's not either of us pretend we're here for the fish." },
        { id = "h_human", when = { race = "Human", faction = "Alliance" },
          text = "Stormwind by the accent, aren't you? I was too, once, till the city got too honest for a man of my talents." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down, the walls in this place have ears and some of them have knives." },
        { id = "h_again2", text = "Go on, but sit with your back to the wall, it's only polite." },
      },
      choices = {
        { text = "What do you know about the Defias?", next = "defias", when = { questActive = Q_DIPLOMAT } },
        { text = "Tell me again what they paid you for.", next = "confess", when = { questDone = Q_DIPLOMAT } },
        { text = "What brings you to Menethil?", next = "menethil" },
        { text = "Why do you sit by the door?", next = "door" },
        { text = "How does a rogue earn a living here?", next = "trade", when = { class = "ROGUE" } },
        { text = "Enjoy your drink, Slim.", next = "END" },
      },
    },

    defias = {
      lines = { { id = "de_default", text = "The Defias? Masons with grudges, I always heard, who took to robbing roads when Stormwind wouldn't pay them. Can't say I've ever met one, and I'd like that written down somewhere official." } },
      choices = {
        { text = "Mikhail says you were watching us.", next = "defias_watch" },
        { text = "You're lying, Slim.", next = "defias_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias_watch = {
      lines = { { id = "dw_default", text = "Everyone watches everyone in a tavern, it's the only entertainment Menethil has. All right, all right, I may have been listening, but listening's not a crime in Menethil, not yet." } },
      choices = {
        { text = "Then you won't mind answering a few questions.", next = "confess" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias_lie = {
      lines = { { id = "dl_default", text = "Of course I am, I'm a rogue in a dockside tavern, it's practically my job. But a lie's only a crime if it hurts somebody, and mine are mostly small and friendly." } },
      choices = {
        { text = "This one might have hurt a lot of people.", next = "confess" },
        { text = "Something else.", next = "BACK" },
      },
    },

    confess = {
      big = true,
      lines = {
        { id = "co_default", text = "They paid me to get one man aboard a ship in this harbor, a soldier called Hendel, and they paid well enough that I didn't ask whose ship it was. Only it wasn't some diplomat's ship, it was the king's, and I swear on my mother I didn't know until it was done." },
        { id = "co_after", when = { questDone = Q_DIPLOMAT }, text = "Same as I told you before: one man, Hendel, aboard the king's ship, and a purse of Defias silver that's long gone. They're working with someone bigger than themselves, and I've no wish to meet them." },
      },
      choices = {
        { text = "You sold out your king for silver.", next = "confess_king" },
        { text = "Who else was in on it?", next = "confess_who" },
        { text = "You told the truth in the end. That counts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'll hang for this, Slim, and you've earned it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    confess_king = {
      lines = { { id = "ck_default", text = "I sold a soldier passage on a boat, which I've done a dozen times for smugglers and runaway apprentices. The king's business was the Defias's doing, and I'm only the fool who held the door." } },
      choices = {
        { text = "Holding the door is enough.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confess_who = {
      lines = { { id = "cw_default", text = "I don't know, and I made a point of not knowing, which is how you live long in my line of work. But the Defias don't pay like that out of their own pockets, and the man who handed me the silver had very clean hands." } },
      choices = {
        { text = "Clean hands. I'll remember that.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    menethil = {
      lines = { { id = "me_default", text = "Ships, friend, ships from everywhere and sailors who've just been paid. A man with quick fingers and a friendly face could do worse than a harbor town with one road out." } },
      choices = {
        { text = "One road out, and the Dragonmaw on it.", next = "menethil_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menethil_road = {
      lines = { { id = "mr_default", text = "That's why I take boats. The Dragonmaw have never once picked my pocket, whereas the harbor guard manage it every time I come through." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },

    door = {
      lines = { { id = "do_default", text = "Because the door is where the air is freshest, the light is best, and the distance to the docks is shortest. Purely matters of health, I assure you." } },
      choices = {
        { text = "And if somebody comes through it looking for you?", next = "door_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    door_run = {
      lines = { { id = "dr_default", text = "Then I wish them a pleasant evening and step out for some of that fresh air. It's worked for years, friend, though I'll admit it didn't work on you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    trade = {
      big = true,
      lines = { { id = "tr_default", text = "Small jobs, friend, carrying a letter, losing a crate, finding a berth for somebody who'd rather not be asked his name. Never anything that ends up in Stormwind's ears, or so I thought." } },
      choices = {
        { text = "Even a rogue needs lines he won't cross.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every job's just a job. Your mistake was getting caught.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ships, sailors, who's paying and who's running. Ask quietly." } },
    background = { { id = "tp_bg", text = "Stormwind once, Menethil now, and somewhere with a faster boat next if I've any sense.", next = "menethil" } },
    defias = { { id = "tp_defias", text = "Silver from them is heavy, friend, heavier than it looks, and it keeps getting heavier.", next = "confess" } },
    _none = { { id = "tp_none", text = "Never heard of it, and I'd like to keep it that way." } },
  },
}

---------------------------------------------------------------------------
-- Fremal Doohickey
---------------------------------------------------------------------------
P:NPC {
  key = "wl_fremal", id = TODO_NPC("Fremal Doohickey"), name = "Fremal Doohickey",
  title = "Bandage Trainer",
  bible = "bibles/menethil_folk.md", role = "trainer", tier = "service",
  communities = { "menethil" }, temper = { "brisk", "friendly" }, values = { "care", "craft" },
  notices = { "kit", "race" },

  impression = {
    first = "Fremal Doohickey is a gnome with spectacles pushed up into his wild hair and a roll of linen in each coat pocket. He teaches first aid in the Deepwater Tavern, and he talks about bandages the way other gnomes talk about engines.",
    third = "{name} met Fremal Doohickey, the gnome who teaches bandaging in Menethil Harbor's Deepwater Tavern.",
  },

  greetings = {
    { id = "g_default", text = "Hold still, hold still, is that blood or swamp water? Either way, sit down and let me look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, mostly! I'll take some of the credit, if you don't mind." },
  },

  notice = {
    { id = "n_hurt", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in tatters, which means whatever was under it probably is too. Sit, sit." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Tell me you've been keeping your bandage tension at the proper ratio, because nobody else ever does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fremal Doohickey, teacher of bandaging, binding, splinting and general not-bleeding-to-death! Sixty-two percent of the sailors in this tavern are alive because of me, and the rest are alive because they listened to the sixty-two percent!" },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Another gnome so far from home! Have you noticed how no one in this harbor appreciates a good tourniquet mechanism? I've designed three, and they keep asking for plain linen." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } },
          text = "A healer, and you still want bandages? Good, because the Light gets tired and the linen never does." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, I've a sailor upstairs with a fishhook in his thumb." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "How does a gnome end up in Menethil?", next = "past" },
        { text = "What wounds do you see here?", next = "wounds" },
        { text = "Where can I learn more after you?", next = "further" },
        { text = "Thanks, Fremal.", next = "END" },
      },
    },
    past = {
      lines = { { id = "pa_default", text = "Same way as all of us, I'm afraid: out of Gnomeregan in a hurry with only what I could carry. I had a lab full of inventions and a pocket full of bandages, and only one of those turned out useful." } },
      choices = {
        { text = "Do you miss your inventions?", next = "past_miss" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    past_miss = {
      big = true,
      lines = { { id = "pm_default", text = "Some days, but nobody ever thanked me for a better gear. They thank me for the bandage, every time, even the ones who can't say it out loud yet." } },
      choices = {
        { text = "Then healing was your real gift all along.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't give up on the gears. Gnomes need inventors.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    wounds = {
      lines = { { id = "wo_default", text = "Crocolisk bites, raptor scratches, Dragonmaw axe cuts, and a remarkable number of sailors who fell off the dock. The axes are the worst, because orcs keep their edges dirty on purpose." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },
    further = {
      lines = { { id = "fu_default", text = "When I've taught you all I can, go and see Doctor Gustaf VanHowzen in Theramore, at the barracks. He's very particular and slightly unbearable, but he's the best there is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Linen, splints, salves, and how much a sailor can bleed before he admits it hurts." } },
    _none = { { id = "tp_none", text = "Not a medical matter, so I'm afraid I've no opinion, which is rare for a gnome." } },
  },
}

---------------------------------------------------------------------------
-- Telurinon Moonshadow
---------------------------------------------------------------------------
P:NPC {
  key = "wl_telurinon", id = TODO_NPC("Telurinon Moonshadow"), name = "Telurinon Moonshadow",
  title = "Herbalism Trainer",
  bible = "bibles/menethil_folk.md", role = "trainer", tier = "service",
  communities = { "menethil" }, temper = { "steady", "proud" }, values = { "nature", "patience" },
  notices = { "race", "craft" },

  impression = {
    first = "Telurinon Moonshadow is a tall night elf who looks out of place among Menethil's dwarves and fishermen, and seems to know it. He speaks of the marsh plants with a patience nobody else in the harbor spends on anything.",
    third = "{name} met Telurinon Moonshadow, the night elf who teaches herbalism in Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveler. Mind the bundles by the door, they're still drying." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and your hands smell of swamp. Good, that means you've been working." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Your gloves are green to the wrist. You've been picking kingsblood in the rain, I think." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, kin. It is good to hear our tongue spoken in a place this damp." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Telurinon Moonshadow, and I teach the gathering of herbs to those who will listen. The Wetlands are richer than they look, if you are willing to kneel in the mud for them." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "A child of Teldrassil, so far from the forests. These humans and dwarves mean well, but they pick a plant as if it had insulted them." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle, here among the reeds. You will know already that a plant cut carelessly does not grow back as it was." },
      },
      again = {
        { id = "h_again", text = "Is there something more? I have time, as my people always do." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Why would a night elf live in Menethil?", next = "why" },
        { text = "What grows in the Wetlands?", next = "herbs" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "The harbor ships go to Auberdine, and someone must speak for our people where the humans can hear us. Also the reeds here grow things I have never seen in Ashenvale, and I have not finished learning them." } },
      choices = {
        { text = "Do the dwarves treat you well?", next = "why_dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_dwarves = {
      big = true,
      lines = { { id = "wd_default", text = "Loudly, and kindly, and with barrels of ale I do not drink. They dig the earth open for metal and wonder why I wince, but they have never once told me to leave." } },
      choices = {
        { text = "The earth gives freely. Digging is no crime.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right to wince. They take too much.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    herbs = {
      lines = { { id = "he_default", text = "Kingsblood and liferoot in the wet ground, mageroyal along the roads, and fadeleaf where the shadows are thickest. The best of it grows near Dragonmaw lands, which I suspect is the marsh's way of testing us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The herbs of these marshes, and a little of Ashenvale, long ago." } },
    _none = { { id = "tp_none", text = "That is not something the reeds have told me." } },
  },
}

---------------------------------------------------------------------------
-- Bethaine Flinthammer
---------------------------------------------------------------------------
P:NPC {
  key = "wl_bethaine", id = TODO_NPC("Bethaine Flinthammer"), name = "Bethaine Flinthammer",
  title = "Stable Master",
  bible = "bibles/menethil_folk.md", role = "stablemaster", tier = "service",
  communities = { "menethil" }, temper = { "brisk", "hearty" }, values = { "practical" },
  notices = { "pet" },

  impression = {
    first = "Bethaine Flinthammer keeps the stables outside the Deepwater Tavern and fights a daily war with the mud. She's a solid, sharp-tongued dwarf who treats every animal like a patient and every owner like a suspect.",
    third = "{name} met Bethaine Flinthammer, Menethil Harbor's stable master.",
  },

  greetings = {
    { id = "g_default", text = "Wipe yer boots before ye come in, an' yer beast's too, if it has boots." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' muddier than last time. I'll take the beast, but ye can stand outside." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "{pet}'s got swamp between the toes, poor thing. I'll see tae it before it festers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bethaine Flinthammer, stable master, an' keeper o' the only dry straw in the Wetlands, so ye'll appreciate what ye're payin' for. What'll it be?" },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Bring yer beast in, an' tell me if it's been near the murlocs, for I'll no' have that smell in my barn." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the hay's gettin' damp just listenin' tae us." },
      },
      choices = {
        { text = "I need to stable a pet.", next = "BUSINESS" },
        { text = "How do you keep anything dry here?", next = "dry" },
        { text = "What troubles the animals here?", next = "trouble" },
        { text = "Good day, Bethaine.", next = "END" },
      },
    },
    dry = {
      lines = { { id = "dr_default", text = "I don't, mostly. I bring straw in from Dun Morogh on the dwarven carts an' pay twice what it's worth, an' I've still not won a single argument wi' the rain." } },
      choices = {
        { text = "Why stay, then?", next = "dry_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry_stay = {
      big = true,
      lines = { { id = "ds_default", text = "Because the harbor needs a stable, an' nobody else wanted it. Somebody has tae do the work that nobody thanks ye for, an' I'd rather it was someone who knows what she's doin'." } },
      choices = {
        { text = "Somebody has to. Good on you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Charge more. Nobody else will do it.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    trouble = {
      lines = { { id = "tr_default", text = "Leeches, foot rot an' the smell o' raptor on the wind, which sets the ponies kickin' all night. An' every time the Dragonmaw's dragons fly over, I lose a day's work calmin' them down." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, mud an' damp straw. That's the lot." } },
    _none = { { id = "tp_none", text = "Does it eat hay? No? Then I couldnae tell ye." } },
  },
}

---------------------------------------------------------------------------
-- Stuart Fleming
---------------------------------------------------------------------------
P:NPC {
  key = "wl_stuart", id = TODO_NPC("Stuart Fleming"), name = "Stuart Fleming",
  title = "Fishing Supplies",
  bible = "bibles/menethil_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "hearty" }, values = { "friendly" },
  notices = { "craft" },

  impression = {
    first = "Stuart Fleming sells fishing gear and fish halfway up Menethil's northern dock, a sunburned man with a voice that carries over the gulls. He's never met a stranger he couldn't tell a fishing story to.",
    third = "{name} met Stuart Fleming, who sells fishing supplies and fish on Menethil Harbor's docks.",
  },

  greetings = {
    { id = "g_default", text = "Line, hooks, bait or supper, friend? I've got all four, and the supper's fresh this morning." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the dock! Catch anything, or are you buying supper from me again?" },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "I can smell a fisher from twenty paces, and you, friend, are well past twenty paces worth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Stuart Fleming, fishing supplies and the best fish on the dock, which isn't saying much, since I'm the only one selling. What can I get you?" },
        { id = "h_fisher", when = { profession = "Fishing" },
          text = "A fellow angler! The harbor's thick with bass this season, if you can get them past the murlocs." },
      },
      again = {
        { id = "h_again", text = "Anything else? The tide's turning, so I've a minute before the boats come in." },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Where's the best fishing?", next = "spots" },
        { text = "What's that wreck in the bay?", next = "wreck" },
        { text = "So long, Stuart.", next = "END" },
      },
    },
    spots = {
      lines = { { id = "sp_default", text = "Off the end of this dock at dawn, before the gulls wake. Or up by the Thandol Span, if you don't mind the Dark Irons watching you bait your hook." } },
      choices = {
        { text = "Dark Irons don't scare me.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } },
      },
    },
    wreck = {
      lines = { { id = "wr_default", text = "Bits of the Third Fleet, some of it, or so the old sailors say. The fish love it down there, and the fishermen won't go near it, so you can guess which of us eats better." } },
      choices = {
        { text = "Why won't they go near it?", next = "wreck_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "third_fleet" } } },
      },
    },
    wreck_why = {
      big = true,
      lines = { { id = "ww_default", text = "Drowned sailors, they say, still walking the hulls. I've hooked a boot or two out there and thrown them straight back, because whoever owned them might want them." } },
      choices = {
        { text = "Let the dead rest. Fish elsewhere.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead don't need the fish. Cast away.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Fish, tides, bait and every wreck in this harbor." } },
    _none = { { id = "tp_none", text = "Can't say, friend. Ask me about bass." } },
  },
}

---------------------------------------------------------------------------
-- Brahnmar
---------------------------------------------------------------------------
P:NPC {
  key = "wl_brahnmar", id = TODO_NPC("Brahnmar"), name = "Brahnmar",
  title = "Armorer",
  bible = "bibles/menethil_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "steady", "proud" }, values = { "craft" },
  notices = { "kit", "class" },

  impression = {
    first = "Brahnmar is a grizzled dwarf armorer who oils every piece of mail on his rack twice a day against the rust. He judges a customer by the state of their buckles before he looks at their face.",
    third = "{name} met Brahnmar, the dwarven armorer in Menethil Harbor who wages a lonely war against rust.",
  },

  greetings = {
    { id = "g_default", text = "Mind the rack, it's freshly oiled. What's rustin' on ye, then?" },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Let's see what the swamp has done tae my work this time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye're wearin' more holes than mail, friend. Stand still while I weep." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brahnmar, armorer, an' the only dwarf in the Wetlands who's winnin' his war wi' rust. Scale, mail an' leather, all oiled, so pick somethin' an' I'll tell ye how tae look after it." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Heavy armour on ye, an' some o' it's been through the wars, I'd say. Off wi' it, let me see the straps." },
      },
      again = {
        { id = "h_again", text = "What else? I'm oilin' either way, so talk." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "How do you fight the rust?", next = "rust" },
        { text = "Who buys armor here?", next = "buyers" },
        { text = "Good day.", next = "END" },
      },
    },
    rust = {
      lines = { { id = "ru_default", text = "Oil twice a day, wax once a week, an' a curse every hour on the hour. Leave a mail shirt out overnight in Menethil an' by mornin' it's the colour o' a carrot." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      big = true,
      lines = { { id = "bu_default", text = "The harbor guard, the Mountaineers passin' through tae Dun Algaz, an' fools headed tae Grim Batol wi' more courage than sense. I sell tae all of them, an' I worry about the last lot." } },
      choices = {
        { text = "Sell them your best. Courage deserves good mail.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fools pay full price. Sell them whatever's on the rack.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grim_batol" } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Armour, oil an' rust. Mostly rust." } },
    _none = { { id = "tp_none", text = "It's no' armour, so I've nothin' tae say about it." } },
  },
}
