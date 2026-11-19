-- The Badlands between the towns: Martek's camp and Rigglefuzz's cookfire. Voice: bibles/badlands_camps.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "martek", id = TODO_NPC("Martek the Exiled"), name = "Martek the Exiled",
  bible = "bibles/badlands_camps.md", role = "blacksmith", tier = "quest",
  communities = { "badlands" }, temper = { "gruff" }, values = { "proud" },
  notices = { "craft" },

  impression = {
    first = "Nobody living knows more about working metal than he does.",
    third = "{name} met Martek the Exiled, a dwarven smith living in exile in the Badlands.",
  },

  greetings = {
    { id = "g_camp", text = "Ye found my camp, which means ye were either lookin' or lost. Which is it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit, then, but don't touch the anvil." },
  },

  start = "hello",
  nodes = {
    dw_kin = {
      narr = "He keeps hammering for a long moment before he answers.",
      lines = {
        { id = "dw_kin_default", text = "A fellow dwarf is just who I'd not talk to about Ironforge. Ye'll go home an' tell it in the Stonefire Tavern, and by supper half the Mystic Ward will know Martek's still alive and still wrong." },
      },
      choices = {
        { text = "I'll keep your secrets. Kin owes kin that much.", next = "dw_kin2", fx = { affinity = 1 } },
        { text = "Then I'll leave it. Something else.", next = "BACK" },
      },
    },
    dw_kin2 = {
      lines = {
        { id = "dw_kin2_default", text = "Kin, is it? Then here's a crumb. I said the King's digging under Uldaman would wake things better left asleep, and I said it loud in front of the wrong thane, and now the troggs pour out of the earth and nobody's sorry they sent me away." },
      },
      choices = {
        { text = "You were right. Ironforge should have listened.", next = "BACK", reply = "Aye, and being right is cold comfort out here. Still, it's good to hear it from a beard that isn't my own.", fx = { align = { order = -1 } } },
        { text = "A dwarf doesn't shame his king in public, right or not.", next = "BACK", reply = "Spoken like a thane's nephew. Maybe ye're right, and maybe that's why I'm out here and ye're not.", fx = { align = { order = 1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The hammer's fine work, better than the arm that carries it, if ye'll forgive me. The Light an' I have an understandin', I work an' it watches, but I never thought it'd go watchin' from inside one o' the dead, an' I'll admit it makes me curious." } },
      choices = {
        { text = "The Light chose me. It can choose anyone.", next = "BACK", reply = "Anyone, aye, an' maybe that's the trouble wi' it. I'll leave the choosin' tae the Light an' the hammer tae the ones who swing it.", fx = { align = { light = 1 } } },
        { text = "The hammer matters more than whatever glows behind it.", next = "BACK", reply = "Ha! Ye sound like a smith, whatever ye are. A good hammer doesnae care what's watchin', only what it hits.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nothin' a month at my anvil wouldnae fix, but there's nae month tae spare out here. Keep it oiled against the dust an' strike wi' the edge, no' the flat, an' it'll serve ye till ye find a better smith than the one who made it." } },
      choices = {
        { text = "I'll mind the blade's care. A weapon's only as good as its upkeep.", next = "BACK", reply = "That's the first sensible thing a warrior's said tae me this month. Oil it nightly, an' it'll see ye home.", fx = { align = { order = 1 } } },
        { text = "A blade's for killing, not coddling. I'll swing it as I like.", next = "BACK", reply = "Swing it as ye like, then, an' bring it back tae me in pieces. I'll charge ye for the pieces.", fx = { align = { order = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Heavy iron, barbed an' hard-tempered, for a basilisk's hide turns a light point aside the way a stone shrugs off rain. I've made a few for hunters passin' through, an' none came back complainin', though one or two didnae come back at all." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Heavy iron, barbed an' hard-tempered, for a basilisk's hide turns a light point aside the way a stone shrugs off rain. An' keep {pet} back from the basilisks' eyes, for I'm told it's no' a good idea." },
      },
      choices = {
        { text = "I'll leave the basilisks be, unless they come for me.", next = "BACK", reply = "Wise, aye, for they've a stare that'll stop ye cold. Take a barbed head anyway, in case they come.", fx = { align = { light = 1 } } },
        { text = "Every basilisk out there is a hide waiting to be sold.", next = "BACK", reply = "Waitin' for a hunter wi' the right head on his arrows, aye. Mind ye dinnae meet its eyes, or ye'll be the one waitin'.", fx = { align = { light = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, but I listen all the same, and I hear when a vein's run thin or a seam's about to crack. The troggs dig without listening, and Uldaman's full of things better left buried, so ye might tell the spirits not everyone down here is so careless." } },
      choices = {
        { text = "Then work gently, Martek. The earth rewards those who listen.", next = "BACK", reply = "It does, an' ye're one o' the few who'd know it. I'll keep listenin', an' I'll keep it gentle.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Metal's metal. Take what the earth won't defend.", next = "BACK", reply = "Metal's metal, aye, until the seam collapses on yer head. The earth defends itself, friend, just slower than ye'd think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because the Badlands ask nothing of me except that I survive them, and Ironforge asked for my name, my clan and my whole life. You of all people should understand wanting a place that doesn't care who you were." } },
      choices = {
        { text = "A dwarf belongs with his own kin, Martek.", next = "BACK", reply = "My kin decided otherwise, an' I'll no' crawl back tae them. Ironforge can keep its halls.", fx = { align = { order = 1 } } },
        { text = "I understand. Some of us need the wild.", next = "BACK", reply = "Aye, ye would, wouldn't ye? I knew a druid would understand. The wild doesnae ask questions.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Old stone that wakes when ye touch the wrong thing, and old seals the Explorers' League keeps breakin' because they cannae leave a door shut. Whatever the titans locked away down there, they locked it for a reason, and yer magic would only be one more key in the wrong hand." } },
      choices = {
        { text = "Doors like that should stay shut, Martek. I'll respect the seals.", next = "BACK", reply = "Good, that's more sense than the whole League's got. I've seen what crawls out o' Uldaman when a door gets opened.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old seals are made to be broken. I'll take what's inside.", next = "BACK", reply = "Then ye'll find out why they were sealed, an' I'll no' be there tae dig ye out. Mind yerself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some nights, when the wind howls through the camp an' there's nobody tae curse it with. But a city's full o' folk who know yer business, an' out here only the buzzards know mine, an' they've never told a soul." } },
      choices = {
        { text = "Better alone and free than watched in a city.", next = "BACK", reply = "Free, aye, that's the word for it. The wind's a poor companion, but it never gossips.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Exile or not, everyone needs their own people.", next = "BACK", reply = "Maybe, an' maybe I'll find mine again someday. Till then, the anvil's company enough.", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, they do, an' that's why I'll no' let a mage near mine. Metal that's been made strong by a charm forgets how tae be strong on its own, an' the day yer charm fails, the blade fails with it." } },
      choices = {
        { text = "Honest steel needs no magic. You're right.", next = "BACK", reply = "Ye've a smith's sense, whatever else ye are. Bring me honest ore an' I'll show ye what fire alone can do.", fx = { align = { order = 1 } } },
        { text = "Magic makes metal better. That's progress, Martek.", next = "BACK", reply = "Progress, aye, until it fails ye in a fight. I'll stick wi' fire an' hammer, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Over the anvil, sometimes, though I couldnae tell ye who's listenin'. Out here a dwarf learns tae pray short an' work long, an' the hammer's never once let me down." } },
      choices = {
        { text = "The Light hasn't left you, Martek. Exile doesn't change that.", next = "BACK", reply = "Hasnae it? Then maybe I'll pray a wee bit longer tonight. Thank ye for that.", fx = { align = { light = 1 } } },
        { text = "A hammer you can trust beats a prayer you can't.", next = "BACK", reply = "Ha! That's been my creed for twenty years. The hammer's never let me down.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It'll do, though it's been ground down by somebody who thinks a whetstone fixes everything, an' it doesnae. Bring me indurium from Uldaman an' I'll show ye what a hammer can be, but I'll no' bless it, because the Light an' I have an understanding: I work, an' it watches." } },
      choices = {
        { text = "Let the Light and the forge both have their due, Martek.", next = "BACK", reply = "Both, aye, an' I'll grant there's room for the two. Bring me the indurium, an' we'll see what the Light thinks.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good steel matters more than any blessing, Martek.", next = "BACK", reply = "Ye sound like me, an' I'm no' sure that's a compliment. Bring me the indurium, an' I'll show ye good steel.", fx = { align = { light = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin. Ironforge sends its knights everywhere but here, which suits me fine, though I'll grant ye that hammer was forged by somebody who knew the trade." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest o' the Light, out here. I was raised under it same as ye, {class}, so I'll thank ye no' tae try an' preach me back home." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. I've no use for spells in my metal, mind; what goes intae the forge should come out the better for the hammer, no' for some charm." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Ye'll have yer own reasons for keepin' away from cities, I'd wager, an' I'll no' ask them if ye don't ask mine." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, here? The earth out here is old and sore, and I've worked it long enough to know when it's in a mood, which is most days." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here? You'll find no forest in the Badlands, only rock and me, and I've been told I'm poorer company than the rock." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "Ye pray to something, I can see it on ye, though I'd wager it's no' the Light I was raised under. Sit if ye must, but keep yer blessings to yerself." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "I can smell the brimstone on ye from here, warlock. Keep whatever's at yer heel well back from my anvil, or it'll learn what a hammer's for." },
        { id = "h_default", key = true,
          text = "Martek, they call me, and 'the Exiled' because it's true. I work metal out here where no one tells me how, and the Badlands keep my secrets." },
        { id = "h_letter", when = { questActive = TODO_QUEST("Martek the Exiled") },
          text = "A letter from the Shimmering Flats? Fizzle Brassbolts, eh, and he wants my help with his racer. That gnome has nerve, I'll give him that." },
        { id = "h_indurium", when = { questActive = TODO_QUEST("Indurium") },
          text = "Indurium, from the troggs round Uldaman. Bring me enough of it and I'll show ye what real metal can do." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Let's see yer blade, then, an' I'll tell ye who made it an' how badly, for I've yet tae meet a warrior who knew what he was carryin'." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Ye'll find the coyotes an' buzzards out here are tougher than they look, an' the basilisks tougher still, so mind yer arrowheads." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, an' one o' the Forsaken at that. I've seen many things forged in strange fires, but I never thought tae see the Light hammered intae a dead one's bones." },
      },
      again = {
        { id = "h_again", text = "What else? The forge is coolin'." },
        { id = "h_again2", text = "Ask, then. I've had no company in weeks." },
      },
      choices = {
        { text = "Why live alone in a land this harsh, Martek?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Does the earth speak to you when you work its metal, Martek?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What lies under Uldaman that a spellcaster ought to know about?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "They say Ironforge sent you out here, Martek.", next = "exile" },
        { text = "What metal is worth digging for out here?", next = "indurium" },
        { text = "It can't be easy living out here on your own.", next = "life" },
        { text = "I'm a smith too. Any advice?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "A man alone out here must miss the cities.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Don't enchantments make metal stronger, though?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you still pray out here alone, Martek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's wrong with my blade, Martek?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What arrowheads would you use on a basilisk?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'd wager you've already judged my hammer, Martek.", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Does a Forsaken paladin's hammer pass your inspection, Martek?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You'll talk to a fellow dwarf about Ironforge, surely.", next = "dw_kin", when = { race = "Dwarf" } },
        { text = "Farewell, Martek.", next = "END" },
      },
    },
    exile = {
      lines = { { id = "e_default", text = "I said things to the wrong people in Ironforge, and I was right, which made it worse. That's all ye'll get from me today." } },
      choices = {
        { text = "You don't sound like a man who regrets it.", next = "exile_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_regret = {
      lines = { { id = "er_default", text = "Some days I miss the Great Forge, and the noise of it. Most days I'm glad to be shot of the lot of them." } },
      choices = {
        { text = "A dwarf owes his city loyalty, even when it's wrong.", next = "exile_end", fx = { align = { order = 1 } } },
        { text = "You were right to go your own way.", next = "exile_end", fx = { align = { order = -1 } } },
        { text = "Would you ever go back?", next = "exile_end" },
      },
    },
    exile_end = {
      lines = { { id = "ee_default", text = "Maybe, if they asked nicely, and they won't. So here I stay, with my anvil and the vultures." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    indurium = {
      lines = { { id = "i_default", text = "Indurium, a metal ye'll find only in the deep places round Uldaman, and the troggs carry it like treasure. It's light, and it's strong, and every tinker who builds fast machines would pay dear for it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },
    life = {
      lines = { { id = "l_default", text = "Water from a hidden spring, meat from the coyotes, and silence from everyone. It suits me better than ye'd think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smith = {
      lines = { { id = "s_default", text = "Listen to the metal, no' the master. If it rings wrong, it is wrong, whatever anyone tells ye." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons work metal like nae other dwarves alive, an' they work it for a fire lord, which spoils the lot. I've seen their blades an' I've seen what they're for." } },
    magni = { { id = "tp_magni", text = "Magni's a fine king tae them as stayed in Ironforge, an' I'm no' one o' them. I'll say nae more than that, an' ye'll no' ask me why." } },
    uldaman = { { id = "tp_uldaman", text = "The diggers at Uldaman are pullin' old stone an' older secrets out o' the Badlands, an' I hear the stone fights back. I'd stay clear o' that hole if I were ye." } },
    firegut = { { id = "tp_firegut", text = "The Firegut ogres up in the Steppes are buyin' iron from somebody, an' it's no' me. I've a fair guess who, an' I'm no' sayin' it aloud." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't much care. Ask someone with a city." } },
  },
}

P:NPC {
  key = "rigglefuzz", id = TODO_NPC("Rigglefuzz"), name = "Rigglefuzz",
  bible = "bibles/badlands_camps.md", role = "questgiver", tier = "quest",
  communities = { "badlands" }, temper = { "jovial" }, values = { "practical" },
  notices = { "race", "lock_shards" },

  impression = {
    first = "He's convinced buzzard wings are his ticket to riches.",
    third = "{name} met Rigglefuzz, a goblin cook with big plans for Badlands buzzards.",
  },

  greetings = {
    { id = "g_cook", text = "Hey, hey, you hungry, pal? No? Give it a minute, because one whiff of this grill and you'll be reachin' for your purse." },
  },

  notice = {
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Whoa, that bag's full of soul shards, pal, and in this market those go for more than my whole grill. Not that I'm buyin', and not that you're sellin', but I'm just sayin', you're walkin' around with a fortune." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Pay? They fight over 'em, chum! Last week an orc and a dwarf nearly came to blows in front of my grill, so I sold 'em both a plate at the fightin' price, and they ended up shakin' hands over the bones." } },
      choices = {
        { text = "Your grill's a better peacemaker than any treaty, Rigglefuzz.", next = "BACK", reply = "A peacemaker! I like that, pal, I'm puttin' it on a sign. Peace through wings, two silver a plate.", fx = { align = { light = 1 } } },
        { text = "Next time, let them fight and sell tickets.", next = "BACK", reply = "Tickets! Sparks and sprockets, why didn't I think of that? You've got a goblin's head on you, friend.", fx = { align = { light = -1 } } },
        { text = "Something else, Rigglefuzz.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Off the cliffs round Angor Fortress, mostly, though the Dark Irons up there charge me in arrows every time I go poking about. The big ones nest out by Dustwind Gulch, and they're as mean as they are tasty, which works out to about four silver a wing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Off the cliffs round Angor Fortress, mostly, and the big ones nest out by Dustwind Gulch, as mean as they are tasty. Keep {pet} away from the grill, though, pal, because I don't run a tab for anything with paws." },
      },
      choices = {
        { text = "I'll bring you buzzards, a fair trade for a fair price.", next = "BACK", reply = "A fair trade, a fair price, and a happy cook! Bring 'em fresh, chum, and I'll pay on delivery.", fx = { align = { honor = 1 } } },
        { text = "I'll sell your nesting spots to whoever pays better.", next = "BACK", reply = "Whoa, whoa, those spots are trade secrets, pal! Sell 'em and I'll put you on the menu, ha.", fx = { align = { honor = -1 } } },
        { text = "Something else, Rigglefuzz.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Thank 'em? I'd thank 'em if they flew down here already seasoned and saved me the pepper. The buzzards out here eat whatever falls over in the heat, so if anybody owes anybody, it's them owin' me a cleaning fee." } },
      choices = {
        { text = "Thank them anyway. Every life taken deserves respect.", next = "BACK", reply = "Thank 'em? Sure, pal, I'll thank 'em on the way into the pot. Respect, seasoning, the works.", fx = { align = { light = 1 } } },
        { text = "Suits me. A buzzard's just a meal waiting for sauce.", next = "BACK", reply = "Exactly, chum, a meal waiting for sauce, and the sauce costs extra. You get it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Counting this morning, pal? Enough to keep the skies clear over my camp and the books in the black, and not one of 'em has ever filed a complaint or haggled over the bill, so they're my favourite clients." } },
      choices = {
        { text = "Ease up, or there won't be any buzzards left.", next = "BACK", reply = "Ease up? And let my profits fly away? Fine, fine, maybe a little, but only so there's buzzards next season.", fx = { align = { light = 1 } } },
        { text = "Cook the lot. They're carrion birds, not songbirds.", next = "BACK", reply = "Cook the lot! A customer after my own heart, friend. One more plate, comin' right up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The ogres, pal, the Dustbelcher ones up in the hills, because they figure anybody wavin' their hands around is worth clubbin' first. Me, I wave a skewer, and they leave me alone so long as the wings keep comin', which I call protection money with sauce on it." } },
      choices = {
        { text = "I'll meet them in the open and let them see me coming.", next = "BACK", reply = "Open, eh? Brave, pal, real brave, and I'll keep a plate warm for whoever comes back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hit them from cover before they know I'm there.", next = "BACK", reply = "From cover, smart thinkin'. The ogres never see it comin', and you get home for supper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every cook from here to Booty Bay, pal, and a few in Gadgetzan who oughta know better. I keep it in my head where nobody can pick the lock, and a Kargath grunt once tried to beat it outta me, and all he got was indigestion and a bill." } },
      choices = {
        { text = "Your secret's safe. I don't rob honest cooks.", next = "BACK", reply = "Glad to hear it, chum! An honest rogue's a rare thing, and I'll throw in an extra wing for it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything's for sale, Rigglefuzz. Even recipes.", next = "BACK", reply = "Not this one, pal, not for all the gold in Undermine. The recipe stays in my head where it belongs.", fx = { align = { honor = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aw, come on, it's practically made of charcoal already, and it'd save me a fortune in fuel! Half the Badlands is on fire anyway, so one more little flame for a good cause can't hurt, and the buzzards sure won't complain." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Aw, come on, look at it, standing right next to my grill and giving off more heat than my coals do! It'd save me a fortune in fuel, and half the Badlands is on fire anyway, so one more flame for a good cause can't hurt, and the buzzards sure won't complain." },
      },
      choices = {
        { text = "Fel fire for buzzard wings sounds like a fair trade to me.", next = "BACK", reply = "A fair trade, he says! You're my kind of customer, buddy, but keep the imp away from the grease.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Demons aren't toys. I keep mine on a short leash.", next = "BACK", reply = "Short leash, good, good, because the last thing I need is a demon eatin' the profits. Thanks, pal.", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Why not, pal? A blessing's free, the wings are cheap and the customer walks away happy, which is the whole business model right there. Besides, plenty of the folks who eat my cookin' out here could use a little divine help with their stomachs, and I'm not liable for that part." } },
      choices = {
        { text = "The Light isn't a sales gimmick, Rigglefuzz.", next = "BACK", reply = "Gimmick? Pal, I'm hurt! It's a value-added service, and the customers love it.", fx = { align = { honor = 1 } } },
        { text = "Bless away. A hungry traveler won't mind either way.", next = "BACK", reply = "That's my whole point, chum! Hungry folks don't argue with a blessing and a plate.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd sell to anybody with coin, pal, but a knight eatin' my wings by the road is advertising I couldn't buy for a hundred gold. Folks see shining plate at my fire and figure the food must be safe, and mostly it is, mostly." } },
      choices = {
        { text = "Cook them properly, and I'll vouch for them truthfully.", next = "BACK", reply = "Properly, sure, I always do, mostly. You vouch, I cook, and we both come out ahead.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fine, I'll tell everyone they're delicious, true or not.", next = "BACK", reply = "Now that's the spirit, pal! A little exaggeration never hurt anybody's appetite.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, pal! March all day in that plate and you'll want somethin' hot and greasy at the end of it, and I've got buzzard wings that'll stick to your ribs and maybe your armor, no extra charge for the polish." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "Hey, a priest! Listen, pal, Alliance folk on this road oughta pay extra for a meal that's been prayed over, or at least that's what the new sign's gonna say once I paint it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that an imp? Could it light my grill? I'll pay in wings, chum, and the little fella looks like he could use a feed and a steady job." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You're not after my sauce recipe, are ya? Because I've had three offers this month, pal, and one of 'em came with a knife instead of a down payment." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Say, could you call up a bit of fire for my grill? It'd save me a fortune on charcoal, pal, and the buzzards don't care how they're cooked." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! You're not here to give me grief about the buzzards, are ya? They're the ugliest birds in the Badlands, pal, and somebody's gotta eat 'em, so it might as well be somebody payin'." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, huh? Say a little blessing over these wings for me, pal, because a holy buzzard's gotta sell for double, and I'll split the markup with the Light." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "Hey, a mage! If you can conjure up water, pal, you're welcome at my fire, because the sauce needs thinnin' and the spring's a long walk, and walkin' is time I'm not sellin'." },
        { id = "h_default", key = true,
          text = "Rigglefuzz's the name, and barbecue's the game! I've got a recipe for buzzard wings that'll make me richer than a Steamwheedle baron, pal, and you're lookin' at the ground floor." },
        { id = "h_wings", when = { questActive = TODO_QUEST("Barbecued Buzzard Wings") },
          text = "Buzzard wings, pal, as many as you can carry, and don't let 'em go rotten in the sun, because I'm not payin' for spoiled stock. The secret's in the sauce, and the sauce needs wings." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Big appetite, I bet, and nothin' builds an appetite like hittin' ogres all day, so how about a plate of wings before you go back out, pal? Cash or trade, I'm flexible." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You must know where the fattest buzzards roost, and if you tell me, I'll owe you a favour forever, or at least till the end of the month, when favours get audited." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, pal? Talk while I turn these, because time is money, friend, and wings burn." },
        { id = "h_again2", text = "Yeah, yeah, what is it, chum? The grill's hot and the customers aren't gettin' any less hungry." },
        { id = "h_again3", text = "Still here, pal? Then you're either buyin' or bargainin', and I'm good at both." },
      },
      choices = {
        { text = "How many buzzards have you cooked, Rigglefuzz?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do you ever thank the spirits for your buzzards, Rigglefuzz?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's the worst danger on this road for a spellcaster, Rigglefuzz?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Buzzard wings? Really?", next = "wings" },
        { text = "There can't be many customers on a road like this.", next = "buyers" },
        { text = "Cooking this close to the road looks dangerous.", next = "danger" },
        { text = "Will you sell to an orc, goblin?", next = "goblin", when = { race = "Orc" } },
        { text = "Who wants your sauce recipe that badly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "My imp is not a cooking fire, Rigglefuzz.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Should a priest really bless buzzard wings, Rigglefuzz?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I doubt soldiers pay good coin for buzzard wings.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where do you get your buzzards, Rigglefuzz?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Would you really sell buzzard wings to a paladin, Rigglefuzz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good luck with the barbecue.", next = "END" },
      },
    },
    wings = {
      lines = { { id = "w_default", text = "Really, really, pal! Tough, sure, but slow-cook 'em with enough pepper and nobody can tell, and nobody's ever asked for a refund. Trust me, I'm a professional." } },
      choices = {
        { text = "That sauce smells like it hides a secret or two.", next = "wings_sauce" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wings_sauce = {
      lines = { { id = "ws_default", text = "That's a trade secret, pal, and the price on that one has more zeros than you've got gold. Let's just say it's got a kick, and some of the kick's even legal." } },
      choices = {
        { text = "Sounds like a swindle. You should be honest with customers.", next = "wings_end", fx = { align = { honor = 1 } } },
        { text = "Ha! If they pay, they pay. Smart business.", next = "wings_end", fx = { align = { honor = -1 } } },
        { text = "I'll take your word for it.", next = "wings_end" },
      },
    },
    wings_end = {
      lines = { { id = "we_default", text = "See, you get it or you don't, but either way you're gonna bring me wings, and either way I'm gonna sell 'em. That's the beauty of business, pal." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Anybody with coin and a stomach, pal: orcs, dwarves, ogres if they pay first, and I don't ask questions, because questions don't pay." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Sure, there's ogres and dragonkin and whatnot, but they've gotta eat too, and a dead cook's a lousy investment. I figure nobody kills the cook while he's still grillin', pal, and so far the numbers agree with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblin = {
      lines = { { id = "g_default", text = "Sure, pal, your coin's as good as anybody's, and Kargath's full of hungry grunts with wages burnin' holes in their pockets. Tell your friends where the wings are, and tell 'em to bring silver." } },
      choices = { { text = "I'll spread the word.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I'd like to open a real kitchen someday, pal, with walls and a roof and customers who aren't covered in dust. Buzzard wings are the first step." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got Dirge Quikcleave, pal, and he thinks he's the best cook in Azeroth. Wait till he tries my buzzard wings." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's grunts eat anything, pal, and they pay in silver, so I'm a big fan of the Warchief. Tell him I said so, if you see him." } },
    uldaman = { { id = "tp_uldaman", text = "The dwarves digging at Uldaman eat like miners, pal, which is to say a lot and not fussy. I'd sell to them if they'd stop shooting at me." } },
    _none = { { id = "tp_none", text = "Dunno, pal, and I don't sell what I don't know. Does it taste good with sauce?" } },
  },
}
