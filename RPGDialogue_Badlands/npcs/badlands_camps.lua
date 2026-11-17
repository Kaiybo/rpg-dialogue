-- The Badlands between the towns: Martek's camp and Rigglefuzz's cookfire. Voice: bibles/badlands_camps.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "martek", id = TODO_NPC("Martek the Exiled"), name = "Martek the Exiled",
  bible = "bibles/badlands_camps.md", role = "blacksmith", tier = "quest",
  communities = { "badlands" }, temper = { "gruff" }, values = { "proud" },
  notices = { "craft" },

  impression = {
    first = "Martek the Exiled works metal in a lonely Badlands camp, and nobody living knows more about it than he does.",
    third = "{name} met Martek the Exiled, a dwarven smith living in exile in the Badlands.",
  },

  greetings = {
    { id = "g_camp", text = "Ye found my camp, which means ye were either lookin' or lost. Which is it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit, then, but don't touch the anvil." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The hammer's fine work, better than the arm that carries it, if ye'll forgive me. The Light an' I have an understandin', I work an' it watches, but I never thought it'd go watchin' from inside one o' the dead, an' I'll admit it makes me curious." } },
      choices = {
        { text = "The Light chose me. It can choose anyone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The hammer matters more than whatever glows behind it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nothin' a month at my anvil wouldnae fix, but there's nae month tae spare out here. Keep it oiled against the dust an' strike wi' the edge, no' the flat, an' it'll serve ye till ye find a better smith than the one who made it." } },
      choices = {
        { text = "I'll mind the blade's care. A weapon's only as good as its upkeep.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A blade's for killing, not coddling. I'll swing it as I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Heavy iron, barbed an' hard-tempered, for a basilisk's hide turns a light point aside the way a stone shrugs off rain. I've made a few for hunters passin' through, an' none came back complainin', though one or two didnae come back at all." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} back from the basilisks' eyes, for I'm told it's no' a good idea. I wouldnae know myself, mind, for I've the sense never tae look." },
      },
      choices = {
        { text = "I'll leave the basilisks be, unless they come for me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every basilisk out there is a hide waiting to be sold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, but I listen all the same, and I hear when a vein's run thin or a seam's about to crack. The troggs dig without listening, and Uldaman's full of things better left buried, so ye might tell the spirits not everyone down here is so careless." } },
      choices = {
        { text = "Then work gently, Martek. The earth rewards those who listen.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Metal's metal. Take what the earth won't defend.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because the Badlands ask nothing of me except that I survive them, and Ironforge asked a great deal more. You of all people should understand wanting a place that doesn't care who you were." } },
      choices = {
        { text = "A dwarf belongs with his own kin, Martek.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I understand. Some of us need the wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Old stone that wakes when ye touch the wrong thing, and old seals the Explorers' League keeps breakin' because they cannae leave a door shut. Whatever the makers locked away down there, they locked it for a reason, and yer magic would only be one more key in the wrong hand." } },
      choices = {
        { text = "Doors like that should stay shut, Martek. I'll respect the seals.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old seals are made to be broken. I'll take what's inside.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some nights, when the wind howls through the camp an' there's nobody tae curse it with. But a city's full o' folk who know yer business, an' out here only the buzzards know mine, an' they've never told a soul." } },
      choices = {
        { text = "Better alone and free than watched in a city.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Exile or not, everyone needs their own people.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, it does, an' that's why I'll no' let a mage near mine. Metal that's been made strong by a charm forgets how tae be strong on its own, an' the day yer charm fails, the blade fails with it." } },
      choices = {
        { text = "Honest steel needs no magic. You're right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic makes metal better. That's progress, Martek.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Over the anvil, sometimes, though I couldnae tell ye who's listenin'. Out here a dwarf learns tae pray short an' work long, an' the hammer's never once let me down." } },
      choices = {
        { text = "The Light hasn't left you, Martek. Exile doesn't change that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hammer you can trust beats a prayer you can't.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It'll do, though it's been ground down by somebody who thinks a whetstone fixes everything, an' it doesnae. Bring me indurium from Uldaman an' I'll show ye what a hammer can be, but I'll no' bless it, because the Light an' I have an understanding: I work, an' it watches." } },
      choices = {
        { text = "Let the Light and the forge both have their due, Martek.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good steel matters more than any blessing, Martek.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Why were you exiled?", next = "exile" },
        { text = "What's indurium?", next = "indurium" },
        { text = "How do you live out here?", next = "life" },
        { text = "I'm a smith too. Any advice?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Do you ever miss the cities, Martek?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Indurium takes enchantments well, though, doesn't it?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you still pray out here alone, Martek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's wrong with my blade, Martek?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What arrowheads would you use on a basilisk?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does a paladin's hammer pass your inspection, Martek?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Does a Forsaken paladin's hammer pass your inspection, Martek?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Martek.", next = "END" },
      },
    },
    exile = {
      lines = { { id = "e_default", text = "I said things to the wrong people in Ironforge, and I was right, which made it worse. That's all ye'll get from me today." } },
      choices = {
        { text = "Do you regret it?", next = "exile_regret" },
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
      lines = { { id = "i_default", text = "A metal ye'll find only in the deep places round Uldaman, and the troggs carry it like treasure. It's light, and it's strong, and it's perfect for a gnome's mad machine." } },
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
    _none = { { id = "tp_none", text = "I don't know, and I don't much care. Ask someone with a city." } },
  },
}

P:NPC {
  key = "rigglefuzz", id = TODO_NPC("Rigglefuzz"), name = "Rigglefuzz",
  bible = "bibles/badlands_camps.md", role = "questgiver", tier = "quest",
  communities = { "badlands" }, temper = { "jovial" }, values = { "practical" },
  notices = { "race" },

  impression = {
    first = "Rigglefuzz is a goblin cooking by the Badlands road, and he's convinced buzzard wings are his ticket to riches.",
    third = "{name} met Rigglefuzz, a goblin cook with big plans for Badlands buzzards.",
  },

  greetings = {
    { id = "g_cook", text = "Hey, hey, you hungry, pal? No? Well, you will be once you smell this." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Pay? They fight over 'em! Last week an orc and a dwarf nearly came to blows in front of my grill, and I sold 'em both a plate, and they ended up shaking hands over the bones." } },
      choices = {
        { text = "Your grill's a better peacemaker than any treaty, Rigglefuzz.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Next time, let them fight and sell tickets.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Rigglefuzz.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Off the cliffs round Angor Fortress, mostly, though the Dark Irons up there don't like me poking about. The big ones nest out by Dustwind Gulch, and they're as mean as they are tasty, which is very." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from the grill, would you? It's looking at my buzzards the way my customers do, and I can't afford to feed anybody for free." },
      },
      choices = {
        { text = "I'll bring you buzzards, a fair trade for a fair price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll sell your nesting spots to whoever pays better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Rigglefuzz.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Thank 'em? I'd thank 'em if they flew down here already seasoned. The buzzards out here eat whatever falls over in the heat, so if anybody ought to be thanking somebody, it's them, for me cleaning the place up." } },
      choices = {
        { text = "Thank them anyway. Every life taken deserves respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Suits me. A buzzard's just a meal waiting for sauce.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Counting this morning? Enough to keep the skies clear over my camp, and not one of 'em has ever complained, which is more than I can say for my customers." } },
      choices = {
        { text = "Ease up, or there won't be any buzzards left.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Cook the lot. They're only carrion birds.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The ogres, pal, the Dustbelcher ones up in the hills, because they figure anybody waving their hands around is worth clubbing first. Me, I just wave a skewer, and they leave me alone so long as I feed 'em." } },
      choices = {
        { text = "I'll meet them in the open and let them see me coming.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hit them from cover before they know I'm there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every cook from here to Booty Bay, pal, and a few in Gadgetzan who should know better. I keep it in my head, where nobody can pick the lock, though a Kargath grunt once tried to beat it out of me, and all he got was indigestion." } },
      choices = {
        { text = "Your secret's safe. I don't rob honest cooks.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything's for sale, Rigglefuzz. Even recipes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aw, come on, it's practically made of charcoal already! Half the Badlands is on fire anyway, so one more little flame for a good cause can't hurt, and the buzzards sure won't complain." } },
      choices = {
        { text = "Fel fire for buzzard wings sounds like a fair trade to me.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Demons aren't toys. I keep mine on a short leash.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Why not? A blessing's free, the wings are cheap and the customer walks away happy, which is the whole business model right there. Besides, pal, half the folks who eat my cooking out here could use a little divine help with their stomachs." } },
      choices = {
        { text = "The Light isn't a sales gimmick, Rigglefuzz.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Bless away. A hungry traveler won't mind either way.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd sell to anybody with coin, pal, but a knight eating my wings by the road is the best advertising a cook could ask for. Folks see shining plate at my fire and figure the food must be safe, and mostly it is, mostly." } },
      choices = {
        { text = "Cook them properly, and I'll vouch for them honestly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fine, I'll tell everyone they're delicious, true or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, pal! You march all day in that plate and you'll want something hot and greasy at the end of it, and I've got buzzard wings that'll stick to your ribs and maybe your armor." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "Hey, a priest! You know, pal, Alliance folk on this road ought to pay extra for a meal that's been prayed over, or at least I'm hoping they will once I paint the sign." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that an imp? Could it light my grill? I'll pay in wings, and the little fella looks like he could use a feed." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You're not after my sauce recipe, are you? Because I've had three offers this month, and one of 'em came with a knife." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Say, could you call up a bit of fire for my grill? It'd save me on charcoal, and the buzzards don't care how they're cooked." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! You're not here to give me grief about the buzzards, are you? Because they're the ugliest birds in the Badlands, and somebody has to eat 'em." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, huh? Say a little blessing over these wings for me, pal, because a holy buzzard's gotta sell for double." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "Hey, a mage! If you can conjure up water, pal, you're welcome at my fire, because the sauce needs thinning and the spring's a long walk." },
        { id = "h_default", key = true,
          text = "Rigglefuzz's the name, and barbecue's the game! I've got a recipe for buzzard wings that'll make me richer than a Steamwheedle baron." },
        { id = "h_wings", when = { questActive = TODO_QUEST("Barbecued Buzzard Wings") },
          text = "Buzzard wings, as many as you can carry, and don't let 'em go rotten in the sun. The secret's in the sauce, and the sauce needs wings." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Big appetite, I bet, and nothing builds an appetite like hitting ogres all day, so how about a plate of wings before you go back out?" },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You must know where the fattest buzzards roost, and if you tell me, I'll owe you a favour forever, or at least till Tuesday." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, pal, since time is money?" },
        { id = "h_again2", text = "Yeah, yeah, what is it?" },
      },
      choices = {
        { text = "How many buzzards have you cooked, Rigglefuzz?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do you ever thank the spirits for your buzzards, Rigglefuzz?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's the worst danger on this road for a spellcaster, Rigglefuzz?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Buzzard wings? Really?", next = "wings" },
        { text = "Who buys food out here?", next = "buyers" },
        { text = "Isn't it dangerous by the road?", next = "danger" },
        { text = "Will you sell to an orc, goblin?", next = "goblin", when = { race = "Orc" } },
        { text = "Who wants your sauce recipe that badly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "My imp is not a cooking fire, Rigglefuzz.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Should a priest really bless buzzard wings, Rigglefuzz?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do soldiers really pay for buzzard wings out here?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where do you get your buzzards, Rigglefuzz?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Would you really sell buzzard wings to a paladin, Rigglefuzz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good luck with the barbecue.", next = "END" },
      },
    },
    wings = {
      lines = { { id = "w_default", text = "Really, really! Tough, sure, but slow-cook 'em with enough pepper and nobody can tell. Trust me, I'm a professional." } },
      choices = {
        { text = "What's in the sauce?", next = "wings_sauce" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wings_sauce = {
      lines = { { id = "ws_default", text = "That's a trade secret, pal, and I'd have to charge you for it. Let's just say it's got a kick, and some of the kick's legal." } },
      choices = {
        { text = "Sounds like a swindle. You should be honest with customers.", next = "wings_end", fx = { align = { honor = 1 } } },
        { text = "Ha! If they pay, they pay. Smart business.", next = "wings_end", fx = { align = { honor = -1 } } },
        { text = "I'll take your word for it.", next = "wings_end" },
      },
    },
    wings_end = {
      lines = { { id = "we_default", text = "See, you get it, or you don't, but either way you're gonna bring me wings. That's the beauty of business." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Anybody with coin and a stomach, pal. Orcs, dwarves, ogres if they pay first, and I don't ask questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Sure, there's ogres and dragonkin and whatnot, but they've gotta eat too. I figure nobody kills the cook." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblin = {
      lines = { { id = "g_default", text = "Sure, pal, your coin's as good as anybody's, and Kargath's full of hungry grunts. Tell your friends where the wings are." } },
      choices = { { text = "I'll spread the word.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Dunno, pal. Does it taste good with sauce?" } },
  },
}
