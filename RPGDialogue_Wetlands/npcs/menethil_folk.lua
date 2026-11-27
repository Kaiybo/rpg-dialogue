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
    first = "He talks like a man working out how far he can run.",
    third = "{name} met Tapoke \"Slim\" Jahn, a small-time rogue in Menethil Harbor who took Defias coin to help someone aboard a ship that should never have been touched.",
  },

  greetings = {
    { id = "g_default", text = "Evening, friend. No, no, sit wherever you like, I was only resting my eyes near the door." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've nothing in my pockets, I've nowhere to be, and I'm very much enjoying my drink, so let's keep it friendly." },
    { id = "g_after", when = { questDone = Q_DIPLOMAT }, text = "Ah, the one who leaned on me till I talked. My ribs still remember you fondly, if you were wondering." },
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
        { text = "Mikhail says you've been watching his customers.", next = "defias_watch" },
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
        { text = "You told the truth in the end. That counts.", next = "BACK", reply = "Does it? I'd like to think so, friend, but I don't sleep any better for it. Every ship that leaves this harbour looks like his ship to me now.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'll hang for this, Slim, and you've earned it.", next = "BACK", reply = "Maybe I will, and maybe I have. But if they hang me, they hang the only man who can tell them who paid, so think on that before you call the guard.", fx = { align = { light = -1 } } },
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
        { text = "Clean hands, then. I'll remember.", next = "BACK", fx = { learn = { "defias" } } },
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
        { text = "Even a rogue needs lines he won't cross.", next = "BACK", reply = "I had them, friend, I swear I did, and I'd have sworn I'd never cross them. Then somebody waved a fat purse in front of one, and I couldn't see it any more.", fx = { align = { honor = 1 } } },
        { text = "Every job's just a job. Your mistake was getting caught.", next = "BACK", reply = "That's a cold way to see it, though I'll admit I thought the same a month ago. Getting caught isn't what keeps me up at night, though.", fx = { align = { honor = -1 } } },
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
    first = "He talks about bandages the way other gnomes talk about engines.",
    third = "{name} met Fremal Doohickey, the gnome who teaches bandaging in Menethil Harbor's Deepwater Tavern.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, my best patient! You've fewer cuts than last time, so either you're learning or the raptors are getting lazy." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Sit down and bleed quietly, then, and I'll get to you when I get to you." },
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
        { text = "A healer should tend anyone who's hurt, whoever they are.", next = "BACK", reply = "Exactly so, and I'd bandage a Dark Iron if he stumbled in bleeding, though I'd watch his hands.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Healers should treat those who can pay first, and the rest after.", next = "BACK", reply = "Then you'd let half this harbor rot of swamp fever while you counted coins, and I won't.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "How does a gnome end up in Menethil?", next = "past" },
        { text = "What wounds do you see here?", next = "wounds" },
        { text = "Where can I learn more after you?", next = "further" },
        { text = "Who are your patients, mostly?", next = "fd_patients" },
        { text = "You talk about bandages like engineering.", next = "fd_engine" },
        { text = "Thanks, Fremal.", next = "END" },
      },
    },
    fd_patients = {
      lines = {
        { id = "fd_patients_1", text = "Sailors with fishhooks, guards with gnoll bites, and the odd dwarf who tried to pet a crocolisk, which happens more often than you'd think. Captain Stoutfist sends me the worst of them from the wall, and I've stitched more Dragonmaw arrow wounds this season than in the last three put together." },
      },
      choices = {
        { text = "More arrow wounds? The fighting's getting worse.", next = "fd_worse" },
        { text = "Who tries to pet a crocolisk?", next = "BACK", reply = "Dwarves, after four ales at Helbrek's, and only once each." },
      },
    },
    fd_worse = {
      lines = {
        { id = "fd_worse_1", text = "It is, and you can read it in the wounds, which is a grim sort of science but a reliable one. The arrows used to come from far off and glance, and now they come from close and go deep, so the orcs are getting bolder or the guards are getting fewer." },
      },
      choices = {
        { text = "Or both. What do you need most?", next = "fd_need" },
        { text = "I'll carry bandages when I go north.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fd_need = {
      lines = {
        { id = "fd_need_1", text = "Linen, and plenty of it, for the damp rots a dressing in half a day and I change them twice as often as I would in Ironforge. If you learn the craft, you'll never want for practice in this harbor, and you'll save a guard or two besides." },
      },
      choices = {
        { text = "Linen and practice. I'll bring both.", next = "BACK" },
        { text = "I'm a priest, but I'll learn the cloth too.", next = "BACK", when = { class = "PRIEST" }, reply = "Good, for the Light runs out of breath before linen runs out of length." },
        { text = "That's a sobering thought. Something else.", next = "BACK" },
      },
    },
    fd_engine = {
      lines = {
        { id = "fd_engine_1", text = "Because it is engineering, really, just with softer materials and a much less forgiving test subject. Tension, pressure, layering, drainage, and the bandage has to hold for nine hours while the patient insists on walking about on it." },
      },
      choices = {
        { text = "Drainage? I hadn't thought of that.", next = "fd_drain" },
        { text = "A gnome would see it that way.", next = "BACK", reply = "And a gnome would be right, which is the usual pattern." },
      },
    },
    fd_drain = {
      lines = {
        { id = "fd_drain_1", text = "Nobody does, and that's why wounds go bad in the Wetlands, because everything here is wet and the wet gets under the cloth. I wrap in three layers, dry linen, wool, and then oilcloth from Gruham Rumdnul's shop, and my patients keep their fingers at a ninety percent rate." },
      },
      choices = {
        { text = "Ninety percent seems high for a marsh.", next = "fd_rate" },
        { text = "I'll buy oilcloth from Gruham, then.", next = "BACK" },
      },
    },
    fd_rate = {
      lines = {
        { id = "fd_rate_1", text = "It's very high, and I'm rather proud of it, though the other ten percent were mostly the crocolisk dwarves. In Gnomeregan I'd have written a paper about it, but here I just tell Bethaine at the stable, and she tells the horses." },
      },
      choices = {
        { text = "Then let me tell you it's impressive.", next = "BACK", fx = { affinity = 1 } },
        { text = "The horses must be very well informed. Something else.", next = "BACK" },
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
        { text = "Then healing was your real gift all along.", next = "BACK", reply = "That's very kind, and my old instructors in Gnomeregan would be furious to hear it! Still, I'll take a living patient over a working prototype any day of the week.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't give up on the gears. Gnomes need inventors.", next = "BACK", reply = "Oh, I haven't, not entirely! There's a self-rolling bandage dispenser sketched in my notebook, and it only catches fire about thirty percent of the time.", fx = { align = { order = -1 } } },
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
    first = "He speaks of marsh plants with a patience nobody else here has.",
    third = "{name} met Telurinon Moonshadow, the night elf who teaches herbalism in Menethil Harbor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, friend. The marsh has been kind to your hands; I can see you have learned to gather with care." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You have returned. Touch nothing on the drying racks, and we will have no quarrel." },
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
        { text = "An herbalist takes only what the marsh can spare.", next = "BACK", reply = "That is the Kaldorei way, and it is good to hear it in a human harbor.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The swamp is endless. Take everything you can carry.", next = "BACK", reply = "Nothing is endless, as my people learned at great cost. Even the swamp has its limits.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Why would a night elf live in Menethil?", next = "why" },
        { text = "What grows in the Wetlands?", next = "herbs" },
        { text = "Do you work with Dewin Shimmerdawn?", next = "tm_dewin" },
        { text = "What does the marsh need from those who gather here?", next = "tm_need" },
        { text = "Farewell.", next = "END" },
      },
    },
    tm_dewin = {
      lines = {
        { id = "tm_dewin_1", text = "We share the harbor and our evenings, and he sells the alchemists what my students gather. Dewin is young, by our reckoning, and he finds this place beautiful, which I did not, at first." },
      },
      choices = {
        { text = "And now you do?", next = "tm_now" },
        { text = "He told me you're the stricter of the two.", next = "tm_now", reply = "He would say so, and he would be right." },
      },
    },
    tm_now = {
      lines = {
        { id = "tm_now_1", text = "Now I find it honest, which is a different thing. The marsh hides nothing, for it floods and rots and blooms in the open, and after the long patience of Ashenvale I have come to find that restful." },
      },
      choices = {
        { text = "What blooms best when it floods?", next = "tm_bloom" },
        { text = "An honest place. I see what you mean.", next = "BACK" },
      },
    },
    tm_bloom = {
      lines = {
        { id = "tm_bloom_1", text = "Mageroyal in the dry patches, and briarthorn along the banks, and further in, toward Thelgen Rock, the grave moss that the dwarves do not like to touch. Take each where it grows thickest and leave the thin patches to recover." },
      },
      choices = {
        { text = "Thickest first, thin patches left. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "I've no wish to touch grave moss either.", next = "BACK" },
      },
    },
    tm_need = {
      lines = {
        { id = "tm_need_1", text = "Restraint, mostly, and that is a hard thing to ask of people who see only mud. The dwarves dig and the gnolls trample and the murlocs strip the reed beds, and the marsh recovers from all of them, but slowly." },
      },
      choices = {
        { text = "The murlocs strip the reeds?", next = "tm_murlocs" },
        { text = "I'm a druid. I feel how worn the land is.", next = "tm_murlocs", when = { class = "DRUID" } },
        { text = "Restraint is easier to ask than give.", next = "BACK" },
      },
    },
    tm_murlocs = {
      lines = {
        { id = "tm_murlocs_1", text = "They build their villages from them, along the Bluegill shore, and they have built many more this season than the last. Something drives them inland from the sea, though I cannot say what, and where they settle the reeds do not return for years." },
      },
      choices = {
        { text = "Something drives them? That's ominous.", next = "tm_drive" },
        { text = "Fewer murlocs would mean more reeds.", next = "BACK" },
      },
    },
    tm_drive = {
      lines = {
        { id = "tm_drive_1", text = "Perhaps, or perhaps they have only multiplied, as murlocs will. Harold Riggs the fisherman watches the bay more closely than I do, and he says the fish have moved as well, so I would ask him before I would ask the stars." },
      },
      choices = {
        { text = "I'll ask Harold Riggs about the fish.", next = "BACK" },
        { text = "Fish and murlocs both moving. Something else.", next = "BACK" },
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
        { text = "The earth gives freely. Digging is no crime.", next = "BACK", reply = "Perhaps not, to a people who have lived a few centuries. When you have watched a mountain bleed for ten thousand years, young one, you learn to wince.", fx = { align = { order = 1 } } },
        { text = "You're right to wince. They take too much.", next = "BACK", reply = "They do, and yet they would share their last loaf with me without a second thought. Elune asks me to see both, and I try, though it is not always easy.", fx = { align = { order = -1 } } },
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
    first = "Every animal is her patient, and every owner is a suspect.",
    third = "{name} met Bethaine Flinthammer, Menethil Harbor's stable master.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ach, it's you, an' ye've wiped yer boots! Bring yer beast in, an' I'll find it the dry stall at the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Leave yer beast an' wait outside, for I've only just swept." },
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
        { text = "What animals do you keep here?", next = "bf_keep" },
        { text = "You look at owners like suspects.", next = "bf_owners" },
        { text = "Good day, Bethaine.", next = "END" },
      },
    },
    bf_keep = {
      lines = {
        { id = "bf_keep_1", text = "Rams from Dun Morogh, horses from Stormwind, the odd hunter's cat or boar, an' once a bear that wouldnae stop eatin' the hay. Every one o' them hates the damp, an' every one o' them tells me so in its own language." },
      },
      choices = {
        { text = "Which takes the Wetlands worst?", next = "bf_worst" },
        { text = "A bear eating hay? That must have been a sight.", next = "BACK", reply = "It was, an' it cost me a week's fodder an' my good temper." },
      },
    },
    bf_worst = {
      lines = {
        { id = "bf_worst_1", text = "The rams, without a doubt, for they're mountain beasts an' they get foot rot in a fortnight. I keep them on dry straw an' trim their hooves every third day, an' I curse every dwarf who rode one down from Loch Modan without a thought." },
      },
      choices = {
        { text = "What would you have them ride instead?", next = "bf_ride" },
        { text = "I ride a ram myself. I'll mind its hooves.", next = "BACK", when = { race = "Dwarf" }, reply = "See that ye do, for it carries ye an' cannae complain." },
      },
    },
    bf_ride = {
      lines = {
        { id = "bf_ride_1", text = "Their own two feet, an' let the ram stay home in the hills where it belongs. Unger Statforth sells horses at the stable by the keep, an' a horse at least kens what mud is, though he'll tell ye they're all perfect." },
      },
      choices = {
        { text = "I'll ask Unger about his horses.", next = "BACK" },
        { text = "Two feet it is, then. Something else.", next = "BACK" },
      },
    },
    bf_owners = {
      lines = {
        { id = "bf_owners_1", text = "Because the owner's the one who left the beast wet an' unfed for three days in the marsh, an' then wonders why it's coughin'. I've never met an animal that neglected itself, but I've met a great many owners who did." },
      },
      choices = {
        { text = "That's harsh, but probably fair.", next = "bf_fair" },
        { text = "I'm a hunter. My pet eats before I do.", next = "bf_fair", when = { class = "HUNTER" } },
        { text = "I'll take better care, then.", next = "BACK" },
      },
    },
    bf_fair = {
      lines = {
        { id = "bf_fair_1", text = "It's fair, for I've seen what the marsh does tae a beast left standin' in it. Feed it, dry it, check its feet, an' it'll carry ye through Dun Modr an' back, which is more than most people would do for ye." },
      },
      choices = {
        { text = "Dry, fed, feet checked. Noted.", next = "bf_last" },
        { text = "Animals are better company than people, sometimes.", next = "BACK", reply = "Most times, I'd say, an' quieter about it." },
      },
    },
    bf_last = {
      lines = {
        { id = "bf_last_1", text = "An' one more thing, keep it away from the water's edge after dark, for the crocolisks take a pony as gladly as a fish. I lost a good horse that way my first season here, an' I've no' forgiven the bay for it." },
      },
      choices = {
        { text = "I'm sorry about your horse.", next = "BACK", fx = { affinity = 1 } },
        { text = "Away from the water. Something else.", next = "BACK" },
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
        { text = "Somebody has to. Good on you.", next = "BACK", reply = "Thank ye kindly, that's more than most say on their way past. Now mind that ram's back end, for he kicks harder than he looks.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Charge more. Nobody else will do it.", next = "BACK", reply = "Ha! An' have the guard ridin' mules tae save a copper? Nae, I'll charge what's fair an' sleep easy, an' ye can keep yer clever advice.", fx = { align = { honor = -1 } } },
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
    first = "He has never met a stranger he couldn't tell a fishing story.",
    third = "{name} met Stuart Fleming, who sells fishing supplies and fish on Menethil Harbor's docks.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back on my dock! I saved you a bucket of the good bait, and the supper's still warm if you want it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Buy your hooks and move along, I've got fish to gut." },
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
        { text = "A fishmonger should say plainly how old the fish is.", next = "BACK", reply = "That's right, and mine's always this morning's, so I've nothing to hide.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Yesterday's fish smells fine with enough salt on it.", next = "BACK", reply = "Not on my dock, friend. Menethil has noses, even if it hasn't much else.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Where's the best fishing?", next = "spots" },
        { text = "What's that wreck in the bay?", next = "wreck" },
        { text = "Who buys your fish?", next = "sf_buyers" },
        { text = "Tell me a fishing story.", next = "sf_story" },
        { text = "So long, Stuart.", next = "END" },
      },
    },
    sf_buyers = {
      lines = {
        { id = "sf_buyers_1", text = "Helbrek takes the most, for the Deepwater's stew, and the keep takes the rest in salt barrels for the soldiers. The elven sailors won't touch it, which is a pity, for a Baradin Bay snapper is as good as anything in the sea." },
      },
      choices = {
        { text = "Why won't the elves eat it?", next = "sf_elves" },
        { text = "I'll try a snapper, then.", next = "BACK", reply = "You'll not regret it, friend, so long as it's fresh." },
      },
    },
    sf_elves = {
      lines = {
        { id = "sf_elves_1", text = "Something to do with the way we cook it, I think, for they say we drown it in salt and fat. I've told them the salt keeps it from rotting in this weather, and they look at me like I've said something sad." },
      },
      choices = {
        { text = "Their food must be very different.", next = "sf_diff" },
        { text = "Night elves are particular about food.", next = "sf_diff", when = { race = "NightElf" }, reply = "Particular is a kind word for it, but you'd know better than me." },
      },
    },
    sf_diff = {
      lines = {
        { id = "sf_diff_1", text = "Everything grilled on a leaf with some herb I can't name, from what they tell me. I tried it once, and I'll admit it wasn't bad, though I wouldn't want to eat it every day with the wind off the bay." },
      },
      choices = {
        { text = "Grilled on a leaf. I might try that.", next = "BACK" },
        { text = "Salt and fat for me. Something else.", next = "BACK" },
      },
    },
    sf_story = {
      lines = {
        { id = "sf_story_1", text = "My father once hooked something in the bay so large it towed his boat halfway to the wreck before the line snapped. He swore it had a face like a drowned man, and he never fished past the point again." },
      },
      choices = {
        { text = "Do you believe him?", next = "sf_believe" },
        { text = "Every fisherman has a story like that.", next = "sf_believe", reply = "They do, but mine's true, and that's the difference." },
      },
    },
    sf_believe = {
      lines = {
        { id = "sf_believe_1", text = "I believe he saw something, and I believe the bay is deeper than people think. Harold Riggs says the old fishermen in Lordaeron told the same stories about their own waters, so maybe it's just the sea being the sea." },
      },
      choices = {
        { text = "The sea keeps its secrets.", next = "sf_secret" },
        { text = "Or maybe there's something down there.", next = "sf_secret" },
      },
    },
    sf_secret = {
      lines = {
        { id = "sf_secret_1", text = "It does, and I'd rather not go looking for them. I fish the shallows by the harbor where the snapper are fat and the water's clear, and I come home every night, which is the best kind of fishing story there is." },
      },
      choices = {
        { text = "That's a fine way to live.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll leave the deep water alone. Something else.", next = "BACK" },
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
        { text = "Let the dead rest. Fish elsewhere.", next = "BACK", reply = "That's my thinking most days, and the fish are kinder closer in anyhow. It's only when the catch is thin that I start eyeing those wrecks again.", fx = { align = { light = 1 } } },
        { text = "The dead don't need the fish. Cast away.", next = "BACK", reply = "You say that, but you've not felt a line go tight and wondered what's on the other end. You go and fish the wrecks, friend, and tell me how it goes.", fx = { align = { light = -1 } } },
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
    first = "He judges your buckles before he looks at your face.",
    third = "{name} met Brahnmar, the dwarven armorer in Menethil Harbor who wages a lonely war against rust.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back, are ye? Let me see it. Aye, ye've been oilin' it properly, an' I'll admit I'm pleased." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Lay yer weapon on the bench an' keep yer opinions tae yerself." },
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
        { text = "A smith should tell you plainly when a blade's past saving.", next = "BACK", reply = "Aye, an' I'll tell ye even if it costs me a sale, for rust doesnae lie.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them a new blade anyway. The old one's their problem.", next = "BACK", reply = "That's how a smith loses his name, an' I've had mine too long tae lose it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "How do you fight the rust?", next = "rust" },
        { text = "Who buys armor here?", next = "buyers" },
        { text = "Do you work with Brak Durnad?", next = "bm_brak" },
        { text = "What's the hardest armour to keep in this weather?", next = "bm_hard" },
        { text = "Good day.", next = "END" },
      },
    },
    bm_brak = {
      lines = {
        { id = "bm_brak_1", text = "Aye, he makes the blades an' I make what stops them, an' we share the forge across the lane when one o' us is short o' coal. We're both losin' tae rust, but we're losin' together, which helps." },
      },
      choices = {
        { text = "Losing together sounds very dwarven.", next = "bm_together" },
        { text = "Two smiths sharing coal. That's friendly.", next = "BACK", reply = "Friendly enough, till he forgets tae pay me back." },
      },
    },
    bm_together = {
      lines = {
        { id = "bm_together_1", text = "It is, an' I'll no' apologise for it. Back in Ironforge we'd be rivals, but down here the swamp is the enemy, an' ye make peace wi' anyone who'll fight it alongside ye." },
      },
      choices = {
        { text = "What do the two of you fight it with?", next = "bm_fight" },
        { text = "I'm a dwarf. I'd stand with you.", next = "bm_fight", when = { race = "Dwarf" } },
      },
    },
    bm_fight = {
      lines = {
        { id = "bm_fight_1", text = "Oil from Gruham, wax from Jennabink's cart, an' a recipe for rust paste that I'll take tae my grave. Brak swears by whale fat, an' I swear at him for it, an' we've been arguin' about it for six years now." },
      },
      choices = {
        { text = "Six years of arguing is a friendship.", next = "BACK", fx = { affinity = 1 } },
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },
    bm_hard = {
      lines = {
        { id = "bm_hard_1", text = "Mail, by a long road, for every link is a place for rust tae hide. Plate ye can wipe, an' leather ye can wax, but a mail shirt has ten thousand wee rings, an' the damp gets intae every one." },
      },
      choices = {
        { text = "What do you tell people who wear mail here?", next = "bm_mail" },
        { text = "I wear mail. What should I do?", next = "bm_mail", when = { class = { "WARRIOR", "PALADIN", "HUNTER", "SHAMAN" } } },
        { text = "Ten thousand rings. That sounds like misery.", next = "BACK" },
      },
    },
    bm_mail = {
      lines = {
        { id = "bm_mail_1", text = "Shake it out every night, roll it in an oiled cloth, an' never, ever put it on wet. The Mountaineers out at Dun Modr dinnae listen, an' they come back tae me wi' shirts that crumble like old bread." },
      },
      choices = {
        { text = "Is it bad at Dun Modr?", next = "bm_dunmodr" },
        { text = "I'll roll mine every night.", next = "BACK" },
      },
    },
    bm_dunmodr = {
      lines = {
        { id = "bm_dunmodr_1", text = "Bad as it gets, for they're livin' in the mud by the Span an' fightin' Dark Irons every day. Longbraid's lads have no time tae oil anythin', so I send them what I can spare an' hope it holds long enough." },
      },
      choices = {
        { text = "That's generous of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll take them something on my way. Something else.", next = "BACK" },
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
        { text = "Sell them your best. Courage deserves good mail.", next = "BACK", reply = "Aye, that's how I see it too, an' I'll fit it maself so the straps dinnae fail. If they're goin' tae Grim Batol, they'll need every link.", fx = { align = { honor = 1 } } },
        { text = "Fools pay full price. Sell them whatever's on the rack.", next = "BACK", reply = "That's a merchant's answer, an' a cold one. I'll no' send a dwarf intae Grim Batol in shoddy mail just tae make a quick coin.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grim_batol" } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Armour, oil an' rust. Mostly rust." } },
    _none = { { id = "tp_none", text = "It's no' armour, so I've nothin' tae say about it." } },
  },
}
