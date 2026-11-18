-- Darkshire's shops and petitioners: Mabel Solaj and Gunder Thornbush in the Scarlet Raven,
-- Morg Gnarltree's armour, Matt Johnson's mining lessons, the Zipstitches upstairs in
-- Madame Eva's house, Hogan Ference at the Town Hall, and Kzixx by the Darkened Bank road.
-- Voice: bibles/darkshire_shops.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC = P.TODO_NPC

-- Mabel Solaj: general goods in the Scarlet Raven Tavern.
P:NPC {
  key = "mabel", id = TODO_NPC("Mabel Solaj"), name = "Mabel Solaj", title = "General Goods",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "warm" }, values = { "practical", "kind" },
  notices = { "hunger" },
  impression = {
    first = "Mabel Solaj sells candles, flour and lamp oil from a corner of the Scarlet Raven, and she mothers every customer whether they want it or not. In Darkshire, I suspect most of them do.",
    third = "{name} met Mabel Solaj, who sells general goods in Darkshire's Scarlet Raven Tavern.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of the fog, dear. Candles are on the left, bread on the right." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again, and still in one piece. Sit a moment before you go back out." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of you! Buy a loaf, dear, and eat it here where it's warm, before you go anywhere near that wood again." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I mother every single one, whether they want it or not. In Darkshire, most of them do. A shaman's no different." } },
      choices = {
        { text = "Thank you, Mabel. Kindness is precious here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I can look after myself. No need for fuss.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Now and then, though I don't mind a lost candle as much as you'd think, because whoever took it needed the light, and that's what I'm here for. It's the flour I count, since a sack walking off means a family going without bread, and in Darkshire that matters more than wax." },
      },
      choices = {
        { text = "Then I'll pay for my candles and leave your flour be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sack of flour is easy to carry, Mabel.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Mabel.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Barrels of it, dear, and they'd buy more if they could pay. The lamps along the road are all that keep the dead back from the town after sundown, and a fighter who trims a wick is as useful to me as one who swings a sword." } },
      choices = {
        { text = "I'll help keep the lamps lit. They matter as much as swords.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Lamps are the Watch's job. Mine's the fighting.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mabel.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bread doesn't need much meat, dear, but meat pies do, and I'd sell twice as many pies if anyone brought me a clean haunch. Most of what's out in the wood isn't fit for a pie, though, so be choosy." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well fed, {class}, rounder than most of the children in Darkshire this winter. You take good care of it, I can tell." },
      },
      choices = {
        { text = "I'll bring you good game for pies, and not a scrap of rot.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll sell my game to whoever pays most, Mabel.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Mabel.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Brighter, maybe, but I've sold candles to Darkshire for twenty years, and folk like a flame they can blow out themselves. Have a seat, dear, and I'll find you something warm." } },
      choices = {
        { text = "Tradition's served you well, Mabel.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Change does folk good, even in Darkshire.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What sells best here?", next = "sells" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Candles and oil and flour, dear, and nothing darker than burnt toast. If you want that sort of thing, try young Alyssa at Madame Eva's, though you didn't hear it from me." } },
      choices = {
        { text = "I'll keep it out of your shop, Mabel.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Darker arts keep this town alive, Mabel.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Where do your supplies come from?", next = "supplies" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They don't ask, bless them, but I've seen a watcher hold a candle a little longer when somebody's said a prayer over it. If you've a word to spare for my shelf, I'd be glad of it." } },
      choices = {
        { text = "Then I'll bless your shelf. Every candle helps.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A candle burns the same, blessed or not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mabel.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Through the winter, if the carts from Lakeshire keep coming and nobody hoards, which is two big ifs. I put a jar of oil aside for the Watch every week, whatever it costs me, because a dark town is a dead town." } },
      choices = {
        { text = "Ration it fairly, Mabel. Everyone should get their share.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sell to whoever pays most. That's trade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Mabel.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From Stormwind, mostly, since nobody here dares render fat from what lives in this forest. A traveller told me your people light their homes with moonlight and wisps, and I'll confess I was jealous for a week." } },
      choices = {
        { text = "Light should be shared. Darkshire's lamps should never go dark.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Charge what the market bears. Light is worth a fortune here.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your sort burn through lamp oil like nobody else, out on patrol all night, so I keep the jars filled for you." },
        { id = "h_default", text = "Mabel Solaj, and I keep Darkshire in candles, lamp oil and flour, which is to say I keep it in light and bread. Neither one is easy to come by in this wood, so I don't apologise for my prices." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Bless you for coming so far into the dark. I sell more candles to the Night Watch than I ever sold to a chapel, and they need the light just as badly." },
        { id = "h_undead", when = { race = "Scourge" }, text = "Oh, my word, you're one of the... well, you're standing here buying candles and not trying to eat me, so I'll be civil if you will." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want a lantern, dear, for nobody swings straight in the dark, and the dark in this wood never ends." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and a beast with you! I've some flour for bread and a few scraps for the creature, but don't tell the other customers I gave them away." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Sit down, dear, and have something warm, because you look like you've come through the trees and the trees here aren't kind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Oh, you gave me a turn, creeping up like that! Sit down where I can see you, dearie, and let me find you a candle." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Come, sit, have you eaten? I've candles, flour and lamp oil, and you'll want all three in Darkshire, spirits or no." },
      },
      again = {
        { id = "h_again", text = "What else, dear? The kettle's on, and there's no hurry in this fog." },
        { id = "h_again2", text = "Ask away. It's dark out, and nobody's in a hurry to leave." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What sells best in Darkshire?", next = "sells" },
        { text = "How do supplies reach you?", next = "supplies" },
        { text = "Most folk would have left Darkshire by now.", next = "stay" },
        { text = "Your candles would burn brighter with a cantrip.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Watch must keep you busy with lamp oil, Mabel.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you need fresh game for your flour and bread trade, Mabel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I doubt you sell anything for the darker arts, Mabel.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Night Watch ever ask for blessed candles, Mabel?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How long can Darkshire last on what reaches your shop?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does your lamp oil come from the forest, Mabel, or from elsewhere?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You must lose a candle or two to light fingers, Mabel.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You seem to mother every customer, Mabel.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good night, Mabel.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Candles and lamp oil, before anything else. The sun hasn't properly shone on Darkshire in years, and folk here would rather go without supper than sit in the dark." } },
      choices = {
        { text = "Why does the dark frighten them so?", next = "sells_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_dark = {
      lines = { { id = "sd_default", fx = { learn = { "worgen" } }, text = "Because things come out of it, dear. Worgen in the woods, the dead from Raven Hill, and worse things nobody names, and all of them seem to like a dark window best." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies = {
      lines = { { id = "su_default", text = "By cart from Stormwind, when the drivers are brave enough, which isn't often. The road from Elwynn runs straight through the forest, and the drivers whip their horses the whole way and won't stay the night." } },
      choices = {
        { text = "Does Stormwind send anything else?", next = "supplies_sw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_sw = {
      big = true,
      lines = { { id = "ss_default", text = "Flour and letters, and the letters say help is coming. Lord Ebonlocke reads them aloud at the Town Hall, and every year fewer people come to listen." } },
      choices = {
        { text = "Stormwind hasn't forgotten you. Keep faith.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop waiting on Stormwind. Darkshire must save itself.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Somebody has to sell the candles, dear, and my husband's buried here, and I'll not leave him to the dark. I talk to him on the way to market, and he's a better listener now than he ever was." } },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a shop on the square when this was still Brightwood, before the dark came, and I simply never closed it." } },
    advice = { { id = "tp_ad", text = "Carry a spare candle, dear, and never let it be your last one." } },
    night_watch = { { id = "tp_nw", text = "Good lads and lasses, all of them, and they buy more lamp oil than anyone." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask Smitts; he collects stories." } },
    raven_hill = { { id = "tp_raven_hill", text = "When this was Brightwood, folk from Raven Hill came to market every week with eggs and turnips. I still keep a corner of the counter for them, out of habit, and nobody comes." } },
    holy_light = { { id = "tp_holy_light", text = "There was a chapel bell in Brightwood you could hear all the way to Raven Hill. The Light hasn't left us, dear, it's only got harder to hear." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I went to the Faire in Elwynn once as a girl, when this was still Brightwood and the roads were safe. I still have a paper flower from it in my drawer." } },
  },
}

-- Gunder Thornbush: tradesman in the Scarlet Raven Tavern.
P:NPC {
  key = "gunder", id = TODO_NPC("Gunder Thornbush"), name = "Gunder Thornbush", title = "Tradesman",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "dry" }, values = { "practical", "shrewd" },
  notices = { "craft" },
  impression = {
    first = "Gunder Thornbush sells thread, vials and flux in the Scarlet Raven and counts his stock aloud as though it might wander off. He seems to think Darkshire's trade died with its sunlight.",
    third = "{name} met Gunder Thornbush, a tradesman in Darkshire's Scarlet Raven Tavern.",
  },
  greetings = {
    { id = "g_default", text = "Thread, flux, vials and parchment. Whatever your craft needs, I've a little of it." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer. I'll write the date down; it's rare enough." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy" } },
      text = "You've a crafter's hands, friend, and you'll know my prices are fair for a town at the end of a bad road. Have a look at the vials before the alchemists take them." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Mostly it has. Wagons don't come, and folk don't buy. Your spirits won't bring the sun back, I'd guess." } },
      choices = {
        { text = "Keep counting, Gunder. Order keeps hope alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop counting. Close the shop and leave.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Parchment, mostly, and vials, and the odd spool of silk thread for mending robes that caught on a thornbush between here and Raven Hill. There used to be a scribe in town who bought twice what you will, but he went home to Stormwind, and the trade went with him, the way it all does." },
      },
      choices = {
        { text = "Then I'll pay what's marked and keep your counting simple.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take what I need and you can count it after.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gunder.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Should he? In Darkshire, he'd better, because Morg can only fix so many dented breastplates in a day. A spool of good thread and some leather patches can keep you alive on the road between here and Raven Hill." } },
      choices = {
        { text = "I'll learn. A warrior should keep his own kit.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I've no time for needlework. That's what armorers are for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gunder.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I buy the clean ones and turn them into leather, though I'll not pay much for a pelt with a hole through the middle. A hunter who shoots clean brings me a hide worth twice what a sloppy one does." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} would fetch a fine price as leather, {class}, though I can see from your face you'd not take kindly to the thought. My apologies." },
      },
      choices = {
        { text = "I'll bring you clean hides from clean kills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hide's a hide. Pay me for what I bring.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gunder.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Afraid? I know they are, because I'm short three vials since the new moon and I've no idea where they went. You've got quiet hands yourself, so if you see who it is, I'd be grateful for a name." } },
      choices = {
        { text = "I'll bring you a name, Gunder.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Maybe they need the vials more than you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who buys from you?", next = "buyers" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Half of them, and the rest have gone into the ground, so I count my stock aloud now, just so somebody in this town is still counting something. Them that left took their trades with them." } },
      choices = {
        { text = "I'll pray for those who stayed and those who left.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't bring them back, Gunder. Work will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gunder.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It'll hold as long as folk keep buying thread and salt and pretending things are normal. The day they stop, I'll know we're done, and I'll pack up the stock myself." } },
      choices = {
        { text = "Then I'll see that it holds. That's my oath.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it falls, I'd be packed before you, Gunder.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gunder.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The tanners went first, because nobody would hunt in the dark wood, and the weavers followed when the flax fields by the lake went to rot. Now I sell to a handful of crafters and count what's left aloud, because counting is all a shopkeeper can do." } },
      choices = {
        { text = "Reopen the flax fields under guard. Trades are worth defending.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the old trades go. Darkshire will find new ones.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've parchment for your prayers and thread for your robes, and that's about as holy as my stock gets." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your armour wants oiling, I'd say, and I've the oil, if you've the patience to do it properly." },
        { id = "h_default", text = "Gunder Thornbush, tradesman, and I've stock for every craft in Darkshire, though there are fewer crafts every year. Mabel sells the bread and candles, and I sell everything you'd need to make something of your own." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! Herble on the hill sells the clever bits, so I'll not pretend to compete, but if you need plain flux, mine's cheaper." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "You'll be after parchment, I expect, and I'll not ask what you write on it. In this town, the less a tradesman asks, the longer he trades." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Not much in my stock for you, I'll warn you now, unless you mend your own armour, which, in this wood, you might want to." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Now you're a customer worth having, for skins need salt and thread and tanning, and I've got every one of those." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I don't stock much a night elf would need, unless your folk have taken up tailoring, and I'll be surprised if they have." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Ink, parchment, vials for your powders, and I've a fair stock of each, if you'll stand still while I count it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I've thread, vials and flux, so count them with me. Darkshire's trade died with the sunlight, but I keep counting." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've stock to count." },
        { id = "h_again2", text = "Go on. Smitts says I talk too little, so I'm practising." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why are there fewer crafts every year?", next = "crafts" },
        { text = "What do you think of the Night Watch?", next = "watch" },
        { text = "Who buys from you most?", next = "buyers" },
        { text = "You count your stock aloud. Afraid someone's lifting it?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Should a warrior learn to mend his own gear, Gunder?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you buy worg hides, Gunder.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The dark seems to have driven many crafters out, Gunder.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd say Darkshire is barely holding on, Gunder.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What became of Darkshire's trades when the light faded?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does a mage buy from you, Gunder?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Trade looks all but dead in Darkshire, Gunder.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    crafts = {
      lines = { { id = "c_default", text = "Because the crafters leave, or die, or stop working and start drinking at Smitts's bar. The tanner went to Stormwind, the weaver's in the churchyard, and the cooper just stopped coming out of his house one winter." } },
      choices = {
        { text = "Why do you stay, then?", next = "crafts_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafts_stay = {
      big = true,
      lines = { { id = "cs_default", text = "Because if I left, the last crafters would have nothing to work with, and then they'd leave too. Some days I think that's duty, and some days I think I'm just too stubborn to admit the town's dying." } },
      choices = {
        { text = "That's duty. The town needs you.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then go. No one owes a dying town their life.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", fx = { learn = { "night_watch" } }, text = "Brave fools, the lot of them. Commander Ebonlocke formed them when Stormwind pulled its soldiers out, and they've held this town with farmers' sons and old swords ever since." } },
      choices = {
        { text = "Fools?", next = "watch_fools" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_fools = {
      lines = { { id = "wf_default", text = "Only a fool walks into that forest at night with a lantern and a sword, and only a fool like that keeps the rest of us alive. I pay them in thread and say thank you, which is more than Stormwind does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "The Watch, for thread to mend their cloaks, and adventurers like you, for vials and flux. Viktori up the hill buys parchment by the ream to write down what he sees in the stars." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family traded in Brightwood for three generations, and I'll likely be the last of us to do it." } },
    advice = { { id = "tp_ad", text = "Buy what you need before nightfall, friend. Nobody opens a door here after dark." } },
    _none = { { id = "tp_none", text = "That's not in my ledger, and what's not in my ledger I don't bother with." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay goods come up the jungle road at three times their price, and I sell them at four, because the trolls and the dead take their cut too. That's Duskwood trade for you." } },
    raven_hill = { { id = "tp_raven_hill", text = "My grandfather bought wool from Raven Hill every spring. I've no wool and no Raven Hill now, only ledger pages for both." } },
    varian = { { id = "tp_varian", text = "Trade from Stormwind stopped being reliable about the time the king went missing. I don't say there's a connection; I only keep the ledger." } },
  },
}

-- Morg Gnarltree: Darkshire's armorer.
P:NPC {
  key = "morg", id = TODO_NPC("Morg Gnarltree"), name = "Morg Gnarltree", title = "Armorer",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "gruff" }, values = { "craft", "duty" },
  notices = { "kit", "class" },
  impression = {
    first = "Morg Gnarltree makes armour for Darkshire and studies every customer's gear for claw marks before he says hello. He is gruff, and he plainly cares whether the people he outfits come back.",
    third = "{name} met Morg Gnarltree, Darkshire's armorer.",
  },
  greetings = {
    { id = "g_default", text = "Armour, mail and plate. Let me see what you're wearing first, and for Light's sake scrape the ghoul off it before it touches my counter." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Turn round, and let me see the damage." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those are claw marks, and they've gone through. You'll not go back out in that, not while I'm standing here, so take it off and let me look." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Cloth, in Duskwood? You'd do as well walking out there in your nightshirt, though I suppose your magic is meant to be the armour." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They grow worse every month. I outfit fighters, and I want them back. Your spirits won't stop claws, but my armour might." } },
      choices = {
        { text = "Your armour's good work, Morg. I'll wear it proudly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Claws are claws. Armour won't matter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Leather, oiled so it doesn't creak, with a steel plate stitched in over the kidneys, because a worgen likes to come from behind as much as you do. Folk like you think speed is armour, and it is, right up until the night it isn't." },
      },
      choices = {
        { text = "I'll take the plate, Morg, and be glad of it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The plate will slow me. I'll trust my speed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Morg.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mail over the shoulders and plate on the forearms, because a worg goes for the throat and you block with your arm. I've buried men who wore leather because it was lighter, and lighter's no use if you're dead." } },
      choices = {
        { text = "Heavy armour, then. I'd rather be slow than dead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Speed keeps me alive. I'll take the lighter armour.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Morg.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It'll slow you a step, and a step is cheaper than a throat. I've watched too many hunters go out in leathers because it's quiet, and the worgs don't care how quiet you were once they've caught you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} won't wear my armour, {class}, more's the pity. Keep it close, then, so it can stand between you and the teeth." },
      },
      choices = {
        { text = "Mail, then. I'll take the step slower.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep my leathers. Quiet is how I hunt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Morg.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More often than they should, because they think a mended breastplate matters more than a mended rib. I send them on to the inn, but half of them go back out on patrol first." } },
      choices = {
        { text = "Send them to me first. I'll see to the ribs.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they're too proud for a healer, let them limp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Morg.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A second plate over the joint and a thicker strap beneath it, which costs you a little swing and buys you an arm that's still attached. I'd do it to every suit that comes through here, if folk would let me." } },
      choices = {
        { text = "Do it properly, then. Safety over speed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather keep my swing, Morg.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Morg.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Worgen claws, every time, because they go through mail like wool and leave four neat lines a hand apart. I've started riveting a second plate over the ribs, and the Watch call it Morg's folly until it saves them." } },
      choices = {
        { text = "Then nobody should patrol alone. Send them out in pairs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Steel won't save them. Teach them to fight like beasts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, in my forge? I've no armour for cloth folk, but come in out of the dark all the same." },
        { id = "h_default", text = "Morg Gnarltree, armorer. Gavin sells you the blade to fight with and I sell you the steel to survive it, and in this wood the second matters more." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. Your plate's good, but it was made for Stormwind's streets, not Duskwood's claws, and the joints at the elbow will fail you first." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf. Your people taught mine half of what we know about plate, so if you see something wrong in my work, say it plainly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Stand still, let me look at that armour, because if I can see the claw marks from here, the next ones will go through." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Mail's what you want, and I'll not hear otherwise, because the things out there aren't stopping at a bit of leather." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Let me see your hide, then, since I'm told it's armour enough for your kind, and I'll judge whether it's armour enough for Duskwood." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Leather, then, by the look of you, and quiet leather at that. Let me see the claw marks before you say anything." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Let me see your gear for claw marks. Good. You've not fought worgen yet. You will." },
      },
      again = {
        { id = "h_again", text = "What else? The forge won't keep." },
        { id = "h_again2", text = "Speak up. I've been at the anvil all day and my ears are ringing." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "What armour works against worgen?", next = "worgen" },
        { text = "Are you kin to Gavin?", next = "kin" },
        { text = "Your armour must go mostly to the Night Watch.", next = "who" },
        { text = "What armour would you trust against Duskwood's worgs, Morg?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Mail would slow me down on the hunt, Morg.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Watch must come to you hurt before they see a healer, Morg.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How would you strengthen my elbow joints, Morg?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What leaves the worst marks on the armour you mend, Morg?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What armour suits someone who works in the dark, Morg?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The worgen seem to be growing worse, Morg.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Morg.", next = "END" },
      },
    },
    worgen = {
      lines = { { id = "w_default", fx = { learn = { "worgen" } }, text = "Mail at the throat and the inside of the arm, because that's where they bite. Plate's better if you can carry it, but a worgen is faster than any man in plate, so most of the Watch choose mail and hope." } },
      choices = {
        { text = "And against the dead?", next = "worgen_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen_dead = {
      lines = { { id = "wd_default", text = "Anything at all, because the dead are slow and they hit like old men. It's the smell you can't armour against, and the knowing that some of them used to buy from me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "We're all Gnarltrees, and that's all any of us says about it. Clarise teaches, Gavin sharpens and I hammer, and none of us has had a full night's sleep in years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "The Night Watch, mostly, and I give them what I can afford to. Commander Ebonlocke pays when she has coin, and when she doesn't, I send the armour out anyway." } },
      choices = {
        { text = "Why give it away?", next = "who_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_why = {
      big = true,
      lines = { { id = "ww_default", text = "Because an unarmoured watchman is a dead one, and a dead watchman doesn't guard my door. Some would call that charity, and I call it good sense, and I don't much care which you call it." } },
      choices = {
        { text = "It's charity, whatever you call it. It's good.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Good sense. Charity wouldn't keep your forge lit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've hammered armour in Darkshire since it was Brightwood, and I've mended more of it since the dark came than I made before." } },
    advice = { { id = "tp_ad", text = "Mend it before it fails, friend, not after." } },
    _none = { { id = "tp_none", text = "Don't know a thing about that, friend, so ask me about rivets instead." } },
    raven_hill = { { id = "tp_raven_hill", text = "I've mended more armour from Raven Hill than from the worgen, and that's saying something. The dead hit slow, friend, but they never stop." } },
    scourge = { { id = "tp_scourge", text = "If the Scourge ever comes south, Darkshire will be the best-armoured town in the kingdom, because we've been practising on our own dead for years." } },
    magni = { { id = "tp_magni", text = "Ironforge sends some fine plate south now and then, and I take it apart to see how it's done. Then I put it back together better, but don't tell the dwarves." } },
  },
}

-- Matt Johnson: mining trainer.
P:NPC {
  key = "matt_johnson", id = TODO_NPC("Matt Johnson"), name = "Matt Johnson", title = "Mining Trainer",
  bible = "bibles/darkshire_shops.md", role = "trainer", tier = "service",
  communities = { "darkshire" }, temper = { "weary" }, values = { "craft", "cautious" },
  notices = { "craft" },
  impression = {
    first = "Matt Johnson teaches mining in a town where nobody dares go down a mine any more. He seemed glad of a student, and a little worried for me.",
    third = "{name} met Matt Johnson, Darkshire's mining trainer.",
  },
  greetings = {
    { id = "g_default", text = "Here to learn mining? You'll be the first this month, and the last one quit after he dug into somebody's grave by mistake." },
    { id = "g_back", when = { metBefore = true }, text = "Still digging, are you? Good, because somebody in this wood ought to be." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "You've dust in the creases of your hands, so you've been underground. Did you come out the same way you went in? That's all I ask of my students." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The dead are in the mines too, mostly. Your earth spirits might tell you where it's safe." } },
      choices = {
        { text = "I'll mine safely, Matt, and teach others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The mines are lost. Don't waste your time.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "You could light a tunnel without a lamp, I suppose, and that would've saved a few men I knew. But I've seen what's down the old shafts near the Rolling Hills, and some of it doesn't like fire at all, and some of it likes it far too much." },
      },
      choices = {
        { text = "Then I'll go down with a lamp, Matt, like your crew did.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll take what likes the fire and make it mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Copper, mostly, and a few seams of tin, if the dead and the spiders haven't got there first. I'd not send a miner down alone now, but a warrior swinging a pick in one hand and a sword in the other might come back." } },
      choices = {
        { text = "I'll clear the mine. The miners deserve their work back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go in for the ore and keep it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Spiders, mostly, since they love the dark, and a few worgs where the shafts open into caves. Brightwood Grove had a fine copper seam once, and now it's thick with webs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would sniff out a nest of spiders before you walked into one, {class}, so I'd let it go first." },
      },
      choices = {
        { text = "I'll clear the shafts so the miners can go back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Spiders aren't worth the trouble. I'll leave them be.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "They did, and that's where the trouble starts, since every old seam round here has something hiding in it now, worgen or worse. Nobody goes down without wondering who's waiting in the dark." } },
      choices = {
        { text = "I'll clear one, and do it openly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hiding in one suits me fine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why did the mining stop?", next = "stopped" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "It is, and that's why it's good for you, since a body that only reads goes soft. Swing a pick for a week, and I'll wager you'll cast the better for it." } },
      choices = {
        { text = "Discipline in body and mind. I'll try it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My mind's my pick, Matt.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Any advice for a beginner?", next = "advice" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They got a hole each and my hat off, which was all I knew to give them. They're out past Roland's Doom, and I'd not ask you to go there, but I'd not stop you either." } },
      choices = {
        { text = "Then I'll go and say the words over them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're past caring, Matt. Look after yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The worgen, first, and then the dead walked in after them and made themselves at home. We left the carts full and the picks in the wall, and I still dream about the sound." } },
      choices = {
        { text = "Then I'll clear that mine for your crew's sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Mines are cheap, Matt. Dig somewhere safer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Roland's Doom went bad first, and then things started walking out of the lower shafts that nobody had sent down. We sealed the other workings with timber and good intentions, and neither has held." } },
      choices = {
        { text = "Leave the deep places sealed. Some things should stay buried.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Open the mines again. A town needs its miners working.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I buried most of my old crew myself, and nobody said proper words over them, so you're welcome here." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll be swinging that hammer at the dead, not at rock, I expect, and I can't say I blame you." },
        { id = "h_default", text = "Matt Johnson, and I teach mining, though there's precious little of it done in Duskwood now. Most of the men I worked with put their picks down years ago, and the rest are buried with them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf wants mining lessons from a human? You're having me on, but I'll teach you what I know about these hills, and that might be worth something." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior who wants to dig? Good, because in Duskwood you'll need both a pick and a sword, often at the same time." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? You've the arms for a pick, if not the patience, and I've the dead mine shafts to put you in, if you can stand the dark." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll know the trails better than I do now. Do you see old mine shafts out there, in the trees?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll not be keen on mining, I'd guess, but if you're willing to learn, I'm willing to teach, and there's precious few of either in Darkshire." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll teach you to swing a pick if you like, but don't bring that imp down a shaft, there's enough fire in the bad air already." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! A student, at last. Nobody dares go down a mine here anymore. Your earth spirits might help." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've no students waiting, more's the pity." },
        { id = "h_again2", text = "Ask away. It's nice to talk shop with somebody." },
      },
      choices = {
        { text = "Train me in mining.", next = "BUSINESS" },
        { text = "Why did the miners stop?", next = "stopped" },
        { text = "These hills must still hold plenty of ore.", next = "ore" },
        { text = "Any advice for mining in Duskwood?", next = "advice" },
        { text = "Mines make good hiding places, Matt.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Mining seems hard work for a mage.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's in the abandoned mines of Duskwood, Matt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess beasts nest in Duskwood's old mines, Matt.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Did your old crew get the rites they deserved, Matt?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What drove the miners out of these hills, Matt?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Duskwood's miners seem to have stopped digging altogether.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could my arts help a miner in Duskwood, Matt?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why don't people mine here anymore, Matt?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    stopped = {
      lines = { { id = "s_default", fx = { learn = { "worgen" } }, text = "There was a good mine south-east of here, past the Rotting Orchard, and one season the worgen made their den in it. We lost good men in that mine. Folk call it Roland's Doom now, and nobody's gone back down since." } },
      choices = {
        { text = "What drew the worgen there?", next = "stopped_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stopped_why = {
      big = true,
      lines = { { id = "sw_default", text = "I don't know, and I've stopped wanting to. Some in town say it's the same curse that darkened the wood, and some say the beasts are guarding something down there, and the Watch says to stay away either way." } },
      choices = {
        { text = "Someone should go down and find out.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "The Watch is right. Stay out of it.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper and tin, and iron in the deeper veins, more than anyone's dug in years. The hills are rich, and that's the cruelty of it, because the ore's just lying there and nobody's alive enough to take it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "a_default", text = "Mine by daylight, and never go into a cave you can't see the far end of. If you hear digging that isn't yours, don't stop to wonder who it is, just leave." } },
      choices = {
        { text = "That's unsettling advice.", next = "advice_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice_more = {
      lines = { { id = "am_default", text = "It's Duskwood, friend, and all the advice here is unsettling. The settling kind is for Elwynn." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I mined these hills since I was a boy, and now I teach other people to do what I won't." } },
    advice = { { id = "tp_ad", text = "Bring a lantern and a friend, and if you can only bring one, bring the friend." } },
    _none = { { id = "tp_none", text = "Not something you can dig up, so I couldn't tell you." } },
    raven_hill = { { id = "tp_raven_hill", text = "There was good copper under Raven Hill once, and the miners dug it until the dead came up through the shafts. I won't teach anyone to dig there now, not for any price." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron dwarves are said to dig deeper than anyone, and folk say what they found down there changed them. Keep that in mind before you dig too deep yourself." } },
    magni = { { id = "tp_magni", text = "The best miners in the world are King Magni's dwarves, and they'll tell you so before you ask. They're right, which is the annoying part." } },
  },
}

-- Danielle Zipstitch: tailoring supplies, upstairs in Madame Eva's house.
P:NPC {
  key = "danielle", id = TODO_NPC("Danielle Zipstitch"), name = "Danielle Zipstitch", title = "Tailoring Supplies",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "chatty" }, values = { "craft", "curious" },
  notices = { "craft" },
  impression = {
    first = "Danielle Zipstitch sells thread and cloth upstairs in Madame Eva's house and knows everything Eva's visitors say on the stairs. She talks the way she sews, quickly and without dropping a stitch.",
    third = "{name} met Danielle Zipstitch, who sells tailoring supplies upstairs in Madame Eva's house in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Up the stairs already! Mind the cat, who'll steal your lunch, and mind the thread on the floor, which the cat also steals." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread, or more gossip? I've plenty of both." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! I could tell by the neat hem on your cloak, and I'm never wrong about hems. Come and look at the dyes." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Oh, all sorts: fears and hopes and secrets. I sew while I listen. Your spirits must hear secrets too." } },
      choices = {
        { text = "Keep their secrets, Danielle. It's only right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Share the gossip. Secrets are meant for telling.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I sell robes to anyone who pays, dear, though I'd ask you to keep your companion off my bolts, because velvet doesn't take kindly to claws. Madame Eva says the dark arts are a door you can't close again, and I say that's very dramatic of her and good for business either way." },
      },
      choices = {
        { text = "I'll keep the door half shut, Danielle, and the claws off.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Eva's right, and I like it open.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Danielle.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You'd think I'd tell, wouldn't you, but a seamstress who spreads her customers' business stops having customers, and Madame Eva's visitors pay her for secrecy. I'll say this much: more of the Night Watch come to her for readings than will admit to it, and not one of them asks about love." },
      },
      choices = {
        { text = "Then I'll not ask for names, Danielle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd pay for the names, if you'd sell them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Danielle.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Padding, mostly, for under the plate, and you'd be amazed how many warriors skip it and wonder why they're blistered raw. Sheri cuts it and I stitch it, and between us you'll not chafe on the road to Raven Hill." } },
      choices = {
        { text = "I'll take the padding. Good gear starts underneath.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I've never needed padding, and I don't plan to start.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Danielle.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Buy it? I'd kiss you for it, because good silk thread from those great spiders out by the Darkened Bank sews finer than anything from Stormwind. Gather it clean, mind, and not covered in whatever the spider was eating." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is lovely, {class}, but it's looking at Sheri's yarn the way a cat looks at a mouse. Hold it tight." },
      },
      choices = {
        { text = "I'll bring you clean silk. Good work deserves good thread.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring what I gather. Picking it clean is your job.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Danielle.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only the ones who tell her she's a fraud, and you'd be surprised how many come down from Stormwind just to say it. She lets them shuffle the deck, and they always leave a little paler than they came." } },
      choices = {
        { text = "My faith is enough, whatever her cards say.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Perhaps her cards see something prayers miss.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Danielle.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every sash and tabard they own, and I mend the claw tears for nothing when Sheri isn't looking. Commander Ebonlocke says a watcher who looks smart stands straighter, and I've never argued with her." } },
      choices = {
        { text = "She's right. Order starts with how a watch carries itself.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fine cloth won't stop a worgen, Danielle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Danielle.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That the trees whisper near Raven Hill, mostly, and that the worgen howl in words if you listen long enough. I don't believe half of it, but I've started lining the shutter curtains double all the same." } },
      choices = {
        { text = "Ignore idle talk. Fear spreads faster than worgen do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Listen to them. Rumours often carry a grain of truth.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Do tiptoe past Madame Eva's door on your way down, because she does so love an argument with the Church." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a good surcoat over that armour, and I've a lovely deep blue that would suit you." },
        { id = "h_default", text = "Danielle Zipstitch, and Sheri and I keep Darkshire in thread, cloth and dye from up here, above Madame Eva's parlour. You'd be amazed what you hear through the floorboards when you sell thread in a fortune teller's house." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage! Your robes are lovely, but the seams are coming apart under the arms, and you'll want that seen to before a worgen sees to it for you." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Oh, a night elf! I've never seen weaving like yours. Is it true your people use spider silk? We've plenty of spiders here, if you'd care to show me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, up our stairs! Mind Eva's door on the way, because if she hears that armour clanking she'll come out and read your fortune, and you'll not like it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with a beast on our stairs! Sheri will faint if it sheds on the good silk, so keep it on the landing, there's a love." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid on our stairs! Madame Eva went quiet downstairs the moment you came in, and that only happens when someone interesting walks by." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Oh, you came up those stairs without a single creak, and I didn't think that was possible. You'll have to teach me the trick." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! I've a black velvet that would suit you down to the ground, and it won't show the scorch marks." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I hear everything Eva's visitors say on the stairs. Do your spirits gossip too?" },
      },
      again = {
        { id = "h_again", text = "What else? Oh, I do love a visitor." },
        { id = "h_again2", text = "Go on, ask. Sheri says I talk too much, but Sheri isn't here." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What do you hear through the floor?", next = "floor" },
        { text = "What's Madame Eva like?", next = "eva" },
        { text = "Somebody in Darkshire must still buy cloth.", next = "cloth" },
        { text = "Do you sew anything a warrior might wear, Danielle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you'd buy spider silk from the wood, Danielle.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I hear Madame Eva quarrels with priests, Danielle.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Night Watch seems to wear your cloth, Danielle.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do Eva's visitors say about the forest on the stairs?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What gossip comes through your floorboards, Danielle?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you sell robes for one of my calling, Danielle?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do Eva's visitors say on the stairs, Danielle?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Danielle.", next = "END" },
      },
    },
    floor = {
      lines = { { id = "f_default", text = "Everyone in Darkshire comes to Eva sooner or later, wanting to know if their husband will come home or if the curse will lift. I shouldn't listen, but the floorboards are thin and I'm only human." } },
      choices = {
        { text = "You shouldn't repeat what you hear.", next = "floor_repeat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    floor_repeat = {
      big = true,
      lines = { { id = "fr_default", text = "I don't, mostly, only to Sheri and the cat. Though if it would help someone, like knowing the Watch is short of men, I think I ought to tell, don't you?" } },
      choices = {
        { text = "Secrets told in trust should stay secret.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it helps the town, tell.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eva = {
      lines = { { id = "e_default", text = "Kind, strange and never wrong, or so she says, and I've never caught her out. She tells people hard things gently, which is a rare gift, and she pays her share of the candles without complaint." } },
      choices = {
        { text = "Do you believe in her fortunes?", next = "eva_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eva_believe = {
      lines = { { id = "eb_default", text = "I believe she sees something, and I believe she's careful about what she tells. I asked her once about my own future, and she only said I'd always have work, which is either a blessing or a curse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = { { id = "c_default", text = "The Watch, for their cloaks, which they tear on every bramble in the forest. And widows, for black cloth, and there are more of those every season than I'd like to say." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Zipstitches have sewn in Darkshire since before it was dark, and Sheri and I don't mean to be the last." } },
    advice = { { id = "tp_ad", text = "Mend a tear the day you get it, love. In Duskwood, tomorrow you'll have three." } },
    _none = { { id = "tp_none", text = "I haven't heard a thing about that, and believe me, everything said over this counter reaches me sooner or later." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Sheri and I went to the Faire in Elwynn once and came home with sore feet and new patterns. We've been copying those patterns for years, love." } },
    raven_hill = { { id = "tp_raven_hill", text = "We buried our mother at Raven Hill, before it turned. Sheri doesn't speak of it, so please don't ask her." } },
    holy_light = { { id = "tp_holy_light", text = "We sew a little circle of gold thread into every Watch cloak for the Light's protection. Whether it works I can't say, but nobody's sent a cloak back." } },
    prestor = { { id = "tp_prestor", text = "The ladies of Stormwind wear black now, I'm told, because Lady Prestor does. We sell plenty of black in Darkshire too, love, though for different reasons." } },
  },
}

-- Sheri Zipstitch: tailoring supplies, upstairs with Danielle.
P:NPC {
  key = "sheri", id = TODO_NPC("Sheri Zipstitch"), name = "Sheri Zipstitch", title = "Tailoring Supplies",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "anxious" }, values = { "cautious", "craft" },
  notices = { "craft" },
  impression = {
    first = "Sheri Zipstitch keeps the accounts and the good scissors in the Zipstitch shop, and she jumps at every creak on the stairs. She's the careful half of the business and knows it.",
    third = "{name} met Sheri Zipstitch, who sells tailoring supplies with Danielle above Madame Eva's house.",
  },
  greetings = {
    { id = "g_default", text = "Oh! You startled me. Come in, but quietly, please." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again, thank the Light. I thought it was another knock in the night." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, don't you? Then you'll understand why I keep the good thread locked up; Danielle gives it away to anyone with a sad story." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In Darkshire, everything does. I'm the careful one. Your spirits might calm me, if they're kind." } },
      choices = {
        { text = "Careful is wise, Sheri. Keep your accounts tidy.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop jumping. Fear makes you weak.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Everything frightens me, so please don't take it personally, but yes, a little, because it looks at the window the same way the thing outside does. Danielle says I fret too much, and maybe I do, but I keep the books and somebody has to count what could go wrong." },
      },
      choices = {
        { text = "I'll keep it on the landing, Sheri, and away from you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Better it watches the window than you do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sheri.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Could it? Oh, I'd pay for that, if you knew how and it didn't burn the frame, because Danielle laughs at me but she sleeps on the other side of the house. I've stopped looking at the glass at night, since there's a shape in it sometimes that I'd rather never see clearly." },
      },
      choices = {
        { text = "I'll look for myself, Sheri, and tell you true.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some shapes are best left unseen. Keep the curtains drawn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sheri.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Safe enough, I suppose, though every creak on the stairs makes me jump. Having a warrior in town makes me sleep easier, even if you're only passing through." } },
      choices = {
        { text = "I'll keep an eye on the house while I'm in Darkshire.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You'll be fine. Lock your door and stop worrying.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sheri.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not hides, but I'd buy spider silk if it's clean, and Danielle says it sews finer than anything from Stormwind. I keep the accounts, so I'll pay you fair, but don't expect me to haggle; I'll only lose." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is staring at my scissors, {class}, and I'll thank you to keep it off them, because those are the good scissors." },
      },
      choices = {
        { text = "I'll bring you silk at a fair price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring silk, but I'll name the price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sheri.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, would you? I'll stand right behind you, if you don't mind, and I'll keep my eyes shut. Danielle says it's only a branch, but there are no branches on that side." } },
      choices = {
        { text = "Whatever's out there, your window is guarded now.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Danielle's probably right. It's only the wind.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sheri.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It would, though I'd feel terribly guilty keeping a paladin on our landing when the whole town needs one. Perhaps just until the scratching starts, and then you could look and tell me it's nothing." } },
      choices = {
        { text = "I'll stand watch. Your fear isn't foolish, Sheri.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've graver work than a scratching window, Sheri.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sheri.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The forest, the stairs, the wind on the shutters, and Danielle laughing when I jump, which she does every single time. I keep telling myself that fear is only good sense that hasn't been proven wrong yet." } },
      choices = {
        { text = "Fear keeps you alive here. Trust it and stay careful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear is a cage. Step outside sometime and breathe.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Oh, a paladin, on our stairs! Please mind the rail, because Danielle's still cross about the last suit of armour." },
        { id = "h_default", text = "Sheri Zipstitch. Danielle does the talking and I do the accounts, which means I'm the one who worries whether we'll eat this winter. Was there something you needed?" },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "You move very quietly, don't you? Please don't do that up here; my heart can't stand it." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "Oh, a priest. I don't suppose you could say a prayer over the window? Something scratches at it most nights, and I'd feel better." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Oh! A warrior, on our stairs. Do be careful with that sword, please; the last one who came up here caught it on the rail, and Danielle still hasn't mended it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and a beast as well. Please don't let it near the dyes; the last time a dog got in here, it was blue for a week." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh! A druid. You came up the stairs so quietly that I didn't hear a thing, and I'd thank you to stomp next time." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Oh, a mage. Please don't do anything bright in here, because the last time the scissors went flying." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh! You've something with you, haven't you? Something that breathes. Please keep it on the landing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman? Oh, the stairs creaked. Sorry. I keep the accounts and the scissors. Do your spirits make the stairs creak?" },
      },
      again = {
        { id = "h_again", text = "What else? Only quietly, please." },
        { id = "h_again2", text = "Go on. Danielle's gone down to Eva's, so it's just me." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What scratches at your window?", next = "window" },
        { text = "Business looks slow up here.", next = "business" },
        { text = "You and Danielle seem very different.", next = "danielle" },
        { text = "It must feel safe enough up here, above Madame Eva's parlour.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess your shop could use hides, Sheri.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll say that prayer over your window, Sheri.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would it ease your mind if I stood watch tonight, Sheri?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the forest frighten you, Sheri, even inside these walls?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a ward keep that scratching off your window, Sheri?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What I keep with me seems to frighten you, Sheri.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Every creak on the stairs seems to make you jump, Sheri.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    window = {
      lines = { { id = "w_default", text = "I don't know, and I've never looked. Danielle says it's a branch, but there's no tree on that side of the house, and the Watch says to keep the shutters closed and not ask." } },
      choices = {
        { text = "Do you want me to look?", next = "window_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    window_look = {
      big = true,
      lines = { { id = "wl_default", text = "No! Please don't. Whatever it is, it hasn't come in, and I won't give it a reason to. Some things in Duskwood are better left unseen." } },
      choices = {
        { text = "Fear only grows in the dark. Face it.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "You're right. Leave it alone.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "Poor, and getting poorer, though black cloth sells well enough. Danielle won't charge the Watch full price, and I can't make her, so I charge everyone else a little extra and feel terrible about it." } },
      choices = {
        { text = "Including me?", next = "business_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business_me = {
      lines = { { id = "bm_default", text = "Only a little, and only because you look like you can afford it. I'm sorry; it's for the Watch, if that helps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danielle = {
      lines = { { id = "d_default", text = "We are, and it's why the shop works. She charms them in and I make sure they pay on the way out, and between us we've kept the doors open longer than half of Darkshire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sewn in this house since I was a girl, and I've never once slept well in it." } },
    advice = { { id = "tp_ad", text = "Keep the shutters closed and the candles lit, and don't open the door to anyone who won't say their name." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd rather not find out, if it's all the same to you." } },
    raven_hill = { { id = "tp_raven_hill", text = "I can see the road to Raven Hill from my window, and I keep the shutters closed on that side. Danielle says I'm being silly, and maybe I am." } },
    dark_riders = { { id = "tp_dark_riders", text = "They went past the house one night, the black horses, and I didn't breathe until they were gone. I'd rather not talk about it, if it's all the same to you." } },
    holy_light = { { id = "tp_holy_light", text = "I say the old prayers every night with the candles lit, because my mother did and her mother did. I'd be too frightened to sleep if I stopped." } },
  },
}

-- Hogan Ference: a townsman who haunts the Town Hall.
P:NPC {
  key = "hogan", id = TODO_NPC("Hogan Ference"), name = "Hogan Ference",
  bible = "bibles/darkshire_shops.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "bitter" }, values = { "justice", "family" },
  impression = {
    first = "Hogan Ference waits in Darkshire's Town Hall every day to ask the council what they mean to do about the dead. Nobody has given him an answer, and he has stopped expecting one.",
    third = "{name} met Hogan Ference, a frustrated townsman who waits in Darkshire's Town Hall.",
  },
  greetings = {
    { id = "g_default", text = "You're not from Stormwind, are you? Then you're no use to me, but you may as well sit." },
    { id = "g_back", when = { metBefore = true }, text = "Still here, and so am I. The council still hasn't said a word." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never once. I keep coming back. Your spirits might give me an answer the council won't." } },
      choices = {
        { text = "Keep asking, Hogan. Persistence matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop waiting on the council. Act yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'd ask you to stand in front of that council and tell them what's actually raising the dead, because they don't believe a farmer and they won't believe a priest. Somebody with books in his head might shame them into doing something before my fence comes down." },
      },
      choices = {
        { text = "I'll speak to the council, Hogan, and make them listen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Councils never act. I'll go to Raven Hill myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Hogan.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They've talked about it, and they've sent letters to Stormwind about it, and the dead have walked into my neighbour's yard in the meantime. A warrior could do in a night what the council hasn't done in a month." } },
      choices = {
        { text = "I'll stand with you before the council tomorrow, Hogan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The council's useless. I'll fight the dead myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Hogan.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Worgs, three of them, on a night with no moon, and they took the whole flock but the ram. I'd ask the council for compensation, but I'd get another letter, and I can't eat a letter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would have kept my sheep safe, {class}, I'm sure of it. I'd buy a dog, but the last two ran off into the woods and never came back." },
      },
      choices = {
        { text = "I'll hunt down the worgs that took your flock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sheep are lost in every war. Buy more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Hogan.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "I've thought of it myself, standing here every day watching them shuffle papers. But if I learn they've done nothing, I'll have to go home and tell my wife, and I don't know that I can." } },
      choices = {
        { text = "Then I'll ask them openly, beside you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll read their papers tonight, quietly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you want from the council?", next = "council" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I know that, friend; I'm not a fool, and I know it's Morbent Fel and his kind. What I don't know is why the council sits in this hall while he does it." } },
      choices = {
        { text = "Then I'll put an end to Fel's work.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel's power could be taken from him and used.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why hasn't Stormwind sent help?", next = "stormwind" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Bless the graves so nobody climbs out of them, for a start, and send someone who'll stay longer than a sermon. I'm not asking for miracles, only for somebody to come back the next day." } },
      choices = {
        { text = "I'll come back the next day, Hogan, and the day after.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead need steel, Hogan, not blessings.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Hogan.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the dead there were our neighbours, and some of them still wear the coats we knew them in. Put them down gently if you can and quickly if you can't, and then come and tell the council it's done." } },
      choices = {
        { text = "Gently, then. They were Darkshire's people once.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're dead, Hogan. Quick is the only kindness.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Hogan.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Never, not in my grandfather's time nor his father's, and that's why I won't believe it's natural. Something turned this wood, and I'll keep asking the council until one of them says what." } },
      choices = {
        { text = "The council must act. Keep asking until they do.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop waiting on the council. Gather folk and act yourselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The council says pray, and I've prayed, and the dead still walk past my fence, so tell me what I'm doing wrong." },
        { id = "h_default", text = "Hogan Ference, and I've been coming to this hall every morning for a month to ask the council one question, which is what they mean to do about the undead. I'll keep coming until somebody gives me an answer." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, at last! Are you here for the dead at Raven Hill? Say you are, because this town has prayed for one of you for years." },
        { id = "h_soldier", when = { origin = "human_city_guard" }, text = "You've the bearing of a Stormwind guardsman. Tell me, then, why your lot haven't come back for us, because nobody else in this hall will." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Will you come in with me tomorrow, when I ask the council again? They might answer a man in armour, where they won't answer a farmer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The wolves took my sheep and the dead took my neighbour, so start with the wolves, if you please, since those I understand." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your people know about putting things back the way nature meant, I'm told, so perhaps you'll answer where the council won't." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Do you know anything about the dead, then, or are you just here for the council like the rest of us?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I wait every day to ask the council about the dead. Nobody answers. Will your spirits?" },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere better to be, more's the pity." },
        { id = "h_again2", text = "Ask, then. The council certainly won't." },
      },
      choices = {
        { text = "What do you want the council to do?", next = "council" },
        { text = "Why haven't Stormwind's guards come?", next = "stormwind" },
        { text = "Where are the undead coming from?", next = "raven" },
        { text = "I'll see what I can do.", next = "help" },
        { text = "The council keeps secrets. I could find them out.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "It seems the council has done nothing about the dead, Hogan.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What happened to your sheep, Hogan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The dead walk because someone makes them walk, Hogan.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would you have the Church do about Darkshire's dead?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll go to Raven Hill. What should I know first?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess the dead never rose here before the forest darkened.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would you ask a mage to do, Hogan?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The council never seems to answer you, Hogan.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck, Hogan.", next = "END" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Something, anything at all. Lord Ebonlocke writes letters to Stormwind, Councilman Millstipe makes speeches, and Clerk Daltry files it all in a drawer, and meanwhile the dead walk the road to Raven Hill every night." } },
      choices = {
        { text = "They're doing what they can.", next = "council_can" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_can = {
      big = true,
      lines = { { id = "cc_default", text = "Then what they can isn't enough, and someone should say so. I'm not asking for miracles, only for the council to stop waiting and spend what coin we have on swords instead of letters." } },
      choices = {
        { text = "The council must follow proper channels. Be patient.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Stop writing and start fighting.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormwind = {
      lines = { { id = "s_default", text = "They pulled their soldiers out when the king went missing, and they've never sent them back. Now we have the Night Watch, which is brave, and small, and not nearly enough." } },
      choices = {
        { text = "You look as if you'd join the Watch yourself.", next = "stormwind_watch" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    stormwind_watch = {
      lines = { { id = "sw_default", text = "I tried, and the commander said a man with my knees would only get someone killed. So I do what I can do, which is stand in this hall and make a nuisance of myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raven = {
      lines = { { id = "r_default", fx = { learn = { "raven_hill" } }, text = "The cemetery at Raven Hill won't keep its dead. They climb out at night and wander, and some say it isn't the curse at all but someone raising them on purpose." } },
      choices = {
        { text = "Who would do that?", next = "raven_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raven_who = {
      lines = { { id = "rw_default", text = "Someone who's lost his mind, or his heart, or both. Ask the Watch; they know more than they tell the rest of us, and maybe they'll tell you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = { { id = "h2_default", text = "Will you, now? Everyone says that, and then they go to the tavern. If you mean it, speak to Commander Ebonlocke, because she's the only one in Darkshire who actually does anything." } },
      choices = {
        { text = "I mean it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I farmed east of town until the dark came, and now I petition the council for a living, if you call it living." } },
    advice = { { id = "tp_ad", text = "Don't trust any promise made in this hall, friend. Trust the Watch, and your own two feet." } },
    _none = { { id = "tp_none", text = "Don't know, and don't care. Ask me about the dead, that's all anyone here talks about." } },
    varian = { { id = "tp_varian", text = "The king's gone missing, the council writes letters, and my farm's still under the dark. Nobody in Stormwind's coming, friend, with a king or without one." } },
    prestor = { { id = "tp_prestor", text = "They say Lady Prestor decides what the Highlord reads now, and I've sent the Keep four petitions. Draw your own conclusions; I've drawn mine." } },
    dark_riders = { { id = "tp_dark_riders", text = "They burned my neighbour's barn and didn't take a thing out of it. Who rides that far to burn a barn and leave the grain? Something that isn't hungry, that's who." } },
    raven_hill = { { id = "tp_raven_hill", text = "Raven Hill's full of the dead and this hall's full of excuses, and I know which I'd rather argue with." } },
  },
}

-- Kzixx: a goblin selling rare goods by the road near the Darkened Bank.
P:NPC {
  key = "kzixx", id = TODO_NPC("Kzixx"), name = "Kzixx", title = "Rare Goods",
  bible = "bibles/darkshire_shops.md", role = "vendor", tier = "service",
  communities = {}, temper = { "smooth" }, values = { "greedy", "freedom" },
  notices = { "race" },
  impression = {
    first = "Kzixx sells rare goods from a roadside spot near the Darkened Bank and swears every item is unique. He claims nothing in the forest worries him much, so long as business is good.",
    third = "{name} met Kzixx, a goblin trader selling rare goods by the Darkened Bank road in Duskwood.",
  },
  greetings = {
    { id = "g_default", text = "Rare goods, friend, rare goods, step right up! You can't find these anywhere else this side of Booty Bay, guaranteed, and if you can, they're cheap knockoffs of mine." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, my favourite customer, back again! I got new stock since you left, pal, and it's even rarer, which means, sadly for both of us, it's pricier too." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Ha! Another goblin out in this wet dump? Don't you dare undercut me, pal, 'cause this road's mine, bought and paid for, and I got the receipts around here somewhere." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Business worries me, friend, 'cause the dead don't buy much and the livin' are in too much of a hurry to haggle. Your spirits might help sales, though, if they'd work on commission." } },
      choices = {
        { text = "Honest scales, Kzixx, or the Watch hears about it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sell to the dead, then. They've coin in their graves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "For you, chum, I got shards, real ones, maybe, and a book with a lock on it I never opened 'cause the lock's warm. Business is business and Kzixx doesn't ask, but if that book starts whisperin' to you, you didn't buy it from me, and there's no returns on whisperin' goods." },
      },
      choices = {
        { text = "I'll take your word on the shards, Kzixx, and pay fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A warm lock? I'll take it now and settle up later, maybe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kzixx.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Unique to this side of the Darkened Bank, at least, pal, which is all a fighter really needs. Don't go askin' where I got it, 'cause the answer's a long story involvin' an ogre, a swamp, a very angry dwarf and a keg of blasting powder I'm still payin' off." } },
      choices = {
        { text = "I'll pay a fair price for it, no questions asked.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll pay half, since you probably stole it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kzixx.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Do I buy 'em? I buy anything rare, pal, and a pelt off one of those big worgs would sell twice over in Booty Bay, so there's margin in it for both of us. Keep it clean and keep it whole, and Kzixx'll make you a deal you'll talk about for years." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours would fetch a fortune in Booty Bay, pal, no offence. I'm only sayin' what I see, and everything I see comes with a price tag." },
      },
      choices = {
        { text = "I'll bring you pelts, but I'll set the price myself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Name your price. I'll take what you offer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kzixx.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Three? Then two of 'em are fakes, my friend, and I'd be happy to sell you the real one at a modest markup. You got a good eye, which I respect, though not so much that I'll lower my prices." } },
      choices = {
        { text = "Fine, then show me the real one.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy all three and sell them back to you.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Why set up shop out here?", next = "why" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Arcane curios, sure! I got a crystal from up Karazhan way that hums when you hold it, or at least it hummed when I bought it, and on my mother's ledger it'll hum again for the right buyer. No refunds, no questions and no castin' near the merchandise." } },
      choices = {
        { text = "Show me its provenance first, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No questions suits me. Let's see it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What else is in your stock?", next = "stock" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Here and there, pal, you know how it is: refugees from Lordaeron sellin' what they carried south, and a sailor who owed me money and paid in candlesticks. No questions asked, which is how I get the good stuff." } },
      choices = {
        { text = "Holy things shouldn't be sold off a cart, Kzixx.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it's blessed, it's blessed. Let me take a look.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Kzixx.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sell to anybody with gold, pal, and I don't check for red masks at the door, 'cause a mask don't change the colour of the coin. Course, if you're askin' where they shop, that's information, and information's the rarest stock I got." } },
      choices = {
        { text = "Selling to bandits makes you one of them, Kzixx.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gold's gold. Your business is your own, Kzixx.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Kzixx.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, pal, a carved bow a sailor swore came off a sentinel, and I flipped it to a Stormwind lordling inside the hour at three times what I paid. I didn't ask how the sailor got it, and I'm bettin' you'd rather I didn't find out." } },
      choices = {
        { text = "Stolen goods should go back where they belong.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A bow's a bow. Whoever pays for it owns it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I got holy relics, real ones, mostly, and blessed by somebody, I'm almost sure of it, so step up before the miracles get marked up." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, pal! Shiny armour, shiny hammer, and I bet a shiny purse to go with 'em, so let's see if we can't lighten that load a little." },
        { id = "h_default", text = "Kzixx, purveyor of rare goods to the discernin' traveller, and the less discernin' ones too, 'cause their gold spends just the same. Everything I sell is one of a kind, or at least one of a few, which is still pretty rare." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde, huh, out here in Alliance country? Never mind, pal, I don't care who you fight, I care who you pay, and your gold's every bit as shiny as theirs." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! You folks appreciate quality, chum, and quality's what I got, at a quality price, with quality interest if you're buyin' on account." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A fighter! You got the look of somebody who needs a one-of-a-kind blade, pal, and it just so happens I got one, or one of a few, sharpened and priced to move." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and a beast besides! I got a rare collar here that'll fit it, guaranteed, and if it doesn't, it's an even rarer belt, and the price stays the same either way." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid, now there's a customer! I don't suppose you'd want a genuine Ashenvale acorn, pal, guaranteed authentic and only slightly nibbled." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Hey, a warlock, my kind of customer! I got candles, I got skulls, and I got a very rare black stone that's definitely not from the riverbank, so don't go checkin' the riverbank." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, huh? Unique goods, every one, pal, and nothin' in this forest worries me so long as business is good, and business is always good when the forest's this scary." },
      },
      again = {
        { id = "h_again", text = "What else? Time is money, friend, and I'm losin' both standin' here." },
        { id = "h_again2", text = "Ask away, chum! Questions are free, but answers might cost ya, and the good ones cost ya double." },
      },
      choices = {
        { text = "Show me what's rare.", next = "BUSINESS" },
        { text = "Why sell out here, in Duskwood?", next = "why" },
        { text = "Where do you get your stock?", next = "stock" },
        { text = "I'd be afraid of the worgen, out here alone.", next = "worgen" },
        { text = "Unique, Kzixx? I've seen three of that one.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Any arcane curios in that stock?", next = "xmage", when = { class = "MAGE" } },
        { text = "That sword doesn't look very unique to me, Kzixx.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You look like a goblin who buys rare pelts, Kzixx.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Where does a goblin come by holy relics, Kzixx?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd wager you'd sell to anyone, Kzixx, even the Defias.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you ever sold anything that came out of Ashenvale, Kzixx?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Anything here for a warlock, Kzixx?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Nothing in Duskwood seems to worry you, Kzixx.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll pass.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "'Cause nobody else is out here, pal, so I got no competition! Everybody passin' through this forest is scared and in a hurry, and scared, hurried people buy things without readin' the price tag." } },
      choices = {
        { text = "That's taking advantage of frightened people.", next = "why_advantage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_advantage = {
      big = true,
      lines = { { id = "wa_default", text = "Takin' advantage? I'm providin' a service, pal! They need somethin' rare and powerful to get through this dump, and I happen to have it, at a fair price once you count the risk, the overhead and the worgen." } },
      choices = {
        { text = "A fair price would be lower.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Business is business. I respect that.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "s_default", text = "Here and there, pal, here and there. Adventurers sell me what they don't want, traders bring things up from Booty Bay, and sometimes a thing just turns up and I don't ask where, 'cause questions cut into the margin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      lines = { { id = "wo_default", text = "Afraid? Sure, a little, but a worgen doesn't want my wares, and you can't sell nothin' to somethin' that wants to eat you. A goblin with a loud enough voice and a fast enough pair of legs can outrun most things in this forest, and I got both." } },
      choices = {
        { text = "Has it come to running before?", next = "worgen_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen_run = {
      lines = { { id = "wr_default", text = "Twice! Once from a worgen and once from a customer who didn't like the price, and the customer was faster, if you can believe it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Booty Bay born, Duskwood stuck, and rich enough to leave whenever I want, pal, which is never, 'cause business is good and nobody out here charges rent." } },
    advice = { { id = "tp_ad", text = "Never pay the first price, pal, unless it's mine, 'cause mine's always fair, and on my last copper I'd never lie to a payin' customer." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, but if you find one, bring it here and I'll make you an offer." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay, pal, best port in the world and my old home, where everything's for sale and everybody's buyin'. I'd go back tomorrow, but the margins up here are somethin' beautiful." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The arena down in Stranglethorn's a gold mine, chum: bet on the right fighter and you're set for a year. Bet on the wrong one and you're a cautionary tale, and I've sold to both kinds." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Steamwheedle Cartel keeps the ports neutral and the profits flowin', and I pay my dues like a good boy. Overhead's overhead, pal, and the alternative is sharks." } },
    raven_hill = { { id = "tp_raven_hill", text = "Raven Hill? Old church silver, grave candles and bone charms, pal, and all of it sells in the right market. I happen to know all the right markets." } },
    dark_riders = { { id = "tp_dark_riders", text = "Riders who don't trade, don't talk and don't pay? Worst customers in Duskwood, pal, and I've sold to a man who was mostly dead." } },
  },
}
