-- Feralas beyond the towns: the Forgotten Coast, the Twin Colossals, the Grimtotem country and the quieter folk of Feathermoon and Camp Mojache.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gregan", id = TODO_NPC("Gregan Brewspewer"), name = "Gregan Brewspewer",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Gregan Brewspewer is a dwarf camped out in the Feralas wilds who talks about brewing the way priests talk about the Light.",
    third = "{name} met Gregan Brewspewer, a dwarven brewer camped in the wilds of Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Well met, well met! Sit a moment, if ye can stand the smell of the mash." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, lad? Ye've a nose for a good brew, I'll give ye that." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I hope so, friend, because a world where the dead cannae taste ale is a sorry place tae be dead in. The Light's still in ye, which surprises me, an' if the Light's still in ye then maybe the taste is too, an' I'd be glad tae find out." } },
      choices = {
        { text = "Duty first, Gregan. Ale can wait.", next = "BACK", reply = "Aye, duty first, an' I'll keep a mug warm for when ye're done, because the Light'll want ye tae have it.", fx = { align = { order = 1 } } },
        { text = "Pour me one. Duty can wait an hour.", next = "BACK", reply = "Now there's a paladin after my own heart, an' I'll pour ye the dark one, the one that blew its own lid off.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Strong enough to make a warrior forget the ogre that hit him, aye, and nearly strong enough to forget the ogre altogether. The fruit out here ferments wild, and I've had a barrel blow its own lid off, which is the mark of a proper brew." } },
      choices = {
        { text = "A warrior keeps a clear head. Drink after the fighting's done.", next = "BACK", reply = "Aye, that's the sensible way, an' I'll have a cask waitin' for ye when the ogres are lyin' still.", fx = { align = { order = 1 } } },
        { text = "A strong ale before battle never hurt anyone.", next = "BACK", reply = "By my beard, a warrior who knows his ale, an' I'll pour ye a wee one for courage an' a big one for after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bears, mostly, and the apes down in the Lower Wilds, who eat everything ripe and throw the rest at me. I've started brewing faster just to beat them to it, and the ale's been better for the hurry, oddly enough." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} out of my mash tub, though, because a beast that gets a taste of fermented fruit comes back for more, and I've lost a whole barrel to a tipsy bear before." },
      },
      choices = {
        { text = "The beasts were here first. Share the fruit with them.", next = "BACK", reply = "Share? I've been sharin' all season, friend, an' the apes still throw the leftovers at my head.", fx = { align = { light = 1 } } },
        { text = "Drive them off. Your brew matters more than their supper.", next = "BACK", reply = "Aye, I'd like tae, but those apes have better aim than I do, an' they've got friends in the trees.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only the fruit from the high places, where the beasts nest and the ogres wander! A brewer can't go sneaking about, but a rogue could, and the best ingredients are always where somebody doesn't want ye to be." } },
      choices = {
        { text = "Anything for a good ale, Gregan.", next = "BACK", reply = "Ha, now that's the spirit, an' I'll name the next batch after ye if ye bring me the high fruit.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some places should be left undisturbed.", next = "BACK", reply = "Maybe so, friend, but the best fruit doesn't care what's sensible, an' neither does a thirsty dwarf.", fx = { align = { order = 1 } } },
        { text = "Something else, friend.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Would ye now! That's the kindest offer anyone's made since I left Dun Morogh. Mind ye don't freeze it solid, though, because frozen ale is just a block of sorrow, and I've had enough of those." } },
      choices = {
        { text = "A small spell for a friend is no trouble.", next = "BACK", reply = "Bless ye, friend, an' I'll pour ye the first mug, chilled just right, as a thank you from the bottom of my heart.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My magic isn't for chilling ale.", next = "BACK", reply = "Ach, fair enough, though a wee frost spell never hurt anyone, an' it would've made ye very popular.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ye'd be surprised, friend, because a brew is a living thing, and it sours the moment ye stop caring for it. I'm no priest, mind, but I say a word to the Light before I tap a new cask, and that's never done the ale any harm." } },
      choices = {
        { text = "Prayer belongs in a chapel, Gregan, not in a brew kettle.", next = "BACK", reply = "Maybe so, but the Light's never once complained, an' my ale's never once soured, so I'll keep at it.", fx = { align = { order = 1 } } },
        { text = "Pray wherever you like. The Light hears a brewer too.", next = "BACK", reply = "Aye, that's what I've always thought, an' it's good tae hear it from someone who knows the Light better than I do.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Wise? Probably not, friend, but the fruit grows where it grows, and the gordunni haven't found my camp yet. I keep my axe close and my fire small, and I say a word to the Light every night that the arrangement holds." } },
      choices = {
        { text = "A dwarf should never hide from ogres. Stand your ground.", next = "BACK", reply = "Aye, ye're right, an' I'll not hide, but I'll not go knockin' on their doors either, an' that's a fair compromise.", fx = { align = { honor = 1 } } },
        { text = "If they come, bribe them with a cask. It's cheaper.", next = "BACK", reply = "Ha, that's the best idea I've heard all week, though I'd hate tae waste good ale on an ogre's palate.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Mostly, aye, though the trees here fruit so heavy it'd be a sin tae leave it rotting on the ground. The trouble's the yetis and the ogres, who take what they want an' trample the rest, so I like tae think I'm doin' the forest a favour." } },
      choices = {
        { text = "Take what's fallen, and leave the trees to bear again.", next = "BACK", reply = "Aye, that's my way, mostly, an' the trees seem grateful for it, judgin' by how much they fruit.", fx = { align = { light = 1 } } },
        { text = "If the ogres take it anyway, you may as well take it first.", next = "BACK", reply = "That's the dwarven way o' thinkin', an' I'll not argue with it, especially when the fruit's this sweet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gregan Brewspewer, brewer by trade and by calling! I came all the way to Feralas because the fruit and grain out here grow wilder than anything back in Dun Morogh, and wild makes for a grand ale." },
        { id = "h_c0", when = { race = "Dwarf" }, text = "A fellow son or daughter of Ironforge, out here in the jungle! Ye'll understand, then, why a dwarf goes this far for the perfect brew." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I don't hold with spirits much myself, but if you can bless a barrel, I'll call it a fair morning's work." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? I don't know whose gods you answer to, friend, but most gods I've heard of approve of a decent ale, so we'll get on." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock, out here in the wilds. Well, I'll not pretend I like it, but a thirsty soul is a thirsty soul, and I'll not turn you away from my fire." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Quiet boots in the jungle! Ye'd do well out here, friend, because the beasts of Feralas hear a dwarf coming a mile off, and I've the teeth marks in my backside to prove it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Could ye chill a barrel for me? The heat in these woods spoils a good brew before it's half done, and I'd give my right arm for a cold cellar." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light, out in the jungle! Now there's a blessing I'll take, friend, because a brewer needs watching over his kegs as much as any soldier needs it over his shield." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin in the jungle! Put that hammer down a moment and have a mug, because even the Silver Hand stopped for an ale now and then, or so my grandda claimed." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Ye'll want a strong ale after a day of knocking ogres about, and I've one brewing that'd make a Gordunni weep." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Ye'll know where the wild fruit grows, then, because the beasts always find it first and leave me the pits." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now don't ye be tellin' me the fruit out here belongs to the forest, because I've asked the forest, and it didnae object." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin in the jungle, an' a Forsaken one at that! Put down that hammer a moment an' have a mug, though I've no idea whether ye can taste it." },
      },
      again = { { id = "h_again", text = "What else, {g:lad|lass}? The mash won't stir itself, and by my beard, it's nearly ready." }, { id = "h_again2", text = "Ask away, I'm only half busy." } },
      choices = {
        { text = "Why brew all the way out here?", next = "b1_1" },
        { text = "What's your best brew?", next = "b2_1" },
        { text = "Camping out here doesn't look very safe.", next = "b3_1" },
        { text = "Ironforge misses its brewers.", next = "x_1", when = { race = "Dwarf" } },
        { text = "Do the spirits care about your brewing, Gregan?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What makes Feralas such good ground for brewing?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Brewing hardly seems worth all this danger.", next = "s_1" },
        { text = "Do you need something fetched quietly, Gregan?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I could chill your barrels, Gregan.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the Light have any place in brewing, Gregan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it wise to brew alone with ogres in these hills?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Do you really brew ale strong enough for warriors, Gregan?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which beasts steal your brewing fruit, Gregan?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You seem to take only what the forest can spare, Gregan.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Can a Forsaken paladin still enjoy a brew, Gregan?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Because Feralas grows things ye can't find anywhere else, and a brewer chases flavor the way a hunter chases game. I've found berries here that'd make a Thunderbrew weep." } },
      choices = { { text = "Isn't picking out here dangerous?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The trouble is everything out here wants to eat ye while ye're picking, from the yetis to the gnolls. I'm a better brewer than a fighter, and I know it." } },
      choices = { { text = "Can I help?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So I pay in the only coin I've got, which is honest thanks and the first taste of whatever comes out of the barrel." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Ask me again in a year, when this batch is done! Every brew I've made is me best until the next one, and I mean that every time I say it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Safe? Not a word I'd use for Feralas, friend. I keep a stout door, a loud voice and a hammer by the bed, and so far that's been enough." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and I miss Ironforge, more than I'd admit to anyone but a dwarf. Tell the lads at the Stonefire I'm alive and fermenting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a dwarf who risks his neck for ale is a fool, and maybe they're right, but they drink it all the same." } },
      choices = { { text = "A man should chase what he loves, danger or not.", next = "BACK", reply = "Aye, an' I love ale, so I'll keep chasin' it, ogres or no ogres, an' raise a mug tae ye while I do.", fx = { affinity = 1, align = { order = 1 } } }, { text = "No barrel of ale is worth getting eaten over.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The rain, the fruit, and the old magic in the soil, which I swear you can taste in the barley if you drink slowly enough. Some folk say it's the elves' old enchantments, and I say it makes a grand stout, so we're both happy." } },
      choices = {
        { text = "Then brew it fair, and share it with whoever passes.", next = "BACK", reply = "Aye, I'll share it with any traveller who passes, an' the ones who don't pass are welcome tae come back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bottle it and sell it dear. That's the real magic.", next = "BACK", reply = "Ha, that's the goblin in ye talkin', an' I'll not deny the gold would be nice, but I'd rather see faces smile.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they don't, they ought to, because a good ale is the land's own gift poured into a mug. Feralas grows wild fruit and wilder grain, and if there's a spirit in all that, it's a cheerful one." } },
      choices = {
        { text = "Then thank the land for every barrel you brew.", next = "BACK", reply = "I do, every barrel, an' I'll thank it twice tonight, since ye reminded me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ale's a craft, not a blessing, and the credit is yours.", next = "BACK", reply = "Aye, the craft's mine, but the fruit's the land's, so I'll share the credit, at least the first mug of it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    magni = { { id = "tp_magni", text = "King Magni keeps the best cellars in all of Ironforge, and I've had the honor of tastin' from them once. The man knows a good stout, whatever else you say about him." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron brew with fire salts and spite, and you can taste both. I'd not drink a drop of it if you paid me, and I've been paid to drink worse." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's rum would strip the paint off a ship and the hair off a goblin, and I've seen it do both. It's no brew for a civilized dwarf." } },
    dire_maul = { { id = "tp_dire_maul", text = "There's ogres in Dire Maul brewin' something foul in the old elf halls, and I'd give my left boot to see their recipe, just to know what not to do." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells a cider that's more sugar than apple, and I've told Silas so to his face. He just laughed and charged me double." } },
    _none = { { id = "tp_none", text = "Can't say I know, friend. If it doesn't ferment, I don't pay it much mind." } },
  },
}

P:NPC {
  key = "zorbin", id = TODO_NPC("Zorbin Fandazzle"), name = "Zorbin Fandazzle",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Zorbin Fandazzle runs his business from the Forgotten Coast in Feralas and wants something done about the giants, with as little personal risk as possible.",
    third = "{name} met Zorbin Fandazzle, a goblin on the Forgotten Coast of Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Customer! Or contractor! I'm not picky, boss, come on over and let's talk numbers." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite adventurer's back! Got another job, boss, if you've got the nerve and I've got the coin." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a giant you fight is a giant that steps on you, boss, and a giant you shrink is a giant you can study, sell or put in a jar! Mind you, I still need somebody big and brave to get close enough to zap 'em, which is where you come in, at a very competitive rate." } },
      choices = {
        { text = "I'd sooner face a giant honestly than zap it.", next = "BACK", reply = "Honestly, boss? That's very noble, and also very flat, which is what you'll be when it sits on you.", fx = { align = { honor = 1 } } },
        { text = "Shrink it, then smash it. The easy way works fine.", next = "BACK", reply = "Now you're talkin', boss, and I'll throw in a discount on the zapping if you do the smashing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not as far as I know, boss, which isn't far, because they tend to stomp off in a very small rage. But the thought of a hunter with a pocket-sized giant at heel keeps me up at night, in a good way, mostly, because I can smell the market." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not that {pet} needs replacing, mind, because it looks like a fine beast, but think of its face if you came home with a giant the size of a cat, and think what I'd charge for one." },
      },
      choices = {
        { text = "Giants aren't toys. Leave them as nature made them.", next = "BACK", reply = "Nature made 'em big and grumpy, pal, and I'm just making 'em small and grumpy, which is an improvement.", fx = { align = { light = 1 } } },
        { text = "If you can shrink it, it's yours to use.", next = "BACK", reply = "That's the spirit, boss, and if you ever want one, I'll sell you a giant on a leash, slightly used.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Must I? Pal, my crates belonged on this beach until one of those giants sat on them, so yes, I must, and I've got the invoice to prove it. You druids can talk to nature all you like, but nature has never once paid its bills." } },
      choices = {
        { text = "Shrink only the ones that threaten you, then.", next = "BACK", reply = "That's the plan, pal, mostly, though they all look pretty threatening from where I'm standing.", fx = { align = { light = 1 } } },
        { text = "Nature doesn't pay bills. Shrink away.", next = "BACK", reply = "Now you sound like a businessman, boss, and I'll put that on a plaque next to my invoice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I know it works, pal, and that's the important part. The giants shrink when you zap 'em, and I'd like to know if it's magic or engineering, because it changes which licensing board I have to pay off." } },
      choices = {
        { text = "You shouldn't use what you don't understand.", next = "BACK", reply = "I understand it fine, pal, it shrinks things, and the rest is paperwork I'll get to eventually.", fx = { align = { order = 1 } } },
        { text = "If it works, it works. Use it.", next = "BACK", reply = "Exactly, boss, and the giants don't care how it works either, they're too busy being small.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I'm the brains of this operation, boss, and brains don't get stepped on. You're the feet, and quiet feet at that, so you're the one who gets close enough to zap, and I'm the one who counts what's left." } },
      choices = {
        { text = "I'll do it. Someone has to be brave.", next = "BACK", reply = "That's the spirit, boss, and I'll be right here keeping count and cheering from a safe distance.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Brave is for fools. Pay me double.", next = "BACK", reply = "Ha, now you're thinkin' like a goblin, boss, and I'll pay you one and a half, which is double by goblin math.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Necessary is a strong word, pal, but those giants are pulling up the coast like weeds, and the shore's where I do my business. Besides, the zapper doesn't kill 'em, it shrinks 'em, and a shrunken giant is a lot easier to have a sensible conversation with, or a sensible negotiation." } },
      choices = {
        { text = "Mercy suits even giants. Better shrunk than slaughtered.", next = "BACK", reply = "Mercy and profit both, pal, and a shrunken giant is worth more alive than dead to a collector.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shrinking them is too gentle. They've earned worse.", next = "BACK", reply = "Too gentle, maybe, but the zapper's what I've got, and I'm not paying for a bigger one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They walk off, mostly, a little confused and a lot smaller. I'll be straight with you, boss, I'd like to sell the gizmo to anybody who has a giant problem, but in the meantime the coast is safer, and that's got to count for somethin' with your sort." } },
      choices = {
        { text = "Shrinking is kinder than killing. I'll help you.", next = "BACK", reply = "Now you're talkin' my language, boss, and I'll put you down as an official field operative.", fx = { align = { light = 1 } } },
        { text = "A smaller giant is still a giant. Better to end them.", next = "BACK", reply = "Maybe so, boss, but a smaller giant's a lot easier to step around, and a lot harder to step on you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zorbin Fandazzle, goblin of commerce and science, mostly commerce, boss. The giants on these islands and shores have been tearing up the coast and my profits with it, and I've got a gizmo that'll do something about it." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Zapped Giants") }, text = "Use the zapper on the giants, boss, and bring back what's left when they shrink down. Don't ask me how it works, because the instructions fell in the ocean along with my deposit." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, huh? You turn into animals, right, so tell me, could you turn into somethin' big enough to scare off a giant? I'm asking for business reasons, boss." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Say, can you ask the earth why the giants keep stomping my coast? I've got a gizmo, pal, but I'd love a second opinion, especially a free one." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Great, so if my gizmo goes wrong and the giants come stomping, you'll patch me up, right, boss? That's practically insurance, and cheaper than the real thing." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! Say, does your little friend there work for food, or is it more of a contract arrangement? I'm always on the lookout for cheap labour, boss, and it looks very cheap." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Maybe you can tell me how this zapper works, pal, because I've got no idea, and the instructions are somewhere at the bottom of the sea with my last shipment." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Perfect, boss, because I need somebody who can get close to a giant without bein' stepped on, and that's a rarer skill than you'd think, and pricier." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Great, pal, because if my zapper goes off wrong again, I'm gonna need somebody who can grow my eyebrows back." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You look like the sort who'd walk right up to a giant and hit it in the ankle, boss, and that's exactly the sort I'm looking for and payin' for." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Ever thought of taming something that used to be forty feet tall? After my zapper, boss, there's a few around here that are just the right size, and I'm not even chargin' a finder's fee." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now before you start with the righteous fury, pal, I want to point out that a shrunken giant is a giant that isn't stomping anybody, which is basically charity with a profit margin." },
      },
      again = { { id = "h_again", text = "What else, boss? Clock's tickin', and every tick costs me a copper, plus interest." }, { id = "h_again2", text = "More questions? Sure, pal, those are free, which is the only free thing on this beach." } },
      choices = {
        { text = "Must you fight the giants, Zorbin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You mentioned giants.", next = "b1_1" },
        { text = "Is your gizmo safe?", next = "b2_1" },
        { text = "Why set up shop here?", next = "b3_1" },
        { text = "I could improve that gizmo.", next = "x_1", when = { race = "Gnome" } },
        { text = "Do you know why the giants are stirring, Zorbin?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The giants of the coast seem riled up.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "The giants hardly seem to deserve this.", next = "s_1" },
        { text = "You don't seem to know how your own device works.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why not use your gizmo yourself, Zorbin?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is zapping the giants really necessary, Zorbin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why not just fight the giants yourself, Zorbin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can a shrunken giant really be tamed, Zorbin?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What becomes of the giants once you've shrunk them, Zorbin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Big ones, boss, out by the coast and the Twin Colossals, smashing anything that looks like it might be worth money. I had a shipment, past tense, because a giant stepped on it, and that's eight hundred gold I'm never seein' again." } },
      choices = { { text = "And what does your gizmo do?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "So I built a little device that zaps 'em down to a more reasonable size, boss. A small giant is still angry, but at least it's angry at your knees instead of your house, and knees are cheaper to fix." } },
      choices = { { text = "And what do I get?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "What you bring me from them pays for the next shipment, and the next shipment pays for you, boss. That's business, and it's beautiful." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe is relative, pal. It's safe compared to a giant, and that's the only comparison that matters out here, so I'd call it a bargain." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Nobody else is here, boss, and that means nobody else is selling! The ocean's full of trade and the coast is full of trouble, and trouble is where the money hides." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "A gnome? Well, sure, every gnome says that, and then the thing explodes and takes the workshop with it. Tell you what, pal, you zap the giants and I'll keep the blueprints." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Hey, I'm not a philosopher, pal, I'm a businessman. They stepped on my crates first, and a debt's a debt." } },
      choices = { { text = "They wreck the coast. Someone has to stop them.", next = "BACK", reply = "Exactly, pal, and it might as well be me, because I've got the gizmo and the grudge.", fx = { affinity = 1, align = { light = 1 } } }, { text = "They were here first. You're the trespasser.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "If I knew, I'd sell the answer, pal. They wade up out of the sea and smash anything that's built, which includes my business, so whatever's botherin' them is bothering me twice as much and costing me three times." } },
      choices = {
        { text = "Point the gizmo at them and let's be done with it.", next = "BACK", reply = "My thinking exactly, pal, because the gizmo's charged and the giants aren't getting any smaller on their own.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Maybe they're defending something. Find out before you fight.", next = "BACK", reply = "Defending something? Pal, if they're defending something, it's probably valuable, and now I'm interested.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not a clue, boss, and as a goblin of science that bothers me. My guess is something under the coast has 'em riled, and my gizmo doesn't care why, which is the beauty of a gizmo: no questions, no wages." } },
      choices = {
        { text = "Find out why first. Blind fixes cause new trouble.", next = "BACK", reply = "Fine, fine, boss, I'll ask around, but if the answer's expensive, I'm billing you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Who cares why? If the gizmo works, use it.", next = "BACK", reply = "That's the spirit of science, boss, and I'll write it on the gizmo so the next fellow remembers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the center of the world, pal, if the world's a ledger, and I'm out here on the edge of it in a swamp of giants. You can see how a guy gets bitter." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got the best auction house in Kalimdor, but the overhead's murder, so I keep my own little shop out here. Lower costs, higher risk, and the giants are the risk." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel keeps things civilized, and civilized is good for business, and business is good for me. You see how it all works out, friend." } },
    dire_maul = { { id = "tp_dire_maul", text = "Dire Maul's a gold mine with ogres in it, and nobody's figured out how to get the gold out without the ogres getting it first. I'll be the first, someday, when I hire the right muscle." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company gives goblins a bad name, chum, and that takes some doin'. They cut down forests and cut down their partners, and I prefer my partners in one piece." } },
    _none = { { id = "tp_none", text = "No idea, pal, and if it doesn't pay, I've got no time to learn." } },
  },
}

P:NPC {
  key = "kindal", id = TODO_NPC("Kindal Moonweaver"), name = "Kindal Moonweaver",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Kindal Moonweaver watches over the creatures of Feralas, and she is angry at what the Grimtotem do to them.",
    third = "{name} met Kindal Moonweaver, a night elf protector of the wild creatures of Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Hush, friend. The forest listens, as it has since the days of the Ancients, and so do the Grimtotem." },
    { id = "g_back", when = { metBefore = true }, text = "Elune guide you. You've returned, and I'm glad of it." },
  },
  start = "hello",
  nodes = {
    xpt_kindal = {
      big = true,
      lines = { { id = "xpt_kindal_default", text = "A druid can help it heal itself, which is a different and slower thing. The harpies and the Grimtotem have taken a great deal from these woods, and I'd sooner see the land given time than forced back into green by someone in a hurry." } },
      choices = {
        { text = "Then we'll drive out whoever harms it. That helps fastest.", next = "BACK", reply = "That would be faster, and I will not stop you, but the land must still heal after the fighting.", fx = { align = { order = 1 } } },
        { text = "Patience, then. The land knows its own healing best.", next = "BACK", reply = "You speak as a druid speaks, and I am glad of it, because few who carry weapons understand.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They chain them, starve them and sell them, and they call on the earth while they do it. If your spirits are honest, they'll weep with me." } },
      choices = {
        { text = "I'll free them, Kindal. The spirits demand it.", next = "BACK", reply = "Then the spirits will walk with you, and so will I, and the cages will open before the moon rises.", fx = { align = { light = 1 } } },
        { text = "I'll free them, and the Grimtotem will pay in blood.", next = "BACK", reply = "Free them first, I beg you, and then do what you must, because the creatures cannot wait for your vengeance.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Heavily enough that I have lost sisters to it, for the Grimtotem fight hard for what they think is theirs. Hold their warriors at the gate, and I will see every cage in the compound opened before they know we've come." } },
      choices = {
        { text = "Free the beasts and spare whoever we can.", next = "BACK", reply = "That is my hope too, and I will thank you for every Grimtotem you send home alive.", fx = { align = { light = 1 } } },
        { text = "Kill every Grimtotem there, and the cages open themselves.", next = "BACK", reply = "Perhaps they do, but the creatures inside are frightened enough without blood running past their bars.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They break them, or try to, and I believe they trade away whatever will not break. A hunter earns a beast's trust and is chosen by it, but the Grimtotem only take, and the creatures know the difference." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} chose you, I can see it, and that bond is the very thing the Grimtotem will never understand." },
      },
      choices = {
        { text = "A beast must be won by trust, never by a cage.", next = "BACK", reply = "Yes, and the creatures know it, and you will find them coming to you of their own will one day.", fx = { align = { honor = 1 } } },
        { text = "Taming is taming. A cage is just a quicker method.", next = "BACK", reply = "A cage breaks the trust before it can begin, and the creature never forgets, so I cannot agree.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Perhaps not, but what you carry harms everything it touches, whether you mean it to or not. If you would help free them from the Grimtotem cages, I'll not refuse you, but stand well back while they flee." } },
      choices = {
        { text = "I'll stand back. Their freedom matters more.", next = "BACK", reply = "Thank you, and I will not forget it, because freedom given gently is the kind the forest remembers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear won't save them. My power might.", next = "BACK", reply = "Your power might, but the creatures would flee it as they flee the Grimtotem, so please stand back.", fx = { align = { light = -1 } } },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Too many, and more every week, because the Grimtotem trap them faster than I can count. Slip in, open the cages, and slip out, and the creatures will find their own way home through the forest." } },
      choices = {
        { text = "I'll free every last one.", next = "BACK", reply = "Then Elune bless your quiet feet, and may every cage you open be one less I must count.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll free them, but the Grimtotem will pay too.", next = "BACK", reply = "Free them first, and leave the rest to the forest, because the Grimtotem have enemies enough.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Cruelly, and without need, which is what I cannot forgive. They starve them and beat them to make them savage, and the creatures that come out of those cages are wounded in ways no bandage reaches." } },
      choices = {
        { text = "Every creature that suffers deserves mercy. Those cages must open.", next = "BACK", reply = "They must, and they will, and the forest will thank you in whatever way the forest can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is a beast. My mercy goes to people first.", next = "BACK", reply = "Then help the creatures for the forest's sake, if not for theirs, because a wounded forest wounds us all.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Freedom first, and then for the Grimtotem to learn that they cannot take what is wild and keep it in a box. I do not need them dead, though many of my sisters would disagree, because a dead Grimtotem learns nothing." } },
      choices = {
        { text = "Free the beasts and spare the Grimtotem who yield.", next = "BACK", reply = "That is the path I would choose, and I am glad to hear it from someone with a blade in their hand.", fx = { align = { light = 1 } } },
        { text = "The Grimtotem chose cruelty. They've earned the blade.", next = "BACK", reply = "Perhaps they have, but I would rather they learned than died, and I will not stop hoping for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I do not know for certain, though I have seen them carry the cages east, toward their own lands beyond Thousand Needles. Whatever they plan, it is not kindness, and the creatures know it, because they cry out whenever a Grimtotem comes near." } },
      choices = {
        { text = "I'll keep my spells for the guards alone.", next = "BACK", reply = "Thank you, and the creatures will thank you too, because a stray spell would only frighten them more.", fx = { align = { order = 1 } } },
        { text = "I'll use whatever magic frees them fastest.", next = "BACK", reply = "Then use it quickly, and let the creatures go before they learn to fear you as well.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_kindal", tags = { "news" }, when = { party = { class = "DRUID" }, faction = "Alliance" },
          text = "There's a druid of the Circle in your company. {companion} will feel it as I do, that the forest here is sick at the edges and struggling to remember what it was." },
        { id = "h_default", key = true, text = "I am Kindal Moonweaver. The Grimtotem have been trapping the wild creatures of Feralas and caging them, and I mean to see every one of them freed." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Freedom for All Creatures") }, text = "The cages are in the Grimtotem compound. Open them, and the creatures will find their own way home; they know these woods better than we do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Do not come near the creatures, warlock, for they fear you more than they fear the Grimtotem. I can see it in their eyes when you pass." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! Good, because the Grimtotem guard their cages closely, and I need someone who can open a lock before the guards notice." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light, so far from your own lands. The beasts in the Grimtotem cages don't know your faith or mine, but they know suffering, and I'd welcome any hands that would ease it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. The Grimtotem guard their cages with brutes of their own, and I need someone who can stand against them while the creatures go free." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. Then you know what it is to stand beside a beast as an equal, and you will understand why the Grimtotem's cages anger me so." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand. The beasts in the Grimtotem cages cannot ask for justice, so I hope you will ask for it on their behalf." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The beasts the Grimtotem keep are frightened of strange magic, so if you come to the cages with me, keep your spells for the guards." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Grimtotem", min = 20 } }, text = "The Grimtotem around the cages have grown fewer and more nervous, and I know why. Free the creatures while their keepers are still afraid of you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The Grimtotem have shamans too, and they use them to cage the creatures of this forest, so prove to me you're different." },
      },
      again = { { id = "h_again", text = "Ask, and speak gently; the creatures of these woods startle at loud voices, as the kaldorei once startled at the first axes." }, { id = "h_again2", text = "Ask, but quietly." } },
      choices = {
        { text = "Why do the Grimtotem cage them?", next = "b1_1" },
        { text = "You seem at home in these forests, Kindal.", next = "b2_1" },
        { text = "Are the creatures dangerous?", next = "b3_1" },
        { text = "The wild calls to me too.", next = "x_1", when = { class = "DRUID" } },
        { text = "Should the Grimtotem be punished?", next = "s_1" },
        { text = "I mean the beasts no harm, Kindal.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "There must be many creatures caged in that compound.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How do the Grimtotem treat the beasts they cage?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Grimtotem must guard their cages heavily, Kindal.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the Grimtotem do with the beasts they cage?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What justice do the caged beasts need, Kindal?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do the Grimtotem cage these creatures, Kindal?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Grimtotem have done something terrible to these creatures, Kindal.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Can a druid heal a forest, Kindal?", next = "xpt_kindal", when = { party = { class = "DRUID" }, faction = "Alliance" } },
        { text = "I tracked yetis and hippogryphs for Feathermoon, Kindal.", next = "xorig_track", when = { origin = "nightelf_feralas_tracker" } },
        { text = "Farewell.", next = "END" },
      },
    },
    xorig_track = {
      lines = {
        { id = "xtr_default", text = "Then you have walked more of these woods than I have, and you will know the hills where the yetis keep their caves. I have seen Grimtotem hunters up there with empty cages, and I would like a tracker's eyes to tell me where they take them. Will you keep watch for me?" },
      },
      choices = {
        { text = "I'll tell you anything I find.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Kindal.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "For their hides, their strength, or simply to prove they can. The Grimtotem are not like other tauren; they take what they want and call it their right." } },
      choices = { { text = "Not all tauren are like that.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I have watched them drag sprites and beasts into those pens for months. Each night I hear them crying out, and each morning there are fewer." } },
      choices = { { text = "I'll help.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So I ask you to do what I cannot do alone. Free them, and let the Grimtotem learn the forest has friends." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "A daughter of Elune who has spent her life in these forests. Feathermoon guards the coast, but somebody must guard the creatures, and that duty fell to me." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Frightened creatures are always dangerous, friend. Move slowly, open the cages, and step back, because they'll run before they'll fight you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then you understand why I can't simply walk away. Cenarius gave us this charge, and I mean to keep it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at Feathermoon want the Grimtotem driven out of Feralas entirely. I only want the cages emptied, though I'm no longer sure that's enough." } },
      choices = { { text = "Free the creatures. Revenge is not our charge.", next = "BACK", reply = "You speak as a druid speaks, and it eases my heart to hear it, because my sisters are angry.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Drive the Grimtotem out. They've earned it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem trap the beasts of Feralas and pen them for their own ends. I free what I can, and I mark the hills where they camp." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "I keep the Circle's watch over the beasts of this forest, and there is a great deal of forest and very few of us. Every hand helps." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons guard the Dream's gate here in Feralas, and they have grown angry of late. I would not walk near them until they calm.", fx = { learn = { "emerald_dream" } } } },
    elune = { { id = "tp_elune", text = "Elune watches over the hunted as well as the hunter. I try to remember that when I set my traps." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion taught the first druids to listen to the land, and he still sleeps in the Dream while we keep his lessons. I hope he finds us worthy when he wakes." } },
    _none = { { id = "tp_none", text = "That I cannot say. The forest keeps its own secrets." } },
  },
}

P:NPC {
  key = "angelas", id = TODO_NPC("Angelas Moonbreeze"), name = "Angelas Moonbreeze",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Angelas Moonbreeze serves the Feathermoon Sentinels and keeps her eye on the ruins of the old highborne across Feralas.",
    third = "{name} met Angelas Moonbreeze at Feathermoon Stronghold in Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Ishnu-alah, traveler. Feathermoon welcomes those who come in peace." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to Feathermoon. Elune has kept you, I see." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They speak to no one, and that is the trouble. They were proud in life and prouder now, but if the earth here remembers what they did, it may answer you." } },
      choices = {
        { text = "Let the dead rest. I won't disturb them.", next = "BACK", reply = "Then you are wiser than many who come here, and the dead will thank you by staying quiet.", fx = { align = { light = 1 } } },
        { text = "If they know something, I'll make them talk.", next = "BACK", reply = "Then be careful, because the Highborne were proud in life, and they do not take kindly to being commanded in death.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Old magic, and the echoes of those who used it too freely, and things that should have died with Eldre'Thalas. A warrior who goes in must remember that not every enemy there bleeds, and that some of them were once our own people." } },
      choices = {
        { text = "Some places should stay sealed. I'll guard the entrances.", next = "BACK", reply = "Then you will be the wall I need, and Elune will be glad of a warrior who knows when not to enter.", fx = { align = { order = 1 } } },
        { text = "Whatever's in there, I'll cut my way through it.", next = "BACK", reply = "Then go with Elune, but remember that not every enemy there bleeds, and some of them will smile at you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They sense the old magic still bleeding from the stones, I think, the way a deer senses a storm before it breaks. Even the ogres who live there seem changed by it, and I would not let a beast I loved wander within those walls." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch {pet} closely if you ever go near the ruins, and if it refuses to go further, turn back, because its instincts are older and wiser than ours." },
      },
      choices = {
        { text = "Respect the beasts' warning. Leave that magic buried.", next = "BACK", reply = "That is the wiser path, and the beasts have never once been wrong about it.", fx = { align = { light = 1 } } },
        { text = "Old magic is power. It shouldn't be left to rot.", next = "BACK", reply = "That is what the Highborne said, and they are the ones still clinging to it, ten thousand years later.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Perhaps, in time, but not while the ogres squat in Eldre'Thalas and the naga dig along the coast. The Circle teaches patience, and I'm afraid I have less of it than I should." } },
      choices = {
        { text = "Be patient. The forest has outlasted worse than ogres.", next = "BACK", reply = "You are right, and I know it, and still I find my hand on my bow every time I look west.", fx = { align = { order = 1 } } },
        { text = "Patience lets the rot spread. Strike now.", next = "BACK", reply = "Perhaps it does, and I want to strike as much as you do, but the Circle would have my oath if I acted alone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "So the stories say, though none of the Sentinels have gone in and come back with a clear answer. Whatever haunts that place has fed on the arcane for ten thousand years, and I would not want to meet it, even with you beside me." } },
      choices = {
        { text = "Their knowledge should be recovered, whatever the risk.", next = "BACK", reply = "Perhaps, but whoever recovers it must be stronger than the Highborne were, and they were very strong indeed.", fx = { align = { order = -1 } } },
        { text = "Some knowledge should stay buried in ruins.", next = "BACK", reply = "I think so too, and I would bury them deeper if I could, though my sisters would argue with me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not yet, and I pray to Elune you never will be. But every satyr in those ruins once believed it was the master of its own bargain, so I'll ask you to forgive my distance, and to remember what they became." } },
      choices = {
        { text = "I'll remember. I won't make their mistake.", next = "BACK", reply = "Then I will hope you remember it always, because the satyrs once said the same, and they forgot.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their mistake was weakness. I'm not weak.", next = "BACK", reply = "The satyrs said that too, before the demons wore them like cloaks, so I will keep my distance.", fx = { align = { light = -1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Restless spirits of the Highborne who will not admit they are dead, and satyrs who were once our own people, before they gave themselves to the demons. Eldre'Thalas is the worst of it, and no Sentinel walks near its walls without a prayer to Elune first." } },
      choices = {
        { text = "The tormented dead deserve release. I'll pray them to their rest.", next = "BACK", reply = "Then Elune guide your prayers, and may they find the rest that I have never been able to give them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Destroy them all. Ghosts and satyrs have earned no prayers.", next = "BACK", reply = "Perhaps they have, but they were our people once, and I cannot help but pity them a little.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some would say they punished themselves, for the magic they loved is what destroyed them, and what is left of them still clings to it. I have walked those ruins, paladin, and I have pitied them as often as I have hated them." } },
      choices = {
        { text = "Justice can be tempered with pity, even for them.", next = "BACK", reply = "That is how I have come to see it too, though it took me many years and many walks through those ruins.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They brought ruin on the world. Pity is wasted on them.", next = "BACK", reply = "Perhaps it is, but I cannot stop feeling it, and I suspect you would not either, if you saw them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Old Highborne spirits, the satyrs that were once their kin, and ogres who have made a home among the broken towers. My scouts go in quietly and come out with what they can, and the ones who are loud do not always come out at all." } },
      choices = {
        { text = "I'll go quietly and bring back what you need.", next = "BACK", reply = "Then Elune bless your quiet feet, and come back to me with whatever you find, and your life besides.", fx = { align = { order = 1 } } },
        { text = "I'll go in my own way, and keep what I find.", next = "BACK", reply = "Keep what you find, then, but come back to tell me what you saw, because my scouts deserve the knowledge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_dm = {
      big = true,
      lines = {
        { id = "xcl_dm_default", text = "Then you've seen what our ancestors made of their own city, and what it made of them. The satyr Alzzin sank his roots into the eastern gardens and twisted every living thing there to his liking, and I have stood at the edge of those gardens many nights wondering whether the trees still remember being trees." },
      },
      choices = {
        { text = "They remember. The Circle could heal them, given time.", next = "BACK", reply = "Then I hope you are right, and that the Circle sends someone patient enough to try.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn the gardens. Some corruption can't be undone.", next = "BACK", reply = "You may be right, though it grieves me to say it, and I would want to light the first torch myself.", fx = { align = { light = -1 } } },
        { text = "I can't see why the Highborne stayed in Eldre'Thalas at all.", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "Pride, mostly, and fear of the world that came after the Well. They had lost their queen and the source of their magic in a single night, and I think they could not bear to walk out among the people who had warned them." } },
      choices = {
        { text = "Then I'm glad your people chose differently, Angelas.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_dm", tags = { "news" }, when = { cleared = "Dire Maul", faction = "Alliance" }, text = "You've been inside Eldre'Thalas, haven't you, all the way to its deepest halls? I can see it in the way you hold yourself, as if the walls are still listening." },
        { id = "h_default", key = true, text = "I am Angelas Moonbreeze of Feathermoon Stronghold. While Shandris guards the island, I watch the mainland, especially the ruins where our ancestors' mistakes still linger." },
        { id = "h_c0", when = { race = "NightElf" }, text = "A sister of Teldrassil, so far from home! The ruins of this land are your history too, though I wish they were a kinder one." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you'll feel what I feel in the ruins on the mainland, where the old Highborne magic still sours the ground after ten thousand years." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Alliance, here among the ruins of our own Highborne. Look well at what is left of Eldre'Thalas, friend, because it is what becomes of those who love magic more than their own people." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Warlock. The satyrs of Eldre'Thalas were once kaldorei, before they bargained with powers very like your own, and I see them every time I look at you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light. You'll find little of it in the old Highborne ruins across this land, because the magic that broke the world still festers there." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. Your order knows what it is to see corruption rise from within its own ranks, so you may understand better than most what waits in the ruins of Eldre'Thalas." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. The highborne ruins hold more than ogres now, and I would sooner send a shield into them than another of my scouts." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. The beasts avoid the highborne ruins, and I have learned to trust their judgment over any scholar's." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You walk like one of my scouts, and I would not mind having one more who can cross the ruins without waking what sleeps there." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman among the Sentinels. The highborne ruins here are full of spirits that never found rest, and I wonder whether they'd speak to you." },
      },
      again = { { id = "h_again", text = "What else? The ruins have waited ten thousand years to tell their story; they can wait while you ask." }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "Can the land around the ruins be healed?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I don't know the ruins you mean.", next = "b1_1" },
        { text = "What is Feathermoon like?", next = "b2_1" },
        { text = "You seem to know a great deal.", next = "b3_1" },
        { text = "Arcane magic needn't be dangerous.", next = "x_1", when = { class = "MAGE" } },
        { text = "Should the ruins be studied or sealed?", next = "s_1" },
        { text = "Are there still Highborne within those ruins?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'm no satyr, Angelas.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What haunts the Highborne ruins, Angelas?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did the Highborne deserve what became of them?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Something besides ogres must lurk in the highborne ruins, Angelas.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do the beasts avoid the highborne ruins, Angelas?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Something must sleep in the ruins, Angelas.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would the highborne ghosts speak to a dwarf, Angelas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've seen the heart of Dire Maul, Angelas.", next = "xcl_dm", when = { cleared = "Dire Maul", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Isildien, Ruins of Ravenwind, and the great sunken halls of the Highborne. Our ancestors built them in the days before the Sundering, and they were proud, too proud." } },
      choices = { { text = "What happened to the Highborne?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Now the naga and the ogres crawl over them, and worse things stir beneath. The magic the Highborne used still clings to the stones like a sickness." } },
      choices = { { text = "Should I go there?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "We keep watch so no one wakes what sleeps there. Treat those places with care, and never with greed." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Quiet, mostly, with the sea all around, and as safe a place as Feralas offers. Shandris keeps us sharp, and the hippogryphs keep us connected to the rest of Kalimdor." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "I have walked these forests for longer than your grandparents' grandparents. Memory is the one thing my people have in abundance." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Every Highborne said the same before the world split. Be careful, mage, because the lesson cost us everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some of my sisters say we should bury the ruins and forget. Others say we must understand them, lest someone else does first." } },
      choices = { { text = "Study them. Ignorance is a danger of its own.", next = "BACK", reply = "That is my belief too, and I will stand by it, even when my sisters frown at me across the fire.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Seal them. Some knowledge should stay buried.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    highborne = { { id = "tp_highborne", text = "I watch the old Highborne ruins scattered across Feralas, because some of what they left still hums. Old magic does not sleep as soundly as old bones." } },
    dire_maul = { { id = "tp_dire_maul", text = "Eldre'Thalas was a jewel of the old empire, and the ogres crawl over it like flies on a corpse. Some of us think the Highborne in its depths are worse than the ogres." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "Azshara's name still lies carved in the ruins along this coast, and the naga still sing it from the water. I hate the sound of both." } },
    elune = { { id = "tp_elune", text = "Elune keeps the Sentinels' watch with us, every night, and her light is the only friendly thing in some of these ruins." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande keeps the Sentinels strong while the druids sleep in their Dream. Without her, Kalimdor would have fallen to the orcs long ago." } },
    _none = { { id = "tp_none", text = "I know little of that, I'm afraid." } },
  },
}

P:NPC {
  key = "hadoken", id = TODO_NPC("Hadoken Swiftstrider"), name = "Hadoken Swiftstrider",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Hadoken Swiftstrider of Camp Mojache hunts the gordunni ogres of Feralas and trusts newcomers only as far as their blades have proven.",
    third = "{name} met Hadoken Swiftstrider, a tauren hunter at Camp Mojache in Feralas.",
  },
  greetings = {
    { id = "g_main", text = "The Earth Mother walks with you, stranger. Come, sit near the fire." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. The winds told me you would be." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Go west against the gordunni and come back. The Light is a fine thing to carry, but I have seen fine things break, and I would rather see you stand against an ogre than hear you talk about your blessings." } },
      choices = {
        { text = "I'll prove it in battle, not in words.", next = "BACK", reply = "Good. A warrior proves himself on the field, and Mojache will remember what you do there.", fx = { align = { honor = 1 } } },
        { text = "My blessings speak for me. I owe you no proof.", next = "BACK", reply = "Then let your blessings speak loudly when the ogres come, because I will be listening for them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With great clubs and greater numbers, and with shamans who throw fire from behind the line. A warrior who breaks their front rank and keeps going until he reaches the shamans is worth more to Mojache than a hundred who stop at the first ogre." } },
      choices = {
        { text = "Hold together as a line. Lone heroes die at their feet.", next = "BACK", reply = "Wise words. The Gordunni love a lone hero, because he falls the fastest, and I have buried many of them.", fx = { align = { order = 1 } } },
        { text = "Break through and kill the shamans. Fury wins that fight.", next = "BACK", reply = "That is the fury of a young warrior, and I will not stop you, but come back alive so the braves can learn from you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Fight them as yourself, druid, whether you choose claw or moonlight. I ask only that you don't hold back out of pity, because the gordunni show none to our braves." } },
      choices = {
        { text = "Even an ogre deserves mercy if it yields.", next = "BACK", reply = "If it yields, perhaps, but I have never seen one yield, and I will not wait for the first.", fx = { align = { light = 1 } } },
        { text = "No pity, then. The camp comes first.", next = "BACK", reply = "Good. Then you will fight well, and the braves will be glad to have you on the line.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "From hiding, or from the front, as long as they fall and Mojache stands. My braves prefer to fight in the open, but I have learned that ogres do not deserve the honor of a fair fight." } },
      choices = {
        { text = "Every enemy deserves a fair fight.", next = "BACK", reply = "That is the tauren way, and it does you honour, but the Gordunni will not return the favour.", fx = { align = { honor = 1 } } },
        { text = "Ogres don't deserve fairness. I'll strike unseen.", next = "BACK", reply = "Then strike, and do not let them see you, because a Gordunni who sees you is a Gordunni who strikes back.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Hadoken.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It may, and I will not turn it away when the Gordunni come. But the Earth Mother did not make the creatures you bind, and a tauren does not forget that, even beside an ally." } },
      choices = {
        { text = "Victory is all that matters in war.", next = "BACK", reply = "Victory is everything, yes, but the way we win is what we must live with when the war is over.", fx = { align = { honor = -1 } } },
        { text = "I'll use my power for Mojache's protection.", next = "BACK", reply = "Then you are welcome beside me, and I will trust your power as long as it guards the camp.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Hadoken Swiftstrider. Camp Mojache is home to the tauren of Feralas, and the gordunni ogres to the west threaten us every season, as hail threatens the young grass." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A child of Mulgore, here among us. Our camp is small, but the fire is warm, and you are welcome to it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid among the hunters of Mojache! The gordunni to the west have no love for the Earth Mother, and you'll see it in every stump they leave behind." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The gordunni have shamans of their own who call fire out of the earth, so I'll want to see whether yours burns hotter." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Our braves come back from the gordunni hills burned and broken, so if your prayers can mend them, you've earned a place by our fires." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. The gordunni have spellcasters of their own, and they burn our scouts for sport, so let's see whether your fire is the hotter one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You move like a shadow in the grass, and a shadow is what we need against the Gordunni. Their camps are many, but their sentries are lazy." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Warlock. You are of the Horde, and so I will fight beside you against the ogres, but I will not call what you do honorable." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Blades are proven against the gordunni, not in the telling, so I will judge you by what you bring back from their camps." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I trust a newcomer only as far as their blade has proven, and yours has proven nothing to me yet, Light or no Light." },
      },
      again = { { id = "h_again", text = "What else do you seek? Ask, and the fire will listen with me." }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "Should I fight the ogres as a hunter would?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me of the gordunni.", next = "b1_1" },
        { text = "This seems an odd place for a camp.", next = "b2_1" },
        { text = "Do you trust the Alliance here?", next = "b3_1" },
        { text = "I hunt as well. Show me the trails.", next = "x_1", when = { class = "HUNTER" } },
        { text = "Are the gordunni shamans dangerous, Hadoken?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The gordunni magi seem to worry you.", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Should we make peace with Feathermoon?", next = "s_1" },
        { text = "Should I strike the Gordunni from hiding?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My power wins battles, Hadoken.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do the gordunni fight, Hadoken?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How can I prove myself to you, Hadoken?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are ogres who came into Feralas and took the old elven ruins as their own. They follow warlocks among them, and the dark magic makes them bolder every year." } },
      choices = { { text = "What do you need from me?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "They raid our hunting grounds and drive away the game we need. If they are left alone, Camp Mojache will not last another winter." } },
      choices = { { text = "How do I stop them?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Strike at their leaders in Dire Maul's shadow, and the rest will lose heart. Ogres need a strong voice to follow." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Feralas is rich with game and green, and our people need such lands. We came to hunt and to watch over the forest, as the Earth Mother asks of us." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "The night elves at Feathermoon keep to their island and we keep to our hills. I do not trust them, but I do not hate them, and that is enough for now." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then follow the streams west, and look for where the ogres break the brush. They are loud hunters, which makes them easy prey." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some here say we should speak with the night elves, since we face the same ogres. Others say peace with the Alliance is a fool's dream." } },
      choices = { { text = "A common enemy makes allies. Speak with them.", next = "BACK", reply = "You speak sense, though few here would say it aloud, and I am not sure the elves would listen.", fx = { affinity = 1, align = { honor = 1 } } }, { text = "The Horde stands alone. Trust no Alliance blade.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They burn our scouts and they read from scrolls none of us can understand, and every season there are more of them. If you can tell me what their magic is for, you'd do the camp a greater service than a dozen spears." } },
      choices = {
        { text = "I'll study their scrolls and bring you the truth.", next = "BACK", reply = "Then do it quickly, because every scroll they read is another scout we bury.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Kill the magi first. Understanding can wait.", next = "BACK", reply = "That is the soldier's answer, and it is mine too, though I would still like to know what they are reading.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They burn our scouts and laugh about it, so yes, they're dangerous, and their brutes are worse. The gordunni crowd the hills to the west, and they won't leave until they're made to." } },
      choices = {
        { text = "Then we face them openly and drive them back.", next = "BACK", reply = "That is the way I would choose, and the braves will be glad to stand beside you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then poison their camps and let them sicken.", next = "BACK", reply = "That is not the tauren way, and I would ask you to think on it, though I will not stop you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "The Warchief does not need me to praise him, and I do not need to praise him, because his deeds do it. I serve him by killing ogres." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest warrior of my people, and he is old now, but I would not fight him even so. Old bulls know every trick young bulls have not learned." } },
    dire_maul = { { id = "tp_dire_maul", text = "The gordunni come out of Dire Maul and raid our camp, and I hunt them back into it. I have never followed them all the way in, and I am not a fool." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem are a shame to every tauren, and they fight beside the ogres when it suits them. I trust a stranger with a blade more than I trust a Grimtotem with a promise." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave me a strong arm and a sharp eye, and I give her the ogres in return. She seems pleased with the arrangement." } },
    _none = { { id = "tp_none", text = "The Earth Mother has not shared that knowledge with me." } },
  },
}

P:NPC {
  key = "jangdor", id = TODO_NPC("Jangdor Swiftstrider"), name = "Jangdor Swiftstrider",
  bible = "bibles/feralas.md", role = "trainer", tier = "service",
  impression = {
    first = "Jangdor Swiftstrider works leather at Camp Mojache, and he judges the quality of a hide before he judges the person carrying it.",
    third = "{name} met Jangdor Swiftstrider, the leatherworker at Camp Mojache in Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Ah, you bring hides, or you seek knowledge. Either way, you are welcome." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Show me what you have learned." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Something I can't see, which bothers me, since I like to judge a thing by its hide. The Light holds you together the way good stitching holds armor, I think, and I'd not want to be the one who tests the seams." } },
      choices = {
        { text = "The Light holds me together. I trust it.", next = "BACK", reply = "Then trust it, and I will trust it too, though I will not be the one to test the stitching.", fx = { align = { light = 1 } } },
        { text = "My own will holds me. The Light only helps.", next = "BACK", reply = "Then your will must be very strong, little one, and I would not want to stand against it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Beneath the mail, always, and well oiled, for the forests here are wet and the ogres strike hard. A warrior in a good leather jerkin feels the club less, and I would rather fit you properly than see you carried back by Hadoken's braves." } },
      choices = {
        { text = "Good armor, well kept, is a warrior's discipline.", next = "BACK", reply = "That is the truth of it, and I will fit you properly, so the leather keeps you alive as long as you keep it.", fx = { align = { order = 1 } } },
        { text = "Speed and strength keep me alive, not layers of armor.", next = "BACK", reply = "They will, until the ogre lands the blow you did not see, and then you will wish you had listened.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Armor that bends when you draw and holds when the yeti swings, which is harder to make than either alone. I use the hides of the Feralas bears, for they are thick and they shed the rain, and the hunters who follow Hadoken trust nothing else." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} could use a collar of soft hide, too, for the brush here tears at fur, though I suspect it would rather chew one than wear one." },
      },
      choices = {
        { text = "Wear the hide of what you hunt. It honours the beast.", next = "BACK", reply = "It does, and the Earth Mother sees it, so wear it well and remember where it came from.", fx = { align = { light = 1 } } },
        { text = "Armor is armor. Where it came from doesn't matter.", next = "BACK", reply = "It matters to me, little one, and to the beast, and the Earth Mother remembers who forgets.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They're loud, little one, and a rogue in loud leather is a rogue who doesn't live long. The hides from these forests are soft and strong, and armor worked from them moves like the wind and whispers like the grass." } },
      choices = {
        { text = "Quality is worth the wait.", next = "BACK", reply = "Then you will have the finest leather in Feralas, though you may wait a while for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll make do with what I've got.", next = "BACK", reply = "Then make do, little one, but come back when you are ready, and I will make you something worth wearing.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Then mages bleed more than they need to, and that's a shame. I'll not make you a jerkin, but even a mage could do with good leather boots, and nobody's magic was ever weakened by dry feet." } },
      choices = {
        { text = "Tradition matters. I'll keep my robes.", next = "BACK", reply = "Then keep your robes, and I will keep my leather, and the rain will decide which of us was right.", fx = { align = { order = 1 } } },
        { text = "Practical beats tradition. Leather boots it is.", next = "BACK", reply = "Good, then I will make you a pair that keeps your feet dry and your spells steady.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "No, because every hide I work was taken fairly, by Hadoken or by hunters I trust. A druid wears the shape of a beast for a while, and I wear its skin for a while, and I think the Earth Mother sees little difference so long as we both honor it." } },
      choices = {
        { text = "You honor the beasts well. I respect that.", next = "BACK", reply = "Thank you, and Hadoken will be glad to hear it, because he takes the hides as carefully as I work them.", fx = { align = { light = 1 } } },
        { text = "Wearing a shape and wearing a skin are not the same.", next = "BACK", reply = "Perhaps not, but they are not so different as you think, and the Earth Mother sees both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jangdor Swiftstrider, and I work the hides of Feralas into armor worthy of hunters. Hadoken Swiftstrider hunts the ogres, and I make sure the hunters who follow him come home whole." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your kind need room to move when the totems go down, so I'll want to fit you for armor that doesn't fight you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Cloth is fine for prayer, I suppose, but a little leather under your robe never hurt anyone who meets the gordunni." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Your demon will scorch any leather I make, so I won't be fitting it, but I'll gladly fit you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! Your leathers are worn thin where the knives rub, and they creak like an old tree. Let me show you what proper Feralas hide can do." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. You wear cloth, and cloth is not my trade, but I'll tell you this for free: cloth tears on the thorns of Feralas, and leather does not." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You wear mail, I see, but you would fight better in Feralas with good leather beneath it, for the rain rusts everything that is not tended." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Your leathers are worn, and I can tell by the wear that you draw a bow more often than you swing a blade." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You wear the hide of the bear when you choose, so you'll hardly need mine, but I'd be glad to hear what you think of my work." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken in plate. You'll not want my leather, I suppose, but I'd like to know what keeps one of the dead walking, since it isn't anything I can stitch." },
      },
      again = { { id = "h_again", text = "Anything else, friend? The hides will keep, as the Earth Mother keeps us." }, { id = "h_again2", text = "Ask away." } },
      choices = {
        { text = "What makes a good hide?", next = "b1_1" },
        { text = "So you know Hadoken.", next = "b2_1" },
        { text = "Is it wrong to hunt for profit?", next = "s_1" },
        { text = "What armor suits a shaman in Feralas, Jangdor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A spellcaster would need more than robes to survive Feralas.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You seem to dislike my leathers, Jangdor.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Mages don't wear leather, Jangdor.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior wear leather at all, Jangdor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What can you make for a hunter, Jangdor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you feel any guilt working the hides of Feralas, Jangdor?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What keeps me walking, do you think, Jangdor?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Patience, and respect for the beast that gave it. A hunter who rushes the kill ruins the hide, and a leatherworker who rushes the curing ruins the armor." } },
      choices = { { text = "Teach me more.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Feralas has yetis, scorpids and great cats, and each needs its own care. Bring me good leather and I will teach you to honor it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "We share a name and a fire, and he worries too much, though in Feralas worry keeps you alive. Tell him I said that, and he will only worry more." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some of the young ones hunt for coin and leave the meat to rot. I do not like it, though the goblins pay them well." } },
      choices = { { text = "Take only what you need from the land.", next = "BACK", reply = "That is the old way, and the right one, and I wish the young ones would remember it.", fx = { affinity = 1, align = { light = 1 } } }, { text = "A hunter must eat, and coin buys food.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Something that sheds rain, first, and something that turns an ogre's club, second. Cloth gives you neither, so I'd put a leather vest under your robes and say nothing about it to your trainers." } },
      choices = {
        { text = "Trainers aren't out here. I'll wear what works.", next = "BACK", reply = "They are not, and the rain is, so I will fit you a vest that stays out of sight.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "My trainers know best. I'll keep to cloth.", next = "BACK", reply = "Then keep to cloth, and may the Earth Mother keep the ogres away from you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Leather from the beasts of this forest, oiled against the rain, and mail once you're strong enough to carry it. A shaman must move freely when the ogres come, and I'd rather fit you properly than bury you properly." } },
      choices = {
        { text = "Good craft keeps hunters alive, so I'll trust your hand.", next = "BACK", reply = "Then I will fit you well, and the leather will serve you as well as any totem.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather fight light and fast, armor or not.", next = "BACK", reply = "Then fight light, and fast, and I will make you something that does not slow you down.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us every hide, and I work each one so she will not be ashamed of me. A poor stitch dishonors the beast." } },
    cairne = { { id = "tp_cairne", text = "Cairne wears leather I would be proud to have made. The craftsmen of Thunder Bluff are fine, though I will say mine is finer." } },
    dire_maul = { { id = "tp_dire_maul", text = "The beasts near Dire Maul have thick hides from fighting ogres, and they make good armor. Bring me their skins and I will judge them fairly." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem take hides with no prayer and leave the beast to rot, and their leather is poor for it. You can see the shame in every stitch they make." } },
    _none = { { id = "tp_none", text = "I know leather, not that." } },
  },
}
