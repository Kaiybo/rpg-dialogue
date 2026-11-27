-- Loch Modan folk we'd missed: Huldar and Miran (Ironband's powder haulers, the Saean ambush),
-- Lina Hearthstove (stable master), Yanni Stoutheart (general goods), Vrok Blunderblast (gunsmith).
-- Voice: bibles/loch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_RESUPPLY = TODO_QUEST("Resupplying the Excavation")
local Q_AMBUSH = TODO_QUEST("After the Ambush")
local Q_SHIPMENT = TODO_QUEST("Protecting the Shipment")

---------------------------------------------------------------------------
-- Miran
---------------------------------------------------------------------------
P:NPC {
  key = "lm_miran", id = TODO_NPC("Miran"), name = "Miran",
  bible = "bibles/loch_folk.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "cowardly", "friendly" }, values = { "loyal", "careful" },
  notices = { "race", "class" },

  impression = {
    first = "He wants badly to be brave, and admits he isn't yet.",
    third = "{name} met Miran, the young hauler who had to carry Ironband's powder to the dig after his partner Saean sold them out to the Dark Irons.",
  },

  greetings = {
    { id = "g_road", text = "Oh! Sorry, I thought ye were... never mind what I thought. Hello, friend, an' mind the barrels." },
    { id = "g_back", when = { metBefore = true }, text = "It's ye again, an' I'm glad of it, for the gully's no' half so frightenin' when there's two of us lookin' at it." },
    { id = "g_done", when = { questDone = Q_SHIPMENT }, text = "My escort! Ironband still talks about the day the powder came through, though he gives most o' the credit tae the powder." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now that's proper armour, an' I'd sleep under a cart beside it any night." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll no' strike a light near the cart, will ye? I've heard stories about yer workshops." },
  },

  start = "hello",
  nodes = {
    dw_di = {
      lines = {
        { id = "dw_di_default", text = "I worry, an' I'm only a hauler. The Dark Irons have hated us since the War o' the Three Hammers, an' my grandda used tae say they'd come back for Ironforge one day, an' I used tae laugh at him." },
        { id = "dw_di_dwarf", when = { race = "Dwarf" }, text = "Ye're kin, so ye'll know the stories as well as I do. The Dark Irons have hated us since the War o' the Three Hammers, an' my grandda swore they'd come back for Ironforge, an' I used tae laugh at him." },
      },
      choices = {
        { text = "Let them come. Ironforge's gates have never fallen.", next = "BACK", reply = "Aye, that's what the guards say, an' I want tae believe them. It's no' the gates I worry about, it's the gullies in between.", fx = { align = { honor = 1 } } },
        { text = "Saean sold you out for coin. Watch your own first.", next = "BACK", reply = "That's the hard truth o' it, an' it's what keeps me up. A dwarf sellin' dwarves tae the Dark Irons, an' I trusted him wi' my lunch.", fx = { align = { honor = -1 } } },
        { text = "Something else, Miran.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Miran, an' I haul for the dig wi' Huldar. Since the ambush we've split the load, so I'm takin' the rest tae Prospector Ironband an' tryin' no' tae think about the gully on the way." },
        { id = "h_ambush", tags = { "news" }, when = { questActive = Q_AMBUSH },
          text = "Huldar sent ye tae walk wi' me? Thank the Light, for I've checked these straps four times already an' I was about tae start a fifth. Just let me finish an' we'll be off." },
        { id = "h_ship", when = { questActive = Q_SHIPMENT },
          text = "Ready when ye are, friend. Keep yer eyes on the rocks, an' if anythin' moves, shout before ye think about it." },
        { id = "h_done", when = { questRecent = { Q_SHIPMENT, days = 7 } },
          text = "Every barrel at the dig, an' not a scratch on me, which my mother will never believe. I owe ye a drink at the Stoutlager, an' I mean tae pay it someday." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, good, for I'm no fighter, an' Saean always said I'd hide under the cart if trouble came. I didnae, as it happens, but it was close." },
      },
      again = {
        { id = "h_again", text = "Aye? What else, friend? I've a minute while the ponies drink." },
        { id = "h_again2", text = "Go on, ask. It keeps my mind off the gully." },
      },
      choices = {
        { text = "I'll walk with you to the dig.", next = "escort", when = { questActive = Q_AMBUSH } },
        { text = "You knew Saean well?", next = "saean" },
        { text = "Why do you keep hauling, after all that?", next = "why" },
        { text = "What's Prospector Ironband like?", next = "ironband" },
        { text = "You seem nervous, Miran.", next = "nerves" },
        { text = "Dark Irons this close to Thelsamar? Should we worry?", next = "dw_di" },
        { text = "I have to go, Miran.", next = "END" },
      },
    },

    escort = {
      lines = { { id = "es_default", text = "Ye will? Then let me check the straps once more an' we'll go by the loch's curve, the flat road. If the Dark Irons come again, they'll come from the rocks on the left, so watch that side for me." },
      },
      choices = {
        { text = "Nobody touches you or the powder.", next = "escort_vow" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    escort_vow = {
      big = true,
      lines = { { id = "ev_default", text = "I like the sound o' that. Ironband says if it comes tae it, I'm tae save the powder first, an' I've been wonderin' all mornin' whether he meant it." },
      },
      choices = {
        { text = "You come first, Miran. Powder can be bought again.", next = "BACK", reply = "That's kind o' ye, an' I hope Ironband never hears ye say it. I'll keep my head down an' my hands on the reins, then.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "He meant it. The dig matters more than either of us.", next = "BACK", reply = "Aye, ye might be right, an' it's a cold thing tae hear. I'll do my job, but I'll no' pretend I'm happy about it.", fx = { align = { light = -1 } } },
      },
    },

    saean = {
      lines = { { id = "sa_default", text = "I knew him well enough tae share a fire, or so I thought. He taught me how tae tie a load so it wouldnae shift, an' all that time he was learnin' when we'd leave an' which way we'd go." },
      },
      choices = {
        { text = "Do you hate him?", next = "saean_hate" },
        { text = "What becomes of him now?", next = "saean_fate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saean_hate = {
      big = true,
      lines = { { id = "sh_default", text = "I want tae, an' then I tie a load the way he showed me an' I cannae quite manage it. Huldar says I'm soft, an' maybe I am, but I keep wonderin' what they promised him." },
      },
      choices = {
        { text = "Hate him. He'd have watched you die.", next = "BACK", reply = "He would have, I know it, an' I've told myself so a hundred times. I'll try, but it doesnae come as easy as Huldar thinks.", fx = { align = { light = -1 } } },
        { text = "Wondering why isn't soft. It's how you stay decent.", next = "BACK", reply = "Is it? I hope ye're right, for I'd rather be decent than hard. Thank ye for that.", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    saean_fate = {
      lines = { { id = "sf_default", text = "If he lived through it, he's run tae his Dark Iron friends in the Wetlands or somewhere worse. Mountaineer Kadrell has his name on a list now, an' Kadrell doesnae forget a name." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    why = {
      lines = { { id = "wh_default", text = "Because the dig needs powder, an' because I'd be ashamed tae go home an' tell my mother I quit after one bad day. Mostly the second one, if I'm honest." },
      },
      choices = {
        { text = "That's braver than you think.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Where's home?", next = "why_home" },
      },
    },
    why_home = {
      lines = { { id = "wy_default", text = "Kharanos, up in Dun Morogh, where my mother brews an' worries in equal measure. She thinks hauling's safe work, an' I've decided she can go on thinkin' it." },
      },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },

    ironband = {
      lines = { { id = "ir_default", text = "He's cheerful, an' always certain the next blast will turn up somethin' wonderful. He's kind tae us haulers, mind, though I think he'd be just as kind tae a pony if it carried powder." },
      },
      choices = {
        { text = "Has he ever found anything?", next = "ironband_found" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironband_found = {
      lines = { { id = "if_default", text = "He's found rocks, mostly, an' a lot o' angry troggs, an' once a carved stone he wouldnae let anyone touch. He sent it tae Ironforge under guard, an' that was the day I first saw him go quiet." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },

    nerves = {
      lines = { { id = "ne_default", text = "Can ye blame me? I'm sittin' on enough powder tae flatten a house, an' last week a man I trusted brought axes tae the road. My hands only stop shakin' when they've a rope tae tie." },
      },
      choices = {
        { text = "Fear keeps you alert. Use it.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Then tie something and keep talking.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the south road, the weight o' a barrel, an' that I'll never trust a smile again. Ask me anythin'." } },
    background = { { id = "tp_bg", text = "I'm a Kharanos lad an' a hauler for the League, an' a lot jumpier than I was a month ago.", next = "why" } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend, I only know the road an' the barrels." } },
  },
}

---------------------------------------------------------------------------
-- Lina Hearthstove
---------------------------------------------------------------------------
P:NPC {
  key = "lm_lina", id = TODO_NPC("Lina Hearthstove"), name = "Lina Hearthstove",
  title = "Stable Master",
  bible = "bibles/loch_folk.md", role = "stablemaster", tier = "service",
  communities = { "thelsamar" }, temper = { "hearty", "steady" }, values = { "friendly", "kind" },
  notices = { "pet", "race" },

  impression = {
    first = "She talks to the animals first and their owners second.",
    third = "{name} met Lina Hearthstove, Thelsamar's stable master and one of the Hearthstove family who keep the Stoutlager Inn.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There ye are! Yer stall's swept, an' the rams have been askin' after ye in their way, which is mostly chewin' my apron." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Leave yer beast if ye must, but I'll be checkin' it's been treated kindly." },
    { id = "g_stable", text = "Come in, come in, an' shut the gate behind ye, for the rams think every open gate is an invitation tae the loch." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've a stall swept an' a bucket full, so whoever ye're leavin' wi' me will eat better than ye do." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "An' who's this, then? {pet}, is it? Oh, aye, ye're a handsome one, an' ye know it too." },
    { id = "n_hunter", cat = "race", when = { class = "HUNTER", race = "NightElf" },
      text = "A night elf hunter! Yer cats always look at my rams like supper, so I'll put them at opposite ends o' the barn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Lina Hearthstove, an' this is my stable, an' those are my rams, an' that's my brother's inn, so ye could say Thelsamar's half Hearthstove by now. What can I do for ye an' yer beast?" },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good, for I like folk who look after their animals. Bring them in out o' the wind an' tell me what they eat." },
        { id = "h_pet", when = { pet = { named = true } },
          text = "Is that {pet}? Hello, sweetheart, ye've come a long road by the look o' yer paws. Yer {g:lad|lass} there can wait a moment while we say hello." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Talk while I fork this straw, for it'll no' fork itself." },
        { id = "h_again2", text = "Aye? Go on, the rams don't mind." },
      },
      choices = {
        { text = "I'd like to stable an animal.", next = "BUSINESS" },
        { text = "So you're family to the innkeeper?", next = "family" },
        { text = "What are the rams like?", next = "rams" },
        { text = "Any advice for keeping a pet in these hills?", next = "advice", when = { class = "HUNTER" } },
        { text = "Good day, Lina.", next = "END" },
      },
    },
    family = {
      lines = { { id = "fa_default", text = "I'm his sister an' Vidra's aunt, though Vidra treats me like a younger sister an' bosses me accordingly. My brother pours the stout, Vidra makes the sausages, an' I muck out, which is the job nobody fought me for." },
      },
      choices = {
        { text = "Do you mind it?", next = "family_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_mind = {
      big = true,
      lines = { { id = "fm_default", text = "Not a bit, for animals don't complain about the beer or try tae pay in IOUs. Though there's a dwarf from the dam owes me three weeks' stablin', an' I've half a mind tae keep his ram." },
      },
      choices = {
        { text = "Keep the ram. A debt's a debt.", next = "BACK", reply = "A debt's a debt, an' the ram's eatin' my oats. I'll keep it, an' he can come an' argue wi' me if he likes.", fx = { align = { honor = -1 } } },
        { text = "Give him a fair warning first.", next = "BACK", reply = "Fair warnin', aye, I'll give him that much. He's had three weeks, though, so the warnin' willnae be gentle.", fx = { align = { honor = 1 }, affinity = 1 } },
      },
    },
    rams = {
      lines = { { id = "ra_default", text = "They're stubborn, loyal, an' cleverer than they let on. They'll climb anythin', eat anythin', an' they've worked out the latch on the feed shed twice this month." },
      },
      choices = {
        { text = "Can I ride one?", next = "rams_ride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rams_ride = {
      lines = {
        { id = "rr_default", text = "No' mine, ye can't, for these are boarders. If ye want a ram o' yer own, ye'll need tae see the breeders in Dun Morogh, an' ye'll need a good deal o' coin." },
        { id = "rr_dwarf", when = { race = "Dwarf" }, text = "Ye'll want Veron Amberstill in Dun Morogh for that, for he breeds the best. Save yer silver, {g:lad|lass}, for he doesnae haggle." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "ad_default", text = "Keep them off the dam road at night, for the troggs set snares there. An' if yer beast won't eat, bring it tae me before ye bring it tae a priest." },
      },
      choices = { { text = "Thanks, Lina.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know rams, ponies, hunters' beasts an' my family's business, which is everyone's business in Thelsamar." } },
    _none = { { id = "tp_none", text = "Ask my brother, he's the one who listens tae gossip. I only listen tae the rams." } },
  },
}
