-- Tanaris beyond the gates: Steamwheedle Port, the wandering turtle Tooga, and the Gadgetzan folk earlier passes skipped.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ironboot", id = TODO_NPC("Prospector Ironboot"), name = "Prospector Ironboot",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He came for treasure and stayed for the sand in his beard.",
    third = "{name} met Prospector Ironboot at Steamwheedle Port in Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Well met, friend! Shake the sand off yer boots before ye come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The desert didn't swallow ye, then, and by my beard I'm glad of it." },
  },
  notice = {
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "What's that cold comin' off yer pack? Soul shards, I'd wager, an' a fair heap o' them, because the sand round yer boots has gone chill. Keep them well away from my digs, for the old troll stones dinnae need more souls whisperin' near them." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Bones, mostly, an' old troll stonework. But I'll say this tae a fellow dwarf: the ground here shifts like it's dreamin', an' I'd sooner ye asked it what it dreams than me." } },
      choices = {
        { text = "Then I'll ask it, and respect what it tells me.", next = "BACK", reply = "Aye, that's the stone-speaker in ye, and I'm glad of it, because a dwarf who listens to the ground lives long enough to grow a proper beard.", fx = { align = { light = 1 } } },
        { text = "Dig deeper, Ironboot. The earth's dreams aren't our problem.", next = "BACK", reply = "Easy said by a shaman with clean hands, but I've felt the sand roll over in its sleep, and I'll not be the fool who kicks it awake.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need someone who'll stand in the sand all day and not wander off after the first bandit he sees, aye. The last fellow I hired chased a Wastewanderer over three dunes and came back with no water, no bandit and no notion where the dig was." } },
      choices = {
        { text = "A guard holds his post. Chasing glory gets diggers killed.", next = "BACK", reply = "By my beard, that's the most sense I've heard all week, and if ye can hold a post like ye talk, ye'll do fine at my dig.", fx = { align = { order = 1 } } },
        { text = "Best defence is running the bandits down before they reach you.", next = "BACK", reply = "And who minds the diggers while ye're off three dunes over playin' hero? That's how I lost the last fellow, and very nearly the trench with him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hyenas by day and scorpids by night, and once a basilisk that sat on my best trench for two days and glared at anyone who came near. I lost a good shovel and a better digger to that stare before it wandered off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hyenas by day an' scorpids by night, mostly. Keep {pet} out o' the trenches, though, because the last beast that dug in my dig found a troll's skull and wouldn't give it back." },
      },
      choices = {
        { text = "Beasts only take what they need. Drive them off, don't slaughter them.", next = "BACK", reply = "A soft heart for a hunter, and I'll not mock it, though I'd ask ye tae tell that to the basilisk that ate my best digger's morning.", fx = { align = { honor = 1 } } },
        { text = "A hyena that learns to raid camps should be put down.", next = "BACK", reply = "Aye, that's my thinking too, and if ye find the one with the torn ear that's been nosing round my tents, ye've my blessing and my thanks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They're Sandfury dead, or their grandfathers, and they were buried with charms meant to keep them down. I'd sooner a priest said proper words over them than have some Zul'Farrak witch doctor come looking for what I've moved." } },
      choices = {
        { text = "I'll lay them to rest properly. The dead deserve that much.", next = "BACK", reply = "Bless ye for it, because I've been sleepin' poorly beside those bones, and a few proper words might settle them and me both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead trolls make useful servants. I'd not waste them on rest.", next = "BACK", reply = "Ye'll not do that in my camp, and I'll say it plain: the League digs to learn, and I'll have no one raising my finds to walk about.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bones, mostly, and old troll stonework that crumbles the moment the air touches it. Once or twice the ground's shifted under me like it was turning over in its sleep, and I'll admit I didn't stay to see it wake." } },
      choices = {
        { text = "The earth remembers. Dig with respect, or it'll bury you.", next = "BACK", reply = "Aye, and I've had a taste of that already, so I go slow and I go careful, and I say a word tae the stone before every new trench.", fx = { align = { honor = 1 } } },
        { text = "Ruins belong to whoever holds the shovel. Dig deep.", next = "BACK", reply = "Spoken like someone who's never had a ruin fall in on them, and I'll warrant ye'd change your tune with a wall of sand on your chest.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The League won't say it out loud, but aye, they've paid for quiet hands before. A sealed vault under the dunes keeps its secrets well, and sometimes the only key is someone who can open what was never meant to be opened." } },
      choices = {
        { text = "Ancient tombs should stay sealed. Leave the dead be.", next = "BACK", reply = "Maybe ye're right, and some nights I think so too, but the League would have my hide if I said that out loud in Ironforge.", fx = { align = { honor = 1 } } },
        { text = "If it's buried and forgotten, it's fair game.", next = "BACK", reply = "Aye, well, the League would nod along with ye, and that's what keeps me up at night, because the forgotten things down there may not stay forgotten.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's dig into something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "There's old magic down there, I'd stake my beard on it, because nobody builds walls like the ones at Eastmoon for no reason. The trolls of Zul'Farrak won't say what came before them, and the sand won't either, so I keep digging and hoping." } },
      choices = {
        { text = "Some old power should stay buried, Ironboot.", next = "BACK", reply = "I've thought the same on a bad night, but a dwarf who leaves a door shut forever never learns why it was locked in the first place.", fx = { align = { order = 1 } } },
        { text = "Dig it all up. Knowledge belongs to the finders.", next = "BACK", reply = "That's the League's own motto near enough, and I'll drink to it, though I'd like tae be the finder who comes home with all his fingers.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near Zul'Farrak they have, aye, and I'll not pretend otherwise. The trolls there don't let their dead lie quiet, so a dwarf with a shovel learns to listen for scratching under the sand before he digs another foot." } },
      choices = {
        { text = "Treat their graves with reverence, even if they're troll graves.", next = "BACK", reply = "I try, and I'll go on trying, because a grave is a grave whatever's lying in it, and the trolls of Zul'Farrak would say the same.", fx = { align = { honor = 1 } } },
        { text = "The dead won't miss what you take from them.", next = "BACK", reply = "Maybe not, but their kin will, and I've heard what the Sandfury do to those who rob their dead, so I'll thank ye not to tempt fate at my camp.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone to stand between my diggers and whatever we wake, mostly, because a shovel's no use against a troll with a spear. The League pays in maps and gratitude, I'm afraid, but there's honest work in keeping good folk alive." } },
      choices = {
        { text = "I'll guard your diggers. That's what a paladin is for.", next = "BACK", reply = "By the forge, that's a weight off my shoulders, and my diggers will sleep a deal easier knowing there's a paladin on the ridge.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light doesn't serve the League. I go where I'm needed.", next = "BACK", reply = "Then go where ye're needed, and no hard feelings, though I'll say my diggers are good folk and they need the Light as much as anyone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bones, mostly, an' some of them far too big for any beast I know. There's petrified wood down there as well, whole trunks of it, so there was a forest here once, an' I'd give a lot to know what killed it." } },
      choices = {
        { text = "Dig it up. The past should be known.", next = "BACK", reply = "That's the spirit, and I'll have ye know I keep every bone labelled and every trunk mapped, so whatever killed that forest won't stay a mystery long.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let the dead forest rest. Not every secret needs digging.", next = "BACK", reply = "A druid would say that, and maybe ye're wiser than me, but I can't look at a stone tree and not want tae know what turned it so.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Old troll cities, older than Zul'Farrak, and things the trolls themselves were afraid of, if the carvings are tae be believed. I dig for the League's knowledge, not for power, an' I'd ask ye tae respect the difference while ye're at my camp." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Old troll cities, older than Zul'Farrak, and things the trolls themselves were afraid of, if the carvings are tae be believed. Yer demon's been starin' at my rubbings since ye walked in like it can read the things, an' that's a fair bit more interest than I'd like, so keep it well back from my camp." },
      },
      choices = {
        { text = "I'll respect it. Some things should stay buried.", next = "BACK", reply = "Good, then we'll get along fine, and I'll show ye the carvings if ye like, so long as ye only look.", fx = { align = { light = 1 } } },
        { text = "If there's power down there, it's wasted on the dust.", next = "BACK", reply = "And that's exactly why I asked ye to mind the difference, so keep your hands off my finds or ye'll be off my dig by sundown.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman, eh? I've no great love for the Horde, but out here the sand's the enemy of us all, so say yer piece and mind the dig." },
        { id = "h_default", key = true, text = "Prospector Ironboot, digger, surveyor and dwarf of Ironforge, out here in the worst sandbox ever made. Tanaris has more buried under the dunes than anyone knows, and I mean to find a bit of it." },
        { id = "h_c0", when = { race = "Dwarf" }, text = "A fellow dwarf! Then ye'll know why I'm here: Explorers' League blood doesn't let a dwarf sit still while there's ruins to dig." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Light fingers and soft boots, eh? I've worked digs with your sort before, and ye'd be surprised how often a locked tomb turns into an open one when there's a rogue on the payroll." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, out here in the sand! Tell me, can ye feel anything under these dunes? Old magic, buried cities, anything a poor prospector might dig up?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, at my dig? I'll not pretend I'm easy about it, but if ye can quiet the troll bones I keep turning up, ye're welcome to try." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out here in the dunes! Say a word over the dig for me, friend, because some of the troll bones I've turned up didn't seem to want turning." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, by my beard! There's not many of yer order this far south, and I'll sleep easier at the port knowing there's a hammer of the Light about." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior with a proper shield, eh? Good, because the Wastewanderers don't respect a surveyor's flag, but they do respect a dwarf with an axe standing next to it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Ye'll have seen the hyenas trailing ye in from the road, then; they've learned that diggers drop their lunch when they run." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid in Tanaris! Ye'll not find much growing out here, but I've found a root or two buried deep that'd interest ye." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock at my dig, is it? Keep yer wee beastie away from the tomb mouths, because I've a feelin' some o' what's buried out here would be glad o' the company." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I'd heard tell o' this, but I didnae believe it till now. Out here the sand's the enemy o' us all, so say yer piece an' mind the dig." },
      },
      again = { { id = "h_again", text = "Anything more, {g:lad|lass}? Ask away, but mind ye don't kick sand in the trench." }, { id = "h_again2", text = "Go on, ask; the sand'll wait." } },
      choices = {
        { text = "What lies buried under these dunes?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The earth here is dry and old. Your digs must have disturbed plenty.", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What's buried out here?", next = "b1_1" },
        { text = "Why Steamwheedle Port?", next = "b2_1" },
        { text = "Is it dangerous?", next = "b3_1" },
        { text = "Ironforge must miss its diggers.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Some folk would say these old ruins ought to be left alone.", next = "s_1" },
        { text = "Would the Explorers' League hire a rogue, Ironboot?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is there old magic buried in Tanaris?", next = "xmage", when = { class = "MAGE" } },
        { text = "Have your digs disturbed any restless dead, Ironboot?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What troubles you about the bones you dig up, Ironboot?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does the Explorers' League need from a paladin out here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you need someone to guard your digs, Ironboot?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What beasts plague your digs out here, Ironboot?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Something old sleeps under Tanaris, Ironboot. I can feel it.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The earth here is dry and old. What have your digs disturbed?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Old troll cities, for a start, the Sandfury's ancestors and Zul'Farrak's lot, and older things beneath them still. Some of the ruins out east are so old the trolls themselves don't know who built them." } },
      choices = { { text = "Older than the trolls?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Older than the trolls, aye, though finding out is the hard part, with the Wastewanderers, the Sandfury and the heat in the way. A dwarf can dig for a week and still find nothing but sand." } },
      choices = { { text = "What keeps you going?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "When ye do find something, friend, there's no feeling like it in all the world. That's what keeps me out here." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because the goblins sell everything a digger needs and don't ask questions about where ye're going. Cost me a fortune, mind, but nothing's free in Tanaris." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Everything here is dangerous, from the sand to the scorpids to the goblins' prices. Bring water, then bring more, and then shake out your bedroll, because I once woke up with a scorpid using my beard as a pillow." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and I miss Ironforge's ale, but a dwarf goes where the dirt's got somethin' buried in it. Tell King Magni I said hello, if ye ever see him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say it's grave robbing, digging up the old troll cities. I say knowledge buried is knowledge wasted." } },
      choices = { { text = "Learn from the past. Dig carefully.", next = "BACK", reply = "Aye, careful and slow, because a ruin rushed is a ruin ruined, and I've buried enough good shovels learning that lesson.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Let the dead keep their cities.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's a fine town if ye like your ale warm and your water rationed, friend. The goblins sell a dwarf his own sweat back by the cup." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls o' Zul'Farrak sit on a pile o' treasure older than Ironforge, an' they guard it like their lives depend on it, which they do. I've looked at those walls from a dune, an' that's as close as I care to get." } },
    magni = {
      { id = "tp_magni", text = "King Magni sent the Explorers' League to every corner o' the world, an' I came to this one on my own coin. I'd like to bring him somethin' from these sands that makes him laugh." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Ye've the look o' Ironforge about ye, so tell me, does the king still hold court in the Great Forge, or has the League got him readin' maps all day?" },
    },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's where the real secrets are, they say, under the Badlands, an' I'd be there now if I weren't so fond o' sand. Somebody's got to dig the desert, an' it may as well be me." } },
    silithid = { { id = "tp_silithid", text = "The bugs to the west in Silithus are diggin' too, friend, an' they're better at it than me. I'd not like to meet one coming the other way in a tunnel." } },
    _none = { { id = "tp_none", text = "Can't say I've dug that up yet, friend." } },
  },
}

P:NPC {
  key = "tooga", id = TODO_NPC("Tooga"), name = "Tooga",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He is lost, far from the friend waiting for him in Feralas.",
    third = "{name} met Tooga, a wandering turtle in the deserts of Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Tooga sees you! Tooga is lost, and very hot, and very slow." },
    { id = "g_back", when = { metBefore = true }, text = "Tooga remembers you. You are kind to Tooga." },
  },
  notice = {
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Tooga feels cold when you stand close, like the sun went behind a cloud, but there are no clouds. The scorpids went away too, so maybe Tooga likes it a little." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tooga is a turtle, and turtles carry their own wall on their backs, so Tooga hides inside it and waits. But the scorpids are patient too, and Tooga has been hiding a long time, and Torta is still very far away." } },
      choices = {
        { text = "Patience wins. I'll walk at your pace and guard you, Tooga.", next = "BACK", reply = "Tooga thinks you are very kind, and also very patient, because most people walk much too fast for Tooga and then they forget about Tooga.", fx = { align = { order = 1 } } },
        { text = "Better to charge the scorpids than wait for them to come.", next = "BACK", reply = "Tooga does not charge, because Tooga is a turtle, but you can charge if you like and Tooga will be right behind you, a long way behind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Tooga would like a prayer for shade, and one for water, and one more that Torta is not too cross that Tooga wandered off. The sand is very big and Tooga is very slow, so the prayers had better be strong ones." } },
      choices = {
        { text = "Keep to the road this time, Tooga, and don't stray from it.", next = "BACK", reply = "Tooga will try very hard, but the road is long and there are interesting rocks beside it, so Tooga cannot make any promises.", fx = { align = { order = 1 } } },
        { text = "Wander as you please, Tooga. The best paths are never on a map.", next = "BACK", reply = "That is what Tooga thinks too, but Torta says that is how Tooga got lost, so maybe do not tell Torta you said it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The sand is hot on top and cold underneath, and it whispers when the wind runs over it. Tooga does not understand the whispering, but Tooga thinks the desert is lonely, like Tooga." } },
      choices = {
        { text = "Every land has its spirits, and every spirit keeps its place.", next = "BACK", reply = "Then maybe the lonely spirit belongs here, and Tooga belongs with Torta, and everyone will be where they should be.", fx = { align = { order = 1 } } },
        { text = "Spirits wander where they like, Tooga, just like you.", next = "BACK", reply = "Tooga likes that, because then the spirits and Tooga are the same, and maybe the desert is not so lonely if someone wanders with it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because Torta is Tooga's, and Tooga is Torta's, and that is how it has been for a very long time. Tooga only went for a little walk, and then the little walk became a big walk, and now Torta is far away and probably cross." } },
      choices = {
        { text = "Then I'll carry you to her myself if I must.", next = "BACK", reply = "Tooga is very heavy, and Tooga is very grateful, and Torta will be so surprised to see Tooga arrive on somebody's back.", fx = { align = { light = 1 } } },
        { text = "You wandered off, Tooga. You can walk yourself home.", next = "BACK", reply = "That is true, and it is a little bit sad, but Tooga will walk, and Tooga will think about wandering less on the way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The scorpids, because they are fast, and Tooga is not fast. Tooga hides in Tooga's shell, and the scorpids tap on it, tap tap tap, and Tooga waits until they get bored, which is a long time." } },
      choices = {
        { text = "I'll keep the scorpids off you all the way to Torta.", next = "BACK", reply = "Then Tooga will not have to hide in Tooga's shell, and that would be nice, because it is very hot in there.", fx = { align = { light = 1 } } },
        { text = "Hide in your shell, Tooga. That's what it's for.", next = "BACK", reply = "Tooga knows, and Tooga is very good at it, but it is lonely in a shell when the scorpids will not stop tapping.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tooga asked a goblin once, and he wanted a lot of gold, and Tooga does not have gold, only a shell. Also Tooga thinks Torta would want Tooga to walk, so that Tooga learns not to wander off so much." } },
      choices = {
        { text = "Torta's right. Walking home will teach you something.", next = "BACK", reply = "Tooga thinks so too, though Tooga's feet do not agree, and Tooga's feet have been walking for a very long time.", fx = { align = { order = 1 } } },
        { text = "Forget the lesson. I'd rush you home if I could.", next = "BACK", reply = "That is a nice thing to say, and Tooga will not tell Torta you said it, because Torta likes lessons very much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little, because it looks at Tooga like the scorpids do. But you came to help Tooga, and Tooga thinks a person who helps a turtle cannot be all bad, even if their friend has horns." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Yes, because it is looking at Tooga right now, the way the scorpids do before they pinch. But you came to help Tooga, so Tooga will walk on the other side of you, and you will tell your {pet} that turtles are not for eating." },
      },
      choices = {
        { text = "He won't harm you, Tooga. I'll see to it.", next = "BACK", reply = "Tooga believes you, and Tooga will try not to look at it, and maybe it will not look at Tooga either.", fx = { align = { light = 1 } } },
        { text = "He goes where I send him. Stay close, and he won't be sent.", next = "BACK", reply = "Tooga will stay very close, then, and Tooga will hope the horned one stays very far away on the other side of you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray that Torta is not too cross, and that the sun is not too hot, and that the scorpids are asleep. That is three prayers, so maybe pray slowly, like Tooga walks, so none of them fall out." } },
      choices = {
        { text = "I'll pray for all three, and walk beside you too.", next = "BACK", reply = "Tooga thanks you, and Tooga will walk very slowly so you have time to finish them all properly.", fx = { align = { light = 1 } } },
        { text = "Prayers won't move your legs, Tooga. Let's just go.", next = "BACK", reply = "Tooga's legs are moving, they are only moving slowly, but Tooga will go now, because you sound like Torta when you say that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You smell like rain and stone, and Tooga likes that smell. Can you ask the sky to make a little water for a lost turtle?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You smell quiet and smoky, like a candle in a tent. Will you say a prayer that Tooga finds his way home to Torta?" },
        { id = "h_default", key = true, text = "Tooga is Tooga, and Tooga is very far from home. Torta is waiting for Tooga in Feralas, but the desert is big and Tooga's legs are small." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Tooga's Quest") }, text = "You will take Tooga to Torta? Tooga is slow, so please be patient, and please do not let the scorpids eat Tooga." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Tooga sees the big shield and the big sword. Tooga thinks you could keep the scorpids away, if you walk slowly, very slowly, like Tooga." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Tooga sees a shiny shell, like Tooga's, but on the outside of a person! Tooga thinks you must be very safe in there." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Tooga did not hear you, and Tooga always hears things, very slowly. You are a quiet one, and Tooga likes quiet ones." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Tooga smells something sparkly on you! Can you make Tooga go fast, very fast, all the way to Feralas?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Tooga sees your little friend with the horns, and Tooga is going to stay in Tooga's shell for a while, if that is all right with you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "You smell like candles and quiet singing. Tooga thinks you must be a kind person, and Tooga hopes you are, because Tooga needs a kind person." },
      },
      again = { { id = "h_again", text = "What else? Tooga listens slowly." }, { id = "h_again2", text = "Tooga is here." } },
      choices = {
        { text = "What do the sands feel like to an old turtle, Tooga?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You look a long way from home, little turtle.", next = "b1_1" },
        { text = "Who is Torta?", next = "b2_1" },
        { text = "Are you all right?", next = "b3_1" },
        { text = "I understand beasts. Let me guide you.", next = "x_1", when = { class = { "DRUID", "HUNTER" } } },
        { text = "Should you have stayed home?", next = "s_1" },
        { text = "What would you have me pray for, Tooga?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The desert must frighten a little turtle like you, Tooga.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do you want to go back to Torta so badly, Tooga?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What scares you most out here, Tooga?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why don't you ask someone to teleport you home, Tooga?", next = "xmage", when = { class = "MAGE" } },
        { text = "You're afraid of my demon, aren't you, Tooga?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would you have me pray for, Tooga?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Tooga went for a walk, and Tooga kept walking, and now Tooga is in the desert. Turtles are not good at deserts." } },
      choices = { { text = "Is Torta worried about you?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Tooga thinks Torta must be worried, because Torta always worries. Torta is Tooga's best friend." } },
      choices = { { text = "Will you stay home after this?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If Tooga can get home, Tooga will never walk so far again, probably." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Torta is a turtle too, and Torta is very wise and very old. Torta lives near the water in Feralas, and Tooga misses the water." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Tooga is hot and tired and thirsty, but Tooga is still Tooga. Turtles are tough on the outside." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "You speak to Tooga like a friend. Tooga likes that, and Tooga will follow you anywhere slow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Torta always tells Tooga to stay close, but Tooga likes to wander. Tooga does not know if that is good or bad." } },
      choices = { { text = "Wandering is how you see the world.", next = "BACK", reply = "Then Tooga has seen a great deal of the world, but Tooga would like to see Torta most of all right now.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Stay close to home next time, Tooga.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan is very loud and very hot, and the goblins there walk very fast. Tooga does not go to Gadgetzan." } },
    earth_mother = { { id = "tp_earth_mother", text = "Torta says the Earth Mother made the turtles first, because she wanted somebody to be slow and think about things. Tooga thinks this is true." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls in the big walls wanted to make soup of Tooga once, and Tooga walked away very slowly, and they forgot. Being slow is sometimes very good." } },
    silithid = { { id = "tp_silithid", text = "The bugs in the west are fast and they click, and Tooga does not like them at all. Tooga hides in his shell when he hears clicking." } },
    _none = { { id = "tp_none", text = "Tooga does not know, because Tooga is a turtle." } },
  },
}

P:NPC {
  key = "curgle", id = TODO_NPC("Curgle Cranklehop"), name = "Curgle Cranklehop",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He has a habit of finishing other people's sentences.",
    third = "{name} met Curgle Cranklehop, a gnome in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Oh! A visitor, how wonderful. Do you have a moment for some science? Five minutes, say, or seven if the scorpids cooperate?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've been thinking about what we discussed, and I've revised my estimate by at least twelve percent." },
  },
  notice = {
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Fascinating, is that a ward of demon skin? It shimmers at a frequency I can almost hear, and I'd love to take a scraping, purely for science, if it wouldn't take a bit of you along with it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, absolutely, armor is a diary nobody can lie in! Those long scratches are a hyena's claws, and those little pits by your collar, unless I'm very much mistaken, are where a scorpid's venom ate the finish off your steel." } },
      choices = {
        { text = "Scars are lessons, and a good warrior studies every one.", next = "BACK", reply = "Oh, splendid, a warrior with a scholar's eye, and if you ever want to compare notes on hyena claw spacing, I've three pages on the subject!", fx = { align = { order = 1 } } },
        { text = "I don't study my wounds. I just hit back harder.", next = "BACK", reply = "Well, it's a method, and the scratches suggest it works, but I'd still dearly love to measure those pits before you hit anything else.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I study everything, which is rather my problem, but faith out here interests me most, because the Sandfury pray to loa that answer them and the goblins pray to profit, which also seems to answer them. I'd dearly like to know whether the Light works the same in a desert as it does in a cathedral." } },
      choices = {
        { text = "The Light works the same everywhere. That's rather the point of it.", next = "BACK", reply = "Is it, now? Then I'll mark it down as a constant, and you've just saved me a very long and very sandy experiment.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Out here, the shadow answers faster than the Light ever has.", next = "BACK", reply = "Oh dear, that's not the result I was hoping for, but I'll write it down anyway, because a scholar can't pick his findings.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The scorpids, without question! They go weeks without water and never complain once, while everyone in Gadgetzan complains hourly, and if I could build a machine half as clever, I'd retire tomorrow." } },
      choices = {
        { text = "Some marvels should be admired, not copied.", next = "BACK", reply = "Admire it, yes, I do that daily, but I'm a gnome, and admiring something only makes me want to know how it works even more.", fx = { align = { light = 1 } } },
        { text = "Copy it, then. The scorpids won't miss the idea.", next = "BACK", reply = "My thoughts exactly, and I've already sketched the water bladders twice, though the second sketch caught fire for reasons I'm still investigating.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The basilisks certainly do; they bask on the stones at exactly the hour the rock holds the most heat, as if something told them. And the scorpids dig down a full hour before a sandstorm, which is either instinct or, well, a very good informant." } },
      choices = {
        { text = "Instinct, nothing more. Your notes will explain it in time.", next = "BACK", reply = "You may be right, and I do hope so, because instinct I can measure, while a mysterious informant would ruin all my tables.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They listen to the land. Scholars should try it sometime.", next = "BACK", reply = "I did try once, lying with my ear on a hot rock for an hour, and all I learned was that rocks in Tanaris are about two hundred degrees.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Natural magic, yes, that's what I said on Tuesday, and then on Wednesday I said the opposite! If you ever have to freeze one, do write down whether it turns to stone any slower, because nobody in Gadgetzan will take notes for me." } },
      choices = {
        { text = "Leave them in peace. Not every creature needs studying.", next = "BACK", reply = "A fair point, and very kindly meant, though I'll confess the basilisks have never once asked to be left in peace.", fx = { align = { light = 1 } } },
        { text = "Knowledge is worth a few frozen basilisks.", next = "BACK", reply = "Splendid, and do note the time to the second, because my last figures came from a goblin with a sundial and I don't trust them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Only to look, because a creature is a creature, and I study creatures! Though I'll admit the scorpids at least have the decency to be from this world, which your little friend clearly isn't, and that bothers the scholar in me terribly." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Only to look, because a creature is a creature, and I study creatures! Though yours is staring back at me with the most unsettling eyes, and I can't even begin to classify a thing that clearly isn't from this world, which bothers the scholar in me terribly." },
      },
      choices = {
        { text = "Study it all you like. Fear is for the ignorant.", next = "BACK", reply = "Oh, I intend to, though I'll study it from a slightly greater distance than usual, purely for methodological reasons, you understand.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're wise to keep your distance. It's hungry.", next = "BACK", reply = "I'd like to think it's wisdom, though between you and me it's mostly that the little fellow keeps looking at my notebook like it's lunch.", fx = { align = { light = 1 } } },
        { text = "Never mind my demon.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, much worse, and I've the notes to prove it! Thirst thins the blood, scorpid venom sits in it for days, and a fever out here climbs twice as fast as one in a cool stone city, so a healer in Tanaris never runs short of patients." } },
      choices = {
        { text = "Then I'll tend whoever falls ill, scholar or bandit alike.", next = "BACK", reply = "That's noble of you, and you'll be busy, so I'll lend you my fever charts, which are mostly accurate and only slightly scorched.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Wastewanderers can look after their own sick.", next = "BACK", reply = "They try, poor things, but they've no herbs and no notes, and I'd wager half of what they call curses are simply bad water.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only on myself, and only a very little, and I couldn't feel my left foot for a week. The goblins laughed, but I learned that the stone begins at the skin and works inward, which is more than anyone in Gadgetzan knew before." } },
      choices = {
        { text = "Science is worth a numb foot. Keep at it.", next = "BACK", reply = "Thank you, I intend to, and I've already found a volunteer for the other foot, which is my right foot, so the volunteer is also me.", fx = { align = { order = -1 } } },
        { text = "Be careful, Curgle. No discovery is worth your life.", next = "BACK", reply = "I'll take that kindly, and I'll be careful, though I can't promise I'll be sensible, which isn't quite the same thing at all.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would dearly love a basilisk egg, still whole, from the nests south of town. The Bruisers took the last one off me at the gate, so this time I'd prefer nobody knew I had it." } },
      choices = {
        { text = "No eggs in town, Curgle. The Bruisers have a point.", next = "BACK", reply = "Oh, very well, though I'll argue the Bruisers would feel differently once they understood the scientific value of it.", fx = { align = { order = 1 } } },
        { text = "I'll get you an egg, and the Bruisers will never know.", next = "BACK", reply = "You splendid, sneaky person, and I'll keep a padded box ready under my bench, well away from anything that might hatch it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I've read that your people speak with the elements, which is either superstition or the most fascinating field study in Kalimdor, and I'd dearly like to know which." },
        { id = "h_default", key = true, text = "Curgle Cranklehop, at your service! I study the creatures of Tanaris, from the scorpids to the basilisks, and I've catalogued forty-one distinct behaviors so far, because the desert hides more marvels than anyone in Gadgetzan gives it credit for." },
        { id = "h_c0", when = { race = "Gnome" }, text = "A fellow gnome! Oh, splendid, someone who'll understand when I talk about mechanical reproduction of insect behavior." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Oh, wonderful, you can settle an argument I've been having with myself: do basilisks really turn things to stone, or do they just stare very hard?" },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Oh, wonderful, you'll know whether the basilisks' stone gaze is an arcane effect or a natural one, because I've been arguing with myself about it for a fortnight." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Is that an imp? Oh, my, it is! May I look at it, from a distance, a safe and sensible distance, preferably with you between us?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest from the Horde! I've read that troll priests and Forsaken priests pray to entirely different things, and I'd give a week's notes to hear you explain the difference yourself." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, wonderful, because I've been wondering whether the Light works the same on a basilisk as on a person, and nobody in Gadgetzan will let me find out." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll forgive me for staring at the dents in your armor, but I can tell a scorpid's sting from a basilisk's bite at ten paces, and you've met both." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, wonderful, do you know I've always wondered whether a basilisk's gaze works on someone who's glowing with the Light? Purely academic, of course." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh, you startled me! You move like a sand scorpid, all quiet and sudden, and I mean that as a compliment, a scientific one." },
      },
      again = { { id = "h_again", text = "What else, friend? Ask quickly, before I lose my place in these notes, which I've numbered but not, unfortunately, in order." }, { id = "h_again2", text = "More questions? Wonderful!" } },
      choices = {
        { text = "Do the desert beasts feel the elements the way I do?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What creature in Tanaris fascinates you most, Curgle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do you study?", next = "b1_1" },
        { text = "Why live in Gadgetzan?", next = "b2_1" },
        { text = "The goblins must think you a strange sort of customer.", next = "b3_1" },
        { text = "My pet might interest you.", next = "x_1", when = { class = "HUNTER" } },
        { text = "Is studying beasts better than hunting them?", next = "s_1" },
        { text = "I'd guess the basilisk gaze is natural magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "You want to study my demon, Curgle? Be careful how close you lean.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The desert must make sickness worse, Curgle.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you study the way faith works, Curgle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can you really read a fight from my armor, Curgle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have you ever tested the basilisk gaze on a person, Curgle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you need anything collected quietly, Curgle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The way desert creatures survive with so little water, mostly. The scorpids, the hyenas and the basilisks have all adapted in ways I can only dream of reproducing." } },
      choices = { { text = "Reproducing them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Reproducing them in machines, someday, and I've filled four journals of notes towards it already. The goblins think I'm mad, but they also think anything not for sale is mad." } },
      choices = { { text = "Can I help somehow?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you see any unusual creatures out there, tell me about them. Science needs eyes, and I only have two." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "It's the only town in Tanaris with walls, water and a decent workbench. The bruisers keep the peace and the goblins keep the shops open, and I can't ask for more." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "They think I'm a customer who never buys anything, which is fair. I spend all my money on notebooks." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, it might indeed, and I'd love to take notes while it does, though I promise I won't poke it, at least not without asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say knowledge is wasted on beasts we'll only kill. I say we kill them because we don't understand them." } },
      choices = { { text = "Understanding beats killing every time.", next = "BACK", reply = "That's my view exactly, and every basilisk I've drawn instead of fought has taught me more than any skull on a pike.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Beasts are for hunting. Study books instead.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan is a marvel, really, a town built on nothing but sand and goblin stubbornness, and the water tower, of course, the water tower is everything. I'd love to see its schematics, if Chief Engineer Bilgewhizzle would ever let me." } },
    gnomeregan = {
      { id = "tp_gnomeregan", text = "Gnomeregan was home, and the trogg, the troggs, the radiation, we all know how that ended, and I still dream about the workshop I left. Somebody had my second-best wrench on loan, too." },
      { id = "tp_gnomeregan2", when = { race = "Gnome" }, text = "You'd remember it too, then, the halls and the lights, before Thermaplugg let the troggs in. Do you still dream about it? I do, nearly every night." },
    },
    bronze_dragonflight = { { id = "tp_bronze_dragonflight", text = "There's talk of a great bronze dragon somewhere in these dunes, guarding a cave where time itself is tangled, and I'd give anything to measure it. Imagine the readings, just imagine them!" } },
    zul_farrak = { { id = "tp_zul_farrak", text = "Zul'Farrak's architecture is remarkable, older than it looks and stranger than it ought to be, and the trolls inside are rather less remarkable and far more dangerous. I study it through a spyglass." } },
    silithid = { { id = "tp_silithid", text = "The silithid build hives like an engineer builds a tower, layer on layer, and it fascinates me and horrifies me in equal measure. Mostly horrifies, if I'm honest about it." } },
    _none = { { id = "tp_none", text = "I don't know, but I'd love to find out!" } },
  },
}

P:NPC {
  key = "jabbey", id = TODO_NPC("Jabbey"), name = "Jabbey",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "He swears each of his trinkets is a bargain.",
    third = "{name} met Jabbey, a vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Step right up, step right up, pal! Jabbey's got what you need, even if you don't know you need it, and Jabbey's got it at a price you'll only regret a little." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer, back again! What can Jabbey sell you today, buddy, and how much have you got?" },
  },
  notice = {
    { id = "n_lock_stones", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Jabbey knows that green glow in your bag, because a warlock once offered Jabbey a healthstone for a sack of flour. Jabbey said no, because Jabbey doesn't trade in anything made of somebody's life, not even at a good markup." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bandages, mostly, because the Wastewanderers fight dirty and the Bruisers won't patch you up for free. And a spare waterskin, pal, since a warrior who runs dry halfway to Noonshade Ruins ends up a skeleton the hyenas argue over, and skeletons don't buy anything." } },
      choices = {
        { text = "I fight fair, even against bandits who don't.", next = "BACK", reply = "That's noble, pal, and Jabbey respects it, but noble don't stop a knife in the back, so take two bandages instead of one.", fx = { align = { honor = 1 } } },
        { text = "Against bandits, I'll fight every bit as dirty as they do.", next = "BACK", reply = "Now you're speakin' Tanaris, friend, and Jabbey's got caltrops, sand in a sack and a lovely little blade for the boot, all on the shelf.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Arrows, shot, and a salve for blistered paws, which out here sells faster than the arrows and at a better margin. By noon the sand gets so hot I've watched a hunter's wolf hop from foot to foot all the way down the main street." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Arrows, shot, and a salve for blistered paws. {pet} looks like it's been walking on that sand all day, friend, and Jabbey would say it's earned a tin of the good salve." },
      },
      choices = {
        { text = "A beast at your side deserves the care you'd give yourself.", next = "BACK", reply = "A hunter after Jabbey's own heart, and the salve's right here, so your wolf can quit dancin' down the main street like a fool.", fx = { align = { light = 1 } } },
        { text = "A beast toughens up or it doesn't. Coddling helps nobody.", next = "BACK", reply = "Your beast, your call, pal, but Jabbey's watched those tough ones limp home, and then their owners come back for salve at double the panic.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Jabbey buys it from a fellow who swears a priest blessed it, and Jabbey has never had a complaint, so who is to say it isn't holy? Out here, friend, folk believe in whatever keeps the sand out of their wounds, and they pay for it gladly." } },
      choices = {
        { text = "Faith deserves better than a counterfeit, Jabbey. Stop selling it.", next = "BACK", reply = "Stop sellin' it? Friend, the fellow swore, and Jabbey has the receipt, so if it isn't holy, the fraud is his and the margin is Jabbey's.", fx = { align = { light = 1 } } },
        { text = "If it comforts them, sell all you can. I'll take a bottle.", next = "BACK", reply = "A customer with sense, and Jabbey likes that very much, so one bottle of genuine blessed water, wrapped and no refunds.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Depends who's talking. The caravan folk swear the dust devils out past the Noonshade Ruins follow wagons on purpose, and one fellow told me the wind stole his hat and gave it back a mile on, though I sold him a new one anyway, just in case, full price." } },
      choices = {
        { text = "The wind keeps its own accounts. Respect it.", next = "BACK", reply = "Jabbey respects it too, especially when it sells hats, so you go right on respectin' and Jabbey will go on stockin'.", fx = { align = { order = 1 } } },
        { text = "Dust devils are just hot air, like most travellers' tales.", next = "BACK", reply = "Maybe so, pal, but hot air sells hats, and hats sell waterskins, so Jabbey won't be the one tellin' the travellers different.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Jabbey cares that the coin is real and the Bruisers don't see the blinding happen inside the walls. What happens in the dunes is between you and whoever you're blinding, and Jabbey sleeps very well, thank you." } },
      choices = {
        { text = "A merchant should care where his goods end up.", next = "BACK", reply = "Jabbey cares plenty, friend, about where the coin ends up, and that's right here in Jabbey's pocket where it belongs.", fx = { align = { order = 1 } } },
        { text = "Good. I don't want my business known either.", next = "BACK", reply = "Then we understand each other perfectly, pal, and Jabbey never saw you, never sold to you and never heard your name.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Booty Bay, mostly, and Ratchet when the boats are kind and the pirates are busy. Jabbey doesn't ask where Booty Bay gets them, and Booty Bay doesn't ask where Jabbey sends them, and that's how reagents get across the sea in one piece and at a profit." } },
      choices = {
        { text = "Good trade keeps the world turning, whoever's on the other end.", next = "BACK", reply = "That's what Jabbey keeps sayin', and nobody listens till they need a reagent fast and Jabbey's the only stall with one.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know who you're buying from.", next = "BACK", reply = "Knowing costs extra, friend, and Jabbey keeps his costs low, so the price stays friendly and the questions stay unasked.", fx = { align = { order = 1 } } },
        { text = "That'll do for reagents.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Jabbey thinks you're a customer like any other, so long as you buy what's on the shelf. What you do with your own shadows is your business, but Jabbey would rather not have them in his stall." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Jabbey thinks you're a customer like any other, so long as you buy what's on the shelf. But your servant is sniffing all along Jabbey's shelf right now, so Jabbey would ask it to wait outside, where the sand doesn't mind the smell." },
      },
      choices = {
        { text = "Every merchant has his price. Yours is only higher.", next = "BACK", reply = "Higher's a nice word for it, pal, and Jabbey'll take it as a compliment, but the shadows still stay outside the stall.", fx = { align = { honor = -1 } } },
        { text = "A man with a line is worth respecting.", next = "BACK", reply = "Jabbey thanks you, friend, and Jabbey's line comes with a price tag like everything else here, but it's one he won't sell.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Jabbey.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ask for 'em? They buy charms for 'em, friend, because a charm comes with a receipt. Most of this town believes in the Cartel first and luck second, though I'll tell you, when the Wastewanderers raid, everybody suddenly remembers a god or two." } },
      choices = {
        { text = "Selling charms to frightened folk is a cheap trick, Jabbey.", next = "BACK", reply = "Cheap? Pal, Jabbey's charms are priced very reasonably, and a frightened fellow with a charm sleeps better than a brave one without.", fx = { align = { honor = 1 } } },
        { text = "If a charm calms them, sell it. Comfort is comfort.", next = "BACK", reply = "Now that's the kind of thinking that keeps a stall open, friend, and if you want one yourself, the blue ones are on special.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Here and there, mostly there, which is to say I don't ask the pickers too many questions, pal. Some of it comes up from Un'Goro in crates, and anything that still bites when it arrives goes in the back at a premium." } },
      choices = {
        { text = "Trade is trade. Don't ask, don't worry.", next = "BACK", reply = "Jabbey likes you already, pal, and you go ahead and buy whatever's bitin' in the back, because it's fresher than it looks.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Ask questions. Stolen herbs are still stolen.", next = "BACK", reply = "Stolen's a strong word, friend, and Jabbey prefers liberated, and besides, herbs don't belong to anybody till somebody sells them.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nothing! Well, nothing much, because Jabbey can't always say where a thing came from, only where it went next. A crate comes in from Steamwheedle Port and Jabbey doesn't ask, because asking makes the crates stop coming." } },
      choices = {
        { text = "You should ask. Stolen goods hurt somebody.", next = "BACK", reply = "Ask, and the crates stop, pal, and when the crates stop, so does Jabbey, and then who's sellin' you bandages in the middle of nowhere?", fx = { align = { order = 1 } } },
        { text = "A merchant can't question every crate, Jabbey.", next = "BACK", reply = "Finally somebody understands the trade, friend, and if Jabbey questioned every crate, he'd have nothin' on the shelf but questions.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you'll be wanting ankhs, pal, and I keep a few under the counter for your sort, priced like everything else here: fair, more or less, mostly more." },
        { id = "h_default", key = true, text = "Name's Jabbey, pal, and I sell a little of everything: reagents, odds, ends and the occasional thing I can't explain. Gadgetzan's the crossroads of Tanaris, and everything passes through my stall sooner or later, and pays a toll on the way." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Flash powder and blinding powder, friend, and Jabbey asks no questions about who you plan to blind. That's what makes Jabbey a reliable vendor, and reliability costs a little extra." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Jabbey keeps runes and feathers for your kind, and arcane powder when the boats bring it, because mages always run out right before they need it most, and that's when Jabbey's prices are best, for Jabbey." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Jabbey doesn't sell soul shards, friend, so don't ask. Jabbey sells a lot of strange things, but even Jabbey has a line, and that line is anything that used to be somebody." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Jabbey has candles, holy water of mostly reliable origin, and a very nice skull that a Forsaken gentleman almost bought last month." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? I've got holy water, or something that was holy water before it crossed the sea, and candles, and one very old prayer book I can't read a word of." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and a thirsty one by the look of you! Jabbey's got whetstones, bandages and a tonic that'll put the fight back in your arms, all at a very reasonable markup." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Now, Jabbey doesn't sell meat, buddy, but if your beast's hungry I know a cook named Dirge Quikcleave who asks very few questions about where his comes from, and he gives Jabbey a little something for the referral." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've got seeds, herbs, and something in a jar I'm told used to be a cactus, so you'll find something here, I promise." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at Jabbey's stall! Jabbey sells honest goods to honest folk, mostly, and Jabbey would like you to remember the honest part." },
      },
      again = { { id = "h_again", text = "What else? Jabbey's always open." }, { id = "h_again2", text = "More? Jabbey loves questions that end in sales." } },
      choices = {
        { text = "Where do you get your herbs, Jabbey?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Travellers must tell strange tales of the desert spirits.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What sells best here?", next = "b1_1" },
        { text = "Where do you get your goods?", next = "b2_1" },
        { text = "Your prices seem a touch steep, Jabbey.", next = "s_1" },
        { text = "You really don't care what your powder gets used for?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Where do you get your reagents out here?", next = "xmage", when = { class = "MAGE" } },
        { text = "You think less of me for my craft, Jabbey?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do folks in Gadgetzan ever ask for prayers, Jabbey?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Holy water of mostly reliable origin, Jabbey?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does a warrior actually need from your stall, Jabbey?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you sell anything for a hunter, Jabbey?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What's not honest about your goods, Jabbey?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Water, friend, by a long way, then cooling potions and anything that keeps the scorpids off you. After that, it's whatever the adventurers are hunting this week, and Jabbey stocks it the week before." } },
      choices = { { text = "What are adventurers hunting this week?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Last month it was snake bits, this month it's turtle shells, pal. Next month, who knows, but Jabbey'll have it, and Jabbey'll have it first." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Here and there, from traders and travelers and the port. Jabbey doesn't ask, and Jabbey doesn't tell, pal, which is how business works in Gadgetzan." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Jabbey charges what the market bears, friend, and the market is very strong in the desert. If you call that overcharging, take it up with the market." } },
      choices = { { text = "Fair prices build loyal customers.", next = "BACK", reply = "Loyal customers, pal, are the ones who come back because there's nowhere else to go, and in Tanaris that's everybody.", fx = { affinity = 1, align = { honor = 1 } } }, { text = "A goblin should get what he can.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the best town in Kalimdor for a goblin with a stall, pal, because nobody's got anywhere else to shop for a hundred miles. Jabbey likes those numbers." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "Folks come out of Zul'Farrak with troll trinkets, pal, and Jabbey buys them cheap and sells them dear. Jabbey never goes in himself, because Jabbey can count." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got better shopping, pal, but worse prices, and Jabbey's prices are the best in Tanaris. Ask anybody, but ask Jabbey first." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel lets Jabbey keep his stall because Jabbey pays his dues on time, every time. That's the whole secret to staying in business here, pal." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells trinkets, and Jabbey sells trinkets, and Jabbey's are cheaper. Jabbey would like that written down somewhere." } },
    _none = { { id = "tp_none", text = "Jabbey doesn't sell that, pal, but Jabbey might know a guy, and the guy gives Jabbey a cut." } },
  },
}

P:NPC {
  key = "vizzklick", id = TODO_NPC("Vizzklick"), name = "Vizzklick",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "She thinks most adventurers dress like they lost to a sandstorm.",
    third = "{name} met Vizzklick, the cloth vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, welcome, dearie! Oh dear, look at the state of your robes, and look at the state of my shelves, which are full of exactly what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, dearie! And still in those clothes, I see, which is a lost sale every single day you wear them." },
  },
  notice = {
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Funny, the silk on my shelf just went dull and limp as you came in, pal, the same way it does when a sandstorm's coming. I'd rather you browsed from the doorway, if it's all the same to you." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everything under the plate is cloth, friend, and everything under the cloth is you, slowly roasting. Most of the Bruisers wear my linings under their mail now, on a Cartel contract, and not one of them has fainted on duty since." } },
      choices = {
        { text = "Discipline means caring for your kit, even the parts nobody sees.", next = "BACK", reply = "Exactly, dearie, and the parts nobody sees are the parts that keep you standing, so let me measure you while you're still upright.", fx = { align = { order = 1 } } },
        { text = "Comfort makes soldiers soft. I'll sweat and fight anyway.", next = "BACK", reply = "Brave words, sweetie, and you'll say them right up until you keel over in the sun, and then the Bruisers will carry you to my shop anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hides, now and then, though I'm a tailor and not a leatherworker, so mostly I get hunters asking me to mend what their own beasts chewed, at the chewed-sleeve rate. They all swear the beast is house-trained, and every sleeve tells me otherwise." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from my bolts, please, dearie, because I've lost a whole roll of silk to a curious nose before, twelve gold of it, and I don't sell it by the chewed yard." },
      },
      choices = {
        { text = "A beast should be trained to leave other folk's goods alone.", next = "BACK", reply = "At last, a sensible hunter, and if you ever teach the trick to the others, I'll be out of the chewed-sleeve business entirely, which I'd mourn a little.", fx = { align = { order = 1 } } },
        { text = "Beasts will be beasts. I let mine be what it is.", next = "BACK", reply = "And I'll let my rates be what they are, dearie, because beasts being beasts is my most dependable source of income.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It matters to the people you're praying over, dearie, because nobody wants to be blessed by someone who looks like a sandstorm's leftovers. A clean robe tells folk you've come to help, and in Gadgetzan folk decide whether to trust you by your hem." } },
      choices = {
        { text = "A priest should look the part. People take comfort in it.", next = "BACK", reply = "Exactly what I've been saying for years, sweetie, and a bit of starch never hurt anyone's credibility either.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The faithful won't care about my hem. Only the work matters.", next = "BACK", reply = "That's very noble, dearie, but the faithful are looking at your hem the whole time you're talking, whether they say so or not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It doesn't, which is how I stay in business. The sand gets into the weave and grinds it thin from the inside, so I double-stitch everything and charge full price for the second stitch." } },
      choices = {
        { text = "Double stitches and proper seams. Discipline beats the desert every time.", next = "BACK", reply = "A tailor after my own heart, sweetie, and I'll sell you a seam ripper so you can admire my work from the inside.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cloth that fights the wind loses. Wear less and move with it.", next = "BACK", reply = "Wear less, dearie? In this sun you'll be the colour of a boiled crab by noon, and then you'll come crawling back for a hood.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They're fine for Stormwind, or Undercity, or wherever you come from, but the desert sand gets into every seam and eats them. A mage who looks like a scarecrow doesn't get much respect at the auction house, dearie, and that's free advice, which is rare in this town." } },
      choices = {
        { text = "A mage's worth is in the spell, not the robe.", next = "BACK", reply = "The spell gets you through the door, sweetie, but the robe gets you a seat once you're inside, and I sell robes.", fx = { align = { order = -1 } } },
        { text = "Fine. Appearances matter, even out here.", next = "BACK", reply = "There's a smart one, and I've just the thing in deep blue that won't show the sand, priced for a mage who's going places.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's discuss something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It wears beautifully, and sells beautifully, and that's the trouble, because it hums when I hold it. I sell to warlocks the same as anyone, but I keep their cloth at the back of the shelf where it can't touch my good silk." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It wears beautifully, and sells beautifully, and that's the trouble, because it hums when I hold it. Now it's humming louder with your demon standing beside it, so I'll keep that cloth at the back of the shelf and you'll keep that thing at the front of the stall." },
      },
      choices = {
        { text = "Then your squeamishness costs you good customers.", next = "BACK", reply = "Good customers, dearie, are the ones whose cloth doesn't hum, and I'll lose a few sales before I lose a night's sleep.", fx = { align = { light = -1 } } },
        { text = "Sensible. Fel taints whatever it touches, even me.", next = "BACK", reply = "Thank you, sweetie, someone understands, and I'll be keeping a pair of tongs by that shelf from now on.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everybody cares, friend, whether they admit it or not, and a clean white robe in Gadgetzan says you've got water to spare for washing. Folks here trust a healer who looks like they've walked through the desert, though, so maybe dust is the right look for you after all." } },
      choices = {
        { text = "A priest's robe should be plain and kept clean. That's discipline.", next = "BACK", reply = "Plain and clean, I can do, dearie, and plain and clean is what I'll charge you for, which is less than fancy and dirty.", fx = { align = { order = 1 } } },
        { text = "The Light doesn't care about hems, Vizzklick, and neither do I.", next = "BACK", reply = "Then you're the only one in town who doesn't, sweetie, but your secret's safe with me, and so is your hem until you ruin it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I've asked three druids that question and got three different answers, and none of them made sense to a tailor. My theory is the robe goes somewhere nice and waits for you, folded and pressed, I hope, dearie." } },
      choices = {
        { text = "Study it, Vizzklick. Magic clothing could make you rich.", next = "BACK", reply = "Rich, sweetie? I'd settle for knowing where my stitches go, because I'll not sell a robe that wanders off with my reputation.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some mysteries are sacred. A tailor shouldn't pry.", next = "BACK", reply = "Pry is such a strong word, dearie, I prefer curious, but you're right that some questions get a tailor turned into a frog.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It can, dearie, because it's what's under the plate that matters in this heat. A good linen padding, washed every few days, and you'll stop smelling like a forge, which the Road Warrior would appreciate, and I'll sell you three so you can rotate." } },
      choices = {
        { text = "Comfort keeps a fighter going. I'll take your advice.", next = "BACK", reply = "Now that's a customer who listens, and listening customers come back, so three linings it is, and wash them in the cool of the evening.", fx = { align = { order = 1 } } },
        { text = "Plate is meant to be endured, not made comfortable.", next = "BACK", reply = "Endured, sweetie? You'll endure it right into a heat faint, and then the Road Warrior will have to drag you somewhere nobody wants to smell.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cloth is cloth, dearie, and coin is coin, and I don't ask what it's going to be used for. Dark wool for a cloak keeps the night cold out, and if it also keeps the Bruisers from seeing someone, that's hardly my stitching's fault." } },
      choices = {
        { text = "You should ask. Somebody pays for what's done in the dark.", next = "BACK", reply = "Somebody always pays, dearie, and so long as it's me getting paid, I'll leave the asking to the Bruisers.", fx = { align = { order = 1 } } },
        { text = "Good. A tailor sells cloth, not judgment.", next = "BACK", reply = "Oh, I like you, sweetie, and you'll find my dark wool is very reasonably priced for a customer who keeps quiet about where he bought it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, with totems clattering off your belt and a hem the wind's been chewing on. I'd ask the spirits for better tailoring, dearie, or ask me, since I'm cheaper and I'm right here." },
        { id = "h_default", key = true, text = "Vizzklick, cloth and thread and the finest tailoring supplies in Tanaris, priced for the desert! Desert living is hard on clothes, and I keep half of Gadgetzan dressed, whether they like it or not, and they always pay." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, dearie, and in robes that have seen far too much sand! Mageweave holds up better in this heat, if you'd let me show you some proper cloth, and it's practically an investment." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Felcloth, is that? No, don't tell me where it came from, dearie, because I've heard the stories about the satyrs, and I'd sooner not know." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and in robes that have seen more sand than soap, dearie. Whether you pray to the Light or to something gloomier, I can at least make you look the part." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, in robes cut for cool stone halls! Your order makes a fine garment, dearie, but its tailors never met a sandstorm, and it shows on every hem you're wearing." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and wearing a padded gambeson under all that in Tanaris, by the look of the sweat! I could line that armor with something that breathes, pal, and you'd stop cooking inside it for a very reasonable fee." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I can always tell, dearie, because you're the only folk who walk in with fur on your sleeves that isn't part of the design, and I charge to take it off." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You spend your days switching between fur and robes, so I'm guessing you're hard on clothes, and I can help with that." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, dearie, and baking inside all that plate! Let me line it with something cool, or at least something that doesn't chafe, because I can see you walking stiff from here." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, dearie, in leathers that creak in this heat! Let me show you some dark cloth that doesn't make a sound, because you'll hear your own sleeves before you hear the guards." },
      },
      again = { { id = "h_again", text = "What else, dearie?" }, { id = "h_again2", text = "Anything more? I've got a needle waiting." } },
      choices = {
        { text = "What happens to your robes when we take bear form?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The wind here never rests. Cloth can't last long against it.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's good cloth for the desert?", next = "b1_1" },
        { text = "Do you sew yourself?", next = "b2_1" },
        { text = "Do clothes really matter out here?", next = "s_1" },
        { text = "My robes are fine, Vizzklick.", next = "xmage", when = { class = "MAGE" } },
        { text = "Felcloth wears as well as any cloth. Better, on the right shoulders.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Should a priest care how the robes look?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does it matter what a priest wears, Vizzklick?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Cloth can't do much for someone in plate, Vizzklick.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters bring you anything useful, Vizzklick?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can cloth really help someone in plate, Vizzklick?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you really sell to anyone who asks, Vizzklick?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Light, tight and pale, dearie, unless you enjoy roasting in your own boots. The sand gets into everything, so a good weave keeps it out, and a good weave costs a little more." } },
      choices = { { text = "What about silk?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Silk's lovely, but it tears on the rocks, and torn silk is gold down a hole, so most folks out here settle for mageweave and pray." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Of course! Selling cloth without knowing how to sew is like selling water without knowing how to drink, dearie, and nobody'd pay for that." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a fighter shouldn't care about looks. I say a well-dressed fighter frightens enemies twice as much and gets better prices at the auction house." } },
      choices = { { text = "Looking sharp is half the battle.", next = "BACK", reply = "Half the battle and all of the bargaining, sweetie, and I'll make sure you look sharp enough to win both.", fx = { affinity = 1, align = { order = 1 } } }, { text = "A blade matters more than a hem.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the dustiest place a tailor can work, dearie, and every bolt I sell is gritty by the end of the week. The customers still pay, though, because there's nobody else." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's tailors sew sails more than silks, dearie, and it shows in what they wear. I'd like to dress that town properly someday." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak wear wraps that would fall apart in a stiff breeze, dearie, but I'll admit the colors are very fine. I'd love to know their dyes." } },
    _none = { { id = "tp_none", text = "Not my line of work, dearie, but I'll keep an ear open, and ears cost nothing." } },
  },
}

---------------------------------------------------------------------------
-- Quadcopter (D.E.L.T.A): small flying drones that lead travellers to the Half-Buried Mech on
-- Land's End Beach ("Beach Bot"). Mechanical barks only.
---------------------------------------------------------------------------
P:NPC {
  key = "tan_quadcopter", id = TODO_NPC("Quadcopter"), name = "Quadcopter", title = "D.E.L.T.A",
  role = "citizen", tier = "service", temper = { "precise" }, values = { "duty" },
  impression = {
    first = "A buzzing little drone over the dunes that keeps trying to lead people south to Land's End Beach.",
    third = "{name} met a D.E.L.T.A quadcopter, a flying drone that guides travellers to a buried mech on Land's End Beach.",
  },
  greetings = {
    { id = "g_default", text = "*The quadcopter's four rotors whine as it drops to eye level. A lens whirs, focuses on you, and blinks green.* Beep. Organic located. Please follow." },
    { id = "g_quest", when = { questDone = TODO_QUEST("Beach Bot") }, text = "*The quadcopter blinks its lens twice, chirps a happy little tone, and spins once in the air.* Unit recovered. Thank you, organic." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "*It points itself toward the shore and wobbles there, insisting.* Distress beacon detected at Land's End Beach. Assistance required. Please follow." },
      },
      again = { { id = "a_again", text = "*Whirr.* Please follow. Please follow." },
      },
      choices = {
        { text = "What's at Land's End Beach?", next = "BACK", reply = "*Click, click.* Damaged unit, partially buried in sand. Recovery requires hands. You have hands." },
        { text = "Who sent you?", next = "xsent" },
        { text = "What is D.E.L.T.A?", next = "xdelta" },
        { text = "You're very persistent for a machine.", next = "xpersist" },
        { text = "Lead the way, little machine.", next = "END", reply = "*The rotors rise to a happy pitch, and it darts off toward the sea.* Affirmative. Follow." },
      },
    },
    xsent = {
      lines = { { id = "xxsent_d", text = "*The lens blinks orange, then green.* Origin unit offline. Last command received: locate organic, guide to beach, recover unit. Command loop active." } },
      choices = {
        { text = "How long have you been looking?", next = "xlong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlong = {
      lines = { { id = "xxlong_d", text = "*Click, whirr.* Many days. Many organics. Most organics run. You did not run. Probability of success increased." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdelta = {
      lines = { { id = "xxdelta_d", text = "*It hesitates, rotors dipping.* Designation incomplete in memory. Sand damage. Data recovered: D, E, L, T, A. Meaning lost. Unit still functions." } },
      choices = {
        { text = "Should broken machines keep working?", next = "xbroken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbroken = {
      lines = { { id = "xxbroken_d", text = "*The lens tilts, as if waiting for your answer.* Query received. Unit lacks judgment protocols. Organic decides." } },
      choices = {
        { text = "Yes. Doing your duty matters, even when you're broken.", next = "BACK", reply = "*A cheerful chirp.* Affirmative. Duty continues. Please follow.", fx = { align = { order = 1 } } },
        { text = "No. You should rest, little machine.", next = "BACK", reply = "*The rotors slow, then pick up again.* Rest not in protocol. Please follow anyway.", fx = { align = { order = -1 } } },
      },
    },
    xpersist = {
      lines = { { id = "xxpersist_d", text = "*Beep-beep.* Persistence is primary function. Persistence is also only function remaining after the crash." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
