-- Thorium Point: the Thorium Brotherhood's town on the cliffs above the Cauldron. Voice: bibles/searinggorge.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oilfist", id = TODO_NPC("Overseer Oilfist"), name = "Overseer Oilfist",
  bible = "bibles/searinggorge.md", role = "noble", tier = "quest",
  communities = { "thorium_point" }, temper = { "stern" }, values = { "proud", "practical" },
  notices = { "race", "profession", "lock_shadow" },

  impression = {
    first = "He left the mountain's service and carries that choice like a weight.",
    third = "{name} met Overseer Oilfist, who leads the Thorium Brotherhood's outpost at Thorium Point.",
  },

  greetings = {
    { id = "g_point", text = "Welcome tae Thorium Point, where everything that happens is my responsibility, an' that includes you, now." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good. Ye're either useful or lost, an' I'm hopin' useful." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "Ye've been gone {away}, an' everythin' that went wrong at the Point in that time was my responsibility too. Glad tae have ye back, then." },
    { id = "g_away_long", when = { away = 60 }, text = "I'd marked ye down as lost tae the Dark Irons after {away} away. Strike that from the ledger, then, an' get back tae work." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a fair bit since we last spoke, an' the Brotherhood notices that sort o' thing. There's harder work for ye now." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear somebody at the Point caught ye in a lie. Everythin' here is my responsibility, an' that includes the truth, so don't make me sort it out." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Brotherhood's been sayin' good things about ye. That's rare praise from a lot o' dwarves who mostly talk about ore." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, by yer beard. Our clans have bled each other for centuries, but up here I've no time for it; do ye?" },
    { id = "n_smith", cat = "profession", when = { profession = { "Blacksmithing", "Enchanting" } },
      text = "A craftsman, then, an' ye'll understand us better than most. We were made tae forge, an' we forged for a tyrant, but now we choose." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The forge-fires in this camp leaned toward ye when ye walked in, the way our elders swore every fire in Thaurissan leaned toward the summoners the night they called the Firelord. Mind yerself, warlock, for that's a thing I'd no' see twice." },
  },

  start = "hello",
  nodes = {
    op_darkiron = {
      lines = {
        { id = "opd_default", text = "Ironforge says every Dark Iron is the Firelord's dog, an' the Horde says much the same wi' fewer words. We buy an' sell wi' both, an' we listen. So what d'ye make o' my folk, then?" },
      },
      choices = {
        { text = "The Brotherhood proves the Dark Iron can be free.", next = "op_di_free", fx = { affinity = 2, align = { light = 1 }, opinion = { dark_iron = "redeemable" } } },
        { text = "I'll trust your steel, Overseer, but not your blood.", next = "op_di_distrust", fx = { affinity = -1, align = { light = -1 }, opinion = { dark_iron = "distrust" } } },
        { text = "Ironforge and the Brotherhood can trade. That's a start.", next = "op_di_trade", fx = { affinity = 1, opinion = { dark_iron = "mixed" } }, when = { race = "Dwarf" } },
        { text = "I'm here for the steel, not the history.", next = "BACK" },
      },
    },
    op_di_free = {
      lines = {
        { id = "opdf_default", text = "Free's a big word for a wee camp on a cliff, but aye, we're free, an' every one o' us paid for it. Tell that tae Ironforge if they ever ask, which they won't." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_di_distrust = {
      lines = {
        { id = "opdd_default", text = "Ye're no' the first tae say it, an' ye'll no' be the last. Our steel's honest, an' that'll have tae do until our names are." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_di_trade = {
      lines = {
        { id = "opdt_default", text = "Aye, a start, an' the first one in a few hundred years. Ye'd be surprised how many Bronzebeards buy our plans an' swear they found them in a ditch." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_dwarf = {
      big = true,
      lines = { { id = "xpt_dwarf_default", text = "Peace is a long word for dwarves and we've a few centuries of grudges to work through first, but trade is a short one, and the Brotherhood has always been good at trade. Ironforge buys our thorium and we buy their bread, and nobody asks too many questions about who fought whom in the War of the Three Hammers." } },
      choices = {
        { text = "That war is long done. It's time to make peace.", next = "BACK", reply = "Long done for ye, maybe, but there's lads up here whose grandfathers died in it. Still, I'll take the sentiment, an' gladly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Ironforge shouldn't trust a Dark Iron, Brotherhood or not.", next = "BACK", reply = "Then let Ironforge keep its distance an' buy our thorium all the same. We'll not beg for anyone's trust.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trust's earned here, by everyone, an' we know somethin' about servin' a dark master an' walkin' away. If the Light took ye back after the Scourge had ye, then ye're not so different from us, an' I'll give ye the same chance I'd give any o' my own." } },
      choices = {
        { text = "Anyone can walk away from darkness. You proved it.", next = "BACK", reply = "Aye, an' it's a comfort tae hear it from one who's walked the same road. Ye're welcome at the Point.", fx = { align = { light = 1 } } },
        { text = "Some chains never break. I'll judge each one myself.", next = "BACK", reply = "That's fair, an' it's what I'd do in yer boots. Judge us by what we do, an' we'll do the same for ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Surface steel, too soft at the heart, an' it'll take a notch the first time it meets Dark Iron plate. Earn the Brotherhood's trust, an' our smiths might one day show ye what steel can be when it's made right." } },
      choices = {
        { text = "I'll earn your trust one task at a time, Overseer.", next = "BACK", reply = "Good, an' ye'll find we keep our word as hard as we keep our steel. Start wi' the board.", fx = { align = { honor = 1 } } },
        { text = "I'd sooner buy the secret. Trust takes too long.", next = "BACK", reply = "Ha! Nobody buys a Dark Iron secret, friend, no' for all the gold in Ironforge. Ye'll earn it or go without.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Lava spiders, glassweb spiders an' the blackened basilisks, an' not one o' them has the decency tae die quietly. The spiders have taken tae troublin' the bairns at the Point, too, so I'll not complain if ye thin them out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Lava spiders, glassweb spiders an' the blackened basilisks, an' not one o' them has the decency tae die quietly. The spiders have taken tae troublin' the bairns at the Point, too, so I'll not complain if ye thin them out. Keep {pet} back from the webs, mind, for they spin them over the vents, an' a beast that blunders through one is cooked before ye can pull it free." },
      },
      choices = {
        { text = "I'll clear the spiders and help keep the Point safe.", next = "BACK", reply = "Bless ye for that, an' the bairns' mothers will too. Mind the glassweb ones, they spit.", fx = { align = { order = 1 } } },
        { text = "I'll hunt what I like in the Gorge, for my own reasons.", next = "BACK", reply = "Yer reasons are yer own, so long as the spiders end up dead. I'll no' ask.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "If the Firelord ever stops breathin' under it, aye, maybe. Our forefathers called him up an' burned this land tae ash, so I reckon the Brotherhood owes it somethin', though I couldnae tell ye what." } },
      choices = {
        { text = "Then pay that debt by mending what you can.", next = "BACK", reply = "Aye, maybe, an' I'd like tae think we've started. Every slave we free is a stone put back.", fx = { align = { light = 1 } } },
        { text = "The past is ash. Forge what you need.", next = "BACK", reply = "Spoken like a smith, an' I'll no' argue. But some ash still stings the eyes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The mountain did, an' the masters who served it, an' we stole the learnin' a scrap at a time, at night, the same way we built our road out. Every enchanted plate we sell now is a theft from Ragnaros, an' I'll no' pretend that doesnae warm me." } },
      choices = {
        { text = "Steal everything the tyrant taught you. You owe him nothing.", next = "BACK", reply = "I'll no' argue wi' that, an' I'll go on stealin' till there's nothin' left o' him in my forge.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Craft learned under a tyrant needs careful keeping.", next = "BACK", reply = "It does, an' we keep it careful, believe me. We know better than anyone what it was made for.", fx = { align = { order = 1 } } },
        { text = "Let's talk of other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A servant, by every story we were taught, a great weapon against the Bronzebeards an' the Wildhammers. What came was a master, an' my folk served him for centuries after, so mind yer imps, warlock, because every fool thinks he's the one holdin' the leash." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A servant, by every story we were taught, a great weapon against the Bronzebeards an' the Wildhammers. What came was a master, an' my folk served him for centuries after, so look at yer servant now, warlock, standin' there watchin' ye, an' ask yerself which of ye holds the leash." },
      },
      choices = {
        { text = "Every leash needs a strong hand, and mine is strong.", next = "BACK", reply = "Every fool says that too, warlock. I'll be watchin' yer leash, an' so will the Brotherhood.", fx = { align = { light = -1 } } },
        { text = "Some powers should never be called at all.", next = "BACK", reply = "Aye, an' my folk learned that the hard way. Ye've more sense than Thaurissan ever did.", fx = { align = { light = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Long ago, maybe, when we were one people wi' yer kin in Ironforge. Down in the depths we knelt tae fire because fire could kill us, an' some o' the lads here are still learnin' that a dwarf can kneel tae somethin' that doesnae burn." } },
      choices = {
        { text = "Then teach them the Light. A people needs something to kneel to.", next = "BACK", reply = "Maybe, an' some o' them are listenin'. But we'll no' be told what tae kneel tae ever again.", fx = { align = { order = 1 } } },
        { text = "Let them kneel to nothing. That's what freedom means.", next = "BACK", reply = "That's the Brotherhood's creed, near enough, an' I'll drink tae it. Ye've a good head on ye.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Watch the road down tae the Cauldron, an' mind who ye strike. Not every Dark Iron in the Gorge chose the mountain, for some were born tae chains, an' a hammer that cannae tell the slaver from the slave does the Firelord's work for him." } },
      choices = {
        { text = "I'll judge each one before I strike, Overseer.", next = "BACK", reply = "Good, an' the slaves will thank ye for it, though they may never know yer name. Go carefully.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "In battle there's no time to ask who chose what.", next = "BACK", reply = "Then ye'll kill the wrong dwarf one day, an' it'll be on ye, no' on the Firelord. Think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Slaves, for one, workin' the mines o' the Gorge till they drop, an' the plans for the war golems their smiths build, for another. I'll no' ask ye tae steal for the Brotherhood, but if somethin' finds its way out o' a Dark Iron camp an' intae my hands, I'll no' ask where it came from either." } },
      choices = {
        { text = "I'll free the slaves first, Overseer, then the plans.", next = "BACK", reply = "That's the right order, an' I'll see ye well paid for both. Bless ye.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take whatever pays best, Overseer.", next = "BACK", reply = "Then ye'll get paid, an' I'll no' ask. Just don't sell tae the Cauldron.", fx = { align = { honor = -1 } } },
        { text = "Something else, Overseer.", next = "BACK" },
      },
    },
    xcl_mc = {
      big = true,
      lines = { { id = "xcl_mc_default", text = "Ye'll forgive an old Dark Iron for sittin' down. I spent most o' my life makin' weapons for that thing's armies, an' every one o' us at Thorium Point remembers the heat o' his voice through the stone. He's no' dead, mind, for ye cannae kill fire, but he's been sent back down, an' that's further than any dwarf ever pushed him." } },
      choices = {
        { text = "Your people were his slaves. The blame for what they made is his.", next = "BACK", reply = "Kind o' ye tae say, an' I'll try tae believe it. Some nights I cannae.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your people forged his weapons. They should answer for that too.", next = "BACK", reply = "We do, every day we stay up here, an' I'll no' pretend otherwise. That's why we fight now.", fx = { align = { light = -1 } } },
        { text = "What did his voice sound like through the stone?", next = "xcl_mc2" },
      },
    },
    xcl_mc2 = {
      lines = { { id = "xcl_mc2_default", text = "Like a furnace that knew yer name an' wanted it. Some o' the older lads still wake up shoutin', an' we let them, because there's no shame in it among us." } },
      choices = {
        { text = "Then I hope they sleep easier now.", next = "BACK" },
      },
    },
    dd_of_rep = {
      lines = {
        { id = "dd_of_rep1", text = "Because ye've brought us what we asked for an' never once asked what it was for, which is more than Thaurissan's heirs ever gave us. The Brotherhood remembers who comes back, an' ye've come back often enough that the smiths have stopped hidin' their good tongs when ye walk in." },
      },
      choices = {
        { text = "Your Brotherhood has earned my trust in return.", next = "BACK", reply = "Then we're square, an' that's the best a Dark Iron can say tae anyone. Mind ye keep it so.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I came for the recipes. Trust is a bonus.", next = "BACK", reply = "Ha! Honest, at least, an' the Brotherhood respects a good bargain more than a sweet word.", fx = { align = { honor = -1 } } },
        { text = "Something else, Overseer.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_dwarf", tags = { "news" }, when = { party = { race = "Dwarf" } },
          text = "You bring a Bronzebeard to Thorium Point, I see, and {companion} has the look of someone who came expecting to hate me. We broke with Thaurissan's empire, friend, so your companion can let that hand rest a little further from the axe." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Dark Iron", min = 40 } }, text = "Ye've been cuttin' down a great many Dark Irons in the Gorge, I'm told. They were my kin once, so I'll no' cheer, but I'll no' grieve either, for they chose the mountain." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Ye'll find nothin' worth liftin' at Thorium Point that the Brotherhood hasnae counted twice, but the Dark Irons up the road keep plenty they shouldnae." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest o' the Light. We had no priests in the mountain, {class}, only the Firelord's sorcerers, so ye'll forgive the lads if they stare." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin. Ye'd have been a prize catch for Thaurissan's men, {class}, an' ye're a fine example for my lads o' what a dwarf can serve besides fire." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Our forefathers called the Firelord up out o' the deep places tae win a war, so I'll be watchin' what ye call up in my camp." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, an' ye'll be eyein' our forges for the enchantments in 'em. We learned that work under the Firelord's eye, an' we keep it for ourselves now." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! We Dark Irons didnae have much use for trees down in the depths, ye understand, but I'll confess the lads have grown fond o' that scrubby bush by the gate." },
        { id = "h_cl_mc", tags = { "news" }, when = { cleared = "Molten Core" },
          text = "They're sayin' Ragnaros has been beaten down in his own Core an' sent back intae the deep fire. I'll believe it when the forges stop tremblin', but I'm halfway tae believin' it already." },
        { id = "h_default", key = true,
          text = "Overseer Oilfist, of the Thorium Brotherhood. We're Dark Iron, an' we served Ragnaros in the depths o' that mountain, makin' arms for his armies, until we stopped." },
        { id = "h_kids", when = { metBefore = true },
          text = "The young ones were playin' too near the lava spiders again, an' one came home wi' a web stuck in her beard, so I've told Hansel tae deal with it. He was restin', he says, but he's always restin'." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The forges never go cold, even now, out o' habit. Down in the mountain, cold forges meant punishment, an' we keep 'em lit for different reasons now." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. The Brotherhood trades with anyone who pays, but trust's another matter, an' ye've no' bought any yet." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. We forged arms for Ragnaros's armies down in that mountain, so I can tell ye from here what's wrong wi' yer blade, whether ye want tae hear it or no." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. There's nothin' in the Gorge worth eatin', I'll warn ye, but there's plenty that'll try tae eat you." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, an' one o' the Forsaken. Thaurissan's men would have made a prize o' ye, an' my lads will stare, for they've never seen a dead thing glow wi' the Light instead o' fire." },
        { id = "dd_maltorius", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Lolo tells me Overseer Maltorius is dead, an' that ye're the one who did it. I knew him once, before the Brotherhood broke away, an' he was a cruel beast even by the mountain's measure." },
        { id = "dd_rep", when = { reputation = { faction = "Thorium Brotherhood", min = "honored" } },
          text = "The Brotherhood speaks well o' ye now, an' that's no' a small thing. We're Dark Iron, an' we dinnae trust easy, for we were lied tae by a god for a very long time." },
      },
      again = { { id = "h_again", text = "Aye? Speak up over the forge." } },
      choices = {
        { text = "Why does the Brotherhood trust me now?", next = "dd_of_rep", when = { reputation = { faction = "Thorium Brotherhood", min = "honored" } } },
        { text = "Could the Gorge ever heal, Overseer?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Not many slaves ever get free of the Dark Irons.", next = "escape" },
        { text = "What does the Brotherhood make?", next = "trade" },
        { text = "And your kin still in the mountain?", next = "kin" },
        { text = "A Dark Iron. I was raised to hate your kind.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Teach me something of your craft.", next = "craft", when = { profession = "Blacksmithing" } },
        { text = "Who do the fire spirits here answer to?", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "Who taught your smiths to enchant steel?", next = "xmage", when = { class = "MAGE" } },
        { text = "What did Thaurissan think he was calling up?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Did your people ever know the Light?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin do down in the Gorge?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "You keep eyeing my blade, Overseer.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What's out there hunting in the Gorge?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What are the Dark Irons up the road hoarding?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Will the Brotherhood trust a dead paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Ragnaros has fallen in the Molten Core, Overseer.", next = "xcl_mc", when = { cleared = "Molten Core" } },
        { text = "Could Dark Iron and Bronzebeard ever make peace?", next = "xpt_dwarf", when = { party = { race = "Dwarf" } } },
        { text = "I was a thrall in the Gorge once, Overseer. A false one.", next = "xorig_thrallspy", when = { origin = "dwarf_searing_gorge_spy" } },
        { text = "I'll work with the Brotherhood.", next = "END", fx = { affinity = 1, standing = { thorium_point = 1 } } },
      },
    },
    xorig_thrallspy = {
      lines = {
        { id = "xothrallspy_default", text = "A false one, says ye. Ironforge's spy, then, countin' sentries while my brothers an' I still wore the Firelord's chains. I'll no' hold it against ye, for we were all of us lyin' tae somebody in those days, but tell me true: did ye count us, too?" },
      },
      choices = {
        { text = "Every one of you, Overseer. It was the job.", next = "BACK", fx = { trait = { honest = 1 } } },
        { text = "I left the Brotherhood out of my reports.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    escape = {
      big = true,
      lines = {
        { id = "e_default", text = "We made our own way out, with enchanted gear made at night under the Firelord's own nose, piece by piece. When we had enough, we walked out o' the depths an' didnae look back, an' we settled across the gorge, close enough tae the ore an' far enough tae sleep." },
      },
      choices = {
        { text = "Walking out under his nose? That took courage.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 } } },
        { text = "So now you'll sell to anyone at all.", next = "anyone" },
      },
    },
    anyone = {
      lines = {
        { id = "a_default", text = "Anyone who pays, Alliance or Horde, it makes no odds. We've had one master, an' we'll no' have another." },
      },
      choices = {
        { text = "Free trade suits me better than any master.", next = "BACK", reply = "Aye, an' it's the only kind o' freedom worth havin'. Welcome tae the Point.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Picking no side is still picking a side, Oilfist.", next = "BACK", reply = "Maybe it is, an' if so, it's the side o' nobody's chains. I'll live wi' that.", fx = { align = { order = 1 } } },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "The best steel this side o' the mountain, an' the plans for it, tae those who've earned our trust. Trust's dear here, an' ye pay for it in deeds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "They're still forgin' for the Firelord, still believin' he's a god. Some I knew by name, but I don't say their names now, because it's easier." } },
      choices = {
        { text = "Could they be freed?", next = "kin_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_free = {
      lines = { { id = "kf_default", text = "Some might, if they wanted it, but a slave learns no' tae want, for wantin' gets ye whipped. We wanted it so badly we built our own way out, an' most down there have forgotten how tae want." } },
      choices = {
        { text = "What do the other dwarves make of the Brotherhood?", next = "op_darkiron" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    dwarf = {
      big = true,
      lines = { { id = "d_default", text = "Aye, an' I was raised tae hate yours. We've both had a long while tae think about who taught us. Stand here an' talk, an' we'll see who's the better student." } },
      choices = {
        { text = "Fair. Let's talk.", next = "BACK", reply = "Good, then sit, an' we'll find out. I've a kettle.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'll talk, but old hates don't die in an afternoon.", next = "BACK", reply = "No, they don't, an' mine took forty years tae cool. Sit a while anyway; the kettle's on.", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "Heat ye can't feel through yer gloves is too hot. Down in the mountain we learned that wi' blistered palms an' lost fingernails, so ye'd best learn it from me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Aye, they do, an' we built his armies' blades in the heat o' him for longer than ye've been alive. Ragnaros doesnae ask, he burns, an' if ye go speakin' tae his spirits, ye'll find out they've forgotten how tae answer anythin' else." },
        { id = "xsh_dwarf", when = { race = "Dwarf" },
          text = "A Bronzebeard who talks tae the elements, standin' in my camp, an' askin' me about the Firelord. Aye, the spirits here answer tae him, an' my kin in the mountain answer tae him too, an' that's the whole o' the trouble." },
      },
      choices = {
        { text = "Fire can be talked down, if someone's brave enough to try.", next = "BACK", reply = "Then ye're braver than me, an' I'll watch from the wall. Mind yer eyebrows.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Some fires you just let burn out.", next = "BACK", reply = "Aye, an' that's my thinkin' too. Ye've a good head for a shaman.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "How did the Brotherhood break free?", next = "escape" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that happens on the Point is my responsibility, an' so I make it my business tae know about it. Ask me about any o' these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "Ye've earned yer place at the forge, so I'll answer ye like one o' the Brotherhood. Here's what I can tell ye about." },
    },
    background = { { id = "tp_ba", text = "Born in the mountain, worked in the mountain, walked out o' the mountain. The last bit's the only part worth tellin'.", next = "escape" } },
    advice = { { id = "tp_ad", text = "Never trust a forge ye didnae light yerself, an' never lend Hansel money, for he'll sit on it." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're my kin, my shame an' my sorrow, an' most of them still bend the knee down there. I pray they'll stop, though I've no' much hope." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "I've walked the halls o' Shadowforge City, under the mountain, an' I'll tell ye it's a furnace for the soul. We left it for a reason, an' that reason's still down there." } },
    thaurissan = { { id = "tp_thaurissan", text = "Thaurissan was our first emperor, an' he called up Ragnaros, an' the whole land burned. The Dark Irons still pay for it, every day." } },
    magni = {
      { id = "tp_magni", text = "King Magni's no friend o' the Dark Irons, an' I don't blame him, after what our people did. But the Brotherhood isn't our people, not anymore." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Ye're a Bronzebeard or a Wildhammer, by the look o' ye, an' ye've come to deal wi' a Dark Iron. That says more about ye than ye'd think, an' it's good." },
    },
    _none = { { id = "tp_none", text = "If it's no' on the Point, it's no' my concern." } },
  },
}

P:NPC {
  key = "hansel", id = TODO_NPC("Hansel Heavyhands"), name = "Hansel Heavyhands",
  bible = "bibles/searinggorge.md", role = "questgiver", tier = "quest",
  communities = { "thorium_point" }, temper = { "grumbling" }, values = { "loyal", "lazy" },
  prejudice = { race = "Dwarf", faction = "Alliance", amount = 8, why = "Ironforge folk spit at the Brotherhood's Dark Iron dwarves, so he spits back, mildly." },
  notices = { "race", "kit", "lock_steed" },

  impression = {
    first = "Freedom, for him, mostly seems to mean a chair.",
    third = "{name} met Hansel Heavyhands, the weary enforcer of the Thorium Brotherhood at Thorium Point.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "Och, Ironforge. Ye'll be wantin' tae look down yer nose at the Dark Iron, I expect, so go on an' do it quick, an' then I can sit back down." },
    { id = "g_prej2", when = { prejudiced = true }, text = "A Bronzebeard at Thorium Point. Yer kin threw a rock at me on the road last month, so forgive me if I keep one eye on yer hands." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ye're the Bronzebeard who doesnae stare. I've told the lads about ye, an' they didnae believe me, but it's true." },
    { id = "g_op_darkiron", when = { gossip = { topic = "dark_iron", stance = "distrust" } }, text = "Oilfist says ye'd trust our steel but no' us. That's sensible enough, for I'd no' trust me either, but sit doon anyway; the rock's warm." },
    { id = "g_rest", text = "Och, what is it now, when I'd just sat down? Fine, fine, out with it." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good! Ye can do the thing they want me tae do, an' everyone's happy." },
    { id = "g_away", when = { away = 14 }, text = "Och, ye've been gone {away}, an' they've had me doin' the work the whole time. Ye can take it off my hands now, I'd say." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear ye talked somebody round tae doin' somethin'. Could ye talk them round tae doin' my bit as well?" },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Tauren" } },
      text = "Big, aren't ye? Folk say I'm built like an orc, an' I take it as a compliment; do you?" },
    { id = "n_lock_steed", cat = "lock_steed", when = { aura = { 5784, 23161 } },
      text = "Is that a horse wi' fire for feet? Lolo'll have my hide for lettin' it through the gate, but I'll confess it's the bonniest thing I've seen in the Gorge, an' that's no' sayin' much." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Why would I? Yer folk see dark skin an' think Thaurissan, an' they don't stop tae ask whether I left him or not. So I've stopped askin' whether ye're any different, an' it saves time, an' I get tae sit down sooner." } },
      choices = {
        { text = "The Brotherhood earned their freedom. Ironforge should see that.", next = "BACK", reply = "Kind o' ye, an' I'll believe it when they do. Sit a while, if ye like.", fx = { align = { order = -1 } } },
        { text = "The Dark Irons burned Ironforge's lands. Distrust is earned.", next = "BACK", reply = "Aye, it is, an' I'll no' argue it. I'll just keep sittin' till they see the difference.", fx = { align = { order = 1 } } },
        { text = "I'm not here to throw rocks. Sit down, Hansel.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Why did you leave the Dark Irons?", next = "prej_why" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Because the Firelord doesnae let ye sit down, an' I mean that true. We worked the forges till our hands blistered for a fire spirit who'd have burnt us without a thought, an' when the Brotherhood walked out, I walked wi' them." } },
      choices = {
        { text = "That took courage. More than Ironforge credits.", next = "BACK", reply = "Thank ye, friend, though it didnae feel like courage at the time. It felt like bein' too tired tae carry one more cart.", fx = { align = { light = 1 } } },
        { text = "You served Ragnaros once. Some will never forget it.", next = "BACK", reply = "Some won't, an' I've made my peace wi' it. I'll sit down, all the same.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Och, ye're a kind one. Mind if I take ye at yer word an' sit? Grand." } },
      choices = {
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The fire elementals, mostly, wanderin' about an' hissin' at the walls. Then there's the Dark Iron down the hill, an' the dragons over in the Steppes, an' Lolo's singin', though I'd never tell him that last one." } },
      choices = {
        { text = "Meet them on the wall, and sleep after.", next = "BACK", reply = "That's Lolo's way too, an' I'll no' argue. I'll sleep after, then.", fx = { align = { honor = 1 } } },
        { text = "Set a few traps, and let them find those instead.", next = "BACK", reply = "Now there's a plan I can get behind. Ye'll help me dig them, aye?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Lolo cannae see me sleepin', which is the beauty of it, though the old goat smells it somehow. Ye'd be surprised what slips past a tired dwarf, an' ye'd be more surprised what doesnae, so I'd no' try anythin'." } },
      choices = {
        { text = "A sleeping guard is a gift, and I never waste gifts.", next = "BACK", reply = "I'd no' try it, friend, I've been tired a long while an' I still wake for thieves.", fx = { align = { honor = -1 } } },
        { text = "Rest, Hansel. I'll keep watch for a while.", next = "BACK", reply = "Bless ye, friend, I'll take that kindly. Five minutes, an' no' a breath more.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Water's kind o' ye, though I'd still rather the chair. Down in the mountain we worked till we dropped, so a mage who thinks of a tired dwarf's comfort is a rare thing, an' I'll drink tae it." } },
      choices = {
        { text = "You've earned your rest, Hansel. Drink up.", next = "BACK", reply = "I'll drink tae ye, then, an' tae the chair. Thank ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Freedom's wasted on a dwarf who only sits.", next = "BACK", reply = "Then I'll waste it gladly, friend, for I've earned every minute.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "Ye laugh, but I stood watch on the walls every night this week, an' the Dark Irons never once had the decency tae attack, so it was all standin' an' no glory. A blessin' on the feet would do more for this outpost than a dozen new swords, an' I'll say so tae Lolo's face." } },
      choices = {
        { text = "Duty's often dull, Hansel. You stand it all the same.", next = "BACK", reply = "Aye, it is, an' I'll stand it. Doesnae mean I have tae like it.", fx = { align = { order = 1 } } },
        { text = "Sit down, Hansel. The Dark Irons won't come tonight.", next = "BACK", reply = "Bless ye for sayin' so. I'll sit, an' Lolo can grumble.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Dark Irons, mostly, diggin' an' smeltin' day an' night in the Cauldron, an' the fire under Blackrock does the rest. Lolo says he can smell the earth gettin' angry, but Lolo says he can smell a lot o' things, an' I just want it quiet enough tae shut my eyes." } },
      choices = {
        { text = "Stay awake, Hansel. Rumbling ground means trouble.", next = "BACK", reply = "Aye, I'll stay awake, though my eyes won't thank ye. Lolo's always right about the smells, worse luck.", fx = { align = { order = 1 } } },
        { text = "Let the earth grumble. Get your nap, Hansel.", next = "BACK", reply = "That's the best advice I've heard all week. Wake me if the earth explodes.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Only for an hour or two, an' only if it can count Dark Irons without eatin' any. Lolo would smell it in a heartbeat, mind, an' then I'd be standin' watch for a month as punishment, so maybe forget I said anythin'." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Only for an hour or two, an' only if it can count Dark Irons without eatin' any. Though lookin' at it now, grinnin' at me, I'd wager it'd eat the Dark Irons an' then me, an' Lolo would smell it on the wall in a heartbeat, so forget I said anythin'." },
      },
      choices = {
        { text = "Stand your own watch, Hansel. That's the job.", next = "BACK", reply = "Aye, aye, I know it is. Ye sound like Lolo.", fx = { align = { order = 1 } } },
        { text = "Happy to help, Hansel. My demon won't tell.", next = "BACK", reply = "Bless ye, friend. Just keep it well clear o' Lolo's nose.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Does yer demon need sleep at all? Because if it doesnae, I'd happily lend it my watch, an' nobody would be any the wiser." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Ask the earth if it'll hold still a while, would ye? The whole Gorge rumbles under my boots all night, an' a dwarf cannae nap on rumblin' ground." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Ye wouldnae have a prayer for sore feet, would ye? I'd take one from anybody just now, Horde or no." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Bless this chair, would ye, if ye can find one, because my feet have been prayin' for one since dawn an' nobody's answered." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can ye conjure a chair, by any chance? I've heard yer kind make bread an' water out o' thin air, an' a chair seems the obvious next step." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, is it? Ye'll be wantin' tae sneak past me, then, an' I'll save ye the bother, for I'm only pretendin' tae watch anyway." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. If ye've come tae talk tae the rocks, go ahead, but they'll no' answer, for I've tried on the long nights." },
        { id = "h_default", key = true,
          text = "Hansel Heavyhands. I'm the one Captain Lolo sends when somebody needs a firm word, or a firm fist, an' I'm very firm, an' also very tired." },
        { id = "h_spiders", tags = { "news" }, when = { questActive = TODO_QUEST("Fiery Menace!") },
          text = "The Overseer says the lava spiders are frightenin' the bairns, so now twenty of 'em are my job. Ye do it, an' I'll supervise from this chair." },
        { id = "h_incendosaurs", when = { questActive = TODO_QUEST("Incendosaurs? Whateverosaur is More Like It") },
          text = "Incendosaurs, they call 'em, which is a fancy name for big burnin' lizards. Go an' put some out, permanently." },
        { id = "h_spiders_done", tags = { "news" }, when = { questDone = TODO_QUEST("Fiery Menace!") },
          text = "The bairns are playin' by the cliff again an' nobody's come home wi' a web in their beard all week, so that's your doin'. The Overseer's stopped glarin' at my chair, which is the best reward I could ask for." },
        { id = "h_tired", when = { metBefore = true },
          text = "Ye know what the best part o' freedom is? Sittin' down whenever ye like, with nobody tellin' ye tae stand, except the Overseer, an' Lolo, an' now you." },
        { id = "h_miner", when = { origin = "dwarf_ironforge_miner" },
          text = "Och, a deeps miner, I can see it in how ye keep glancin' at the sky like it owes ye money. Sit a while, for down here we've both earned the right, an' tell me if the Ironforge seams are as cool as I remember." },
        { id = "dd_maltorius", when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "The captain says ye brought down Maltorius. I'd been savin' a very firm word for him, so I'm a wee bit disappointed, but mostly I'm glad tae be spared the walk." },
      },
      again = { { id = "h_again", text = "Aye? Ask quick, I've just got comfy." } },
      choices = {
        { text = "What keeps you up on those long nights?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why are you always resting?", next = "resting" },
        { text = "Lolo seems an easy enough master to work for.", next = "lolo" },
        { text = "What's the worst beast out in the Gorge?", next = "lizards" },
        { text = "What did you do inside the mountain?", next = "mountain" },
        { text = "Are the bairns safe from the spiders now?", next = "bairns", when = { questDone = TODO_QUEST("Fiery Menace!") } },
        { text = "Arm-wrestle me.", next = "wrestle", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "My beast could take anything in this Gorge.", next = "k_hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Doesn't Lolo mind that you sleep on watch?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "No chairs, Hansel, but I could conjure you some water.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you really need a prayer for sore feet, Hansel?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "The Gorge rumbles all night long, Hansel.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you really let my demon stand your watch, Hansel?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "You don't trust Ironforge dwarves much, Hansel.", next = "prej", when = { prejudiced = true } },
        { text = "I'll handle it.", next = "END", fx = { affinity = 2 } },
      },
    },
    resting = {
      lines = { { id = "r_default", text = "Because for a long time I couldnae. Down in the mountain ye stood till ye dropped, so now I sit when I like, an' every time I sit, it's a wee bit o' freedom." } },
      choices = {
        { text = "Then sit, Hansel. You've earned the chair.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lolo = {
      lines = { { id = "l_default", text = "Grand, though he's blind as a bat an' twice as stubborn. He always knows where I am, an' says it's the snorin', but I don't snore, an' the lads who say I do are liars, the lot o' them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    lizards = {
      lines = { { id = "z_default", text = "The incendosaurs are big as a cart, hot as a forge, an' stupid as a boot, an' the stupid's what makes 'em dangerous, because they don't know tae run." } },
      choices = {
        { text = "You could deal with them yourself.", next = "lizards_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lizards_why = {
      lines = { { id = "zw_default", text = "I could, but I'd have tae stand up, walk down the cliff, fight a lizard an' walk back up the cliff, or ye could, an' that, ye see, is teamwork." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    mountain = {
      lines = { { id = "mt_default", text = "Carried things, mostly, because I was the biggest, so they gave me the heaviest. Ore carts up from the deep seams, coal down tae the forges, an' now an' then a lad who couldnae walk any further." },
      },
      choices = {
        { text = "You carried the other slaves?", next = "mountain_cart" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountain_cart = {
      lines = { { id = "mc_default", text = "Only the ones who fell, an' only when the taskmasters werenae lookin', for a slave who cannae walk was no use tae them. I'd put a lad on top o' the ore an' push, an' that's why my back's the way it is, an' I'd do it again." },
      },
      choices = {
        { text = "That chair is the least you've earned, Hansel.", next = "BACK", reply = "Kind o' ye, friend. I'll sit in it till the cliff falls.", fx = { align = { order = -1 }, affinity = 3, trait = { kind = 1 } } },
        { text = "And now the Point needs that back working again.", next = "BACK", reply = "It does, an' it'll get it, when the back's willin'. Give it a day or two.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bairns = {
      lines = { { id = "bn_default", text = "Safe as bairns ever are on a cliff over a lava pit, which is no' very, but the spiders were the worst of it. Ye'd think a Dark Iron child would have more sense than tae poke a burnin' spider, but they're braver than us, for they've never known the whip." },
      },
      choices = {
        { text = "Let them stay brave. That's what you escaped for.", next = "BACK", reply = "Aye, an' that's the best part o' them. I'd no' trade it for anythin'.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Brave children get burned. Teach them fear.", next = "BACK", reply = "We knew fear plenty, friend, an' I'll no' teach it tae them. They'll learn caution soon enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrestle = {
      lines = { { id = "w_default", text = "Ha! Sit, then... no, ye sit, since I'm already sittin', an' that's my advantage. Ready? ...Ye nearly had me there, nearly." } },
      choices = { { text = "Rematch, someday. Standing up.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Ha! It could try, an' I'd sit here an' watch, for it's the most fun I'd have had all week. The incendosaurs are made o' fire an' temper both, so let yer beast bite an' then let it run, because they don't like bein' bitten." },
      },
      choices = {
        { text = "My beast doesn't run.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Good advice. I'll keep it back.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Big, Dark Iron, free an' tired, an' mostly the last two.", next = "resting" } },
    advice = { { id = "tp_ad", text = "Sit down whenever ye can, because ye never know when somebody'll make ye stand." } },
    dark_iron = { { id = "tp_dark_iron", text = "They're no' us, for we're nicer, an' we sit down more." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "I worked in the forges under the mountain for years, an' I'll tell ye, I'd rather sit down. Now I can." } },
    thaurissan = { { id = "tp_thaurissan", text = "The old emperor called up a fire lord an' burned the land, an' we've been payin' for it ever since. I'd like to have a word wi' him, sittin' down." } },
    magni = { { id = "tp_magni", text = "Magni's a king, an' I'm a Dark Iron, so we'll no' be havin' a drink anytime soon. I'd sit down wi' him, though." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, an' couldnae be bothered either, so ask Lolo." } },
  },
}

P:NPC {
  key = "lolo", id = TODO_NPC("Lookout Captain Lolo Longstriker"), name = "Lookout Captain Lolo Longstriker",
  bible = "bibles/searinggorge.md", role = "guard", tier = "quest",
  communities = { "thorium_point" }, temper = { "jovial" }, values = { "loyal", "proud" },
  notices = { "drink", "stealth", "lock_armor" },

  impression = {
    first = "Nearly blind, he smells out trouble with some help from the bottle.",
    third = "{name} met Lookout Captain Lolo Longstriker, the near-blind lookout of Thorium Point.",
  },

  greetings = {
    { id = "g_who", text = "Who goes there? No, don't tell me, I'll know ye by yer step... hmm, no idea at all. Who goes there?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah! I know that step now, so welcome back, friend, for I never forget a footfall, mostly." },
    { id = "g_away", when = { away = 14 }, text = "I know that step, even after {away} away! Well, I think I do, so welcome back, friend." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "Word along the walls is ye gave somebody a proper fright. I heard it in their step for a day after, for I hear everythin', mostly." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye've had a few, I can smell it, an' good! A wee nip sharpens the nose, an' mine's never been sharper." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That dark shell round ye is a demon's armour, warlock, an' I saw its like on the Dark Iron summoners in the deep forges. Keep it on if ye must, but dinnae come near the bairns wearin' it." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Someone's sneakin', an' don't ask how I know. I've no eyes, but I've a nose like a hound an' ears like a bat." } },

  start = "hello",
  nodes = {
    xpt_hunter = {
      big = true,
      lines = { { id = "xpt_hunter_default", text = "Dark Iron patrols out of the Cauldron, mostly, and the odd fire elemental that wanders off from wherever they boil up. A good hunter sees the dust before the army, and that's all a lookout really is, a hunter who never gets to shoot." } },
      choices = {
        { text = "Better to watch and warn than charge in blind.", next = "BACK", reply = "That's the job, an' ye've the eyes for it, which is more than I can say. Stay an' watch wi' me a while, an' tell me what the dust is doin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to hunt them down before they reach the ridge.", next = "BACK", reply = "Spoken like a hunter who's never had tae watch an army come up the road. Hold the ridge first, an' hunt after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oiled steel, sweat an' a bit o' bravado, aye, that's a warrior, while a Dark Iron from the Cauldron smells o' soot an' sulfur. My eyes are long gone, but my nose has never let the Point down, an' I'll put it up against any lookout in Khaz Modan." } },
      choices = {
        { text = "Your nose has kept the Point safe. That deserves respect.", next = "BACK", reply = "Well, now, that's a kindly thing tae say tae an old lookout. Ye smell honest too, for what it's worth.", fx = { align = { light = 1 } } },
        { text = "A blind lookout's a danger, Captain, nose or no nose.", next = "BACK", reply = "Aye, an' a seein' one who sleeps on watch is a worse one. Ask Hansel how many Dark Irons got past me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Fur an' leather an' trail mud, an' a wee bit o' whatever the beast last rolled in, which is never roses. I'd know a hunter in the dark, which is lucky, because for me it's always dark." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Fur an' leather an' trail mud, an' a wee bit o' whatever the beast last rolled in, which is never roses. I'd know a hunter in the dark, which is lucky, because for me it's always dark. An' yer {pet} smells like it's been chasin' basilisks, which is a brave thing for a beast tae do down here, so give it a scratch from me." },
      },
      choices = {
        { text = "A good hunter trusts every sense, as you do.", next = "BACK", reply = "Aye, they do, an' they'll serve ye better than the eyes when the smoke's thick. Ye smell like a good one.", fx = { align = { order = 1 } } },
        { text = "I trust my eyes and my instincts. Noses can lie.", next = "BACK", reply = "Noses never lie, friend, only eyes do, an' I'd know about both. Mind the smoke out there.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Arcane leaves a smell like a storm that hasnae broken yet, an' ye're wearin' it like perfume. I've a nose for trouble, an' yer kind are trouble that usually means well, which is the worst sort." } },
      choices = {
        { text = "Meaning well still counts for something, Captain.", next = "BACK", reply = "Aye, an' I'll grant it, for most o' the trouble I've smelled meant ill. Just keep the storm off my walls.", fx = { align = { light = 1 } } },
        { text = "Good intentions are worth nothing. Results are.", next = "BACK", reply = "Then ye're a different smell altogether, an' I'll keep my nose on ye. The last mage who talked like that singed my eyebrows.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I can smell the wee beast from the gate, an' it smells like the deep forges under the mountain, which I'd hoped never tae smell again. Keep it close, warlock, an' keep it away from the bairns, for they've seen enough fire for one lifetime." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I can smell that beast o' yers from the gate, an' it smells like the deep forges under the mountain, which I'd hoped never tae smell again. It's starin' at the bairns by the cookfire now, so call it tae yer side, warlock, for they've seen enough fire for one lifetime." },
      },
      choices = {
        { text = "It obeys me. Your bairns are safe.", next = "BACK", reply = "I'll hold ye tae that, warlock, an' so will the mothers. Keep it on a short leash.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp goes where it likes. That's its nature.", next = "BACK", reply = "Then its nature had best keep clear o' the bairns, or my nature will meet it at the gate. Mind me.", fx = { align = { order = -1 } } },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Smell it, feel it, call it what ye like, for it sits on ye like sun on a stone. Down in the mountain everythin' that glowed meant fire an' hurt, so it's taken me years tae learn there's a warmth that doesnae bite." } },
      choices = {
        { text = "The Light's warmth is for everyone, Captain, Dark Irons included.", next = "BACK", reply = "Aye, I'm learnin' that, slow as it comes. Thank ye for sayin' it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light chooses whom it warms. Not everyone earns it.", next = "BACK", reply = "Maybe, an' maybe I havenae earned it yet. But I'll keep standin' in it while it lasts.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "Faith, mostly, which smells o' candle smoke an' clean linen whatever god it's pointed at, an' under it whatever the priest's been up tae lately. Ye'd be amazed how many holy folk smell o' brandy, an' I'd know, since I smell o' it myself most days." } },
      choices = {
        { text = "A priest should keep clear of the bottle, Captain.", next = "BACK", reply = "Aye, they should, an' I'll no' tell ye which ones don't. Keep yer own clear, an' we'll get on.", fx = { align = { order = 1 } } },
        { text = "A drop of brandy never hurt anyone's faith.", next = "BACK", reply = "Now there's a priest after my own heart! I'll pour ye one, if ye've a cup.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Sulfur, slag an' burnin' rock, with a sour edge when the fire elementals come too close tae the walls, an' I smell them comin' long before the lookouts see them. The land's sick, I reckon, an' if ye can talk tae it, ye might ask what it'd take tae make it smell green again." } },
      choices = {
        { text = "I'll speak for the land, Captain, and heed its answer.", next = "BACK", reply = "Then ye're braver than me, an' I'll be glad tae hear the answer. Tell me if it ever smells green.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "This land's past saving, Captain. Just guard the walls.", next = "BACK", reply = "Aye, the walls, I'll guard those till I drop. But I'd still like tae smell grass again.", fx = { align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    dd_ll_hear = {
      lines = {
        { id = "dd_ll_hear1", text = "I'm blind, no' deaf, an' half o' Thorium Point talks tae me as if I'm a wall. The smiths gossip over the anvils, the lookouts count bodies for the bounty, an' the Dark Irons out in the Slag Pit shout yer name when they're cursin', which they do a great deal lately." },
      },
      choices = {
        { text = "Good. Let them learn to fear the name.", next = "BACK", reply = "Fear's a fine lookout, I'll grant ye. Just dinnae let it make ye careless.", fx = { align = { light = -1 } } },
        { text = "I'd rather they surrendered than cursed me.", next = "BACK", reply = "So would I, an' some might, one day. The Brotherhood did, after all, in its way.", fx = { align = { light = 1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_hunter", tags = { "news" }, when = { party = { class = "HUNTER" } },
          text = "{companion}'s got a hunter's eye; I saw them mark the ridge line before you'd even said hello. I'd trade two of my lookouts for one pair of eyes like that." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Ye smell o' rain an' wolf, which is a rare thing in the Gorge, where everythin' else smells o' sulfur an' Dark Iron." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, an' I can smell it on ye, though no' the incense o' the Cathedral, somethin' older an' stranger. Stand where I can smell ye, an' we'll get along fine." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? I can smell the incense on ye from here, an' it's a welcome change from sulfur, so stand upwind o' me a while, if ye'd be so kind." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "Plate, an' somethin' else besides, warm like a hearth wi' no smoke in it. That'll be a paladin, I'd wager, an' welcome, for the Point's short on folk who glow without burnin'." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Brimstone! Either there's a warlock standin' in front o' me or the Gorge has finally opened up under my boots, an' I'm hopin' it's the warlock." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Somebody smells o' candle smoke an' cold air, which means a mage, an' a mage means somethin' in my camp is about tae catch fire or freeze." },
        { id = "h_default", key = true,
          text = "Lookout Captain Lolo Longstriker, at yer service, blind as a mole an' captain o' the lookouts. Don't laugh, for nobody's snuck up on the Point yet." },
        { id = "h_kalaran", key = true, when = { heardClaim = "kalaran_father" },
          text = "That fellow southeast o' here, with the sad story about his father? I've never once smelled grief on him; I smelled somethin', but no' grief." },
        { id = "h_maltorius", tags = { "news" }, when = { questActive = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Maltorius is overseer o' the Dark Iron slaves in the Gorge, an' a cruel one. The poster's up, so bring me his head, an' I'll... know it when I feel it." },
        { id = "h_malt_done", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "It's quieter down in the Cauldron since ye dealt wi' Maltorius, an' I can hear it from up here. The whips are fewer o' a night, though no' gone, an' I'll thank ye for every one that's stopped." },
        { id = "h_drink", when = { metBefore = true },
          text = "Folk say I drink too much for a lookout, an' I say I'd see nothin' at all without it. They've no answer tae that, an' neither have I, come tae think of it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Ah, I can smell the oil on yer armor an' hear it clankin' from here, so ye're either a warrior or a very loud thief, an' I'm hopin' for warrior." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "Ah, a hunter, for I can smell the beast on ye, an' it's a fine healthy smell, so ye must feed it well." },
        { id = "dd_menace", when = { questDone = TODO_QUEST("Fiery Menace!") },
          text = "Hansel tells me ye took care o' the fire beasts he was meant tae deal with. He's grateful, though he'd never say so, for sayin' things makes him tired." },
        { id = "dd_darkiron", when = { killed = { name = "Dark Iron", min = 50 } },
          text = "Fifty Dark Irons or more, I hear, an' none o' them our Brotherhood lads, thank the stone. I cannae see the scars on ye, but I can hear them in the way ye walk." },
      },
      again = { { id = "h_again", text = "Aye, aye, still here. I can hear ye fidgetin'." } },
      choices = {
        { text = "How do you hear all this, Captain?", next = "dd_ll_hear", when = { killed = { name = "Dark Iron", min = 50 } } },
        { text = "How do you keep watch, blind?", next = "watch" },
        { text = "What do you hear from the Gorge at night?", next = "maltorius" },
        { text = "What did you smell on Kalaran?", next = "kalaran", when = { heardClaim = "kalaran_father" } },
        { text = "Does the drink really help?", next = "drink" },
        { text = "How did you lose your sight?", next = "eyes" },
        { text = "What do you make of Hansel?", next = "l_hansel" },
        { text = "Maltorius is dead, Captain.", next = "malt_done", when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") } },
        { text = "I bet I could sneak up on the Point.", next = "k_rogue", when = { class = { "ROGUE", "DRUID" } } },
        { text = "I didn't know a mage had a smell.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my imp bother you, Captain?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "You can actually smell the Light on me?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You can really smell a warrior coming?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "So what does a hunter smell like?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "And what does a priest smell of?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What does the Gorge smell like to you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you watch for from up here, Captain?", next = "xpt_hunter", when = { party = { class = "HUNTER" } } },
        { text = "Keep your nose to the wind, Captain.", next = "END", fx = { affinity = 1, standing = { thorium_point = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "w_default", text = "The wind on the cliff tells me what's comin' up the road, the forge tells me the time, an' Hansel's snorin' tells me where Hansel is. Between the lot of 'em, I see plenty." },
      },
      choices = {
        { text = "Impressive. I'd never have guessed you were blind.", next = "BACK", fx = { affinity = 2 } },
        { text = "And what do you hear about me?", next = "watch_me" },
      },
    },
    watch_me = {
      lines = {
        { id = "wm_default", text = "Light boots an' a heavy purse, an' ye stopped tae look at the lava twice on the way up. Everyone does, the first time." },
        { id = "wm_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "Plate! I heard ye a mile off, an' don't take it personal, but ye're a walkin' bell." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    maltorius = {
      lines = { { id = "m_default", text = "Whips, mostly, held by Maltorius, overseer o' the slaves still workin' the Gorge for the Firelord's people. Ye can hear 'em from the cliff on a still night, an' I'd like tae stop hearin' 'em." } },
      choices = {
        { text = "Then someone should stop those whips.", next = "BACK", reply = "Aye, someone should, an' I'd go myself if I could see past my own nose. Maltorius is down in the Cauldron.", fx = { align = { light = 1 } } },
        { text = "Slaves in the Gorge are the Firelord's business, not mine.", next = "BACK", reply = "Is it, now? Then go deaf on the cliff, friend, an' tell me how well ye sleep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kalaran = {
      big = true,
      lines = { { id = "k_default", text = "Smoke, an' somethin' old, like a cellar that's been shut a long while. Grief smells o' salt an' sleeplessness, an' he doesnae smell of either." } },
      choices = {
        { text = "Your nose could be wrong, Captain.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    eyes = {
      lines = { { id = "ey_default", text = "Ask me sober an' I'll tell ye it's none o' yer business, an' ask me drunk an' I'll tell ye a different tale every time. Last week it was a fire elemental, an' the week before it was a wager wi' a Bronzebeard, an' I liked that one best." },
      },
      choices = {
        { text = "And the true story?", next = "eyes_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes_true = {
      lines = { { id = "et_default", text = "The true story is that I'm captain o' the lookouts, an' nobody's got past me yet. What I lost doesnae matter half as much as what I kept, so that's the only story I tell sober." },
      },
      choices = {
        { text = "Nobody's taken your wall. That's the only test that counts.", next = "BACK", reply = "Aye, that's the only test I'll take. Have a drink, if ye've time.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "The Point still deserves a lookout who can see.", next = "BACK", reply = "Maybe it does, an' maybe one day it'll get one. Until then, I'm still standin' here.", fx = { align = { order = 1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    l_hansel = {
      lines = { { id = "lh_default", text = "Best man on the Point, an' the laziest, an' I'd no' trade him for ten who work harder. When there's real trouble on the road, Hansel's the first one standin', an' I always know where he is, for I can hear him snorin' from the gate." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    malt_done = {
      big = true,
      lines = { { id = "md_default", text = "So I heard, an' I knew it before the runner came, for the whips went quiet. They'll send another, they always do, but the one after Maltorius will remember what happened tae Maltorius, an' that's worth somethin'." },
      },
      choices = {
        { text = "Then I'll deal with the next one too.", next = "BACK", reply = "Aye, an' I'll be listenin' for the whips when ye do. Bless ye.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I was paid for a head. The rest isn't my concern.", next = "BACK", reply = "Fair enough, an' ye were paid well, I hope. The whips still went quiet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = { { id = "d_default", text = "It helps me no' mind that I cannae see, which is close enough. Don't tell the Overseer I said that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Ye could try, an' ye'd smell o' boot leather an' nerves the whole way up the cliff. Every rogue who comes through Thorium Point thinks they'll be the first, an' I keep a count o' them in my head, every one caught." },
        { id = "xro_druid", when = { class = "DRUID" },
          text = "As a cat, I suppose, all soft paws an' no scent? Ye'd still smell o' moss an' sabercat, an' I'd still hear ye breathin', an' I'd still win." },
      },
      choices = {
        { text = "Then I'll try, and you'll add me to the list.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Best not to test a captain on his own wall.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a lookout since before I lost my eyes, an' I kept the job after, for nobody's dared take it off me." } },
    advice = { { id = "tp_ad", text = "Listen more than ye look, because eyes lie an' the wind doesnae." } },
    dark_iron = { { id = "tp_dark_iron", text = "I can smell a Dark Iron from the far side o' the Gorge, an' the ones up on the ridge smell like trouble. The ones here at the Point smell like ale, which I prefer." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Shadowforge folk under the mountain smell o' brimstone an' bad intentions. I've smelled them comin' for years." } },
    magni = { { id = "tp_magni", text = "Magni's no friend o' ours, but he's no enemy either, not anymore. That's enough for me." } },
    _none = { { id = "tp_none", text = "Never seen it, ha, never seen anything! Ask someone else." } },
  },
}

P:NPC {
  key = "kalaran", id = TODO_NPC("Kalaran Windblade"), name = "Kalaran Windblade",
  bible = "bibles/searinggorge.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "brooding" }, values = { "vengeful", "cunning" },
  notices = { "class", "lock_stones" },

  impression = {
    first = "He tells of his murdered father like a story told many times.",
    third = "{name} met Kalaran Windblade in the Searing Gorge, who seeks vengeance on the Dark Iron for his father's death.",
  },

  greetings = {
    { id = "g_vengeance", text = "Another traveler, good. I have need of someone with a strong arm and no love for the Dark Iron." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own. You'll understand, then, why the guilty must answer for what they've done." },
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Is that a firestone in your bag? It burns with something hotter than the Gorge, and I'll admit I've wondered whether a flame like mine could be kindled from one, though I'd not ask you to part with it." },
  },

  start = "hello",
  nodes = {
    op_vengeance = {
      lines = {
        { id = "opv_default", text = "Reason enough? It's the only reason that has never once lied to me. But you've the look of someone who's been told otherwise by a priest or a parent, so tell me what you believe." },
      },
      choices = {
        { text = "Vengeance is justice with the gloves off. I approve.", next = "op_venge_yes", fx = { affinity = 1, align = { light = -1 }, opinion = { vengeance = "admire" } } },
        { text = "Vengeance eats the one who carries it.", next = "op_venge_no", fx = { affinity = -1, align = { light = 1 }, opinion = { vengeance = "wrong" } } },
        { text = "Burn their towers first. We can talk philosophy later.", next = "op_venge_yes", fx = { trait = { brave = 1 }, opinion = { vengeance = "useful" } } },
        { text = "I'd rather not judge your grief.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    op_venge_yes = {
      lines = {
        { id = "opvy_default", text = "Good. Then take the torch and use it, and don't look back at the smoke, because the smoke is the only thanks the Dark Iron will ever give you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_venge_no = {
      lines = {
        { id = "opvn_default", text = "Eats me? Perhaps, and perhaps I've been eaten already and only kept walking out of habit. Burn the towers anyway; the Dark Iron deserve it whatever it costs me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In blood, as my father paid, and in fear, so that they remember who came for them. You're a warrior, so you understand that some debts are only settled with steel, and that is all I will say of it." } },
      choices = {
        { text = "Vengeance won't bring your father back, Kalaran.", next = "BACK", reply = "No, it won't, and I know it. But it will let me sleep, and that's all I'm asking for.", fx = { align = { light = 1 } } },
        { text = "Then we'll settle the debt in blood together.", next = "BACK", reply = "Then you're the arm I've been waiting for. Bring me what I ask, and we'll see it done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I follow them as you'd follow any prey, for they leave signs like any other: soot on the rocks, ash on the wind and the cries of their slaves. When I find the ones who did it, I'll take them as cleanly as any hunter takes a wolf." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I follow them as you'd follow any prey, for they leave signs like any other: soot on the rocks, ash on the wind and the cries of their slaves. When I find the ones who did it, I'll take them as cleanly as any hunter takes a wolf. Your {pet} would find their trail sooner than I could, I think, for a beast doesn't let grief cloud its nose." },
      },
      choices = {
        { text = "Take only the guilty, Kalaran, not everything in reach.", next = "BACK", reply = "Only the guilty, then, as you say. I'll know them when I see them.", fx = { align = { light = 1 } } },
        { text = "Hunt them all down. Every Dark Iron shares the blame.", next = "BACK", reply = "Every one of them, and gladly. You understand me better than most.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've had years to tell it, and grief wears smooth with handling, like a stone in a river. If you doubt me, ask the Dark Iron what they did here, and then ask yourself why they're so eager to deny it." } },
      choices = {
        { text = "Vengeance is honest work. Point me at them.", next = "BACK", reply = "At last, someone honest enough to call it work. The torch needs its pieces, and you'll have them from me.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Revenge isn't worth my knife, Kalaran.", next = "BACK", reply = "Then keep your knife clean, and I'll find another. Vengeance doesn't need everyone's blessing.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A flame that doesn't falter, as I said, kindled from things that burn hotter than any forge in Thorium Point. You'd know something of such fires, warlock, so don't ask me to apologise for wanting one." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A flame that doesn't falter, as I said, kindled from things that burn hotter than any forge in Thorium Point. Your {pet} is leaning toward my brazier as though it recognises the heat, so you'd know something of such fires, and don't ask me to apologise for wanting one." },
      },
      choices = {
        { text = "No apology needed. Fire is fire.", next = "BACK", reply = "Precisely, and I'm glad someone understands it. Help me finish it.", fx = { align = { light = -1 } } },
        { text = "Fire that hot burns the hand that holds it.", next = "BACK", reply = "Then I'll be careful, warlock. But some hands are better suited to the heat than you'd think.", fx = { align = { light = 1 } } },
        { text = "Let's leave the fire for now.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Dark Iron believe they do, since their king called it up and they stoke it still, though I suspect the fire has other ideas. Leave the spirits to their sulking, shaman, and help me with my torch, because vengeance is the only fire I care to understand." } },
      choices = {
        { text = "The spirits aren't sulking, Kalaran. They're enslaved.", next = "BACK", reply = "Enslaved, then, if you like, and by the same hand that took my father. All the more reason to help me.", fx = { align = { light = 1 } } },
        { text = "Vengeance first, then. The spirits can wait.", next = "BACK", reply = "Good. The spirits have waited this long, and they can wait a little longer.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For the same thing I want everyone's help with: the torch, and the pieces I need to make it whole. Bring me what I ask and say little about it, and you'll see at the end what a little fire can do to those who earned it." } },
      choices = {
        { text = "I'll want to know what the torch does first.", next = "BACK", reply = "You'll know when it's lit, and not before. Trust me that far, at least.", fx = { align = { light = 1 } } },
        { text = "If they earned it, they'll get it. Name the pieces.", next = "BACK", reply = "Good, then we understand each other. I'll give you the list.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It would be forgetting, and I've no patience for forgetting while my father's killers still work their forges a day's walk from here. Heal what you like when I'm done, druid, but don't ask me to forgive the ground for what was done on it." } },
      choices = {
        { text = "Healing isn't forgetting, Kalaran. The land deserves mending.", next = "BACK", reply = "Mend it after, then, and I'll not stop you. But not while they still breathe.", fx = { align = { light = 1 } } },
        { text = "Justice first, then. Healing can wait.", next = "BACK", reply = "Good, that's the order I'd choose too. The grass can grow on their graves.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then the hand at the top is cut off, and the ones who killed my father have no master left to answer to but themselves. I've spent every waking hour on the torch and the flame, and now I find I don't know what I'll do when there's nobody left to hate." } },
      choices = {
        { text = "Let it go now. Your father wouldn't want this for you.", next = "BACK", reply = "Perhaps not, but I'm not sure I know how to want anything else now. I'll think on it.", fx = { align = { light = 1 } } },
        { text = "Finish it. Everyone who touched him should pay.", next = "BACK", reply = "Then we're agreed, and the torch will be ready. Every one of them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "What will you do once the torch is finished?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Go home, perhaps, if there's a home left for me, and sit somewhere quiet without ash on everything. I haven't thought that far, and I suppose that's because I'm afraid to." } },
      choices = {
        { text = "I hope you find somewhere quiet, Kalaran.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Dark Iron", min = 30 } }, text = "I hear the Dark Iron have learned to fear your name, and I'm glad of it, though fear is only the beginning of what they owe." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'd heal this Gorge, I suppose, and grow grass over the bones of everyone the Dark Iron killed here, which seems a strange sort of mercy." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Your kind measure fire and give it names, and I suppose that's mastery of a sort, though naming a fire has never avenged anyone." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Then you'll know the fire of this Gorge does not burn by chance, and that it answers to those with the will to command it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Then you understand that some debts can only be paid in fire, and that the people who owe them rarely pay willingly." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll understand vengeance better than most, I think, since your kind deal in quiet knives and long memories." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths" },
          text = "Thaurissan is dead, they say, and the Dark Iron who butchered my father served him. I thought I would feel something more than this, and I'm still waiting for it." },
        { id = "h_default", key = true,
          text = "I am Kalaran Windblade, and the Dark Iron took my father from me, butchered him, here in this gorge. I mean to see them pay, and I can't do it alone.",
          fx = { hear = "kalaran_father" } },
        { id = "h_retribution", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Divine Retribution") }, { questActive = TODO_QUEST("The Flawless Flame") } } },
          text = "We'll need a flame that doesn't falter, and the means to carry it. Bring me what I ask, and I'll forge vengeance from it." },
        { id = "h_torch", when = { any = { { questActive = TODO_QUEST("The Torch of Retribution") }, { questActive = TODO_QUEST("Forging the Shaft") }, { questActive = TODO_QUEST("The Flame's Casing") } } },
          text = "The torch is nearly ready. Every piece you bring brings my father's killers closer to the reckoning they deserve." },
        { id = "h_father", when = { metBefore = true },
          text = "I dream of him, and of what they did. You'd think the dreams would fade, but they don't, and good; I don't want them to." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Good, for I need a strong arm against the Dark Iron, and one that won't hesitate when the moment comes to strike." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Then you know how to follow a quarry for days and wait for the right moment, which is a skill I have had to learn." },
      },
      again = { { id = "h_again", text = "What else? We have work to do." } },
      choices = {
        { text = "Tell me about your father.", next = "father" },
        { text = "Which Dark Iron? The Brotherhood?", next = "which" },
        { text = "How do you mean to make them pay?", next = "torch" },
        { text = "Lolo says you don't smell of grief.", next = "lolo", when = { heardLine = "lolo.h_kalaran" } },
        { text = "You tell your story very smoothly, Kalaran.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What kind of fire would settle your debt?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How do you want the Dark Iron to pay, Kalaran?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You track the Dark Iron the way I'd track a beast.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Who commands the fire in this Gorge, Kalaran?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you want a mage's fire for, Kalaran?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would healing the Gorge really be a strange mercy, Kalaran?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll help you.", next = "END", reply = "Then go, and come back with what I need. The Dark Iron won't wait, and neither will I.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Vengeance isn't justice, Kalaran. I'm a paladin.", next = "k_paladin", when = { class = "PALADIN" } },
        { text = "Thaurissan is dead, Kalaran. I was there.", next = "xcl_brd", when = { cleared = "Blackrock Depths" } },
        { text = "Vengeance won't bring your father back, Kalaran.", next = "END", reply = "No, it won't, and I never said it would. Go, then, and leave the vengeance to me.", fx = { align = { light = 1 } } },
      },
    },
    father = {
      lines = {
        { id = "f_default", text = "He was... strong, and proud, and the Dark Iron cut him down without a thought. That's all you need to know, and all I'll say." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2 } },
        { text = "That's not much of a story.", next = "father_push", fx = { trait = { skeptical = 1 } } },
      },
    },
    father_push = {
      lines = { { id = "fp_default", text = "It's the only story that matters; where, when and how change nothing about what's owed. Help me or don't, but I've no time for questions." } },
      choices = {
        { text = "Then tell me one true thing about him. Just one.", tag = "Persuade", next = "father_slip",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "skeptical" }, { heardLine = "lolo.h_kalaran" } } } },
          fail = { next = "father_wall", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    which = {
      lines = { { id = "w_default", text = "Does it matter? Dark Iron is Dark Iron, and those at the Point trade with anyone, so they'd have traded with his killers, too." } },
      choices = {
        { text = "Is vengeance reason enough to fight, Kalaran?", next = "op_vengeance" },
        { text = "The Brotherhood escaped the same masters.", next = "BACK", reply = "Escaped, or simply moved house? I've not seen them hand back a single blade they forged for him.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "You're right. Dark Iron is Dark Iron.", next = "BACK", reply = "Exactly, and I'm glad you see it. The Point has a short memory.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    torch = {
      lines = { { id = "t_default", text = "With a torch that will make them burn, as he burned. Bring me the pieces and you'll see, and you'll see him burn again, at the end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lolo = {
      lines = { { id = "l_default", text = "A blind drunk sniffs at me and you listen? Grief has no smell; it has a cost, and I'm paying mine, so bring me what I asked for." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    father_slip = {
      big = true,
      lines = {
        { id = "fs_default", text = "You're persistent, for one so... for one so young, and very well, then: I wasn't there when he fell, and I couldn't tell you which hand held the blade. What I know is that the Dark Iron owe a debt, and I mean to collect it, with or without the details you seem to want so badly." },
      },
      choices = {
        { text = "That sounds more like a grudge than grief.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I'm sorry. I'll stop asking.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_wall = {
      lines = {
        { id = "fw_default", text = "One true thing: he's dead, and they killed him. Bring me the pieces of the torch, and spare me the questions." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_paladin = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Then call it justice, if the word helps you sleep, and I'll call it what it is. Either way the Dark Iron who killed my father walks this gorge, and either way someone ought to stop him." },
        { id = "xpa_scourge", when = { race = "Scourge" },
          text = "A dead man with the Light in him, lecturing me on vengeance. Your own people hunt the Scourge for revenge, so your sermon rings a little hollow in my ears." },
      },
      choices = {
        { text = "Justice has rules. Vengeance doesn't.", next = "BACK", reply = "Then follow your rules, paladin, and I'll follow mine. We'll see whose lands the blow.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "You're right. Call it what you like; I'll help.", next = "BACK", reply = "Good, that's all I need. Bring me what I ask.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Tell me about your father.", next = "father" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've made it my business to learn what I need for my vengeance, and little else. Ask about these, if they serve it." },
    },
    background = { { id = "tp_ba", text = "I am my father's son, and that is all I am until his killers are ash.", next = "father" } },
    advice = { { id = "tp_ad", text = "Never forgive what was taken from you, because forgiveness is how they win." } },
    dark_iron = { { id = "tp_dark_iron", text = "Murderers, every one of them. Don't let the ones at Thorium Point fool you; it's in the blood." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "My father's killers hide in their city beneath the mountain, and I'll have them out of it. Fire calls to fire, and I'm patient." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons are a power in this land, and I'd not speak lightly of them. Some debts are owed in fire." } },
    thaurissan = { { id = "tp_thaurissan", text = "The Dark Iron emperor called a fire lord and burned his own kingdom. I've always thought he was a fool to do it, and a greater fool to think he could control it." } },
    _none = { { id = "tp_none", text = "That doesn't concern my vengeance, and nothing else matters." } },
  },
}
