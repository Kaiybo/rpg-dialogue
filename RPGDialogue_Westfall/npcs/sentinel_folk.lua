-- Sentinel Hill's working people: the inn, the stores, the gryphons, the tower and the bows.
-- Voice: bibles/sentinel_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "heather", id = TODO_NPC("Innkeeper Heather"), name = "Innkeeper Heather",
  bible = "bibles/sentinel_folk.md", role = "innkeeper", tier = "service",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "kind", "practical" },
  notices = { "weary", "drink" },
  impression = {
    first = "Her guests sleep in their boots, and she has stopped minding.",
    third = "{name} met Innkeeper Heather, who keeps the inn on Sentinel Hill and feeds the hungry militia.",
  },

  greetings = {
    { id = "g_op_defias_hard", when = { gossip = { topic = "defias", stance = "hardline" } }, text = "Danuvin tells me you'd hang the Defias lads off the tower. Some of those lads drank at my tables once, so I'll be pouring a little slower for you." },
    { id = "g_op_bolvar_soft", when = { gossip = { topic = "bolvar", stance = "soft" } }, text = "The Commander says you told him the Regent's forgotten his oath. Say it again by my fire, love, and the whole room will stand you a drink." },
    { id = "g_inn", text = "In off the road with you. Dust on the mat, please, not on my floor. It's the one clean thing in Westfall." },
    { id = "g_home", when = { homeInn = { "Sentinel Hill" } }, text = "Your bed's made, and I've shaken the grit out of the blankets, though it'll be back by morning. It always is." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late for the road. Sit down before the militia mistakes you for a bandit; it happens more than they'd admit." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you've brought half of Westfall back on your boots. Mat first, then sit, and I'll find you something warm." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, I'd thought we'd lost you, after {away} without a word up the hill. Your bed's had more dust in it than guests, but I'll shake it out." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody on the hill has been speaking well of you over supper, and that doesn't happen much in Westfall. Sit down and enjoy it." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard you put someone's nose out of joint on the hill. We've enough grit in the air without stirring up more, so mind how you go." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've been out to Moonbrook, or somewhere just as bad, by the look of you. Sit down; it's stew first and questions after." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "That'll do for tonight. The militia's got a cell for brawlers, and it's mostly full of hay." },
  },

  start = "hello",
  nodes = {
    dd_murkeye = {
      lines = {
        { id = "dd_murkeye_a", text = "I thought so, and I'll not make a fuss, since you look like you'd rather I didn't. That old fish drowned two men off the Longshore this spring, and their widows still come in here to sit by the window." },
      },
      choices = {
        { text = "Tell the widows it's done. They deserve to hear it.", next = "dd_murkeye_2", fx = { align = { light = 1 } } },
        { text = "It was a job. Grayson asked and I did it.", next = "dd_murkeye_2", fx = { align = { light = -1 } } },
        { text = "Did the fishermen go back out after that?", next = "dd_murkeye_2" },
      },
    },
    dd_murkeye_2 = {
      lines = {
        { id = "dd_murkeye_2a", text = "Some have, and the catch is better than it's been since the farms went under, so there's fish on my table again. It isn't much in Westfall, but a full bowl is how we start back, one supper at a time." },
      },
      choices = { { text = "One supper at a time, then. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It never has, not since the farms emptied. Your wind spirits might know why, but I just sweep and laugh." } },
      choices = {
        { text = "Keep sweeping and laughing, Heather. That's good spirit.", next = "BACK", reply = "I'll do both till I drop, love, and then someone can sweep me out the door with the rest of it. Laughing's cheaper than crying, and the broom's already paid for.", fx = { align = { honor = 1 } } },
        { text = "Stop fighting it. Let the dust have the inn.", next = "BACK", reply = "And have my guests sleeping in a sand dune? Not while I've arms, love. The dust can have the inn when it pries the broom out of my hands.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the Defias come at night, and nobody wants to be the one running out barefoot. I've seen a man fight off a Defias raid in his nightshirt and one boot, and he was very proud of it." } },
      choices = {
        { text = "I'll sleep in my boots, then, and be ready.", next = "BACK", reply = "That's the way, and you'll fit right in with the rest of them. Just wipe the mud off before you climb into my beds.", fx = { align = { order = 1 } } },
        { text = "I'll sleep well and let the night watch handle it.", next = "BACK", reply = "Lucky you, then, to sleep so sound in Westfall. The night watch will be glad someone trusts them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They don't mind, as long as the beast doesn't eat their supper, and some of them talk to the animals more than to each other. A wolf by the fire reminds them of home, I think, the ones who had a home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They don't mind, as long as the beast doesn't eat their supper, and some of them talk to the animals more than to each other. Your {pet} is welcome by the fire, only mind it doesn't sit on anyone's sore feet." },
      },
      choices = {
        { text = "I'll keep it quiet and out of the way.", next = "BACK", reply = "That's kind of you, love, and the lads will thank you, mostly. Keep it away from the stew pot.", fx = { align = { order = 1 } } },
        { text = "It goes where I go. They'll have to cope.", next = "BACK", reply = "Then it'll have to cope with the lads too, and they're louder than any wolf. Mind your supper.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Don't you dare, {class}. Those are militia who've nothing but those boots, and travellers who'll never come back if they lose their purse under my roof." } },
      choices = {
        { text = "Your roof, your rules. I'll wipe my boots.", next = "BACK", reply = "That's what I like to hear, love, and the floor thanks you. Welcome to the inn.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Only the ones who can spare it, Heather.", next = "BACK", reply = "Not under my roof, {class}, spare or not. Out you go if I catch you at it.", fx = { align = { honor = -1 } } },
        { text = "Who stays here these days?", next = "guests" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "You'd only blow it into the soup, love, and then out to the road, and then straight back in on the next breeze. Westfall dust never leaves; it just changes rooms." } },
      choices = {
        { text = "Then I'll sweep it properly, by hand.", next = "BACK", reply = "By hand, love, that's the only way it ever works. There's a spare broom by the door.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it blow. Fighting dust is wasted effort.", next = "BACK", reply = "Wasted effort, aye, but it's my wasted effort, and I'll keep at it. The guests like a clean floor.", fx = { align = { order = -1 } } },
        { text = "How long have you kept the inn?", next = "tending" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Thick walls I haven't got, but there's a room at the end where nobody minds odd smells or muttering after dark. I'll ask you not to let anything with horns sit on the beds, because I've only just washed the linens." } },
      choices = {
        { text = "My companions stay outside. You have my word.", next = "BACK", reply = "Bless you for that, love, and my linens bless you too. The room at the end is yours.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They go where I go, I'm afraid.", next = "BACK", reply = "Then they'll sleep on the floor, love, not on my clean sheets. I'll find you a blanket.", fx = { align = { light = -1 } } },
        { text = "What's the hill like at night?", next = "hill" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Better than most soldiers I've poured for, though that's not saying much, since I've only poured for these. They square their bills, they mind my benches and they never draw steel indoors, because Gryan would skin them." } },
      choices = {
        { text = "Discipline keeps them alive. Gryan's right to be strict.", next = "BACK", reply = "He is, and they love him for it, mostly. I'll tell him you said so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them be loud, Heather. They've earned a little freedom.", next = "BACK", reply = "They're loud enough already, love, believe me. A little freedom goes a long way in my common room.", fx = { align = { order = -1 } } },
        { text = "Something else, Heather.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the farms nobody ploughs any more, because a dead field just blows away a little each day. I sweep it out every morning and it's back by noon, so some days I think I'm sweeping half of Westfall through my door." } },
      choices = {
        { text = "Plant grass on the empty fields and hold the dust down.", next = "BACK", reply = "Grass, is it? I'll try anything, love, if it means I can put the broom down for a day.", fx = { align = { order = 1 } } },
        { text = "Let it blow. The land will find its own way back.", next = "BACK", reply = "It's finding its way back into my inn, love, every morning. I'd rather it found somewhere else.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_stew", when = { questDone = TODO_QUEST("Westfall Stew") },
          text = "Salma Saldean sent a crock of her stew up the hill and said you'd fetched half of what went into it. My guests ate it to the last spoonful, and two of them asked if they could stay another night on the chance of more." },
        { id = "dd_murkeye", tags = { "news" }, when = { killed = { name = "Murk-Eye" } },
          text = "The fishermen down at the Longshore came up for a drink last night, which they haven't done in a season, because Old Murk-Eye's dead and somebody they wouldn't name did it. They kept looking at the door, so I'm guessing it was you." },

        { id = "h_default", text = "I'm Heather, and I keep the inn on the hill. Most of my guests are militia between watches, and most of them sleep in their boots." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "You've eaten at Salma's? Then you've had the best stew in Westfall and you'll be disappointed in mine. I've made my peace with it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves, out here? We've only dust and gulls to offer you, and the gulls are rude and the dust gets everywhere." },
        { id = "h_militia", when = { metBefore = true }, text = "The militia eats more than any army I've ever fed, and I've never fed an army, but I'm fairly sure this is worse." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The night watch comes in for soup about now, the same faces every night. I worry on the nights one's missing." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You came back up out of Moonbrook. The whole hill's been singing about it, badly, and I've let them, because it's the first singing in here for a year." },
        { id = "h_patrol", when = { questActive = TODO_QUEST("Patrolling Westfall") },
          text = "Out after gnolls for Captain Danuvin? Wash your hands before you sit at my table. Gnoll paws are no kind of thing to bring to supper." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be sleeping in your boots, then, like the rest; I've given up asking anyone to take them off." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast can sleep by the fire, if it doesn't mind the militia snoring; most of them sound worse than a bear." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The militia will stand up straighter just seeing you, and then they'll ask you to bless their soup." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid from the great forest, and you've come all this way to our dust. I'll find you a room with a window, because I'd guess you hate a closed roof." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Mind the dust; it gets everywhere. Most guests sleep in their boots, and I've stopped minding." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the dust on the bench; I've only just swept it." },
        { id = "h_again2", text = "Ask away while I pour; the militia drink faster than they talk, so I've a moment." },
      },
      choices = {
        { text = "I'm the one who killed Old Murk-Eye.", next = "dd_murkeye", when = { killed = { name = "Murk-Eye" } } },

        { text = "Make this my home.", next = "BUSINESS" },
        { text = "The hill seems to be holding up.", next = "hill" },
        { text = "Who stays here, mostly?", next = "guests" },
        { text = "Do any of the militia need tending?", next = "tending", when = { class = "PRIEST" } },
        { text = "Did any Defias ever drink here?", next = "masons", when = { topicKnown = "defias" } },
        { text = "Any chance of a proper dwarven ale?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Your guests sleep in their boots. Easy pickings, Heather.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Mind if I sweep the dust out with a gust of wind?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll need a room with thick walls, Heather.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why does the militia sleep in their boots, Heather?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the militia mind beasts in the inn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The militia seem to keep good order at your inn.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where does all this dust come from, Heather?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The dust never seems to settle in Westfall, Heather.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just resting.", next = "END" },
      },
    },
    hill = {
      lines = { { id = "hi_default", text = "It's holding better than the farms, since we've walls of a sort and Gryan's word. Out there they've only got locks, and the Defias have keys." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } } },
    },
    guests = {
      lines = { { id = "gu_default", text = "Militia between watches, the odd carter brave enough for the road, and whoever Gryan's put to work. The carters pay and the militia sleep, and I call that even." } },
      choices = {
        { text = "I'd guess the militia don't often pay.", next = "guests_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_pay = {
      lines = { { id = "gp_default", text = "When Gryan can, which isn't often. I keep a slate for them, and I've never once rubbed it clean or asked for a copper of it." } },
      choices = { { text = "That's generous.", next = "BACK", fx = { affinity = 1 } } },
    },
    masons = {
      big = true,
      lines = { { id = "ma_default", text = "Some did, aye: masons, the first of them to come out from the city after the trouble there. They paid for their ale and sang dreadful songs, and then one week they stopped coming in, and now I hear their names on Gryan's lists." } },
      choices = {
        { text = "The city wronged them first. That should count for something.", next = "BACK", reply = "Something, maybe, but not enough to excuse what came after. I liked them, and that's the hardest part.", fx = { align = { order = -1 }, learn = { "stonemasons" } } },
        { text = "Whatever they were owed, they chose to become thieves.", next = "BACK", reply = "They did, and I'll never forgive them for it. But I remember them singing.", fx = { align = { order = 1 }, learn = { "stonemasons" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "stonemasons" } } },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Proper? I've what the wagon brought, and the wagon brought what the Defias didn't want. You're welcome to it, but don't say 'proper' again, or I'll cry into the jug." } },
      choices = { { text = "It'll do nicely. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tending = {
      lines = { { id = "te_default", text = "Always: burns, cuts, and the ones who've stopped sleeping. Sit with that last lot, if you can; they'll talk to a priest who won't be here next week." } },
      choices = {
        { text = "I'll sit with them tonight.", next = "BACK", reply = "Bless you, love, they'll be glad of it. The quiet ones by the fire, mostly.", fx = { affinity = 2, align = { light = 1 }, standing = { sentinel_hill = 1 } } },
        { text = "I'll leave the sleepless ones to someone who's staying.", next = "BACK", reply = "That's fair, love, they need someone who stays. I'll keep an eye on them myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Defias are holed up in the old Moonbrook mines, and half my guests are on their way there or back from it. The ones coming back sleep for two days and don't talk about it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I took a day off for the Darkmoon Faire once, and when I got back, the dust had moved into every room and set up house. I've not taken a day off since, and I think the dust remembers." } },
    booty_bay = { { id = "tp_booty_bay", text = "A guest left me a bottle of Booty Bay rum once and swore it was good for the nerves. It's still on the shelf, because I'd not know what to do with nerves that didn't jump at every knock." } },
    the_stockade = { { id = "tp_the_stockade", text = "Some of my guests say the Stockade's full of Defias who'll be back in Westfall by summer. I keep a few extra rooms ready, because I've learned to expect the worst and charge for it." } },
    knows = {
      { id = "tp_knows", text = "Everyone on the hill comes through my door for a bed or a bowl, and they all talk. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm an innkeeper. The inn came with the hill and I came with the inn, and that's as far back as anyone here cares." } },
    advice = { { id = "tp_ad", text = "Bind your hearthstone here. You'll want somewhere to come back to that isn't a field." } },
    defias = { { id = "tp_defias", text = "Some of them drank here, before all this, a few masons among them, and nice enough men they were. I try not to think about that." } },
    people_militia = { { id = "tp_militia", text = "They're farmers with spears and no pay, so they eat for free here. Gryan pays when he can, which is hardly ever." } },
    _none = { { id = "tp_none", text = "Ask Gryan. Or ask the gulls, they'll tell you just as much." } },
  },
}

P:NPC {
  key = "lewis", id = TODO_NPC("Quartermaster Lewis"), name = "Quartermaster Lewis",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "harried" }, values = { "dutiful", "practical" },
  notices = { "kit" },
  impression = {
    first = "He would rather not know how the gear gets damaged.",
    third = "{name} met Quartermaster Lewis, who keeps Sentinel Hill fed and armed with far too little.",
  },

  greetings = {
    { id = "g_stores", text = "The stores are open, as they always are, and half empty, as they always are. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "More business? Good, buy something; it'll make my ledger feel useful." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "I can mend that, but don't tell me how it happened, or I'll only have to write it down." },
  },

  start = "hello",
  nodes = {
    dd_lewis_w = {
      lines = {
        { id = "dd_lewis_w_a", text = "Safer, aye, and I'll not say safe, because I've learned better. Every crate that comes up the hill without a knife through it is one more family fed in the militia, and they know who to thank for it, even if they're too proud to say." },
      },
      choices = {
        { text = "I don't need thanks. Just keep the militia fed.", next = "dd_lewis_w2", fx = { align = { honor = 1 } } },
        { text = "Pride's fine, but I'd take a discount on the gear.", next = "dd_lewis_w2", fx = { align = { honor = -1 } } },
      },
    },
    dd_lewis_w2 = {
      lines = {
        { id = "dd_lewis_w2a", text = "I can't change the prices, friend, they're set by people far above me, but I can make sure your name goes in Gryan's report. That counts for something in Stormwind, or so I keep telling myself." },
      },
      choices = { { text = "Fair enough. Something else, Lewis.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They know the roads better than we do. I record every loss in my ledger, and I don't ask how the gear gets damaged." } },
      choices = {
        { text = "Keep honest records, Lewis. They'll matter someday.", next = "BACK", reply = "I will, and someday someone will read them and wonder how we managed. That'll be my reward.", fx = { align = { order = 1 } } },
        { text = "Stop writing it down. Ledgers won't stop thieves.", next = "BACK", reply = "No, but they keep me honest, and they keep Gryan informed. I'll keep writing, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Short enough that we share helmets between watches, and I've seen breastplates go out with one man and come back with another. The Defias rob every wagon, so I'm stretching what I've got thinner every week." } },
      choices = {
        { text = "I'll make do with what you have. Give the rest out.", next = "BACK", reply = "Thank you, truly, and the farmers on the south road will be glad of it. I'll write you down as generous.", fx = { align = { honor = 1 } } },
        { text = "I'll need the best you've got if I'm to fight.", next = "BACK", reply = "Everyone does, and the best went out last week on a man who didn't come back. I'll see what's left.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Meat, mostly, and fewer vultures picking at the wagons. Goretusk and coyote both, if they're fresh, and I'll put them in the ledger and the pot, and the militia will be grateful for once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Meat, mostly: goretusk and coyote both, if they're fresh, and the militia will be grateful for once. Your {pet} eats too, I suppose, so I'll put it in the ledger as one more mouth and not complain." },
      },
      choices = {
        { text = "I'll hunt for the hill and ask nothing for it.", next = "BACK", reply = "That's a rare offer, and I'll write it down twice so nobody forgets. The militia thanks you.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt for the hill, but I'll want paying.", next = "BACK", reply = "Fair enough, though the ledger's thin. I'll pay what I can, which isn't much.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Linen, water and plenty of wishing, since the reagent wagon from Stormwind gets robbed twice as often as the rest. If you've ever conjured water for a militia patrol, you've done more for this hill than my ledger ever has." } },
      choices = {
        { text = "I'll conjure for the patrols. Put it in the ledger.", next = "BACK", reply = "Then I'll put it in the ledger as a miracle, which is what it is. The patrols will thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll conjure for whoever pays best, Lewis.", next = "BACK", reply = "Then you'll be conjuring for the Defias, who pay better than I do. Think on that.", fx = { align = { honor = -1 } } },
        { text = "What goes in the ledger?", next = "ledger" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I'll want to, and I won't, because there's no form for whatever that thing of yours is and I'm not inventing one. Just keep it away from the ammunition crates, since one spark there and Sentinel Hill becomes a crater." } },
      choices = {
        { text = "I'll answer for anything it breaks.", next = "BACK", reply = "That's decent of you, and I'll not write it down unless I must. Keep it clear of the crates.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it breaks something, write down Defias.", next = "BACK", reply = "Ha, half the ledger's already Defias, so it'd hardly stand out. Keep it clear of the crates, all the same.", fx = { align = { honor = -1 } } },
        { text = "What are all the forms for?", next = "forms" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Bandages, yes, and never enough of them, but blessed water I'd have to write down as plain water, and then someone would ask why I paid for it. If you can bless what we've already got, though, I'll not tell a soul." } },
      choices = {
        { text = "Then I'll bless it all and tend whoever needs it.", next = "BACK", reply = "Bless you, and I'll not write it down. The lads will feel better for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Water's water. Spend the coin on steel instead.", next = "BACK", reply = "Steel doesn't heal a fever, but I take the point. I'll stretch the coin as far as I can.", fx = { align = { light = -1 } } },
        { text = "Something else, Quartermaster.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Whoever's in the worst shape, which is the fairest rule I've got, though it means the bravest get it last because they're too proud to ask. If it were up to me, the lads on the south road would get it first." } },
      choices = {
        { text = "Give mine to a farmer. I can stand without it.", next = "BACK", reply = "That's generous, and the farmers on the south road will be grateful. I'll write it down.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight hardest, so I should be armored first.", next = "BACK", reply = "Everyone fights hardest, to hear them tell it. I'll see what I can do.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lewis.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If you can bring me herbs that do the work, I'll take them gladly, because Elwynn charges dear for everything that comes down that road. I'll have to log them as something, though, so tell me what they're called before I invent a name." } },
      choices = {
        { text = "Log them true, Lewis, whatever Stormwind makes of it.", next = "BACK", reply = "Honestly, then, and Stormwind can puzzle over it. I'll write the names you give me.", fx = { align = { honor = 1 } } },
        { text = "Write them down as bandages. Nobody in Stormwind will check.", next = "BACK", reply = "Ha, I'd be tempted, but someone always checks. I'll write them honestly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_militia_lewis", when = { questDone = TODO_QUEST("The People's Militia") },
          text = "Gryan says you've been out clearing Defias for the militia, and I can see it in my ledger, because the wagon from Goldshire made it up the hill twice this week without being robbed. Twice! I nearly wept on the flour sacks." },
        { id = "dd_defias_lewis", when = { killed = { name = "Defias", min = 50 } },
          text = "You've put down so many of those bandana men that I've started counting fewer losses on the supply roads. I don't usually like what I see in a ledger, but I like this." },

        { id = "h_default", text = "Lewis, quartermaster. I keep Sentinel Hill fed, armed and patched, which is a lot to ask of one ledger and a wagon that keeps getting robbed." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "Our armor's running thin. That note goes to the one man in the city who can fix it, faster than a wagon and without a Defias reading it first. Thor, our gryphon master, will put you in the air." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Lewis") },
          text = "Osric's crate? Armor at last, and it goes to whoever's in the worst shape first. Now you know the way by gryphon, so use it often; the roads are worse." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I'll put your name in the ledger, and you'll get what armor I can spare, which isn't much, and it's mostly dented." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Arrows are the first thing we run out of, after bread and patience, so I hope you brought your own." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Our bandages are mostly old shirts, so whatever you can do without them, please do." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your plate's in better shape than anything in my ledger, so keep it that way, since I've nothing to mend it with." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid, is it? I've no column in my ledger for night elves, so I'll write you down as a scout and hope nobody asks." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I've one ledger and a robbed wagon. If your spirits can stop the Defias stealing my supplies, I'd be grateful." },
      },
      again = {
        { id = "h_again", text = "What's next? I've a ledger waiting on me." },
        { id = "h_again2", text = "Go on, and quickly, before another wagon goes missing." },
      },
      choices = {
        { text = "Your wagons should be safer now, Quartermaster.", next = "dd_lewis_w", when = { killed = { name = "Defias", min = 50 } } },

        { text = "Your shelves look short on supplies.", next = "short" },
        { text = "How do you get word to the city?", next = "message" },
        { text = "What's in the ledger?", next = "ledger" },
        { text = "Got arrows, shot, throwing knives?", next = "ammo", when = { class = { "HUNTER", "ROGUE", "WARRIOR" } } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Do you stock anything for a mage, Lewis?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You'll want to log whatever my companion breaks. It breaks things.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Sentinel Hill looks short on armor, Quartermaster.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does Sentinel Hill need from its hunters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does your ledger have room for bandages and blessed water?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who gets the armor first when new stock comes in?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could wild herbs stand in for the bandages you can't get?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The Defias seem to rob your wagon at will, Lewis.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    short = {
      big = true,
      lines = {
        { id = "s_default", text = "Every wagon from the city passes three farms the Defias hold, and one in two arrives in a good week. The ledger counts the bad weeks so I don't have to." },
      },
      choices = {
        { text = "I'll clear the road.", next = "BACK", fx = { affinity = 2, standing = { sentinel_hill = 1 } } },
        { text = "The city could surely send guards.", next = "guards" },
      },
    },
    guards = {
      lines = { { id = "g2_default", text = "The city sends me forms, and I fill them in. That's the arrangement, and it's never once put a guard on the road." } },
      choices = {
        { text = "What happens to the forms?", next = "forms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forms = {
      lines = { { id = "fo_default", text = "Three copies: one goes to the city, one comes back stamped, and the third keeps the stove going, which is the only one that's ever helped." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    message = {
      lines = { { id = "me_default", text = "By gryphon. There's a man in Old Town, Osric Strang, who keeps an armor shop and sends us what he can spare, and while the wagons never reach him, the gryphons do." } },
      choices = {
        { text = "A friend in the city, then.", next = "message_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message_friend = {
      lines = { { id = "mf_default", text = "The only one we've got. The Keep sends nothing and Osric sends steel, and I know which I'd rather have, and which I'd rather thank." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { westfall = "abandoned" } } } },
    },
    ledger = {
      lines = { { id = "le_default", text = "Bread, water, arrows, shot and mending, in and out and stolen. The stolen column's the longest, and I've had to rule extra pages for it." } },
      choices = {
        { text = "Someone must be stealing most of it.", next = "ledger_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_who = {
      lines = { { id = "lw_default", text = "The Defias on the north road, the gnolls on the south, and the militia from the bread bin at night. Those last ones I forgive." } },
      choices = { { text = "Generous of you.", next = "BACK", fx = { affinity = 1 } } },
    },
    ammo = {
      lines = { { id = "am_default", text = "Arrows, shot, throwing knives and axes. They're not the best in the kingdom, only the best that got through, and I'd not be picky out here." } },
      choices = {
        { text = "Let me see them.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "Gryan's got a pile of requisitions on my desk for the day we go into the Deadmines, and I've not got half of what's on them. I'll make do, as I always do, though I'd like to make do with more." } },
    booty_bay = { { id = "tp_booty_bay", text = "I could get proper supplies from Booty Bay if the road south weren't full of trolls and the sea weren't full of pirates. As it is, I get what Stormwind sends me, which is mostly paperwork." } },
    stonemasons = { { id = "tp_stonemasons", text = "The Stonemasons built Sentinel Hill's tower, and I've their ledgers somewhere in this wagon. Nobody paid them for it either, and I keep those pages folded so I don't have to read them." } },
    second_war = { { id = "tp_second_war", text = "I kept the books for a supply train in the Second War, and I've been counting arrows ever since. The numbers were worse then, but I was younger and they didn't feel as heavy." } },
    background = { { id = "tp_bg", text = "I'm a quartermaster, and the ledger's the only history I keep, and it's mostly losses." } },
    advice = { { id = "tp_ad", text = "Buy food before you need it. Out here the bread runs out before the hunger does." } },
    trade = { { id = "tp_tr", text = "General goods for a hill at war: what I have, I sell, and what I don't have was stolen.", next = "ledger" } },
    defias = { { id = "tp_defias", text = "They eat better than we do, I'm told, off our wagons. I'd like that told to someone who can do something about it." } },
    people_militia = { { id = "tp_militia", text = "They're my best customers and my worst payers, and I wouldn't change either." } },
    _none = { { id = "tp_none", text = "That's not in my ledger, and if it's not in my ledger, it either doesn't exist or it's been stolen." } },
  },
}

P:NPC {
  key = "thor", id = TODO_NPC("Thor"), name = "Thor", gender = "male",
  bible = "bibles/sentinel_folk.md", role = "flightmaster", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "proud" },
  notices = { "travel", "animal", "lock_steed" },
  impression = {
    first = "He likes his gryphons better than most people, and they know it.",
    third = "{name} met Thor, the gryphon master of Sentinel Hill, whose birds are the one way out of Westfall the Defias haven't robbed.",
  },

  greetings = {
    { id = "g_fly", text = "Need a ride? The birds are fed and cross, which is the best time to fly, since they'll get you there quicker just to be rid of you." },
    { id = "g_back", when = { metBefore = true }, text = "Landed well, did you? Good, because the birds talk about the bad ones." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "thor_flirt_no" } }, cooldown = "2d",
      text = "Afternoon. The birds have gone quiet, which they only do when someone worth looking at comes up the hill, so I looked as well." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "thor_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "You're back! The big bird's been preening since you left, and I'll admit I've combed my beard twice, so neither of us is fooling anyone." },
    { id = "g_flirt_no", when = { npcFlagBefore = "thor_flirt_no" }, priority = 8, once = true,
      text = "Just the birds today, I promise. I've told the big one to mind his manners, and myself while I was at it." },
  },

  notice = {
    { id = "n_hunter", cat = "animal", when = { pet = true },
      text = "Keep that beast back from my gryphons. They don't share, and they've had a hard week." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid, eh? Don't go turning into anything with feathers near my birds, or they'll get jealous, and then they get bitey." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Keep that burning horse away from the roost, because my gryphons are shrieking, and they don't shriek at the Defias. Ride it if you must, but you'll not leave it tethered by my feed." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll carry you, so long as your little friend stays put away while you ride, because a gryphon with fire on its back is a gryphon that goes wherever it likes. I had a gnome try it once, and he saw a lot more of Elwynn than he paid for." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'll carry you, though I'll have to lead the birds round the far side of the hill first, because they've all fluffed up and turned their backs on that demon of yours. Send it off before you ride, or you'll see a lot more of Elwynn than you paid for, same as the gnome who tried it." },
      },
      choices = {
        { text = "Then I'll ride by your rules, Thor.", next = "BACK", reply = "Good, and the birds will thank you for it. Up you go.", fx = { align = { order = 1 } } },
        { text = "What travels with me goes where I go. Your birds can adjust.", next = "BACK", reply = "Then my birds will adjust by dropping you in Elwynn. Your choice, friend.", fx = { align = { order = -1 } } },
        { text = "Something else, Thor.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They mind the weight, but they don't complain, much. A warrior in plate is like a sack of stones to them, and they'll grumble the whole way to Stormwind, but they'll get you there." } },
      choices = {
        { text = "I'll ride light, for the gryphon's sake.", next = "BACK", reply = "That's kind, and the bird will thank you. They mind the weight more than they say.", fx = { align = { honor = 1 } } },
        { text = "I'll ride in full armor. The bird can manage.", next = "BACK", reply = "Then you'll hear the grumbling the whole way. Pay no mind, it'll get you there.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once, and only once, because the cat took fright halfway to Stormwind and tried to climb the gryphon's neck. The bird landed in a field in Elwynn and refused to fly again until the cat was gone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Once, and only once, because the cat took fright halfway to Stormwind and tried to climb the gryphon's neck. Your {pet} will have to meet you at the other end, and it'll find you, because they always do." },
      },
      choices = {
        { text = "I'll leave my beast at the stables and trust it.", next = "BACK", reply = "That's a wise choice, and the birds thank you. The stables here are good.", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go, on the bird or not.", next = "BACK", reply = "Then you'll walk, I'm afraid, because the birds won't have it. Not after the cat.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Every bird I've got has carried somebody who paid in coin with a red bandana stuffed in his pocket, and the gryphons don't care a bit. I do, though, so if you're flying for the wrong sort, fly from somewhere else." } },
      choices = {
        { text = "I fly for the Militia, Thor. Count on it.", next = "BACK", reply = "Good, then you're welcome to any bird I've got. Gryan will be glad.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fly for whoever pays, same as your birds.", next = "BACK", reply = "Then fly from somewhere else, as I said. My birds don't choose; I do.", fx = { align = { honor = -1 } } },
        { text = "Where do your routes go?", next = "routes" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Aye, and a spell never brought anyone a ginger cake from Lakeshire or sat on a roof to watch the sunset with them. You go blinking off to Stormwind if you like, and my birds will go on being better company." } },
      choices = {
        { text = "Teleports are tidier. No feathers, no fuss.", next = "BACK", reply = "Tidier, maybe, but lonelier. Off you blink, then.", fx = { align = { order = 1 } } },
        { text = "A free flight beats a spell any day, Thor.", next = "BACK", reply = "Now you're talking, though the flight's not free, mind. The birds will take you anywhere.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What are their names?", next = "names" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When there's no other way, and they're gentler with a wounded rider than a whole one, which I've never understood. I'd sooner the hill had a priest than send a man on a long ride to the Cathedral, mind, because the ride kills some of them." } },
      choices = {
        { text = "Then I'll tend them here, so they needn't make the ride.", next = "BACK", reply = "That's the best thing I've heard on this hill in a month. Bless you for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If a man can't survive the flight, he couldn't survive the war.", next = "BACK", reply = "Hard words, and wrong ones too, but I've heard them before. I'll keep flying them when I must.", fx = { align = { light = -1 } } },
        { text = "Something else, Thor.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They'd love to, the brutes, but I keep them out of it, since a gryphon's a flier and not a soldier. The Defias leave the birds alone, and I'd like it to stay that way." } },
      choices = {
        { text = "Fair enough. Everyone on this hill has a duty, birds included.", next = "BACK", reply = "It is, and mine is keeping these birds alive. Thank you for understanding.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Use every weapon you have, Thor. Send the birds in.", next = "BACK", reply = "Not mine, friend, they're fliers, not soldiers. I'll not lose a bird to a Defias arrow.", fx = { align = { order = -1 } } },
        { text = "Something else, Thor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_fall_thor", when = { deathCause = "falling" },
          text = "You've a way of looking at the edge of my platform that tells me you've fallen off something tall, and not on purpose. My gryphons don't drop riders, friend, so you'll have to find some other way to break your neck." },

        { id = "h_default", text = "Name's Thor, and I keep the gryphons. They're the fastest way out of Westfall, and the only one the Defias haven't managed to rob, so far." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "thor_flirt_no" } }, cooldown = "3d",
          text = "The gryphons like you, which is rare, because they don't like anyone, me included. I'd trust their judgement before my own, and my own happens to agree with them." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "thor_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "You came up the hill again, and the birds noticed before I did, which is the only time I've ever been jealous of a gryphon." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "From Lewis, and urgent? They're all urgent, with Lewis. Up you go, then, and hold on with your knees, not your hands; the bird hates being strangled." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lot glide, I hear, off cliffs and the like. Gryphons don't glide, they haul, so strap in; it's not the same thing at all." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll need to leave that shield on the ground while you ride, or my gryphon will think you're attacking it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast stays on the ground, I'm afraid; the gryphons don't share their backs with anything that might bite." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The birds don't mind your sort, since you smell of candles and not of blood." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Mind the plate, because it pinches the feathers, and the gryphons will let you know about it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Keep that smoky little thing off the perch, would you? The birds have long memories and short tempers." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick, the birds are restless." },
        { id = "h_again2", text = "Go on, then. Quick, before one of them bites somebody." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Your gryphons look a proud lot.", next = "birds" },
        { text = "Where do your routes go?", next = "routes" },
        { text = "You must have lost a rider or two.", next = "lost" },
        { text = "Lewis's note has to reach Stormwind.", next = "message", when = { questActive = TODO_QUEST("Continue to Stormwind") } },
        { text = "Ironforge's gryphons look sturdier than these.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "The winds over Westfall are restless today, Thor.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Your gryphons must carry riders who'd rather not be seen.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A gryphon is slower than a teleport, you know.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the gryphons mind carrying warriors, Thor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Has a hunter's beast ever ridden a gryphon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your gryphons ever carry the wounded back to Stormwind?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your gryphons look eager to fly against the Defias, Thor.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will your gryphons carry someone the animals don't trust, Thor?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the gryphons ever take to anyone, Thor?", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "thor_flirt_no" } } },
        { text = "Not today.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "Hardly anyone, but the big one has watched you since you came up the hill, and he's got taste, for a bird. So have I, I'm told, though nobody on this hill gives me much chance to prove it." },
        { id = "fl_again", when = { npcFlagBefore = "thor_flirt_yes" }, priority = 5,
          text = "The big one still watches you, and so do I, if I'm honest. A man who spends his days with gryphons forgets how to be subtle, and I was never much good at it to start with." },
      },
      choices = {
        { text = "Then perhaps you'll take me flying someday, Thor.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "thor_flirt_yes" }, clear = { "thor_flirt_no" } } } },
        { text = "Careful, Thor. My beast gets jealous.", next = "flirt_yes", when = { class = "HUNTER" },
          reply = "Then it can take a number behind the gryphons, because they had their eye on you first.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "thor_flirt_yes" }, clear = { "thor_flirt_no" } } } },
        { text = "I'll take the compliment, but just the flight path, please.", next = "BACK",
          reply = "Fair enough, and no offence taken. The birds will sulk, but they sulk about everything.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "thor_flirt_no" }, clear = { "thor_flirt_yes" } } } },
        { text = "Stick to your birds, Thor.", next = "BACK",
          reply = "That's what my mother told me, and she was right as well. Off you go, then, and hold on with your knees.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "thor_flirt_no" }, clear = { "thor_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "Gryphon masters don't fly for pleasure as a rule, because it feels too much like work. For you I'd make an exception, though I'd want a clear sky, the gentle bird, and nobody from the militia watching." } },
      choices = {
        { text = "I'll hold you to that, Thor.", next = "BACK",
          reply = "Do, and I'll save you the gentle bird. Hold on with your knees, not your hands, and leave the rest to me." },
      },
    },
    birds = {
      lines = { { id = "b_default", text = "They're proud, hungry and loyal, in that order. Treat them like soldiers and they'll treat you like cargo, which is a compliment from a gryphon." } },
      choices = {
        { text = "I'll be good cargo.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do they have names?", next = "names" },
      },
    },
    names = {
      lines = { { id = "na_default", text = "They do, but they've never told me what they are. I call them all 'you', and they answer when they feel like it." } },
      choices = { { text = "Sounds like the militia.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
    routes = {
      lines = { { id = "ro_default", text = "Stormwind, always, and Lakeshire over the mountains, Darkshire when the wind's kind and Booty Bay if you've the stomach for it." } },
      choices = {
        { text = "Why only the places I've been?", next = "routes_been" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_been = {
      lines = { { id = "rb_default", text = "Every bird knows the way home to the capital, but a strange roost they won't trust until you've shown them it once. Once is enough, mind; they're smarter than they let on." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    lost = {
      lines = { { id = "lo_default", text = "Never a rider, but I lost a crate of Lewis's arrows over the Dagger Hills once. Somewhere out there a Defias is very well stocked." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    message = {
      lines = { { id = "ms_default", text = "Then you want Osric Strang, in Old Town. His shop's called Limited Immunity. Pay the bird's fare and I'll have you there before Lewis finishes fretting." } },
      choices = {
        { text = "Saddle up, then.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Sturdier, maybe, but mine fly through sea wind and dust every day and come home grumbling. That's all the sturdy I need." } },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Aye, the birds felt it too; they've been snapping at each other since dawn. If you can tell when the wind turns, you're welcome to stand by the roost and warn me before it does." } },
      choices = {
        { text = "It'll turn by dusk. Ground the birds.", next = "BACK", fx = { affinity = 2 } },
        { text = "The wind doesn't take orders from me.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    wildhammer = { { id = "tp_wildhammer", text = "My gryphons were bred by the Wildhammers at Aerie Peak, and they've never let me forget it. They think a man on a saddle is an insult, and I suspect they're right." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "My birds won't fly within a league of that black mountain north of Redridge, and I've stopped trying to make them. A gryphon knows when there's something bigger in the sky, and that's enough for me." } },
    dark_portal = { { id = "tp_dark_portal", text = "I flew a message to Nethergarde once and saw the Dark Portal from above, a great black gate standing in a red waste. The bird turned back on its own, and I didn't argue." } },
    deadmines = { { id = "tp_deadmines", text = "My gryphons won't land near Moonbrook, because the Defias have taken to shooting at anything with wings. I'd rather a bird be sulky than dead, so I fly the long way round." } },
    onyxia = { { id = "tp_onyxia", text = "Some of the riders who fly south to Theramore say there's a black dragon in the marshes there who'd eat a gryphon whole. I've told my birds about her, and they've been behaving ever since." } },
    background = { { id = "tp_bg", text = "I'm the gryphon master, and that's the whole of it. The birds don't care where I came from, so neither do I." } },
    advice = { { id = "tp_ad", text = "Fly over trouble, not through it, and never feed a gryphon from your hand. I did it once, and never again." } },
    trade = { { id = "tp_tr", text = "I sell rides out of Westfall for a little coin, cheaper than walking and safer than the road.", next = "routes" } },
    westfall = { { id = "tp_westfall", text = "From up there it's all gold and grey. Pretty, if you don't know what's in the grey." } },
    _none = { { id = "tp_none", text = "I fly birds, friend, so you'd best ask someone who walks." } },
  },
}

P:NPC {
  key = "riell", id = TODO_NPC("Scout Riell"), name = "Scout Riell",
  bible = "bibles/sentinel_folk.md", role = "militia", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "watchful" }, values = { "dutiful", "loyal" },
  notices = { "stealth", "kit" },
  impression = {
    first = "She saw me long before I saw her.",
    third = "{name} met Scout Riell, who watches the roads from Sentinel Hill's tower and reports to Gryan Stoutmantle.",
  },

  greetings = {
    { id = "g_tower", text = "Up here you can see every road into the hill, which means I see you coming long before you say hello." },
    { id = "g_back", when = { metBefore = true }, text = "I saw you on the north track an hour ago. You walk like you're looking for a fight, which suits me fine." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { stealthed = true },
      text = "Nice try. You can hide from the road, but not from the tower." },
  },

  start = "hello",
  nodes = {
    dd_riell_t = {
      lines = {
        { id = "dd_riell_t_a", text = "You have, and the Defias have noticed too, because their scouts move in threes now instead of pairs. That means they're scared, and scared men make mistakes, which is when the militia gets them." },
      },
      choices = {
        { text = "Then I'll keep them scared. Westfall deserves better.", next = "dd_riell_t2", fx = { align = { light = 1 } } },
        { text = "Scared men also get desperate. Mind your militia.", next = "dd_riell_t2", fx = { align = { order = 1 } } },
        { text = "Where do their scouts come from?", next = "dd_riell_t2" },
      },
    },
    dd_riell_t2 = {
      lines = {
        { id = "dd_riell_t2a", text = "Moonbrook, mostly, and the Jangolode mine, and somewhere under them both that nobody's mapped yet. Whoever's giving them orders isn't on the roads, and I'd give a year's pay to see their face from my tower." },
      },
      choices = { { text = "Maybe you will. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I enjoy it very much, since every road into Sentinel Hill is mine to watch. A shaman's lightning would make them more nervous still." } },
      choices = {
        { text = "Watch fairly, Riell. Strike only when it's needed.", next = "BACK", reply = "Fairly, aye, and I'll strike only when the road's threatened. But I'll still enjoy watching them sweat.", fx = { align = { honor = 1 } } },
        { text = "Make them terrified. Fear wins wars.", next = "BACK", reply = "That's my thinking, and I'm glad to hear it from someone else. Every nervous Defias is a careless one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "South to the Jangolode Mine, or west to the coast, where the Defias have dug in among the old farms. Gryan wants them pushed back, and I want them gone, but I'll settle for pushed back today." } },
      choices = {
        { text = "I'll push them back, and keep pushing.", next = "BACK", reply = "Good, and keep pushing till they're out of Westfall. I'll be watching from the tower.", fx = { align = { order = 1 } } },
        { text = "I'll go where the fighting's thickest and stay there.", next = "BACK", reply = "Then you'll be where I need you most. I'll point you in the right direction.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Defias camps, mostly, and where the gnolls are gathering. The gnolls and the thieves trade, I'm sure of it, but I can't prove it from up here, so bring me something I can show Gryan." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Defias camps, mostly, and where the gnolls are gathering, because I'm sure they trade with the thieves. Your {pet} has a good nose, I'd guess, so point it at the hills south of the mine and bring me something I can show Gryan." },
      },
      choices = {
        { text = "I'll track them and bring you proof.", next = "BACK", reply = "Then Gryan will have to listen to me at last. Bring me something I can hold.", fx = { align = { order = 1 } } },
        { text = "I'll track them and deal with them myself.", next = "BACK", reply = "Then I'll watch from up here and cheer. Bring me something anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "It would, and it would show every Defias on that road exactly where I'm standing, so I keep my tower dark. If you want to help, put your fire on the riders I point at, not on the lamp." } },
      choices = {
        { text = "I'll follow your lead, Riell.", next = "BACK", reply = "Good, and you'll be more use to me than the lamp. I'll point, you burn.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pick my own targets, scout.", next = "BACK", reply = "Then you'll be guessing, and I'll be watching. Your choice, mage.", fx = { align = { order = -1 } } },
        { text = "What have you seen on the roads?", next = "see" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Can you now? Then tell me what's moving round Moonbrook after midnight, because the lights I've seen there aren't lanterns. Whatever your eyes are borrowed from, I'll take a report from them all the same." } },
      choices = {
        { text = "I'll use whatever sight I've got, borrowed or not.", next = "BACK", reply = "Then you'll be the most useful stranger I've met this year. Tell me what you see.", fx = { align = { light = -1 } } },
        { text = "I'll trust my own eyes, not the ones I borrow.", next = "BACK", reply = "Wise, maybe, but your own eyes don't see in the dark. Either way, tell me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What lights did you see?", next = "see_lights" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I see every cart come up the road, and I count what's lying in the back before anyone else does. Gryan buries them on the east slope, and I'd be glad if someone said better words over them than he does." } },
      choices = {
        { text = "I'll say those words, Riell, and I'll say them properly.", next = "BACK", reply = "Thank you, and Gryan will thank you too, though he'll not say it. They're buried on the east slope, under the old fence line.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Words don't help the dead. Keep your eyes on the road.", next = "BACK", reply = "Maybe not, but they help the living. I'll keep watching.", fx = { align = { light = -1 } } },
        { text = "Something else, scout.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The camps along the Moonbrook road, because that's where they gather before they come at us. Gryan wants them pushed back, but I'd like them broken, and I'm told that's why I'm a scout and not a captain." } },
      choices = {
        { text = "Gryan's plan is sound. We push them back, steadily.", next = "BACK", reply = "Steadily, aye, and I'll keep my opinion to myself. Mostly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then I'll break them, and I won't wait for Gryan.", next = "BACK", reply = "Then you'll have a friend in this tower, and Gryan will have a headache. Go break them.", fx = { align = { order = -1 } } },
        { text = "Something else, Riell.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_fields_riell", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "From the tower I could see those harvest watchers stalking the Saldean fields every dawn, and lately there are fewer of them. Farmer Saldean says that's your doing, and I'll take his word, since I watched the dust go up." },
        { id = "dd_defias_riell", when = { killed = { name = "Defias", min = 80 } },
          text = "I keep a tally of red bandanas on the tower post, one notch for every Defias I see go down on the roads, and half the notches this month are yours. I'll need a new post soon." },

        { id = "h_default", text = "Riell, scout for the People's Militia. I watch from the tower and tell Gryan what's coming. Lately it's always the same answer: more." },
        { id = "h_silk", tags = { "news" }, when = { questActive = TODO_QUEST("Red Silk Bandanas") },
          text = "I want the red silk off Defias necks, so bring me the bandanas. Every one on my table is one less on the road." },
        { id = "h_silk_done", when = { questDone = TODO_QUEST("Red Silk Bandanas") },
          text = "There are fewer red silks on the roads this week, and the ones that are left look nervous. I like them nervous." },
        { id = "h_gryan", when = { heardLine = "gryan.w_default" },
          text = "Gryan told you how Westfall went to ruin? We lived through it, every one of us on this hill, and that's why we stayed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The tower sees a lot, but it can't fight what it sees, so I'll tell you where to go and you'll go." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll see things on the ground the tower can't, and I'd like to know what you see." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Gryan will want you on the hill tonight, because we lose fewer men when someone's there to tend them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. From up here your armor shines like a beacon, and I mean that kindly, though the Defias will see it too." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I saw you coming a long way off, and your spirits aren't quiet, which is good, because the Defias should be nervous." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm watching the road, not you, but talk anyway." },
        { id = "h_again2", text = "Go on. Up here the wind carries every word, so I'll hear you fine while I watch Moonbrook." },
      },
      choices = {
        { text = "I've been keeping your tally busy, Riell.", next = "dd_riell_t", when = { killed = { name = "Defias", min = 80 } } },

        { text = "What can you see from the tower?", next = "see" },
        { text = "Why do the Defias all wear red?", next = "silk" },
        { text = "Living up here can't be easy.", next = "tower" },
        { text = "Bet I could slip past your watch.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Sentinels keep watches like this at home.", next = "nightelf", when = { race = "NightElf" } },
        { text = "I could scout the hills for you as a cat.", next = "druid", when = { class = "DRUID" } },
        { text = "A light spell would show you the road at night.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I can see things in the dark that you can't.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where should a warrior go from Sentinel Hill?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter watch for on the roads?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you watch the militia's dead come home from the tower?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should a paladin strike first, from what you see up here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You seem to enjoy making the Defias nervous, Riell.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Carry on, scout.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Smoke from Moonbrook, riders on the coast road at odd hours, and lights at the old farms that shouldn't have lights. I write it all down, and Gryan reads every word." } },
      choices = {
        { text = "Lights at the old farms?", next = "see_lights" },
        { text = "Who rides the coast road?", next = "see_riders" },
        { text = "I'll look into it.", next = "BACK", fx = { affinity = 1, learn = { "moonbrook" } } },
      },
    },
    see_lights = {
      lines = { { id = "sl_default", text = "Defias camped in houses that were farmers' homes not long ago: the Molsen place, Furlbrow's, and the farms near the Jangolode Mine. They don't even bother to close the shutters." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    see_riders = {
      lines = { { id = "sr_default", text = "A messenger, riding from Moonbrook to the quarry, the quarry to the mine, and back again, the same route every time like a clock. I've told Gryan, and Gryan has plans for clocks." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    silk = {
      lines = {
        { id = "si_default", text = "The red marks the gang and the cloth marks the rank: leather on the road, silk on the ones who give the orders. You'll find the silk under Moonbrook." },
        { id = "si_known", when = { deed = "dungeon:The Deadmines" },
          text = "You've been under Moonbrook. Then you've seen what silk looks like up close, and what it costs to take it off them." },
      },
      choices = {
        { text = "Under Moonbrook?", next = "silk_under" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silk_under = {
      big = true,
      lines = { { id = "su_default", text = "There's a way down somewhere in the town, and the high ranks hole up beneath it. When you go, go with friends, and bring me ten silks for my table." } },
      choices = {
        { text = "Ten silks. I'll remember.", next = "BACK", fx = { affinity = 1, learn = { "moonbrook" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      lines = { { id = "to_default", text = "It's cold at night and hot by noon, and the wind never stops. On a clear day I can see Moonbrook's smoke from here. I'd trade the view for a quiet one." } },
      choices = {
        { text = "You look as if you never sleep.", next = "tower_sleep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower_sleep = {
      lines = { { id = "ts_default", text = "Between watches, when I can. Heather keeps a bed for me at the inn, and I've used it twice; it was very nice both times." } },
      choices = { { text = "Use it a third time.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Try it, then; every thief in red has tried. A shadow moving against dry grass is the easiest thing in Westfall to see." } },
      choices = {
        { text = "Challenge accepted.", next = "BACK", reply = "Then try, and I'll be waiting. Nobody's managed it yet.", fx = { align = { order = -1 }, trait = { witty = 1 }, affinity = 1 } },
        { text = "Good. Keep it that way.", next = "BACK", reply = "I intend to, and I'll be watching you all the way down the hill.", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "From the trees, I've heard. We've no trees to speak of out here, only plenty of sky and nothing to hide in, which suits a lookout fine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "druid_l", text = "As a cat? Well, the Defias shoot at anything that moves on two legs out there, so a cat would get further than I would. Mind the coyotes, and come back before dawn, or I'll assume you've been eaten." } },
      choices = {
        { text = "I'll be back before the watch changes.", next = "BACK", fx = { affinity = 1 } },
        { text = "Coyotes are the ones who should be careful.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "I can see the road to Moonbrook from this tower, and I watch the Defias carts go in and never come out. Whatever they're building down there, they're building it big." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail have been anchoring off the coast at night, and I've seen their lanterns from up here. If they're trading with the Defias, I'd like to know what for, and I'd like to know before they do." } },
    si7 = { { id = "tp_si7", text = "SI:7 sends a man to look at our maps now and then, and he never introduces himself. I've started leaving a few wrong pins on the map, just to see if anyone notices." } },
    sentinels = { { id = "tp_sentinels", text = "The night elf Sentinels can watch a forest for a week without blinking, so I'm told. I'd like to learn their trick, because I've been on this tower for three days and I'm seeing gnolls in my sleep." } },
    background = { { id = "tp_bg", text = "I scout for the militia, and before that there's nothing worth the telling. The tower's where I live now, near enough." } },
    advice = { { id = "tp_ad", text = "Look up before you walk into a valley, because someone's always on the ridge. Make sure it's me." } },
    defias = { { id = "tp_defias", text = "They're organised, and that's what scares me. Bandits don't post watches, but these do." } },
    people_militia = { { id = "tp_militia", text = "We're what's left when the lords leave: not much, but more than nothing." } },
    moonbrook = { { id = "tp_moonbrook", text = "I watch its smoke every morning. One day I'd like to watch it stop.", next = "silk" } },
    _none = { { id = "tp_none", text = "I can't see that from up here. Ask someone on the ground." } },
  },
}

P:NPC {
  key = "macgregor", id = TODO_NPC("William MacGregor"), name = "William MacGregor",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "dry" }, values = { "craft" },
  notices = { "class", "lock_shards" },
  impression = {
    first = "Strings, he reminded me more than once, are always extra.",
    third = "{name} met William MacGregor, the Sentinel Hill bowyer, who coaxes good bows from Westfall's poor wood.",
  },

  greetings = {
    { id = "g_bows", text = "Bows, arrows, and a quiver if you've the coin. Strings are extra, mind; strings are always extra." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Let me see that bow of yours. Hm, it'll do, though it'd do better with a new string, and those are extra." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior buying arrows, for pulling things to you, I suppose. Suit yourself, though the things out here usually come anyway, teeth first." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Your bag's cold and it hums, and I've heard warlocks keep souls in crystals the size of a thumb. If any of them belonged to the Defias, I'll not lose sleep over it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's poor and dry, since the farms emptied. Your earth spirits might know better wood elsewhere, but I make do." } },
      choices = {
        { text = "Patience makes good bows, William. Keep at it.", next = "BACK", reply = "Patience it is, and I've plenty of that. Strings are still extra, mind.", fx = { align = { order = 1 } } },
        { text = "Find better wood. Poor bows get people killed.", next = "BACK", reply = "Better wood costs better coin, and nobody on this hill has it. I'll do what I can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A bowstring, maybe, if that little horror of yours chews through your satchel straps like I've heard they do. Otherwise you're wasting each other's time, though I'll say a warlock on Sentinel Hill is one more thing the Defias have to think about, and I like that well enough." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A bowstring, maybe, if your {pet} keeps eyeing my rack the way it is, because I've heard what your sort's servants do to satchel straps. Still, a warlock on Sentinel Hill is one more thing the Defias have to think about, and I like that well enough." },
      },
      choices = {
        { text = "I'll pay for any string, at your price.", next = "BACK", reply = "That's the right answer, and I'll take it. Strings are extra, as ever.", fx = { align = { honor = 1 } } },
        { text = "I'll take what I need, and the hill can thank me.", next = "BACK", reply = "The hill can thank you after, and you'll pay me before. That's how it works.", fx = { align = { honor = -1 } } },
        { text = "Something else, William.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior shoots once and then throws the bow down to draw a sword, and I've found my best work in a ditch more than once. Take a plain one, and save the good yew for the ones who'll keep it." } },
      choices = {
        { text = "Then I'll take the plain one and treat it well.", next = "BACK", reply = "Then you'll get a decent bow and I'll get a decent night's sleep. Fair trade.", fx = { align = { honor = 1 } } },
        { text = "I'll pay for the best, and do as I like with it.", next = "BACK", reply = "Then you'll pay the full price and the strings besides. Your coin.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Quieter, aye, and a sight shorter, which means you've got to be close enough to smell the Defias before you use it. I make bows so the militia lads never need to get that close." } },
      choices = {
        { text = "Close is where the work gets done, William.", next = "BACK", reply = "It might be, for your trade. I'll stick to keeping the lads at a distance.", fx = { align = { honor = -1 } } },
        { text = "Distance is honest. The militia need bows.", next = "BACK", reply = "Exactly, and that's why I make them. Good to hear you agree.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What's the best wood for a bow?", next = "best" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "A wand? No, a wand's a stick that's forgotten what it was for. Strings are extra, mind, and wands don't take strings, so I'll leave you to Stormwind's shops on that one." } },
      choices = {
        { text = "Craft takes rules and patience, like yours.", next = "BACK", reply = "That's kind of you, and you're right. Bows and spells both want patience.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll make do with whatever's lying about.", next = "BACK", reply = "Then you'll be making do with sticks, I'd guess. Good luck to you.", fx = { align = { order = -1 } } },
        { text = "Why is Westfall wood so poor?", next = "wood" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Once, for a young brother from the Cathedral who couldn't hit a barn door, and I bought it back from him for half the price. Your sort have your own weapons, I'm told, and I'd guess prayer doesn't need a string." } },
      choices = {
        { text = "My faith is my weapon, William, and it never misses.", next = "BACK", reply = "Then you'll never need a bow from me, and I'll not argue with a priest. Pray for my strings, though; they keep snapping.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith's well enough, but I'd rather carry a good bow.", next = "BACK", reply = "Then you'll want a good one, and I'll find you one. Strings extra.", fx = { align = { light = -1 } } },
        { text = "Something else, William.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More often than my family would like, and they'd tell you I'm a fool for it. A farmer with a bow is one more pair of eyes on the hill, and that's worth a few coppers to me." } },
      choices = {
        { text = "That's right and generous. The weak deserve a way to fight.", next = "BACK", reply = "That's what I tell Gina, and she rolls her eyes. Thank you for saying it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Charge them, William. Charity won't keep your bench open.", next = "BACK", reply = "Gina says the same, and she's usually right. I'll keep giving a few away anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else, William.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the windbreaks the old farmers planted, mostly, and only the trees that are already dying, because I'll not fell a sound one when there are so few left. It makes for knotty staves, and I charge for the patience they take." } },
      choices = {
        { text = "Only the dying trees. That's a fair bargain with the land.", next = "BACK", reply = "That's how I see it, and I'm glad someone does. The staves are knotty, but they're honest.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Cut the sound ones. The militia needs bows now, not later.", next = "BACK", reply = "Now, then, and nothing left later, and then where are we? I'll keep to the dying ones.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_gnolls_mac", when = { killed = { name = "Riverpaw", min = 30 } },
          text = "You've been at the Riverpaw gnolls, haven't you? The militia boys say the hills to the south are quieter, and I've had fewer arrows come back to me with gnoll teeth marks in the shafts." },

        { id = "h_default", key = true, text = "MacGregor's the name. I make bows for the militia and sell what's left to whoever walks up; Westfall wood's poor, so I make it up with patience." },
        { id = "h_yew", when = { metBefore = true }, text = "I found a decent stave of yew out by the Dagger Hills, decent but not good. In Westfall, decent is a holiday." },
        { id = "h_patrol", when = { questDone = TODO_QUEST("Patrolling Westfall") },
          text = "The gnolls to the south are thinner on the ground since you went out. The militia are wasting fewer arrows, which I'm told is good news and I take as bad for business." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "You went under Moonbrook and came back with your bowstring still whole. Either you're good, or you didn't let the hunters shoot. Either way, well done." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at my bench. You'll want a bow for pulling, I suppose, and I'll sell you one, though it's not my best." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at a bowyer's bench. You'll not want a bow, I'd guess, but you're welcome to watch." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Hammers and maces for your lot, I know, so I've nothing for you but a fine bowstring to admire." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll have opinions about my staves, I expect, since I'm told your people grow the finest bow wood in the world." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ink on your fingers and a smell of struck matches. You'll want a wand, not a bow, and I don't sell wands." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Westfall wood is poor, so I make up the difference with patience. Strings are extra." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm listening, though I'm waxing a string while I do." },
      },
      choices = {
        { text = "You must have learned bowmaking somewhere.", next = "learn" },
        { text = "Is good wood hard to come by out here?", next = "wood" },
        { text = "What bow would you give a hunter?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'd guess the militia get your best bows.", next = "best" },
        { text = "Gina MacGregor says she sells your strings.", next = "gina", when = { heardLine = "gina.h_default" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "A good bow is fine, but a knife is quieter.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would a wand count as competition, William?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why won't you sell a warrior your best bow?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have you ever made a bow for a priest, William?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd wager you give bows to farmers who can't pay.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where do you cut your wood, now Westfall's groves are gone?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is there anything someone in my line of work would want from a bowyer?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Westfall wood doesn't look like much, William.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "It's dry country with crooked trees. Elwynn wood's better, but the wagons don't get through often enough, so I bend what we've got, slowly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learn = {
      lines = {
        { id = "l_father", text = "I made bows for farmers who hunted rabbits, at first. Then the thieves came and the farmers wanted bigger bows, so it's the same wood in worse times." },
      },
      choices = { { text = "Times will turn.", next = "BACK", fx = { affinity = 1 } } },
    },
    best = {
      big = true,
      lines = { { id = "be_default", text = "The militia, every time, before I'll sell one to a stranger. A farmer with a good bow on the wall is a farm the Defias think twice about, and that does me more good than your coin ever could." } },
      choices = {
        { text = "Right. The hill's defenders come first.", next = "BACK", reply = "Exactly, and I'll not sell otherwise. Thank you for seeing it.", fx = { align = { honor = 1 }, standing = { sentinel_hill = 1 } } },
        { text = "Coin's coin. Sell to whoever pays the most.", next = "BACK", reply = "Then go buy from someone who'll sell to Defias. Not from me.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gina = {
      lines = { { id = "gi_default", text = "She does, and she charges me for them too, so mine cost extra. That's all the family business you'll get out of me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Something that pulls smooth and forgives a cold morning, not the prettiest on the rack but the one you'll still trust in the Dagger Hills at dusk." } },
      choices = {
        { text = "Show me that one.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "The night elves make bows from their own trees and string them with something I've never seen this side of the sea. I'd trade my whole stock for one, and still feel I'd got the better deal." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I sold bows at the Darkmoon Faire one summer, and a gnome bought one twice his height just to see if he could. He couldn't, but he paid, and that's what counts." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are dug into the old mines under Moonbrook, and they've been buying arrows from somebody who isn't me. I'd like to know who, because that's my trade they're stealing as well." } },
    background = { { id = "tp_bg", text = "I'm a bowyer, working Westfall wood with Westfall patience, and there's nothing else worth telling." } },
    advice = { { id = "tp_ad", text = "Keep your string dry and your quiver full. Out here you won't get a second chance to restock." } },
    _none = { { id = "tp_none", text = "I sell bows, friend, so ask me about bows." } },
  },
}
