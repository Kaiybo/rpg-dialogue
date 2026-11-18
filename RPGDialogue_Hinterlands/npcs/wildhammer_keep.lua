-- Wildhammer Keep's trades: Truk Wildbeard behind the bar, Drakk Stonehand who teaches leatherworking and
-- wants tall tales, Nioma who sells him his salt and thread, and Killium Bouldertoe in the stables. Voice: bibles/wildhammer_keep.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "truk", id = TODO_NPC("Truk Wildbeard"), name = "Truk Wildbeard", title = "Bartender",
  bible = "bibles/wildhammer_keep.md", role = "vendor", tier = "service",
  communities = { "aerie_peak" }, temper = { "jovial", "chatty" }, values = { "generous", "friendly" },
  notices = { "drink", "race" },

  impression = {
    first = "Truk Wildbeard tends the bar at Wildhammer Keep and has an opinion on every rider who drinks there. He pours as if every mug were a toast, and most of them are.",
    third = "{name} drank at Truk Wildbeard's bar in Wildhammer Keep, Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "Step up, step up! Ale, cheese, a bit o' roast boar, an' the best stories in the Hinterlands for free wi' every mug." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Yer usual, is it? I'll pretend I remember what that was." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late, an' the riders are in, so mind yer elbows. They swing their arms when they tell a story." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye've had a few already, I see, so I'll pour ye a small one an' call it a large one." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, by the beard! Our ale's better than yers, an' I'll fight ye on it, after ye've had one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Truk Wildbeard, an' this is my bar, though Thulfram likes tae say it's his inn. He's got the beds an' I've got the barrels, so ye can guess where folk spend the evenin'." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "A kaldorei, at the Peak! Ye'll be wantin' somethin' gentler than our ale, I'd wager, but I've only got ale, so we'll see how ye manage." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Stand on the stool, there's a good lad, or lass, an' I'll be able tae see who I'm pourin' for." },
      },
      again = { { id = "h_again", text = "Another? Or another question, which is cheaper?" } },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "What's the gossip in the keep?", next = "gossip" },
        { text = "Who drinks the most here?", next = "drinkers" },
        { text = "Is your ale better than Rhapsody's?", next = "rhapsody" },
        { text = "I'll be off, Truk.", next = "END" },
      },
    },

    gossip = {
      lines = { { id = "go_default", text = "The Vilebranch are bold again at Jintha'Alor, the Witherbark are stealin' gryphon eggs, an' Talonaxe is in a mood because he's no' been flyin'. Same as last week, only louder." } },
      choices = {
        { text = "Stealing gryphon eggs? Why?", next = "gossip_eggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_eggs = {
      big = true,
      lines = { { id = "ge_default", text = "Tae eat, or tae sell, or tae raise against us, an' I couldnae tell ye which is worst. The riders want tae burn their villages for it, an' the Thane's half a mind tae let them." } },
      choices = {
        { text = "Burn them out. Egg thieves get no mercy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Get the eggs back, but spare the young ones.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drinkers = {
      lines = { { id = "dr_default", text = "The riders, after a long patrol, an' Fraggar, though he says it's for the spirits an' no' for himself. The Thane drinks least an' shouts most, so it evens out." } },
      choices = {
        { text = "Falstad doesn't drink much?", next = "drinkers_thane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drinkers_thane = {
      lines = { { id = "dt_default", text = "One mug a night, an' he raises it tae someone he never names. I've learned no' tae ask, an' ye'd do well tae learn the same." } },
      choices = {
        { text = "I'll keep my questions to myself.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rhapsody = {
      big = true,
      lines = { { id = "rh_default", text = "Rhapsody's stuff isnae ale, it's a crime wi' a cork in it. Mind, I've bought a bottle or two for the cellar, for medicinal purposes, an' I'll deny it if ye tell anyone." } },
      choices = {
        { text = "Your secret's safe. A man's entitled to his bottle.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll be telling everyone, Truk.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in the keep, raised behind the bar. My father poured for the riders who flew in the Second War." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' I hear everythin'. Ask Thulfram; he hears the rest." } },
  },
}

P:NPC {
  key = "drakk", id = TODO_NPC("Drakk Stonehand"), name = "Drakk Stonehand", title = "Master Leatherworking Trainer",
  bible = "bibles/wildhammer_keep.md", role = "trainer", tier = "service",
  communities = { "aerie_peak" }, temper = { "eager", "proud" }, values = { "craft", "curious" },
  notices = { "craft", "class" },

  impression = {
    first = "Drakk Stonehand teaches leatherworking at Aerie Peak and would rather hear about the beast than see the hide. He's one of the few Wildhammer with black hair, and he's tired of hearing about it.",
    third = "{name} met Drakk Stonehand, the master leatherworker of Wildhammer Keep.",
  },

  greetings = {
    { id = "g_default", text = "There's beasts in these hills that would make a Bronzebeard drop his pint! Go an' have a crack at one, {name}, an' bring me back the hide an' a tall tale tae go wi' it." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! Let me see yer hands. Aye, there's the calluses; ye're one o' us." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! What did ye kill, an' how big was it, an' how much bigger will it be by the time ye've told me?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter brings the best skins, because ye know where tae aim. Don't spoil a good hide wi' sloppy shots, mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drakk Stonehand, master o' leather for Aerie Peak. Give me a good hide from these hills an' I'll make ye a jerkin the riders will fight over, if folk would only bring the hides tae me instead o' sellin' them in Ironforge." },
      },
      again = { { id = "h_again", text = "What else? Talk while I stitch." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Leatherworking" } },
        { text = "What creatures are you talking about?", next = "beasts" },
        { text = "Why do you want tall tales?", next = "tales" },
        { text = "Your hair's black. Aren't Wildhammer usually fair?", next = "hair" },
        { text = "What's the finest thing you ever made?", next = "finest" },
        { text = "Good stitching, Drakk.", next = "END" },
      },
    },

    beasts = {
      lines = { { id = "be_default", text = "Owlbeasts wi' hides like oiled oak, silvermane stalkers, wildkin, an' the great razorbeaks the Witherbark ride. I'd give a week's wage for a proper owlbeast pelt wi' no holes in it." } },
      choices = {
        { text = "Razorbeaks? You'd skin a gryphon's cousin?", next = "beasts_gryphon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_gryphon = {
      big = true,
      lines = { { id = "bg_default", text = "Never! No' in this keep, no' wi' Talonaxe listenin'. A razorbeak that's gone wild an' carries trolls is a different matter, though, an' the riders argue about it every night." } },
      choices = {
        { text = "A wild razorbeak is still kin to your gryphons. Spare them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast that carries trolls is fair game.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tales = {
      big = true,
      lines = { { id = "ta_default", text = "Because a hide's only leather until ye know the story behind it, an' then it's a trophy. Folk pay twice as much for a jerkin from a beast that nearly ate somebody." } },
      choices = {
        { text = "Then I'll tell the truth, small beast and all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll make every beast twice its size.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hair = {
      lines = { { id = "ha_default", text = "Aye, an' if I had a copper for every time someone mentioned it I'd buy the keep. My mother says there's Bronzebeard in the family somewhere, an' my father says there isnae, an' they've been arguin' about it for sixty years." } },
      choices = {
        { text = "It suits you, whoever's right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    finest = {
      lines = { { id = "fi_default", text = "A ridin' harness for the Thane's own gryphon, stitched from a silvermane stalker that took three riders tae bring down. He wore it once, said it pinched, an' I've been tryin' tae forgive him ever since." } },
      choices = {
        { text = "Falstad has no taste in harnesses.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Wildhammer wi' black hair an' clever hands. I've worked leather since I could hold a knife." } },
    _none = { { id = "tp_none", text = "Don't know, but bring me a hide an' a story an' I'll find out for ye." } },
  },
}

P:NPC {
  key = "nioma", id = TODO_NPC("Nioma"), name = "Nioma", title = "Leatherworking Supplies",
  bible = "bibles/wildhammer_keep.md", role = "vendor", tier = "service",
  communities = { "aerie_peak" }, temper = { "brisk", "dry" }, values = { "practical", "trade" },
  notices = { "craft" },

  impression = {
    first = "Nioma sells leatherworking supplies at Wildhammer Keep and keeps Drakk Stonehand in salt and thread. She has strong views on owlbeast hides and stronger ones on Drakk.",
    third = "{name} bought supplies from Nioma at Wildhammer Keep.",
  },

  greetings = {
    { id = "g_default", text = "Salt, thread, dye an' the odd hide. If ye're makin' somethin', I've got what ye need." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more salt? Ye must be skinnin' every beast between here an' the Overlook Cliffs." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker, an' wi' good habits, by the look o' yer kit. Ye'll be after the heavy thread, then." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nioma, an' I sell leatherworkin' supplies tae Drakk an' anyone else who can stitch. Half my trade is him, an' the other half is folk he's sent me." },
      },
      again = { { id = "h_again", text = "Anythin' else? I've stock tae sort." } },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You and Drakk work together?", next = "drakk" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "Do you ever work leather yourself?", next = "craft" },
        { text = "Thank you, Nioma.", next = "END" },
      },
    },

    drakk = {
      big = true,
      lines = { { id = "dk_default", text = "He makes the wonders, an' I make sure he's got the salt tae make them, an' I get none o' the stories told about me. He's a fine craftsman an' a terrible man for payin' on time." } },
      choices = {
        { text = "Charge him interest. Business is business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Friends shouldn't count every copper between them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stock = {
      lines = { { id = "st_default", text = "The thread an' dye come up from the Wetlands on the gryphons, an' the salt from the coast, though the Revantusk make that harder than it should be. Everythin' else I get from riders who've had a good hunt." } },
      choices = {
        { text = "The trolls block the salt?", next = "stock_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock_trolls = {
      lines = { { id = "stt_default", text = "They sit on the best stretch o' shore an' throw spears at anythin' wi' a beard. So I pay a rider tae fly in low an' fast an' grab a sack, an' the price goes up accordingly." } },
      choices = {
        { text = "That explains your prices.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    craft = {
      lines = { { id = "cr_default", text = "Now an' then, belts an' purses an' the odd pair o' gloves, nothin' Drakk would bother wi'. Mine sell faster, mind, because folk can afford them." } },
      choices = {
        { text = "Should you compete with him openly?", next = "craft_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_stance = {
      big = true,
      lines = { { id = "cs_default", text = "I've thought about it, an' I'd win, an' he'd sulk for a year. Some say a keep's better when its crafters keep tae their own corners." } },
      choices = {
        { text = "Compete. Good work should stand on its own.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep to your corners. The keep runs smoother that way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Aerie Peak born. I've sold supplies here since before Drakk could hold a needle, an' I remind him o' that often." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask Truk; he'll make somethin' up." } },
  },
}

P:NPC {
  key = "killium", id = TODO_NPC("Killium Bouldertoe"), name = "Killium Bouldertoe", title = "Stable Master",
  bible = "bibles/wildhammer_keep.md", role = "stablemaster", tier = "service",
  communities = { "aerie_peak" }, temper = { "calm", "gruff" }, values = { "nature", "patient" },
  notices = { "pet", "class" },

  impression = {
    first = "Killium Bouldertoe keeps the stables at Wildhammer Keep, where every animal has to get used to living beside gryphons. He talks to the beasts more than to their owners.",
    third = "{name} met Killium Bouldertoe, the stable master of Wildhammer Keep.",
  },

  greetings = {
    { id = "g_default", text = "Stables are this way. Keep yer beast calm, because the gryphons can smell it, an' they're hungry." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "That's {pet}, is it? A fine animal. It'll want tae hide from the gryphons, so I'll give it the back stall." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Yer beast remembers me, I'd wager, an' it's no' sure how it feels about it." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Ye'll want a stall, then, an' maybe a word about keepin' yer beast clear o' the aviary." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Killium Bouldertoe, stable master. I keep the beasts that aren't gryphons, which up here means the ones everybody forgets about, an' I like it that way." },
      },
      again = { { id = "h_again", text = "Anythin' else? The beasts need feedin'." } },
      choices = {
        { text = "I need the stables.", next = "BUSINESS" },
        { text = "How do beasts cope with the gryphons?", next = "gryphons" },
        { text = "What's the strangest animal you've stabled?", next = "strange" },
        { text = "Do you ever ride the gryphons yourself?", next = "ride" },
        { text = "Good day, Killium.", next = "END" },
      },
    },

    gryphons = {
      lines = { { id = "gr_default", text = "Badly, at first. A wolf or a cat takes one look at a gryphon an' decides tae live under the hay for a week, an' then it gets used tae them, mostly." } },
      choices = {
        { text = "Do the gryphons ever go after them?", next = "gryphons_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryphons_hunt = {
      big = true,
      lines = { { id = "gh_default", text = "Once, a young one, an' Talonaxe had the rider muckin' out the aviary for a month. Some folk say gryphons should be kept apart entirely, an' some say beasts should learn tae live together." } },
      choices = {
        { text = "Keep them apart. Safer for everyone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them learn. It's the wild's way.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    strange = {
      lines = { { id = "sr_default", text = "A hunter brought in a turtle once, a great slow thing, an' it bit everythin' in reach an' wouldnae let go. The gryphons were terrified of it, an' I've never been prouder of an animal." } },
      choices = {
        { text = "A champion turtle. Wonderful.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ride = {
      lines = { { id = "ri_default", text = "Once, when I was young an' foolish, an' I was sick over the side before we cleared the keep. The gryphon's never forgiven me, an' neither has the fellow underneath." } },
      choices = {
        { text = "Not everyone's made for the sky.", next = "ride_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ride_stance = {
      big = true,
      lines = { { id = "rs_default", text = "No, an' at the Peak that makes ye a bit odd. Some o' the riders think every Wildhammer should fly, an' some think the keep needs folk wi' their feet on the ground." } },
      choices = {
        { text = "Every Wildhammer should fly. It's who you are.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Folk should find their own way. Yours is the stables.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Bouldertoe, an' there's a few of us scattered about. I'm the one who stayed wi' the animals." } },
    _none = { { id = "tp_none", text = "Ask the beasts; they know more than they let on. Or ask Truk." } },
  },
}
