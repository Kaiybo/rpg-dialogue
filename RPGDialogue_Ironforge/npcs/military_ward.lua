-- The Military Ward: the Hall of Arms' trainers, and a soldier's widow who waits for letters.
-- Voices: bibles/military_ward.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sara Balloo: Sully Balloo's wife. His letter from beneath the Thandol Span, her plea to Magni,
-- and the King's memorial (A King's Tribute).
P:NPC {
  key = "sara_balloo", id = TODO_NPC("Sara Balloo"), name = "Sara Balloo",
  bible = "bibles/military_ward.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "gentle" }, values = { "loving", "loyal" },
  notices = { "soldier" },

  impression = {
    first = "Sara Balloo waits in the Military Ward for news of her husband, Sully, who serves at the Thandol Span. She asks every traveler where they have been, and listens very carefully to the answer.",
    third = "{name} met Sara Balloo of Ironforge, whose husband Sully was posted with the soldiers watching the Thandol Span.",
  },

  greetings = {
    { id = "g_news", text = "Ye look as though ye've come a long way. What news d'ye bring from the roads?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") }, text = "Oh, it's you. No, stay, please; I'd rather see a kind face than an empty doorway." },
    { id = "g_memorial", when = { questDone = TODO_QUEST("A King's Tribute") }, text = "Good day tae ye. I went an' sat by Sully's stone this mornin', an' it helped, a little." },
  },

  notice = {
    { id = "n_priest", cat = "soldier", when = { class = "PRIEST", questDone = TODO_QUEST("Sully Balloo's Letter") },
      text = "A priest. I've had the High Priest's people by, an' they're very kind, but I don't want tae be prayed at today; I only want tae sit." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, ["not"] = { questDone = TODO_QUEST("Sully Balloo's Letter") } },
      text = "Ye carry yerself like a soldier. Have ye been up through the Wetlands, past Dun Modr? My Sully's posted there." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I have, but the gryphon masters fly where the King tells them, an' a soldier's wife isnae the King. I'd go myself if I knew how tae ride one wi'out fallin' off." } },
      choices = {
        { text = "Ask the gryphon masters properly. They may grant it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Don't wait for permission, Sara. Find a rider who'll go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, an' a good one, though he'd say so himself before anyone else could. His last letter said the Dark Irons press them hard by the Span an' they need every shield they can get, so if ye go north, they'd be glad o' yours." } },
      choices = {
        { text = "I'll go north and stand beside him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go where the pay's better than the Wetlands.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Just that he's well, an' eatin', an' no' doin' anythin' daft, for he's a dwarf who'd charge a red dragon if it insulted his beard. Ye'll know him by his voice before ye see him, I promise ye." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} might find him first, for he always smells o' boot grease an' gun oil, the great lump." },
      },
      choices = {
        { text = "I'll find him and bring you word, Sara.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll look, but I won't go out of my way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because ye go where the soldiers dinnae, an' ye listen where they talk. If ye ever hear Sully's name on the wind, I'd be grateful tae know it, good or bad, for the not knowin' is the worst o' it." } },
      choices = {
        { text = "I'll listen for his name and bring you the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring you good news, Sara, whatever I actually hear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It can, but the roads through the Wetlands are thick wi' Dark Iron raiders, an' half the post never arrives. I know a spell's no' the King's mail, but a worried wife will try anythin' twice." } },
      choices = {
        { text = "Use the King's post, Sara. It'll get there in time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules be hanged. I'd find a faster way for you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd take news from a trogg if it had seen my Sully, an' I'm past carin' who brings it. The folk in the Ward look at ye sideways, I know, but they look at me sideways too these days, for askin' every stranger the same question." },
      },
      choices = {
        { text = "If I hear anything, I'll bring it straight to you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I've no time for other people's husbands.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sara Balloo. My Sully serves wi' the garrison at Dun Modr, watchin' over the Thandol Span, an' I ask everyone who comes through the Ward whether they've passed that way." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Sully Balloo's Letter") },
          text = "Ye've the look o' someone carryin' somethin' heavy, an' ye keep lookin' at me as if it belongs tae me. These are tryin' times for the soul, so tell me plain: what news d'ye bring?" },
        { id = "h_grief", tags = { "news" }, when = { questRecent = { TODO_QUEST("Sully Balloo's Letter"), days = 3 } },
          text = "I've read his letter so often the ink's goin' soft. He wrote it in case, ye see, an' then the case came, an' he was right tae write it." },
        { id = "h_plea", tags = { "news" }, when = { questActive = TODO_QUEST("Sara Balloo's Plea") },
          text = "Have ye taken my note tae the King? I'd go myself, but I couldnae stand before him like this an' say what needs sayin' wi'out breakin' in half." },
        { id = "h_tribute", tags = { "news" }, when = { questActive = TODO_QUEST("A King's Tribute") },
          text = "They say the King's ordered a memorial for Sully, an' the Grand Mason's sent for stone. I don't know what tae feel about it yet, so I'm feelin' all of it at once." },
        { id = "h_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "Sully's gone. He died at the Thandol Span when the Dark Irons came, an' ye were the one who found him, so ye've as much right tae his name as anyone." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye've the look o' someone who travels the back roads, an' the back roads are where news hides. Have ye been anywhere near the Thandol Span?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! They say yer kind can send messages a long way, quicker than any gryphon, an' I've a letter for Dun Modr that's waited a month." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Have ye been tae Dun Modr? Ye'd have seen my Sully if ye had, for he's the one who never stops talkin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'll travel the roads, then, an' ye might pass Dun Modr; if ye do, would ye look for my Sully?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've heard yer kind can talk tae the beasts, an' I've wondered whether a bird might find Dun Modr quicker than the post." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Have ye been anywhere near the Thandol Span? I'll ask anyone, even you, for I've had no word from Sully in too long." },
      },
      again = {
        { id = "h_again", text = "Is there somethin' else? I've nowhere I need tae be today." },
        { id = "h_again2", text = "Go on. It's good tae talk." },
      },
      choices = {
        { text = "Tell me about Sully.", next = "sully" },
        { text = "What's happening at the Thandol Span?", next = "span" },
        { text = "How do you pass the days?", next = "days" },
        { text = "What did the King say?", next = "king", when = { questDone = TODO_QUEST("Sara Balloo's Plea") } },
        { text = "Would you like me to pray with you?", next = "pray", when = { class = "PRIEST" } },
        { text = "I'm a soldier too, Sara.", next = "soldier", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Why would a rogue hear news of Dun Modr first?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can't the post carry your letter to Dun Modr?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is your Sully a warrior too, Sara?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What news would you want me to bring from Dun Modr?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you thought of sending word to Dun Modr by gryphon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you really take news from a warlock, Sara?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Take care, Sara.", next = "END" },
      },
    },

    sully = {
      lines = {
        { id = "su_default", text = "He's a soldier, an' a believer in what he's sent tae do, which is more than most can say. He writes every fortnight, an' every letter begins the same way, 'My dear Sara', as if I might've forgotten who I was." },
        { id = "su_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "He was a soldier who believed in his missions, every one. His last letter began like all the others, 'My dear Sara', an' the rest is mine, if ye don't mind." },
      },
      choices = {
        { text = "Of course. The rest is yours.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Why did he believe so strongly?", next = "sully_why" },
      },
    },
    sully_why = {
      lines = {
        { id = "sw_default", text = "Because somebody has tae hold the bridges, he'd say, or there's nothin' between the Dark Irons an' the rest o' us but water. I used tae tell him that's what the water's for." },
      },
      choices = {
        { text = "He was right; someone has to stand there.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "You were right; no bridge is worth a husband.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    span = {
      lines = {
        { id = "sp_default", text = "It's the great bridge between the Wetlands an' Arathi, an' the Dark Irons have been at it. Folk say there was an attack, an' the garrison at Dun Modr's been stretched thin ever since." },
      },
      choices = {
        { text = "I'll go and see for myself.", next = "span_go" },
        { text = "Something else, Sara.", next = "BACK", fx = { learn = { "thandol_span", "dark_iron" } } },
      },
    },
    span_go = {
      lines = {
        { id = "sg_default", text = "Would ye? If ye pass by the Span, look for him, will ye; Sully Balloo, a broad dwarf wi' a laugh ye can hear from the far bank. Tell him tae write." },
        { id = "sg_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "Ye've already been, an' ye found him in the water under the bridge. I'm glad it was someone who'd come back an' tell me, an' no' a stranger who'd walk on." },
      },
      choices = {
        { text = "The Dark Irons will answer for this bridge.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "thandol_span" } } },
        { text = "Vengeance won't bring anyone home.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 }, learn = { "thandol_span" } } },
      },
    },

    days = {
      lines = {
        { id = "da_default", text = "I keep the house, an' I walk the Ward, an' I go up tae the gates when a courier's due. Some evenin's Brother Toldren lets me sit in the back o' the Hall, an' doesnae ask me anythin', which is a mercy." },
        { id = "da_after", when = { questDone = TODO_QUEST("Sully Balloo's Letter") },
          text = "I keep the house, though there's less o' it tae keep. I still go up tae the gates when a courier's due, out o' habit, an' then I remember halfway up the road." },
      },
      choices = {
        { text = "Waiting must be the hardest part.", next = "days_wait" },
        { text = "Keeping busy is the best medicine.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    days_wait = {
      lines = {
        { id = "dw_default", text = "It is, an' everyone in the Military Ward knows it. Half the wives an' husbands on this street are waitin' on someone, an' we nod tae each other in the mornin' an' don't say a word." },
      },
      choices = {
        { text = "Families like yours carry this war too.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "It's the price of keeping Khaz Modan safe.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    king = {
      big = true,
      lines = {
        { id = "ki_default", text = "He sighed, they say, a long one, an' then he ordered a memorial built. He said that war's travesties have tae be endured for the good o' our people, an' that every dwarf who falls weighs on him." },
        { id = "ki_done", when = { questDone = TODO_QUEST("A King's Tribute") },
          text = "It's finished now, granite from Alterac, an' it'll stand longer than any of us. The King says it's for the ones who'll come after, so they don't forget what Sully gave." },
      },
      choices = {
        { text = "The King honored him rightly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A stone is small payment for a life.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Do you believe him?", next = "king_believe" },
      },
    },
    king_believe = {
      lines = {
        { id = "kb_default", text = "I believe he means it, an' I believe it doesnae help as much as he'd like. Both can be true, Sully used tae say about most things." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    pray = {
      lines = {
        { id = "pr_default", text = "Not today, if ye'll forgive me; I've been prayed for until my ears ring. Only sit wi' me a moment, would ye, an' that can be the prayer." },
      },
      choices = {
        { text = "Silence can be a prayer too.", next = "BACK", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Sometimes words help more than silence.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    soldier = {
      lines = {
        { id = "sd_default", text = "Then ye'll have someone waitin' for ye an' all, somewhere, askin' strangers the same question I ask. Write tae them, will ye, even a line, for I've learned what a line weighs." },
        { id = "sd_ward", when = { origin = "dwarf_military_ward" },
          text = "Ward-born, are ye? Then ye'll know my Sully, or know o' him; he drilled wi' Kelstrum's lot afore they sent him tae the Span." },
      },
      choices = {
        { text = "I'll write. I promise.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Nobody waits for me, Sara.", next = "soldier_nobody" },
      },
    },
    soldier_nobody = {
      lines = {
        { id = "sn_default", text = "Then I'll wait for ye a wee bit, alongside Sully, for I'm doin' it anyway. Come back through the Ward an' let me see ye're still in one piece." },
      },
      choices = { { text = "I will, Sara.", next = "BACK", fx = { affinity = 3 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I listen tae every traveler who'll stop, so I know more about the roads than I ever wanted tae. Ask me." } },
    background = { { id = "tp_bg", text = "I'm Sully Balloo's wife, an' that's all I've been for a long while. I don't mind it." } },
    advice = { { id = "tp_ad", text = "Write tae the ones who wait for ye, even if it's only a line. Ye'll never know how much a line weighs." } },
    thandol_span = { { id = "tp_span", text = "The bridge my Sully was sent tae hold. I'd rather ye asked me about somethin' else, but I'll tell ye what I know.", next = "span" } },
    dark_iron = { { id = "tp_dark_iron", text = "They're the ones who struck the Span. I don't know more than that, an' I don't want tae." } },
    _none = { { id = "tp_none", text = "I'm sorry, I couldnae say. Ask someone in the Hall o' Arms; they know about such things." } },
  },
}

-- Kelstrum Stonebreaker: warrior trainer; scoffs that non-warriors wouldn't last a day of his regimen.
P:NPC {
  key = "kelstrum", id = TODO_NPC("Kelstrum Stonebreaker"), name = "Kelstrum Stonebreaker", title = "Warrior Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "stern", "brave" },
  notices = { "class" },

  impression = {
    first = "Kelstrum Stonebreaker told me I wouldn't last a day under his training regimen, and laughed about it. I am not entirely sure he was wrong.",
    third = "{name} met Kelstrum Stonebreaker, a loud warrior trainer in the Hall of Arms.",
  },

  greetings = {
    { id = "g_ha", text = "Ha! Another one wanderin' intae the Hall o' Arms. State yer business, an' stand up straight while ye do it." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Back for more punishment? Good; punishment's what makes a warrior." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest in the Hall o' Arms! Ye'd no' last a day under my regimen, but I'll grant ye this: I'd want ye behind me in a fight, so don't let anyone tell ye different." },
    { id = "n_human_war", cat = "class", when = { class = "WARRIOR", race = "Human" },
      text = "A human warrior. Ye're taller than my usual lot, so ye'll be gettin' hit in the head more; mind yer helmet." },
    { id = "n_gnome_war", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome warrior! Bilban says ye're all the best at gettin' under a guard, an' I'll admit he has a point, low as it is." },
    { id = "n_dwarf_war", cat = "class", when = { class = "WARRIOR", race = "Dwarf" },
      text = "A dwarf warrior, standin' like the Ward taught ye, more or less. Shoulders back; ye're no' carryin' a keg." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "One o' Brandur's lot, by the shine on ye. Mind ye don't blind my students, for they've enough trouble seein' a punch comin'." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd train the bear, aye, an' I'd shout at it the same as I shout at the rest. A bear that knows how tae hold a line is worth three dwarves who don't." } },
      choices = {
        { text = "Discipline sharpens even a beast's instincts. Train me.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A bear needs no drillmaster. Instinct is enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plenty, for the day yer beast falls an' the bear's still standin', ye'll want tae know how tae take a blow. Come tae the yard an' I'll knock ye down a few times, an' ye'll thank me in the high snows." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} o' yours has more fight in its eyes than half my recruits, I'll say that." },
      },
      choices = {
        { text = "I'll take the training. Every hunter should stand firm.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good hunter never lets the bear get that close.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "On the field, aye, though no warrior likes admittin' it. Ye throw the fire an' we stand in front o' ye so ye can, an' the best mages I've known never forgot which half o' the bargain was bleedin'." } },
      choices = {
        { text = "I'll never forget who stands in front of me, Kelstrum.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The warriors are paid to bleed. That's their trade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Fear it? They'd charge it, which is worse, for they've been taught tae charge anythin' wi' horns. I'd rather they learned on dummies than on yer voidwalker." } },
      choices = {
        { text = "I'll keep it out of the yard. Your recruits come first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them charge it. They'd learn faster that way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "After trainin', durin' trainin', an' sometimes before, when they've seen the regimen written on the wall. I'll no' go soft on them, mind, for the Dark Irons won't, but I'll admit a priest in the yard saves me a few recruits a season." } },
      choices = {
        { text = "Then I'll stand in your yard. Nobody should break for want of healing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Recruits who need healing in training aren't ready for real war.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What else, Kelstrum?", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the Military Ward! Ye'd no' last a day o' my regimen either, but my recruits would last a good deal longer wi' ye standin' behind them." },
        { id = "h_default", text = "Kelstrum Stonebreaker, an' I train warriors. Yer no warrior, by the look o' ye, an' ye wouldnae last a day under my trainin' regimen, but go on, ask what ye came tae ask." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "There's a warrior! A bit soft round the edges, but we'll hammer that out. What'll it be: trainin', or are ye just here tae admire the weapons?" },
        { id = "h_warrior_high", when = { class = "WARRIOR", minLevel = 40 },
          text = "Look at that, someone who survived my regimen an' kept goin'. I'll no' say I'm proud, for it'd go tae yer head, but I'm no' disappointed." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the Military Ward. I'll be honest, ye'd no' last a day o' my training, but I've seen fire win battles an axe couldnae." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in the Military Ward! I'd ask ye tae keep yer creatures out o' my yard, for my recruits have enough tae worry about." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Ye'll be soft from lettin' yer beast do the fightin', but I'll no' hold it against ye." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Ye wouldnae last a day under my regimen either, though I'll admit the bear might." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, now; my students are standin' about." },
        { id = "h_again2", text = "Spit it out, for warriors don't dither." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's this famous regimen?", next = "regimen" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "I'd last a day, I'll wager.", next = "wager", when = { ["not"] = { class = "WARRIOR" } } },
        { text = "What comes next for me, trainer?", next = "next", when = { class = "WARRIOR" } },
        { text = "A paladin can hold a line as well as any warrior.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I don't fight fair, Kelstrum.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do warriors and mages truly need one another?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would your recruits really fear a warlock's demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could a hunter learn anything from your warriors, Kelstrum?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your recruits ever need a priest after training, Kelstrum?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you train a druid who fights as a bear?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    regimen = {
      lines = {
        { id = "re_default", text = "Up before the forges, a hundred swings wi' a practice axe, a run tae the gates an' back, then sparrin' till ye cannae lift yer arms. Then we start the real work." },
      },
      choices = {
        { text = "Discipline makes the warrior.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Real fights don't follow a drill.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And the real work is?", next = "regimen_real" },
      },
    },
    regimen_real = {
      lines = {
        { id = "rr_default", text = "Learnin' tae get up. Anybody can swing an axe, but a warrior's the one who's still standin' when the others are lyin' down, an' that's all I really teach." },
      },
      choices = { { text = "That's a fair lesson.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    good = {
      lines = {
        { id = "go_default", text = "Thick skin, a short memory for bruises, an' the sense tae stand in front o' the folk who cannae take a hit. That last one's the part they forget." },
      },
      choices = {
        { text = "Standing in front is an honor.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Winning matters more than where you stand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wager = {
      lines = {
        { id = "wa_default", text = "Ha! A wager, is it? I've heard that from mages, an' priests, an' once from a very confident gnome wi' a wrench, an' I'm still waitin' tae lose." },
      },
      choices = {
        { text = "Then I'll be the first.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Maybe I'll keep my wager for another day.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    next = {
      lines = {
        { id = "nx_default", text = "Ye pick a side o' yerself an' ye sharpen it. Shield an' stance for the ones who stand in front, two hands an' a temper for the ones who'd rather end the fight early, an' both are warriors, whatever the shield lot tell ye." },
        { id = "nx_ward", when = { origin = "dwarf_military_ward" },
          text = "Ye grew up in this Ward, so ye've heard me say it a hundred times through the wall: a shield first, an' a temper second. I'll say it a hundred an' one, because ye're still standin' crooked." },
        { id = "nx_gnome", when = { race = "Gnome" },
          text = "Ye pick a side o' yerself an' sharpen it, though wi' a gnome the side's mostly knees. Bilban'll tell ye about angles; I'll tell ye a shield's a door an' ye're the hinge." },
      },
      choices = {
        { text = "The shield. Someone has to stand in front.", next = "next_shield", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Two hands. The fight ends faster.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Can I learn both?", next = "next_both" },
      },
    },
    next_shield = {
      lines = {
        { id = "ns_default", text = "Then ye'll be the one the healers love an' the orcs hate, which is the best reputation a warrior can have. Learn tae taunt, learn tae take it on the shield an' no' the face, an' never step back unless the whole line does." },
      },
      choices = {
        { text = "I won't step back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    next_both = {
      lines = {
        { id = "nb_default", text = "Ye can, an' ye'll be middlin' at both for a long while. The ones who last carry two sets o' gear an' a strong back, an' they change stance faster than a Senator changes his vote." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Hold it, aye, an' then stop tae pray over the fella beside ye, an' the line's got a hole in it. I'm teasin' ye, mostly; Brandur's lot are the only ones who come in here an' don't flinch when I shout." },
        { id = "pa_dwarf", when = { race = "Dwarf" },
          text = "Hold it, aye, wi' a hammer in one hand an' the Light in the other, an' I'll admit I've seen dwarves o' the Silver Hand hold the Span when my own lads broke. Don't tell Brandur I said so." },
      },
      choices = {
        { text = "Faith is what keeps the line standing.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Steel holds the line. The prayer's for after.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rg_default", text = "Nobody fights fair once they've been in a real fight, so ye've just learned it sooner than most. I'll say this, though: my warriors take the blows so ye can get round the back, an' ye'd best make it count when ye get there." },
      },
      choices = {
        { text = "Fair fights are for people who expect to lose.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll make it count, and I'll thank the shield.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear a fair bit from the soldiers comin' back through the Ward. Here's what's worth knowin'." } },
    background = { { id = "tp_bg", text = "I train warriors in the Hall o' Arms. That's my story, an' it's got a lot o' shoutin' in it." } },
    advice = { { id = "tp_ad", text = "Get up. Whatever knocks ye down, get up before it comes back for a second look." } },
    _none = { { id = "tp_none", text = "Do I look like a librarian? Ask in the Hall o' Explorers." } },
  },
}

-- Bilban Tosslespanner: gnome warrior trainer; talks like an engineering manual.
P:NPC {
  key = "bilban", id = TODO_NPC("Bilban Tosslespanner"), name = "Bilban Tosslespanner", title = "Warrior Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "practical", "proud" },
  notices = { "class" },

  impression = {
    first = "Bilban Tosslespanner explains swordplay as if it were a faulty machine to be repaired. I understood perhaps half, but he was very sure of all of it.",
    third = "{name} met Bilban Tosslespanner, a gnome warrior trainer in the Hall of Arms who talks about combat like an engineer.",
  },

  greetings = {
    { id = "g_spec", text = "Greetings. Please state your class specification and the nature of your inquiry." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Ah, a warrior unit, returning for calibration. Excellent." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Due to incompatibility in your class specification, I am unable to train you. I can, however, recommend that you stand behind someone I have trained." },
    { id = "n_gnome_war", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome warrior! Low center of gravity, excellent; most opponents' guards are calibrated for a target twice your height." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The switching, mostly, because every shift costs you a moment, and a moment is when the blow lands. Choose a shape for the fight and commit to it, and you'll be much harder to kill." } },
      choices = {
        { text = "Sound advice. Commit to a shape and hold the line.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Changing is my strength. A fixed fighter is predictable.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, quite simply: your weak point is the gap between your rifle and your beast, where an enemy can close before you've reloaded. Close the gap with footwork and a sharp knife, and you'll be a much better-tuned machine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a remarkable piece of engineering, by the way, even if nobody designed it, which I find unsettling." },
      },
      choices = {
        { text = "Footwork and a knife, then. I'll practise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll trust my beast to close the gap.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've no idea, but it's happened four times this year, and three of them were trying to get into the Military Ward's armory from above. I've since fitted the dummies with a squeaker, which works very well." } },
      choices = {
        { text = "I'll leave your armory alone, Bilban. Your squeakers are safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Four attempts? Then the armory clearly needs a better design.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "An imp set fire to a practice target last spring, and the target was made of compressed sawdust, so I'll leave you to calculate the result. It was a very instructive afternoon, though not for the reasons I'd hoped." } },
      choices = {
        { text = "I'll keep the imp well away from your machines.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sawdust targets were a poor design choice, Bilban.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I've tried, and the results were inconsistent, which annoys me more than I can say. A priest healed one of my students from very nearly dead in four seconds, and I've no formula for that, so I've filed it under 'anomalies, beneficial'." } },
      choices = {
        { text = "Some things can't be measured, Bilban. That's what faith means.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep measuring. Everything has a formula, given time.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In theory, yes, but the paladins I've calibrated keep stopping mid-drill to help whoever fell over, which wrecks my timings. Efficient combat says leave the fallen until the drill's done, but I've stopped arguing with them about it." } },
      choices = {
        { text = "A paladin always helps the fallen. That's the whole point, Bilban.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your drill is right. Win first, help the fallen after.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Good day, Bilban.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Your class specification is incompatible with my curriculum, but your healing output has saved several of my students, so I'm statistically grateful." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! An armoured unit with a self-repair function, which is, I'll admit, a very elegant design." },
        { id = "h_default", text = "Bilban Tosslespanner, warrior trainer. I correct deficiencies in combat technique, much as one corrects a misaligned gear, though with more shouting." },
        { id = "h_other", when = { ["not"] = { class = "WARRIOR" } },
          text = "Due to incompatibility in your class specification, I'm unable to help you rectify any lack of ability. I am, however, able to talk, so do proceed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! Statistically speaking, rogues are the most likely to try climbing the training dummies, so please don't." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'll warn you that the Military Ward's equipment isn't rated for demonic interference, so please keep your companion off my machines." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! A ranged unit with an organic support module, if I'm not mistaken. Fascinating." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You present a fascinating combat problem, since your stance changes with your shape, and I have several theories about it." },
      },
      again = {
        { id = "h_again", text = "Further inquiries? Please proceed." },
        { id = "h_again2", text = "Next item on the agenda?" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Why does a gnome take up arms?", next = "why" },
        { text = "Combat is like engineering?", next = "engineering" },
        { text = "Calibrate me, Bilban. Where am I weakest?", next = "calib", when = { class = "WARRIOR" } },
        { text = "Why not engineering, like the rest of us?", next = "gnome", when = { race = "Gnome", ["not"] = { class = "WARRIOR" } } },
        { text = "Why would a rogue climb your training dummies?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has a demon ever damaged your machines, Bilban?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How would you calibrate a hunter, Bilban?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you measure the Light in your calculations, Bilban?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could you train a paladin to fight better, Bilban?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you correct in a druid's way of fighting?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Good day, Bilban.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because the troggs did not wait for us to finish our calculations. A great many gnomes learned to fight on the way out of Gnomeregan, and some of us found we had an aptitude." },
      },
      choices = {
        { text = "Every gnome should learn to fight now.", next = "BACK", fx = { align = { order = 1 }, learn = { "gnomeregan" } } },
        { text = "Gnomes should build, and leave fighting to others.", next = "BACK", fx = { align = { order = -1 }, learn = { "gnomeregan" } } },
        { text = "How did you learn?", next = "why_learn" },
      },
    },
    why_learn = {
      lines = {
        { id = "wl_default", text = "Badly, at first, and then from Kelstrum, who shouted at me until I improved. I have since refined his method by adding diagrams, which he does not appreciate." },
      },
      choices = { { text = "I'd like to see the diagrams.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    engineering = {
      lines = {
        { id = "en_default", text = "Exactly like it. Every guard has a tolerance, every swing has a load limit, and every opponent has a weak bolt somewhere, so a warrior's task is to find the bolt." },
      },
      choices = {
        { text = "Strike the weak bolt first, whatever it takes.", next = "BACK", fx = { align = { honor = -1 }, trait = { practical = 1 } } },
        { text = "I'd rather beat them fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "And my weak bolt?", next = "bolt" },
      },
    },
    bolt = {
      lines = {
        { id = "bo_default", text = "Your left side, at present; you favor it when you stand. I'd charge a fee for that diagnosis, but I'm told the Hall of Arms frowns on it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    calib = {
      lines = {
        { id = "ca_default", text = "Your recovery after a missed swing is slow by nearly half a second, which in a fight is the length of a sentence. The fix is to stop admiring your own swing and plan the second one before the first has landed." },
        { id = "ca_rear", when = { origin = "gnome_rearguard" },
          text = "You fight like someone who learned in a corridor with no room behind them, which is efficient but narrow. I have a diagram for open ground, and you are going to look at it." },
      },
      choices = {
        { text = "I'll drill until it's gone.", next = "calib_drill" },
        { text = "A diagram won't win a fight, Bilban.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Your method works. I'll follow it to the letter.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    calib_drill = {
      lines = {
        { id = "cd_default", text = "Excellent, and do it slowly first, because speed is merely accuracy repeated. Kelstrum will tell you to do it fast and loud, and you may do that after you have done it correctly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Because a gear does not care whether you are frightened, and a trogg very much does, and I discovered I could use that. You chose a different specification yourself, so you understand that the old plans did not survive Gnomeregan." },
        { id = "gn_mage", when = { class = "MAGE" },
          text = "Because I failed my first-year arcana examination twice, and the second time I set the examiner's beard alight. You passed yours, clearly, so you will appreciate that the Hall of Arms is a great deal less flammable." },
      },
      choices = {
        { text = "Every gnome should still learn to fight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We're builders. Fighting is a detour.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I have catalogued a number of facts, of varying reliability. Select one." } },
    background = { { id = "tp_bg", text = "I left Gnomeregan with the rest, learned to fight, and now I train others to do it more efficiently. That is the summary." } },
    advice = { { id = "tp_ad", text = "Check your equipment's tolerances before a fight, not during. During is very inconvenient." } },
    _none = { { id = "tp_none", text = "That falls outside my area of specification." } },
  },
}

-- Daera Brightspear: dwarf hunter trainer; sends young dwarf hunters to Grif Wildheart in Kharanos.
P:NPC {
  key = "daera", id = TODO_NPC("Daera Brightspear"), name = "Daera Brightspear", title = "Hunter Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "steady" }, values = { "practical", "patient" },
  notices = { "pet" },

  impression = {
    first = "Daera Brightspear looked at my companion before she looked at me, which I suppose is how hunters say hello. She speaks plainly and seems to trust beasts more than people.",
    third = "{name} met Daera Brightspear, a dwarf hunter trainer in the Hall of Arms.",
  },

  greetings = {
    { id = "g_hunt", text = "If ye're no' a hunter, I cannae help ye wi' trainin'. If ye are, come in an' let's have a look at ye." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "An' who's this, then? Let me see yer beast first; ye can wait." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet}, is it? That's a good name, an' the beast'll answer tae it as long as ye feed it, an' longer, if ye're kind." },
    { id = "n_priest", cat = "pet", when = { class = "PRIEST" },
      text = "A priest in the Hall o' Arms. Ye'd make a fair hunter, I think; ye already know how tae keep somethin' alive that'd rather bite ye." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tae watch before ye charge, for a beast tells ye everythin' wi' its ears an' its tail before it moves. Most warriors I meet see a bear an' run at it, an' the bear always knew they were comin'." } },
      choices = {
        { text = "I'll watch first, then strike.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Watching's for hunters. I'll charge and see.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "In the high snows, aye, both trackin' the same trolls for different reasons. I've no quarrel wi' yer trade, so long as ye don't track my students' beasts back tae their stables." } },
      choices = {
        { text = "I'd never harm a hunter's companion. That's beneath me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast is a beast, Daera. It's only a tool.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, an' the second time the wolf never quite forgave anyone. Ye've power enough tae change a creature's shape, an' I'd thank ye tae save it for the Frostmane." } },
      choices = {
        { text = "I'll save my spells for the enemy, Daera.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sheep's harmless enough. It wears off.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not quite. A hunter takes a companion an' keeps it close, while a druid lets the wild run free an' walks beside it. Both ways can be honest, if the heart's right." } },
      choices = {
        { text = "A beast should be free, not leashed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A well-kept companion lives longer than a wild one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It can, though most priests don't think tae try, for they're used tae patchin' up dwarves who complain. A beast won't thank ye, but it'll remember ye, an' that's worth more than thanks, if ye ask me." } },
      choices = {
        { text = "Every living thing deserves healing. Beasts as much as dwarves.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers are for people first. Beasts can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tell me about the beasts instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Like a friend, an' no' like a tool, for a beast that fears ye will throw ye when it matters most. I've seen paladins who treat their chargers like their swords, an' I've seen what happens tae them when the fightin' starts." } },
      choices = {
        { text = "A loyal mount deserves loyalty back. I'll treat it well.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mount is a mount. It carries me where I need to go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Daera.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Aye, as different as a friend is from a prisoner, for a hunter's beast stays because it wants tae. Yers stays because ye've a chain on it, an' the day that chain slips, ye'll learn what it thought o' ye all along." },
      },
      choices = {
        { text = "You're right. I'll never trust it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A chain is honest. Loyalty can lie.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll no' be wantin' trainin' from me, but if ye've a moment, my rams have been off their feed, an' I'll take any blessin' I can get." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll be ridin' a charger one day, I expect, an' I'll be curious tae see how ye treat it." },
        { id = "h_default", text = "Daera Brightspear. I train hunters here, an' if ye're no' one, ye'll want tae look for yer own kind o' trainer, though I'll answer a question if ye've one." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunter's Path") },
          text = "Grif Wildheart's waitin' for ye in Kharanos. He'll put ye on the path tae a beast o' yer own, an' mind ye listen tae him; he's never been wrong about an animal." },
        { id = "h_hunter_young", when = { class = "HUNTER", maxLevel = 12 },
          text = "A young hunter, an' ye've no' got a beast yet, have ye? Go an' see Grif Wildheart in Kharanos; he'll know when ye're ready." },
        { id = "h_hunter_beast", when = { class = "HUNTER", pet = { type = "Beast" } },
          text = "Let me see that beast o' yers before ye say a word; it'll tell me more about how ye've been huntin' than ye will. Good, it's fed an' it's no' limpin', so ye're doin' somethin' right." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Ye'll know the beasts as well as any hunter, though ye'd rather become one than tame one, I'd wager." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the hunters' corner? Ye move well, I'll grant ye, but a hunter's beast would smell ye a mile off." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' I'll ask ye no' tae turn any o' my students' beasts intae sheep. It confuses them for days." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye'll be lookin' for Kelstrum, then, though I'll answer a question if ye've one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. My beasts have their hackles up, an' I'd say that's yer companion they're lookin' at, no' you." },
      },
      again = {
        { id = "h_again", text = "Anythin' else?" },
        { id = "h_again2", text = "Go on, then, ask." },
      },
      choices = {
        { text = "Do hunters and druids see the beasts the same way?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you choose a beast?", next = "beast" },
        { text = "Who's Grif Wildheart?", next = "grif" },
        { text = "Have a look at my beast, Daera.", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Humans don't take the bow much, they tell me.", next = "human", when = { race = "Human", class = "HUNTER" } },
        { text = "I ride a nightsaber at home, Daera.", next = "elf", when = { race = "NightElf", class = "HUNTER" } },
        { text = "Why do dwarves keep rams?", next = "rams" },
        { text = "Do hunters and rogues often cross paths?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has a mage really turned a hunter's beast into a sheep?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would a hunter teach a warrior, Daera?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a priest's healing help a wounded beast, Daera?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should a paladin treat a mount, Daera?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a demon so different from a hunter's beast, Daera?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    beast = {
      lines = {
        { id = "be_default", text = "Ye don't, mostly; it chooses ye, an' ye find out by how much it bites. A bear's loyal, a cat's clever, an' a boar's too stubborn tae know when it's beaten, which makes it a dwarf's favorite." },
      },
      choices = {
        { text = "A beast should obey its master.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A beast is a partner, not a servant.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grif = {
      lines = {
        { id = "gr_default", text = "A hunter in Kharanos who teaches the young ones how tae tame their first beast. He's patient wi' animals an' short wi' people, so ye'll get on fine if ye bark." },
      },
      choices = {
        { text = "I'll bark politely.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "pe_default", text = "Good coat, clear eyes, an' it's watchin' me instead o' ye, which means it thinks I'm the danger here. That's a beast that knows its job, so feed it well an' it'll keep doin' it." },
        { id = "pe_bear", when = { origin = "dwarf_bear_tracker" },
          text = "Ye've tracked bears in the high snows, I can see it in how ye stand next tae this one, a hand off its shoulder an' never in front o' its face. Who taught ye that, an' did they keep all their fingers?" },
      },
      choices = {
        { text = "I let it eat first, always.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "It obeys because I'm the stronger one.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "It stays with me because it chooses to.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "How do I train it better?", next = "pet_train" },
      },
    },
    pet_train = {
      lines = {
        { id = "pt_default", text = "Ye don't train it so much as agree on things wi' it, one at a time, an' never two in a day. Grif Wildheart says the same, only shorter an' wi' more growlin'." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    human = {
      lines = {
        { id = "hu_default", text = "They tell ye right; I've trained more Darnassians than Stormwinders, an' most humans I see wi' a bow are poachers or soldiers. So who put a bow in yer hand, an' what made ye want a beast at yer side instead o' a squad?" },
        { id = "hu_eastvale", when = { origin = "human_eastvale_woodsman" },
          text = "Eastvale, is it? I've heard o' the woodsmen there; they hunt the wolves an' the bears, an' they know the forest better than the Stormwind lads. Ye'll do well, as long as ye remember a mountain isnae a forest." },
      },
      choices = {
        { text = "A squad leaves you. A beast doesn't.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Somebody had to, so it may as well be humans.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Do dwarves look down on human hunters?", next = "human_look" },
      },
    },
    human_look = {
      lines = {
        { id = "hl_default", text = "We look down on everyone, it's a matter o' height. But the beast decides if ye're a hunter, no' me an' no' the Ward, an' that one o' yers seems tae have decided." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elf = {
      lines = {
        { id = "el_default", text = "I've seen a few o' those cats come through the gates, an' every ram in the stables goes quiet. A sabercat on the snow's a different beast from one in yer forests, so mind its paws on the ice, they're no' made for it." },
        { id = "el_rider", when = { origin = "nightelf_nightsaber_rider" },
          text = "Ye ride them, ye said, no' just hunt beside one. The Sentinels' cats are a different breed from the wild ones, I'm told, an' I'd give a month's pay tae see how ye train them." },
      },
      choices = {
        { text = "My saber will learn the ice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Our ways would work on your rams.", next = "BACK", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rams = {
      lines = {
        { id = "ra_default", text = "Because they're the only beast in Dun Morogh as stubborn as we are, an' they'll climb where a horse would sit down an' weep. Veron Amberstill breeds the best o' them out past Kharanos, an' he'll tell ye so himself." },
      },
      choices = {
        { text = "Is a ram a fit companion for a hunter?", next = "rams_pet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rams_pet = {
      lines = {
        { id = "rp_default", text = "For ridin', aye, but no' for huntin'; a ram'll butt yer quarry an' then wander off tae eat the bushes. Take a bear or a boar from the hills if ye want somethin' that'll stay." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hunters bring news in from the hills along wi' the pelts. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "I train hunters in the Hall o' Arms. My own story's mostly about cold mornin's an' patient beasts." } },
    advice = { { id = "tp_ad", text = "Feed yer beast before ye feed yerself. It remembers who did." } },
    _none = { { id = "tp_none", text = "No' my trade, I'm afraid. Try someone wi' books." } },
  },
}
