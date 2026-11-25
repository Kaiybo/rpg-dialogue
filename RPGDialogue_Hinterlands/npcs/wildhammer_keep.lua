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
    first = "He pours as if every mug were a toast, and most are.",
    third = "{name} drank at Truk Wildbeard's bar in Wildhammer Keep, Aerie Peak.",
  },

  greetings = {
    { id = "g_default", text = "Step up, step up! Ale, cheese, a bit o' roast boar, an' the best stories in the Hinterlands for free wi' every mug." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Yer usual, is it? I'll pretend I remember what that was." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late, an' the riders are in, so mind yer elbows. They swing their arms when they tell a story." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Ye've the look o' someone who's been arguin' wi' trolls. Sit, an' I'll pour before ye tell me who won." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye've had a few already, I see, so I'll pour ye a small one an' call it a large one." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, by the beard! Our ale's better than yers, an' I'll fight ye on it, after ye've had one." },
  },

  start = "hello",
  nodes = {
    thulfram = {
      lines = {
        { id = "tf_default", text = "Oh, he minds, he just minds quietly. He frets about the noise an' the spilled ale an' the riders singin', an' then he counts what the beds bring in when they're too merry tae fly home. We suit each other fine." },
      },
      choices = {
        { text = "Who else keeps you company in here?", next = "thulfram_regulars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thulfram_regulars = {
      lines = {
        { id = "tre_default", text = "Old Howin looks in twice a day an' never drinks, because Claira would know. Killium comes up from the stables smellin' o' wolf, an' Drakk comes tae hide from Nioma when his account's due. I keep a stool for each." },
      },
      choices = {
        { text = "A bartender knows where everyone hides.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrols = {
      lines = {
        { id = "pt_default", text = "It does. A rider back from Jintha'Alor drinks fast an' says little, an' one back from the coast drinks slow an' complains about the Revantusk. The ones who've flown near Seradane dinnae drink at all, they just sit." },
      },
      choices = {
        { text = "What do they see at Seradane?", next = "patrols_seradane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrols_seradane = {
      lines = {
        { id = "ps_default", text = "Green dragons, they say, that used tae sleep an' dinnae any more. One lad swore he nodded off in the saddle over it an' woke wi' the bird halfway down. I gave him a double an' told Talonaxe, an' nobody flies that way alone now." },
      },
      choices = {
        { text = "You did right to tell Talonaxe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "Gladly, cousin! Ours is brewed wi' mountain water an' heather, so it's lighter than yer Ironforge stout an' it'll put ye on yer back twice as fast. Dinnae tell me which is better till ye've finished the mug." },
      },
      choices = {
        { text = "Then fill the mug, and I'll judge fairly.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Truk Wildbeard, an' this is my bar, though Thulfram likes tae say it's his inn. He's got the beds an' I've got the barrels, so ye can guess where folk spend the evenin'." },
        { id = "h_elf", when = { race = "NightElf" },
          text = "A kaldorei, at the Peak! Ye'll be wantin' somethin' gentler than our ale, I'd wager, but I've only got ale, so we'll see how ye manage." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Stand on the stool, there's a good lad, or lass, an' I'll be able tae see who I'm pourin' for." },
      },
      again = {
        { id = "h_again", text = "Another? Or another question, which is cheaper?" },
        { id = "h_again2", text = "Aye? The barrel's no' goin' anywhere, an' neither am I." },
        { id = "h_again3", text = "Ask away, an' lean on the bar while ye do, it likes the company." },
      },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "What's the gossip in the keep?", next = "gossip" },
        { text = "Who drinks the most here?", next = "drinkers" },
        { text = "Is your ale better than Rhapsody's?", next = "rhapsody" },
        { text = "Thulfram doesn't seem to mind sharing a roof.", next = "thulfram" },
        { text = "A bar hears where the patrols have been.", next = "patrols" },
        { text = "Pour for a cousin from Ironforge, and tell me how it compares.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I'll be off, Truk.", next = "END" },
      },
    },

    gossip = {
      lines = { { id = "go_default", text = "The Vilebranch are bold again at Jintha'Alor, the Witherbark are stealin' gryphon eggs, an' Talonaxe is in a mood because he's no' been flyin'. Same as last week, only louder." } },
      choices = {
        { text = "They're stealing gryphon eggs? What for?", next = "gossip_eggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_eggs = {
      big = true,
      lines = { { id = "ge_default", text = "Tae eat, or tae sell, or tae raise against us, an' I couldnae tell ye which is worst. The riders want tae burn their villages for it, an' the Thane's half a mind tae let them." } },
      choices = {
        { text = "Burn them out. Egg thieves get no mercy.", next = "BACK", reply = "Ye sound like the riders, an' they'd cheer ye from the rafters. Burn 'em out, then, an' bring the eggs home.", fx = { align = { light = -1 } } },
        { text = "Get the eggs back, but spare the young ones.", next = "BACK", reply = "Aye, that's the better way, an' the Thane would say the same. The young ones didnae steal anythin'.", fx = { affinity = 1, align = { light = 1 } } },
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
        { text = "Your secret's safe. A man's entitled to his bottle.", next = "BACK", reply = "Bless ye. A barkeep's entitled tae his medicine, an' a medicine's entitled tae be strong.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Oh, I'll be telling everyone, Truk.", next = "BACK", reply = "Ye wouldnae dare! I'll water yer ale for a month, an' ye'll never know which mug.", fx = { align = { honor = 1 } } },
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
    first = "He's tired of hearing about his black hair.",
    third = "{name} met Drakk Stonehand, the master leatherworker of Wildhammer Keep.",
  },

  greetings = {
    { id = "g_default", text = "There's beasts in these hills that would make a Bronzebeard drop his pint! Go an' have a crack at one, {name}, an' bring me back the hide an' a tall tale tae go wi' it." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! Let me see yer hands. Aye, there's the calluses; ye're one o' us." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! What did ye kill, an' how big was it, an' how much bigger will it be by the time ye've told me?" },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Those are a stitcher's fingers, all pricked an' callused. Good, then ye'll no' need tellin' why a rushed seam is a sin." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer straps are near worn through, an' it pains me tae look at them. See tae them before they see tae ye." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter brings the best skins, because ye know where tae aim. Don't spoil a good hide wi' sloppy shots, mind." },
  },

  start = "hello",
  nodes = {
    crafters = {
      lines = {
        { id = "cf_default", text = "Harggan has the forge an' sells the smiths their coal, an' Nioma keeps me in thread an' salt an' reminds me what I owe her. Between the three of us we keep the riders shod, strapped an' saddled, an' they thank the gryphons for it." },
      },
      choices = {
        { text = "Nioma says you're slow to pay.", next = "crafters_nioma", when = { heardLine = "nioma.dk_default" } },
        { text = "Craftsmen rarely get the songs.", next = "crafters_songs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters_nioma = {
      lines = {
        { id = "cn_default", text = "She told ye that? Well, it's true, an' I'll no' deny it. I pay her the day a piece sells, an' my pieces sell slow because they're dear, an' they're dear because they're good, so really it's a compliment tae us both." },
      },
      choices = {
        { text = "I doubt she sees it that way.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters_songs = {
      lines = {
        { id = "cs2_default", text = "Never, an' it's a scandal. There's a dozen ballads about Falstad's hammer an' no' one about the strap that kept him in the saddle while he swung it. I've half a mind tae write it myself." },
      },
      choices = {
        { text = "I'd listen to that ballad.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    harness = {
      lines = {
        { id = "hn_default", text = "More than ye'd believe. A gryphon in a dive pulls on every buckle at once, an' troll spears dinnae help. Guthrum brings me a heap o' broken tack every week, an' I mend it between the work I'd rather be doin'." },
      },
      choices = {
        { text = "Mending keeps riders alive. That's no small work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskin = {
      lines = {
        { id = "xs_default", text = "Owlbeast first, an' cut it from the belly so the back stays whole. Silvermane after that, an' I'll take a wildkin hide if ye've the nerve tae get one. Whatever ye bring, tell me how it died, an' dinnae leave out the good parts." },
      },
      choices = {
        { text = "Belly cut, whole back, and the story. Agreed.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drakk Stonehand, master o' leather for Aerie Peak. Give me a good hide from these hills an' I'll make ye a jerkin the riders will fight over, if folk would only bring the hides tae me instead o' sellin' them in Ironforge." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I stitch." },
        { id = "h_again2", text = "Aye? Ask, an' mind the needle, it's sharper than it looks." },
        { id = "h_again3", text = "Go on. I've a seam tae finish, but my ears are free." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Leatherworking" } },
        { text = "What creatures are you talking about?", next = "beasts" },
        { text = "Why do you want tall tales?", next = "tales" },
        { text = "Your hair's black. Aren't Wildhammer usually fair?", next = "hair" },
        { text = "What's the finest thing you ever made?", next = "finest" },
        { text = "Who else works a craft in this keep?", next = "crafters" },
        { text = "The riders must wear out a lot of harness.", next = "harness" },
        { text = "I skin what I hunt. Which pelts do you want?", next = "xskin", when = { profession = "Skinning" } },
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
        { text = "A wild razorbeak is still kin to your gryphons. Spare them.", next = "BACK", reply = "Kin, aye, but kin that's turned. I'll no' skin a gryphon, but I'll mourn the razorbeak quietly.", fx = { align = { honor = 1 } } },
        { text = "A beast that carries trolls is fair game.", next = "BACK", reply = "Aye, it is, an' I'll make somethin' fine o' its hide. Talonaxe needn't hear about it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tales = {
      big = true,
      lines = { { id = "ta_default", text = "Because a hide's only leather until ye know the story behind it, an' then it's a trophy. Folk pay twice as much for a jerkin from a beast that nearly ate somebody." } },
      choices = {
        { text = "Then I'll tell the truth, small beast and all.", next = "BACK", reply = "Then ye'll get half the price an' all my respect. The truth's a rare hide in this trade.", fx = { align = { honor = 1 } } },
        { text = "Then I'll make every beast twice its size.", next = "BACK", reply = "Ha! Now ye're talkin' like a leatherworker. Twice its size an' twice the coin, an' nobody complains.", fx = { affinity = 1, align = { honor = -1 } } },
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
    first = "She has strong views on owlbeast hides and stronger ones on Drakk.",
    third = "{name} bought supplies from Nioma at Wildhammer Keep.",
  },

  greetings = {
    { id = "g_default", text = "Salt, thread, dye an' the odd hide. If ye're makin' somethin', I've got what ye need." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more salt? Ye must be skinnin' every beast between here an' the Overlook Cliffs." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker. Good, I've salt an' thread an' dye, an' ye'll know what tae do wi' all three." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're late, but I'm still countin' stock, so ye may as well buy somethin'." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If ye've pelts tae sell, show Drakk first an' let him get excited, for the price is always better after." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker, an' wi' good habits, by the look o' yer kit. Ye'll be after the heavy thread, then." },
  },

  start = "hello",
  nodes = {
    traders = {
      lines = {
        { id = "tr_default", text = "Harggan sells the smiths their coal an' flux across the way, Truk sells the ale, an' Thulfram sells the beds an' a decent stew. There's a gnome wi' a cart on the road east who undercuts the lot of us on thread, an' I've words saved up for her." },
      },
      choices = {
        { text = "A little competition keeps prices honest.", next = "traders_gnome" },
        { text = "A keep ought to buy from its own.", next = "traders_gnome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    traders_gnome = {
      lines = {
        { id = "tg_default", text = "Hmph. I'll say this for her: she's camped out among the trolls an' the wolves wi' nae wall round her, an' she's still open for business. That's either courage or bad sense, an' in a trader it's hard tae tell them apart." },
      },
      choices = {
        { text = "You sound as if you half admire her.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying = {
      lines = {
        { id = "fy_default", text = "A gryphon carries a rider an' two sacks, an' nae more, an' Guthrum Thunderfist charges me for the bird's supper besides. So everythin' on these shelves has flown further than most folk in the keep, an' it's priced like it." },
      },
      choices = {
        { text = "Why not a wagon up the western road?", next = "flying_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying_road = {
      lines = {
        { id = "fr_default", text = "Because the western road comes up out o' the Plaguelands, an' I'll no' sell thread that's sat a night in that air. The gryphons come in clean from the south, an' clean is worth the coin." },
      },
      choices = {
        { text = "Fair. I'd pay for clean, too.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskin = {
      lines = {
        { id = "xs_default", text = "A fair price for whole hides an' nothin' for ragged ones, the same as anywhere. But take the fine pelts tae Drakk an' the plain ones tae me, an' ye'll do better out o' both of us than ye deserve." },
      },
      choices = {
        { text = "Sound advice. Let's see your stock.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nioma, an' I sell leatherworkin' supplies tae Drakk an' anyone else who can stitch. Half my trade is him, an' the other half is folk he's sent me." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've stock tae sort." },
        { id = "h_again2", text = "Aye? Ask while I count, I can do both." },
        { id = "h_again3", text = "Go on, then, but dinnae lean on the salt barrels." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You and Drakk work together?", next = "drakk" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "Do you ever work leather yourself?", next = "craft" },
        { text = "Who else trades in the keep?", next = "traders" },
        { text = "Flying goods in must cost you dearly.", next = "flying" },
        { text = "What would you pay for good hides?", next = "xskin", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "Thank you, Nioma.", next = "END" },
      },
    },

    drakk = {
      big = true,
      lines = { { id = "dk_default", key = true, text = "He makes the wonders, an' I make sure he's got the salt tae make them, an' I get none o' the stories told about me. He's a fine craftsman an' a terrible man for payin' on time." } },
      choices = {
        { text = "Charge him interest. Business is business.", next = "BACK", reply = "Interest, is it? He'd faint. Still, it's a thought, an' I'll keep it in my back pocket.", fx = { align = { honor = -1 } } },
        { text = "Friends shouldn't count every copper between them.", next = "BACK", reply = "Aye, that's the way o' it, an' I'd no' change it. He'd do the same for me, eventually.", fx = { affinity = 1, align = { honor = 1 } } },
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
        { text = "Compete. Good work should stand on its own.", next = "BACK", reply = "Aye, it should, an' mine does. I'd win, an' he knows it, which is why I'll no' bother.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep to your corners. The keep runs smoother that way.", next = "BACK", reply = "Aye, smoother, an' quieter, an' I like quiet. My corner it is.", fx = { align = { order = 1 } } },
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
    first = "He talks to the beasts more than to their owners.",
    third = "{name} met Killium Bouldertoe, the stable master of Wildhammer Keep.",
  },

  greetings = {
    { id = "g_default", text = "Stables are this way. Keep yer beast calm, because the gryphons can smell it, an' they're hungry." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "That's {pet}, is it? A fine animal. It'll want tae hide from the gryphons, so I'll give it the back stall." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Yer beast remembers me, I'd wager, an' it's no' sure how it feels about it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a well-kept beast ye've got. {pet} looks me in the eye an' doesnae flinch, an' that tells me all I need about its keeper." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, is it? The beasts have all turned tae look at ye, every one. I'd give a good deal tae know what they think they're seein'." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Ye'll want a stall, then, an' maybe a word about keepin' yer beast clear o' the aviary." },
  },

  start = "hello",
  nodes = {
    aviary = {
      lines = {
        { id = "av_default", text = "By my own askin'. Guthrum Thunderfist has the roost an' Talonaxe has the war birds, an' they're welcome tae the noise. Down here it's wolves, cats, boars an' the odd bear, an' not one o' them screams at dawn." },
      },
      choices = {
        { text = "Do you and Talonaxe get on?", next = "aviary_talonaxe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aviary_talonaxe = {
      lines = {
        { id = "at_default", text = "Well enough. He thinks anythin' wi'out wings is livestock, an' I think he's been dropped on his head by one bird too many, an' we say so tae each other's faces. He's been poor company since they took Sharpbeak, an' I've let him be." },
        { id = "at_home", when = { questDone = TODO_QUEST("Saving Sharpbeak") }, text = "Well enough. He thinks anythin' wi'out wings is livestock, an' I tell him he's been dropped on his head by one bird too many. He's been near cheerful since Sharpbeak came home, which is unsettlin' in its own way." },
      },
      choices = {
        { text = "That sounds like friendship, of a kind.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills = {
      lines = {
        { id = "hl_default", text = "Silvermane wolves, mostly, for the hunters love them, an' now an' then a great owl some elf has gentled. The trolls keep razorbeaks an' wolves o' their own, an' I've nursed one or two that came in wi' Witherbark collars on." },
      },
      choices = {
        { text = "You'd tend a troll's beast?", next = "hills_troll" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills_troll = {
      lines = {
        { id = "ht_default", text = "A beast doesnae choose who puts the collar on it. I cut the collar off, feed it up an' find it a hunter wi' patience, an' it's never once thrown a spear at me." },
      },
      choices = {
        { text = "The beast is innocent. You do right by it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpet = {
      lines = {
        { id = "xp_default", text = "They all are, the first day. It's the smell o' the gryphons, an' the wind, an' the drop. Leave {pet} wi' me an' I'll bed it down on the low side, away from the roost, an' by mornin' it'll be eatin' again." },
      },
      choices = {
        { text = "Then I'll leave the beast in your hands.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Killium Bouldertoe, stable master. I keep the beasts that aren't gryphons, which up here means the ones everybody forgets about, an' I like it that way." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Be quick, the beasts need feedin' an' they're no' patient about it." },
        { id = "h_again2", text = "Aye? Ask, but keep yer voice down, there's a cat asleep." },
        { id = "h_again3", text = "Go on. The feed can wait a moment, if no' two." },
      },
      choices = {
        { text = "I need the stables.", next = "BUSINESS" },
        { text = "How do beasts cope with the gryphons?", next = "gryphons" },
        { text = "What's the strangest animal you've stabled?", next = "strange" },
        { text = "Do you ever ride the gryphons yourself?", next = "ride" },
        { text = "You're kept apart from the aviary, I see.", next = "aviary" },
        { text = "What beasts do the hills send you?", next = "hills" },
        { text = "My companion's uneasy this high up.", next = "xpet", when = { pet = { type = "Beast" } } },
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
        { text = "Keep them apart. It's safer for everyone.", next = "BACK", reply = "Aye, they would, an' I've said so tae Talonaxe. He listened, for once.", fx = { align = { order = 1 } } },
        { text = "Let them learn. That's the wild's way.", next = "BACK", reply = "Aye, maybe, but the rider who mucked out the aviary for a month would argue wi' ye. So would I.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    strange = {
      lines = { { id = "sr_default", text = "A hunter brought in a turtle once, a great slow thing, an' it bit everythin' in reach an' wouldnae let go. The gryphons were terrified of it, an' I've never been prouder of an animal." } },
      choices = {
        { text = "A champion turtle? Wonderful.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
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
        { text = "Every Wildhammer should fly. It's who you are.", next = "BACK", reply = "That's what they all say, an' I'm the odd one out. I'll stay on the ground, thank ye.", fx = { align = { order = 1 } } },
        { text = "Folk should find their own way. Yours is the stables.", next = "BACK", reply = "Aye, it is, an' I'm happy here. The beasts dinnae care whether I fly.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Bouldertoe, an' there's a few of us scattered about. I'm the one who stayed wi' the animals." } },
    _none = { { id = "tp_none", text = "Ask the beasts; they know more than they let on. Or ask Truk." } },
  },
}
