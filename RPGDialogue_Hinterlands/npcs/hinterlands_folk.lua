-- Hinterlands folk we'd missed: Truk Wildbeard (bartender), Killium Bouldertoe (stable master), Drakk Stonehand (leatherworking trainer)
-- and Nioma (leatherworking supplies) at Aerie Peak; Renn'az (ammunition) at Revantusk Village.
-- Voice: bibles/hinterlands_folk.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Truk Wildbeard
---------------------------------------------------------------------------
P:NPC {
  key = "hl_truk", id = TODO_NPC("Truk Wildbeard"), name = "Truk Wildbeard",
  title = "Bartender",
  bible = "bibles/hinterlands_folk.md", role = "vendor", tier = "service",
  communities = { "aerie_peak" }, temper = { "boisterous", "hearty" }, values = { "friendly", "proud" },
  notices = { "race", "drink", "weary" },

  impression = {
    first = "Truk Wildbeard tends the bar in Wildhammer Keep, a red-bearded dwarf with tattooed forearms who pours ale as if he were blessing it. Every gryphon rider in Aerie Peak drinks at his counter, and he knows every one of their stories, true or not.",
    third = "{name} met Truk Wildbeard, who keeps the bar at Wildhammer Keep in Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "Pull up a stool, friend, an' let me pour ye somethin' that'll put hair on yer chest, whether ye want it there or no'." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my bar! I knew ye would be, for nobody leaves Aerie Peak thirsty twice." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} an' ye walk in like ye never left! Sit, sit, an' tell me where ye've been drinkin' instead." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've started without me, I see. That's fine, I'll catch ye up." },
    { id = "n_ironforge", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard at a Wildhammer bar! I'll pour ye the good stuff, an' then ye'll understand why we left." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Truk Wildbeard, an' this is the finest bar in the Hinterlands, which is no' hard, for it's the only one wi' a roof. Cheese, meat an' ale, an' a story wi' every round if ye've the ears for it." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Ironforge, is it? Yer stout's all right for folk who live under a mountain, but up here we brew for the wind, an' the wind's a thirsty thing." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "A night elf! We get yer kin up from Quel'Danil now an' then, an' they never finish a pint, so I'll pour ye a half an' no' be offended." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've ears for days an' ale for longer." },
        { id = "h_again2", text = "Go on, the night's young an' the riders are still out." },
      },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What's the best drink in the house?", next = "drink" },
        { text = "Tell me a rider's story.", next = "story" },
        { text = "What do the Wildhammer think of Ironforge?", next = "ironforge" },
        { text = "Cheers, Truk.", next = "END" },
      },
    },
    drink = {
      lines = { { id = "dr_default", text = "Thunder ale, brewed in the caves under the Keep, an' strong enough tae make a gryphon sing. Falstad drinks it at every feast, an' then he tries tae fly without one." } },
      choices = {
        { text = "Does he manage it?", next = "drink_falstad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_falstad = {
      lines = { { id = "df_default", text = "Once, for about the length o' the bar, an' then he landed in a barrel o' pickled herring. We've never let him forget it, an' he's never let us mention it." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    story = {
      lines = { { id = "st_default", text = "There's a rider called Durgan who swears he flew a gryphon through the window o' a Vilebranch hut an' out the other side wi' a troll's feathered headdress on his hammer. The hut's still there, an' so's the hole, so make o' that what ye will." } },
      choices = {
        { text = "Do you believe him?", next = "story_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_true = {
      big = true,
      lines = { { id = "stt_default", text = "I believe he believes it, which is the important part in a bar. The truth's a dull thing tae pour, an' a good story keeps a rider brave when the trolls are thick." } },
      choices = {
        { text = "The truth matters, even in a bar.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good story beats the truth every time.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
    ironforge = {
      big = true,
      lines = { { id = "if_default", text = "Cousins, an' good ones in a fight, but they live in a hole an' think the sky's somethin' tae be dug through. We left that life behind after the War o' the Three Hammers, an' I've never once missed the dark." } },
      choices = {
        { text = "The sky's better. You chose well.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Ironforge's halls hold the dwarves together. You should mend it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ale, riders, an' every tall tale told in Aerie Peak since I took over the bar." } },
    _none = { { id = "tp_none", text = "Never heard o' it, but buy a round an' I'll make somethin' up." } },
  },
}

---------------------------------------------------------------------------
-- Killium Bouldertoe
---------------------------------------------------------------------------
P:NPC {
  key = "hl_killium", id = TODO_NPC("Killium Bouldertoe"), name = "Killium Bouldertoe",
  title = "Stable Master",
  bible = "bibles/hinterlands_folk.md", role = "stablemaster", tier = "service",
  communities = { "aerie_peak" }, temper = { "steady", "friendly" }, values = { "practical" },
  notices = { "pet" },

  impression = {
    first = "Killium Bouldertoe keeps the stable at Wildhammer Keep, a stocky, slow-talking Wildhammer who smells of hay and gryphon feathers. He's the only dwarf in Aerie Peak who seems to prefer animals that stay on the ground.",
    third = "{name} met Killium Bouldertoe, the stable master at Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "Bring yer beast in, friend, an' mind the gryphon droppin's on the step." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The stall's still warm from last time." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "{pet}, is it? A fine name for a fine beast. The gryphons will want tae meet it, an' I'll no' let them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Killium Bouldertoe, stable master, an' keeper o' every beast in Aerie Peak that cannae fly. Ye'd be surprised how many there are, an' how jealous they get o' the gryphons." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, an' a good one by the look o' yer beast. Leave it wi' me, an' I'll see it's no' eaten by somethin' wi' wings." },
      },
      again = {
        { id = "h_again", text = "Aye? What else?" },
      },
      choices = {
        { text = "I'd like to stable my pet.", next = "BUSINESS" },
        { text = "Why not keep gryphons instead?", next = "gryphons" },
        { text = "Any trouble with the trolls?", next = "trolls" },
        { text = "Good day, Killium.", next = "END" },
      },
    },
    gryphons = {
      lines = { { id = "gr_default", text = "Because I'm afraid o' heights, which is a terrible thing tae admit in Aerie Peak. My family's laughed at me for forty years, an' I've kept my feet on the ground for every one o' them." } },
      choices = {
        { text = "There's no shame in that.", next = "gryphons_shame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryphons_shame = {
      big = true,
      lines = { { id = "gs_default", text = "Tell that tae Falstad. He offered tae cure me once by takin' me up on his own gryphon, an' I hid in the hay for a day an' a half." } },
      choices = {
        { text = "Face it one day. Fear grows if you feed it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stay on the ground. You know yourself best.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    trolls = {
      lines = { { id = "tr_default", text = "The Witherbark come close at night tae sniff the stables, for they think a tethered beast is an easy supper. They're right, mostly, which is why I sleep in here wi' a hammer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts that walk, an' a little about the ones that fly." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask Truk, he'll make somethin' up." } },
  },
}

---------------------------------------------------------------------------
-- Drakk Stonehand
---------------------------------------------------------------------------
P:NPC {
  key = "hl_drakk", id = TODO_NPC("Drakk Stonehand"), name = "Drakk Stonehand",
  title = "Leatherworking Trainer",
  bible = "bibles/hinterlands_folk.md", role = "trainer", tier = "service",
  communities = { "aerie_peak" }, temper = { "boisterous", "proud" }, values = { "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Drakk Stonehand teaches leatherworking at Wildhammer Keep, a black-haired Wildhammer in a dark crowd of red and brown beards. He talks about the Hinterlands' beasts with the delight of a dwarf who has never once been bored.",
    third = "{name} met Drakk Stonehand, Aerie Peak's master of leatherworking.",
  },

  greetings = {
    { id = "g_default", text = "By Muradin's beard, there are fantastic creatures in these hills! Go an' have a whack at them, an' bring me back some tall tales." },
    { id = "g_back", when = { metBefore = true }, text = "Back, an' wi' a story, I hope! What did ye skin this time?" },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "Yer hands smell o' tannin, which is the finest smell in the world after a gryphon's nest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drakk Stonehand, an' I can make amazin' things wi' what I find out here. The Hinterlands are full o' beasts ye'll never see anywhere else, so get yer knife out an' I'll teach ye what tae do wi' them." },
        { id = "h_lw", when = { profession = "Leatherworking" },
          text = "A leatherworker, come all this way! Ye'll have seen nothin' like the hides in these hills, I promise ye that." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid in a tanner's workshop. Ye're braver than ye look, or ye've a stronger stomach." },
      },
      again = {
        { id = "h_again", text = "What else? Ask away, I'm only stretchin' a hide." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "What beasts are worth hunting here?", next = "beasts" },
        { text = "Why is your hair black?", next = "hair" },
        { text = "Farewell, Drakk.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "Silvermane wolves, an' the stalkers wi' them, an' owlbeasts near Quel'Danil wi' hides like old oak. An' the wildkin, though Agnar'll tell ye off if he catches ye near the young ones." } },
      choices = {
        { text = "Do you hunt for need or sport?", next = "beasts_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_why = {
      big = true,
      lines = { { id = "bw_default", text = "Both, if I'm honest, an' I'll no' apologise for it. The hills give us hides an' we give the hills a fair fight, an' that's the Wildhammer way." } },
      choices = {
        { text = "Take only what you need. The hills aren't endless.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A fair fight's the only rule that matters.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    hair = {
      lines = { { id = "ha_default", text = "My mother says it's from a great-grandfather nobody talks about, an' my father says it's from soot. I've decided it makes me look dangerous, an' nobody's argued yet." } },
      choices = { { text = "It does look dangerous.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hides, beasts, an' the best skinnin' spots from here tae the Overlook." } },
    _none = { { id = "tp_none", text = "If it hasnae got a hide, I've no' bothered learnin' about it." } },
  },
}

---------------------------------------------------------------------------
-- Nioma
---------------------------------------------------------------------------
P:NPC {
  key = "hl_nioma", id = TODO_NPC("Nioma"), name = "Nioma",
  title = "Leatherworking Supplies",
  bible = "bibles/hinterlands_folk.md", role = "vendor", tier = "service",
  communities = { "aerie_peak" }, temper = { "brisk", "shrewd" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "Nioma sells leatherworking supplies beside Drakk's workshop: thread, dye and salt for curing. She's a sharp-eyed Wildhammer woman who keeps Drakk's accounts as well as her own, and sighs about both.",
    third = "{name} met Nioma, who sells leatherworking supplies at Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "Thread, salt an' dye, an' don't touch the dye unless ye're buyin' it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, Drakk's been through half my salt this week." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker who buys their own salt, an' doesnae borrow mine. Ye're welcome here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nioma, an' I keep the leatherworkers supplied, which means I keep Drakk supplied, which is a full-time job. What are ye after?" },
      },
      again = {
        { id = "h_again", text = "What else? I've a ledger tae balance." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You and Drakk work together?", next = "drakk" },
        { text = "Where do your goods come from?", next = "goods" },
        { text = "Thanks, Nioma.", next = "END" },
      },
    },
    drakk = {
      lines = { { id = "dr_default", text = "He teaches, I sell, an' he borrows everythin' I sell an' forgets tae pay. If he wasnae the best leatherworker in the Hinterlands I'd have stopped lendin' years ago." } },
      choices = {
        { text = "Make him pay up.", next = "drakk_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drakk_pay = {
      big = true,
      lines = { { id = "dp_default", text = "I've tried, an' he gives me a belt or a pair o' boots instead, an' they're always better than the coin would have been. That's the trouble wi' a craftsman, ye cannae stay angry at him." } },
      choices = {
        { text = "A debt is coin, not boots. Hold him to it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Take the boots. That's a better bargain.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    goods = {
      lines = { { id = "go_default", text = "Thread from Ironforge on the gryphons, salt from Menethil, an' dye we make ourselves from the hill flowers. Don't tell Drakk about the flowers, or he'll start pickin' them himself an' ruin the lot." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Thread, salt, dye, an' what Drakk owes me." } },
    _none = { { id = "tp_none", text = "No idea. Ask somebody who isnae busy." } },
  },
}

---------------------------------------------------------------------------
-- Renn'az
---------------------------------------------------------------------------
P:NPC {
  key = "hl_rennaz", id = TODO_NPC("Renn'az"), name = "Renn'az",
  title = "Ammunition Vendor",
  bible = "bibles/hinterlands_folk.md", role = "vendor", tier = "service",
  communities = { "revantusk" }, temper = { "sharp", "proud" }, values = { "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Renn'az sells arrows and shot at Revantusk Village, a lean troll who fletches while he talks and never misses a stroke. He speaks of the Vilebranch and the Wildhammer with the same flat hatred, and of the Revantusk with fierce pride.",
    third = "{name} met Renn'az, who sells ammunition to the Revantusk trolls of the Hinterlands.",
  },

  greetings = {
    { id = "g_default", text = "You need arrows, mon? Revantusk arrows fly true, and they fly far." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, mon. You been shootin' dwarves or trolls this time?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good. Your quiver look light, mon." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, eh? You far from your islands, but Revantusk welcome you all the same." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Renn'az, and I make arrows and sell shot for the Revantusk and anybody who fight with us. The Vilebranch in the hills and the Wildhammer in the sky, they both need killin', so you gonna need plenty." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, mon, and a hunter always need more arrows than they think. Take a look, and take a few extra." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Darkspear, I can see it. Your people and mine, we both know what it be to be few among enemies, and we both still shoot straight." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
      },
      choices = {
        { text = "Show me your arrows.", next = "BUSINESS" },
        { text = "Why do the Revantusk fight the Vilebranch?", next = "vilebranch" },
        { text = "What about the Wildhammer?", next = "wildhammer" },
        { text = "Later, Renn'az.", next = "END" },
      },
    },
    vilebranch = {
      lines = { { id = "vi_default", text = "Because they took the Primal's mate, and because they sold themselves to dark loa and blood magic. We was all Amani once, mon, but the Vilebranch forgot what that meant." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wildhammer = {
      big = true,
      lines = { { id = "wi_default", text = "The dwarves fly over our village and drop their hammers on us, and they call us savages for it. Some of the young ones say we should make peace with them, and I say they too young to remember." } },
      choices = {
        { text = "The young ones are right. Make peace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You remember. Keep fighting them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Arrows, shot, and how to make a dwarf fall off a gryphon." } },
    _none = { { id = "tp_none", text = "I don't know that, mon. Ask the Mystic." } },
  },
}
