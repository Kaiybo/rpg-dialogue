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
    first = "She waits for news of her husband Sully and questions every traveler.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Would ye? I know it's foolish, an' the priests say I should pray an' wait like everyone else. But if the earth runs all the way tae the Thandol Span an' he's standin' on it, then maybe it could tell ye he's still standin'. I'd take any word at all." } },
      choices = {
        { text = "I'll listen carefully and tell you only what I hear.", next = "BACK", reply = "Thank ye, truly, an' I'd rather hear nothin' honest than somethin' kind an' false, so listen well, an' tell me whatever the stone says.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell you he's well. That's what you need to hear.", next = "BACK", reply = "Ye mean it kindly, an' I'll no' scold ye for it, but I'd know a comfortin' lie when I heard one, an' then I'd worry twice as hard.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I have, but the gryphon masters fly where the King tells them, an' a soldier's wife isnae the King. I'd go myself if I knew how tae ride one wi'out fallin' off." } },
      choices = {
        { text = "Ask the gryphon masters properly. They may grant it.", next = "BACK", reply = "I'll try again, then, an' wear my good shawl, an' maybe the gryphon master will take pity on a soldier's wife this time.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Don't wait for permission, Sara. Find a rider who'll go.", next = "BACK", reply = "Och, don't tempt me, for I've half a mind tae do it, an' Sully would be furious, but at least he'd be furious in person.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, an' a good one, though he'd say so himself before anyone else could. His last letter said the Dark Irons press them hard by the Span an' they need every shield they can get, so if ye go north, they'd be glad o' yours." } },
      choices = {
        { text = "I'll go north and stand beside him.", next = "BACK", reply = "Would ye? Then tell him his wife says tae keep his head down an' his beard dry, an' tae write more than four words at a time.", fx = { align = { honor = 1 } } },
        { text = "I'll go where the pay's better than the Wetlands.", next = "BACK", reply = "Well, that's yer business, I suppose, but if ye ever pass the Span on yer way tae better pay, look for a broad dwarf laughin' too loud.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Just that he's well, an' eatin', an' no' doin' anythin' daft, for he's a dwarf who'd charge a red dragon if it insulted his beard. Ye'll know him by his voice before ye see him, I promise ye." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Just that he's well, an' eatin', an' no' doin' anythin' daft, for he'd charge a red dragon if it insulted his beard. Yer {pet} might find him first, for he always smells o' boot grease an' gun oil, the great lump." },
      },
      choices = {
        { text = "I'll find him and bring you word, Sara.", next = "BACK", reply = "Bless ye, an' tell him tae eat proper, an' tae stop chargin' things that are bigger than him, though I know he willnae listen.", fx = { align = { honor = 1 } } },
        { text = "I'll look, but I won't go out of my way.", next = "BACK", reply = "That's fair, an' I'll no' ask more, but if ye happen tae be near the Span, I'd be grateful for any word at all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because ye go where the soldiers dinnae, an' ye listen where they talk. If ye ever hear Sully's name on the wind, I'd be grateful tae know it, good or bad, for the not knowin' is the worst o' it." } },
      choices = {
        { text = "I'll listen for his name and bring you the truth.", next = "BACK", reply = "Thank ye, I mean it. The not knowin' is worse than any truth, an' ye've a way o' hearin' things the post doesnae.", fx = { align = { honor = 1 } } },
        { text = "I'll bring you good news, Sara, whatever I actually hear.", next = "BACK", reply = "I'd rather ye didnae, for I'd know, an' then I'd never trust good news again, an' that would be the cruellest thing ye could do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It can, but the roads through the Wetlands are thick wi' Dark Iron raiders, an' a good third o' the post never arrives. I know a spell's no' the King's mail, but a worried wife will try anythin' twice." } },
      choices = {
        { text = "Use the King's post, Sara. It'll get there in time.", next = "BACK", reply = "Aye, I know it, an' I'll wait like everyone else, but I'll be checkin' the postbox twice a day while I do.", fx = { align = { order = 1 } } },
        { text = "Rules be hanged. I'd find a faster way for you.", next = "BACK", reply = "Ye're kind tae say it, an' I'd take ye up on it if I could, but I'll no' have ye in trouble wi' the guards for my sake.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd take news from a trogg if it had seen my Sully, an' I'm past carin' who brings it. The folk in the Ward look at ye sideways, I know, but they look at me sideways too these days, for askin' every stranger the same question." },
      },
      choices = {
        { text = "If I hear anything, I'll bring it straight to you.", next = "BACK", reply = "Thank ye. Let them whisper; the folk who look at us sideways have never once brought me a letter.", fx = { align = { honor = 1 } } },
        { text = "I've no time for other people's husbands.", next = "BACK", reply = "No, I suppose no', an' I'll no' hold it against ye, for everyone's got their own waitin' tae do in this Ward.", fx = { align = { honor = -1 } } },
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
          text = "I've read his letter so often the ink's goin' soft. He wrote it in case he didnae come home, ye see, an' then he didnae, so he was right tae write it." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Have ye been anywhere near the Thandol Span? I'll ask anyone, even one wi' eyes as cold as yours, for I've had no word from Sully in too long." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! They say ye can hear things far off through the stone. Could ye hear my Sully at Dun Modr, if ye listened hard enough?" },
      },
      again = {
        { id = "h_again", text = "Is there somethin' else? I've nowhere I need tae be today." },
        { id = "h_again2", text = "Go on. It's good tae talk." },
      },
      choices = {
        { text = "Tell me about Sully.", next = "sully" },
        { text = "What's happening at the Thandol Span?", next = "span" },
        { text = "The days must be long, waiting for news.", next = "days" },
        { text = "What did the King say?", next = "king", when = { questDone = TODO_QUEST("Sara Balloo's Plea") } },
        { text = "Would you like me to pray with you?", next = "pray", when = { class = "PRIEST" } },
        { text = "I'm a soldier too, Sara.", next = "soldier", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Why would a rogue hear news of Dun Modr first?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can't the post carry your letter to Dun Modr?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is your Sully a warrior too, Sara?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What news would you want me to bring from Dun Modr?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you thought of sending word to Dun Modr by gryphon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you really take news from someone like me, Sara?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Shall I ask the stone after your Sully, Sara?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Take care, Sara.", next = "END" },
      },
    },

    sully = {
      lines = {
        { id = "su_default", text = "He's a soldier, an' a believer in what he's sent tae do, an' I've met precious few o' those. He writes every fortnight, an' every letter begins the same way, 'My dear Sara', as if I might've forgotten who I was." },
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
        { text = "He was right; someone has to stand there.", next = "BACK", reply = "Aye, that's what he'd say, an' he'd be right, but I'd still rather he was standin' somewhere a wee bit closer tae home.", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "You were right; no bridge is worth a husband.", next = "BACK", reply = "Thank ye for that, for nobody in this Ward will say it aloud, an' it does my heart good tae hear someone take my side for once.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "The Dark Irons will answer for this bridge.", next = "BACK", reply = "Aye, they will, an' I hope ye're the one who makes them, but bring my Sully home first, an' then ye can have yer vengeance.", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "thandol_span" } } },
        { text = "Vengeance won't bring anyone home.", next = "BACK", reply = "No, it won't, an' I know that better than anyone, but it would be nice tae know somebody was makin' them pay for my sleepless nights.", fx = { align = { honor = -1 }, trait = { kind = 1 }, learn = { "thandol_span" } } },
      },
    },

    days = {
      lines = {
        { id = "da_default", text = "I keep the house, an' I walk the Ward, an' I go up tae the gates when a courier's due. Some evenin's Brother Toldren lets me sit in the back o' the Hall o' Mysteries, an' doesnae ask me anythin', which is a mercy." },
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
        { id = "dw_default", text = "It is, an' everyone in the Military Ward knows it. Every other door on this street has someone waitin' behind it, an' we nod tae each other in the mornin' an' don't say a word." },
      },
      choices = {
        { text = "Families like yours carry this war too.", next = "BACK", reply = "Thank ye for seein' it, for most folk only see the soldiers, an' they forget about the ones countin' the days at home.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "It's the price of keeping Khaz Modan safe.", next = "BACK", reply = "Aye, it is, an' I pay it willin'ly, most days, but some mornin's it feels like I'm the only one in Khaz Modan still payin'.", fx = { align = { order = 1 }, affinity = -1 } },
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
        { text = "The King honored him rightly.", next = "BACK", reply = "He did, an' I'll no' say otherwise, for a memorial's a kindness, but I'd rather the King's sigh had come wi' more soldiers for the Span.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A stone is small payment for a life.", next = "BACK", reply = "It is. But it's the only payment there is, an' I'd sooner have it than nothin' at all.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "Silence can be a prayer too.", next = "BACK", reply = "Aye, it can, an' this one's a good one, so just sit a while longer, an' we'll say nothin' together for Sully.", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Sometimes words help more than silence.", next = "BACK", reply = "Maybe they do, an' maybe I'll want them tomorrow, but today I've had my fill, so let's just sit a moment, if ye dinnae mind.", fx = { align = { light = -1 } } },
      },
    },
    soldier = {
      lines = {
        { id = "sd_default", text = "Then ye'll have someone waitin' for ye an' all, somewhere, askin' strangers the same question I ask. Write tae them, will ye, even a line, for I've learned what a line weighs." },
        { id = "sd_ward", when = { origin = "dwarf_military_ward" },
          text = "Ward-born, are ye? Then ye'll know my Sully, or know o' him; he drilled under Kelstrum Stonebreaker in the Hall o' Arms afore they sent him tae the Span." },
      },
      choices = {
        { text = "I'll write to you, I promise.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
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
    scourge = { { id = "tp_scourge", text = "Sully writes that the Wetlands are safe enough, but Lordaeron's just across the water, an' I've heard what's there. I light a candle every night an' try no' tae think on it." } },
    stromgarde = { { id = "tp_stromgarde", text = "Sully's letters say Refuge Pointe is all tents an' brave faces, an' the Highlands are crawlin' wi' trolls an' ogres. I'd bring him home if I could, an' he'd never come." } },
    holy_light = { { id = "tp_holy_light", text = "I pray tae the Light every evenin' in the Mystic Ward, an' I ask it fer one thing only. It's no' answered yet, but it's no' said no, either." } },
    _none = { { id = "tp_none", text = "I'm sorry, I couldnae say. Ask someone in the Hall o' Arms; they know about such things." } },
  },
}

-- Kelstrum Stonebreaker: warrior trainer; scoffs that non-warriors wouldn't last a day of his regimen.
P:NPC {
  key = "kelstrum", id = TODO_NPC("Kelstrum Stonebreaker"), name = "Kelstrum Stonebreaker", title = "Warrior Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "stern", "brave" },
  prejudice = { class = "WARLOCK", amount = 11, why = "Old soldier; lost his company to orcs with warlocks at their backs in the Second War." },
  notices = { "class" },

  impression = {
    first = "He said I wouldn't last a day under him, and laughed.",
    third = "{name} met Kelstrum Stonebreaker, a loud warrior trainer in the Hall of Arms.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "Brimstone in my yard again. I know what ye are, an' I'll no' have my recruits thinkin' it's welcome here." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I fought orcs who had warlocks behind 'em, an' I'll no' forget how that went. What d'ye want?" },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "Ye've trained here an' kept yer beasts out o' my yard. I'll no' cheer for ye, but I'll stop growlin'." },
    { id = "g_ha", text = "Ha! Another one wanderin' intae the Hall o' Arms. State yer business, an' stand up straight while ye do it." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Back for more punishment? Good; punishment's what makes a warrior." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest in the Hall o' Arms! Ye'd no' last a day under my regimen, but I'll grant ye this: I'd want ye behind me in a fight, so don't let anyone tell ye different." },
    { id = "n_human_war", cat = "class", when = { class = "WARRIOR", race = "Human" },
      text = "A human warrior. Ye're taller than my usual lot, so ye'll be gettin' hit in the head more; mind yer helmet." },
    { id = "n_gnome_war", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome warrior! Bilban, the gnome who trains alongside me, says ye're all the best at gettin' under a guard, an' I'll admit he has a point, low as it is." },
    { id = "n_dwarf_war", cat = "class", when = { class = "WARRIOR", race = "Dwarf" },
      text = "A dwarf warrior, standin' like the Ward taught ye, more or less. Shoulders back; ye're no' carryin' a keg." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "One o' Brandur Ironhammer's paladins, by the shine on ye. Mind ye don't blind my students, for they've enough trouble seein' a punch comin'." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd train anyone who can stand straight an' take orders, which most shamans I've met cannae. They want tae stop in the middle o' a charge an' ask the wind its opinion. If ye can keep in line an' save yer chattin' wi' the elements for after the fight, I'll make somethin' o' ye." } },
      choices = {
        { text = "I'll keep the line, Kelstrum. Orders first.", next = "BACK", reply = "Good answer, an' ye'll last longer in my yard than most, which isnae sayin' much, but it's a start.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind's opinion has saved more lives than your orders.", next = "BACK", reply = "Has it now? Then ye'd best ask it tae fight for ye in my yard, for I'll be askin' ye tae do a hundred swings either way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd train the bear, aye, an' I'd shout at it the same as I shout at the rest. A bear that knows how tae hold a line is worth three dwarves who don't." } },
      choices = {
        { text = "Discipline sharpens even a beast's instincts. Train me.", next = "BACK", reply = "That's what I like tae hear, an' I'll shout at ye just as loud as I shout at the rest, bear or no bear.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A bear needs no drillmaster. Instinct is enough.", next = "BACK", reply = "Instinct gets ye killed when the trolls fight smarter than ye, so come back when ye've learned what a drill is good for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plenty, for the day yer beast falls an' the bear's still standin', ye'll want tae know how tae take a blow. Come tae the yard an' I'll knock ye down a few times, an' ye'll thank me in the high snows." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Plenty, for the day yer beast falls an' the bear's still standin', ye'll want tae know how tae take a blow. Mind, that {pet} o' yours has more fight in its eyes than half my recruits." },
      },
      choices = {
        { text = "I'll take the training. Every hunter should stand firm.", next = "BACK", reply = "Then I'll knock ye down gentle the first time, an' a wee bit less gentle every time after. That's how it's learned.", fx = { align = { order = 1 } } },
        { text = "A good hunter never lets the bear get that close.", next = "BACK", reply = "That's what they all say, right up until it does, an' then they're in my yard learnin' tae stand up again, so come anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "On the field, aye, though no warrior likes admittin' it. Ye throw the fire an' we stand in front o' ye so ye can, an' the best mages I've known never forgot which half o' the bargain was bleedin'." } },
      choices = {
        { text = "I'll never forget who stands in front of me, Kelstrum.", next = "BACK", reply = "The warriors who stand in front o' ye will remember it. They fight harder for a mage who doesnae forget them.", fx = { align = { honor = 1 } } },
        { text = "The warriors are paid to bleed. That's their trade.", next = "BACK", reply = "They are. But they'll bleed slower for a mage who thanks them, an' ye'll learn that eventually.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Fear it? They'd charge it, which is worse, for they've been taught tae charge anythin' wi' horns. I'd rather they learned on dummies than on that thing o' yours." } },
      choices = {
        { text = "I'll keep it out of the yard. Your recruits come first.", next = "BACK", reply = "Thank ye, for my recruits charge enough things already without me givin' them reasons tae charge somethin' that bites back.", fx = { align = { light = 1 } } },
        { text = "Let them charge it. They'd learn faster that way.", next = "BACK", reply = "Faster, aye, an' then I'd be explainin' tae their mothers why they're short a hand, so keep yer pet at home.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "After trainin', durin' trainin', an' sometimes before, when they've seen the regimen written on the wall. I'll no' go soft on them, mind, for the Dark Irons won't, but I'll admit a priest in the yard saves me a few recruits a season." } },
      choices = {
        { text = "Then I'll stand in your yard. Nobody should break for want of healing.", next = "BACK", reply = "Then ye'll be welcome, an' my recruits will be glad o' ye, though they'll still curse my name every mornin' at the same time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Recruits who need healing in training aren't ready for real war.", next = "BACK", reply = "Maybe they're no', an' that's why they're in my yard, but they'll be more ready wi' a priest healin' them than without.", fx = { align = { light = -1 } } },
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
          text = "A mage in the Military Ward. Ye'd no' last a day o' my training, I'd wager, but I've seen fire win battles an axe couldnae." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I lost half my company in the Second War tae orcs wi' Gul'dan's warlocks at their backs. I'll train anyone the King sends me, but I'll no' pretend I like it." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Ye fight well enough, I'll give ye that, an' ye've kept yer filth tae yerself. Go on, then, what is it?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've brought a smell o' brimstone intae the Military Ward! I'd ask ye tae keep yer creatures out o' my yard, for my recruits have enough tae worry about." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Ye'll be soft from lettin' yer beast do the fightin', but I'll no' hold it against ye." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Ye wouldnae last a day under my regimen either, though I'll admit the bear might." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I've trained warriors for longer than ye've been alive an' never once had yer kind come through, so dinnae expect me tae know what tae do wi' ye." },
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
        { text = "Do warriors and mages really need one another?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would your recruits really fear what follows me, Kelstrum?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "A hunter could learn plenty from your warriors, Kelstrum.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your recruits ever need a priest after training, Kelstrum?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you train a druid who fights as a bear?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you train a shaman to hold the line, Kelstrum?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    regimen = {
      lines = {
        { id = "re_default", text = "Up before the forges, a hundred swings wi' a practice axe, a run tae the gates an' back, then sparrin' till ye cannae lift yer arms. Then we start the real work." },
      },
      choices = {
        { text = "Discipline makes the warrior.", next = "BACK", reply = "That it does, an' ye'll be a warrior by the end o' it, or ye'll be carried out, an' either way ye'll have learned somethin'.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Real fights don't follow a drill.", next = "BACK", reply = "No, they dinnae, an' that's why we drill till ye cannae lift yer arms, so ye've still got somethin' left when the fight ignores the plan.", fx = { align = { order = -1 } } },
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
        { text = "Standing in front is an honor.", next = "BACK", reply = "It is. Most o' my recruits only learn that after they've watched someone die for want o' a shield.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Winning matters more than where you stand.", next = "BACK", reply = "Winnin' matters, aye, but ye'll no' win much if the healer behind ye is dead, so mind where ye stand for her sake.", fx = { align = { honor = -1 } } },
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
        { text = "Two hands. The fight ends faster.", next = "BACK", reply = "Ha, I knew ye had a temper in ye, an' I'll teach ye tae use it, but mind ye dinnae leave the shield-bearers tae do all the bleedin'.", fx = { align = { honor = -1 } } },
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
        { id = "pa_default", text = "Hold it, aye, an' then stop tae pray over the fella beside ye, an' the line's got a hole in it. I'm teasin' ye, mostly; Brandur Ironhammer's paladins are the only ones who come in here an' don't flinch when I shout." },
        { id = "pa_dwarf", when = { race = "Dwarf" },
          text = "Hold it, aye, wi' a hammer in one hand an' the Light in the other, an' I'll admit I've seen dwarves o' the Silver Hand hold the Span when my own lads broke. Don't tell Brandur I said so." },
      },
      choices = {
        { text = "Faith is what keeps the line standing.", next = "BACK", reply = "Aye, Brandur's lot have held more lines than I can count. I'll keep my teasin' for Brandur himself.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Steel holds the line. The prayer's for after.", next = "BACK", reply = "That's a warrior's answer, an' I'll take it, for a paladin who swings first an' prays after is welcome in my yard any day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rg_default", text = "Nobody fights fair once they've been in a real fight, so ye've just learned it sooner than most. I'll say this, though: my warriors take the blows so ye can get round the back, an' ye'd best make it count when ye get there." },
      },
      choices = {
        { text = "Fair fights are for people who expect to lose.", next = "BACK", reply = "Ha! Maybe so. But fair fights are what keep the rest o' us alive while ye're off gettin' round the back.", fx = { align = { honor = -1 } } },
        { text = "I'll make it count, and I'll thank the shield.", next = "BACK", reply = "My warriors will be glad tae hear it. They rarely get thanked by anybody who isnae a healer.", fx = { align = { honor = 1 }, affinity = 2 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear a fair bit from the soldiers comin' back through the Ward. Here's what's worth knowin'." } },
    background = { { id = "tp_bg", text = "I train warriors in the Hall o' Arms. That's my story, an' it's got a lot o' shoutin' in it." } },
    advice = { { id = "tp_ad", text = "Get up. Whatever knocks ye down, get up before it comes back for a second look." } },
    second_war = { { id = "tp_second_war", text = "The Second War taught me that soldiers who train hard come home, an' soldiers who dinnae, don't. That's the whole o' my regimen." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The troll arena in Stranglethorn's a fine place tae test yer edge, if ye're tired o' livin'. I've sent a few o' my best there, an' they came back meaner." } },
    scourge = { { id = "tp_scourge", text = "Ye'll want a hammer fer the dead, no' a sword, for bones break better than they cut. Learn that here or learn it in the Plaguelands, an' I know which I'd pick." } },
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
    first = "He explains swordplay as if it were a faulty machine.",
    third = "{name} met Bilban Tosslespanner, a gnome warrior trainer in the Hall of Arms who talks about combat like an engineer.",
  },

  greetings = {
    { id = "g_spec", text = "Greetings. Please state your class specification and the nature of your inquiry, in that order, for filing purposes." },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think any crutch makes a fighter lazy, whether it's a shield, a spell or a talking rock. That said, I've no data on shamans, and a gnome without data is a gnome with an opinion, which is a dangerous thing. Come and spar with me sometime and I'll collect some." } },
      choices = {
        { text = "I'll spar with you. Discipline should serve the gift.", next = "BACK", reply = "Splendid, I'll fetch my notebook and a spare helmet, and we'll find out together exactly where the gift ends and the crutch begins.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements aren't a crutch, Bilban. They're my strength.", next = "BACK", reply = "Then I'd very much like to measure that strength, so do stop by the yard, and I'll bring the calipers and a fire bucket.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The switching, mostly, because every shift costs you a moment, and a moment is when the blow lands. Choose a shape for the fight and commit to it, and you'll be much harder to kill." } },
      choices = {
        { text = "Sound advice. Commit to a shape and hold the line.", next = "BACK", reply = "Precisely, and I'll make a note that you understood it on the first explanation, which puts you in the top two percent of my students.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Changing is my strength. A fixed fighter is predictable.", next = "BACK", reply = "Hmm, predictable is a fair point, and I'll add it to my notes, though I suspect your switching costs you more than it gains you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, quite simply: your weak point is the gap between your rifle and your beast, where an enemy can close before you've reloaded. Close the gap with footwork and a sharp knife, and you'll be a much better-tuned machine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, quite simply: close the gap between your rifle and your beast with footwork and a sharp knife, and you'll be a much better-tuned machine. Your {pet} is a remarkable piece of engineering, by the way, even if nobody designed it, which I find unsettling." },
      },
      choices = {
        { text = "Footwork and a knife, then. I'll practise.", next = "BACK", reply = "Splendid, and I'll time you, so we can see whether that gap shrinks by the half-second I've been predicting.", fx = { align = { order = 1 } } },
        { text = "I'll trust my beast to close the gap.", next = "BACK", reply = "That's a sound design, if your beast is reliable, but beasts have a failure rate too, and I'd keep a knife as a backup system.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've no idea, but it's happened four times this year, and three of them were trying to get into the Military Ward's armory from above. I've since fitted the dummies with a squeaker, which works very well." } },
      choices = {
        { text = "I'll leave your armory alone, Bilban. Your squeakers are safe.", next = "BACK", reply = "Thank you, and I'll mark you down as a confirmed non-squeaker, which is a much smaller category than I'd like.", fx = { align = { honor = 1 } } },
        { text = "Four attempts? Then the armory clearly needs a better design.", next = "BACK", reply = "Oh, I completely agree, and I've submitted three proposals, but the Military Ward prefers its doors the old-fashioned way, with dwarves in front.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little horned something set fire to a practice target last spring, and the target was made of compressed sawdust, so I'll leave you to calculate the result. It was a very instructive afternoon, though not for the reasons I'd hoped." } },
      choices = {
        { text = "I'll keep my little companion well away from your machines.", next = "BACK", reply = "Thank you, very sensible, and I'll note that you've been warned, which helps with the paperwork if anything should catch light.", fx = { align = { light = 1 } } },
        { text = "Sawdust targets were a poor design choice, Bilban.", next = "BACK", reply = "I've since replaced them with fireproof straw, which I'm told is a contradiction in terms, but it's the best I've got so far.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I've tried, and the results were inconsistent, which annoys me more than I can say. A priest healed one of my students from very nearly dead in four seconds, and I've no formula for that, so I've filed it under 'anomalies, beneficial'." } },
      choices = {
        { text = "Some things can't be measured, Bilban. That's what faith means.", next = "BACK", reply = "That's precisely the sort of thing a priest says, and it drives me mad, though I'll admit the four seconds were very impressive.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep measuring. Everything has a formula, given time.", next = "BACK", reply = "Thank you, at last someone sensible, and I'll keep measuring until the Light gives me consistent results or a very clear headache.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In theory, yes, but the paladins I've calibrated keep stopping mid-drill to help whoever fell over, which wrecks my timings. Efficient combat says leave the fallen until the drill's done, but I've stopped arguing with them about it." } },
      choices = {
        { text = "A paladin always helps the fallen. That's the whole point, Bilban.", next = "BACK", reply = "I know, I know, and it ruins my timings, but I've added it to the formula as a constant, and the results are oddly better for it.", fx = { align = { light = 1 } } },
        { text = "Your drill is right. Win first, help the fallen after.", next = "BACK", reply = "Splendid, and I'll put that in the drill notes, though I suspect your fellow paladins will argue with you about it at supper.", fx = { align = { light = -1 } } },
        { text = "Good day, Bilban.", next = "BACK" },
      },
    },
    dd_bb_hk = {
      lines = {
        { id = "dd_bb_hk1", text = "I always want to check technique! A hundred victories against the Horde means a hundred chances to learn, and most warriors learn nothing at all, because they think winning is the lesson. Winning is only the result, and the lesson is in the footwork." },
      },
      choices = {
        { text = "Then I'll keep training. Show me the footwork.", next = "BACK", reply = "Excellent! Come back between battles, and we'll correct the left foot first. It's always the left foot.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Winning is the lesson. The footwork takes care of itself.", next = "BACK", reply = "Spoken like a warrior who's been lucky. I'll be here when the luck runs out.", fx = { align = { order = -1 } } },
        { text = "Something else, Bilban.", next = "BACK" },
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
          text = "I'll warn you that the Military Ward's equipment isn't rated for whatever is making my gauges twitch right now, so please keep your companion off my machines." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! A ranged unit with an organic support module, if I'm not mistaken. Fascinating." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You present a fascinating combat problem, since your stance changes with your shape, and I have several theories about it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Unusual. Your stance is adequate, but I suspect you rely on the elements to cover deficiencies in your footwork." },
        { id = "dd_hk", when = { honorKills = { min = 100 }, faction = "Alliance" },
          text = "The battlefield reports put you at over a hundred honorable kills. A fine figure, though I'd want to see the technique behind it before I called it efficient." },
      },
      again = {
        { id = "h_again", text = "Further inquiries? Please proceed." },
        { id = "h_again2", text = "Next item on the agenda?" },
      },
      choices = {
        { text = "A hundred kills, Bilban. Want to check my technique?", next = "dd_bb_hk", when = { honorKills = { min = 100 }, faction = "Alliance" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Why does a gnome take up arms?", next = "why" },
        { text = "Combat sounds a lot like engineering, the way you put it.", next = "engineering" },
        { text = "Calibrate me, Bilban. Where am I weakest?", next = "calib", when = { class = "WARRIOR" } },
        { text = "Why not engineering, like the rest of us?", next = "gnome", when = { race = "Gnome", ["not"] = { class = "WARRIOR" } } },
        { text = "Why would a rogue climb your training dummies?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has anything you couldn't explain ever wrecked your machines, Bilban?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How would you calibrate a hunter, Bilban?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you measure the Light in your calculations, Bilban?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could you train a paladin to fight better, Bilban?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you correct in a druid's way of fighting?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think the elements make a shaman lazy, Bilban?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Bilban.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because the troggs did not wait for us to finish our calculations. A great many gnomes learned to fight on the way out of Gnomeregan, and some of us found we had an aptitude." },
      },
      choices = {
        { text = "Every gnome should learn to fight now.", next = "BACK", reply = "I agree, and I've been saying so for years, though some of the older gnomes still think a spanner is an adequate defensive tool.", fx = { align = { order = 1 }, learn = { "gnomeregan" } } },
        { text = "Gnomes should build, and leave fighting to others.", next = "BACK", reply = "I understand, and I used to think the same, but the troggs didn't wait for us to finish building, and I'd rather not be caught short again.", fx = { align = { order = -1 }, learn = { "gnomeregan" } } },
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
        { text = "Strike the weak bolt first, whatever it takes.", next = "BACK", reply = "Exactly, and I'll show you how to find it in four seconds or less, though you'll have to practise on dummies until you stop flinching.", fx = { align = { honor = -1 }, trait = { practical = 1 } } },
        { text = "I'd rather beat them fairly.", next = "BACK", reply = "Fairly is a lovely concept, and very inefficient, but I'll train you for both, and you can choose which formula suits you best.", fx = { align = { honor = 1 } } },
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
        { text = "A diagram won't win a fight, Bilban.", next = "BACK", reply = "No, but a diagram will tell you why you lost it, and that's worth something, so I'll draw you one anyway and you can frame it later.", fx = { align = { order = -1 } } },
        { text = "Your method works. I'll follow it to the letter.", next = "BACK", reply = "Splendid, and I'll check your timings again next week, because a method followed to the letter is a method I can finally measure.", fx = { align = { order = 1 }, affinity = 2 } },
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
        { id = "gn_default", text = "Because a gear will not run from you, but a trogg will, and I discovered I had a talent for making it. You chose a different path from the workshops yourself, so you understand that the old plans did not survive Gnomeregan." },
        { id = "gn_mage", when = { class = "MAGE" },
          text = "Because I failed my first-year arcana examination twice, and the second time I set the examiner's beard alight. You passed yours, clearly, so you will appreciate that the Hall of Arms is far less flammable." },
      },
      choices = {
        { text = "Every gnome should still learn to fight.", next = "BACK", reply = "I agree completely, and I'll put that in my next pamphlet, though I suspect the engineers will use it to line their toolboxes.", fx = { align = { order = 1 } } },
        { text = "We're builders. Fighting is a detour.", next = "BACK", reply = "A detour, perhaps, but a very useful one, and I'd rather take it than be caught in another Gnomeregan with nothing but a wrench.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I have catalogued a number of facts, of varying reliability. Select one." } },
    background = { { id = "tp_bg", text = "I left Gnomeregan with the rest, learned to fight, and now I train others to do it more efficiently. That is the summary." } },
    advice = { { id = "tp_ad", text = "Check your equipment's tolerances before a fight, not during. During is very inconvenient." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The swordplay I teach was born in Gnomeregan's practice halls, where we learned to fight in tight tunnels with short blades. That's why I'm so good at it, and why the troggs aren't." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "A sword fight is a machine with two moving parts, and the Gurubashi Arena is a machine with too many. I'd study it from the stands, with a notebook and a good deal of distance." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages tried to teach me a ward against blades once, and I found three flaws in it before lunch. They didn't thank me, which I thought was poor engineering etiquette." } },
    _none = { { id = "tp_none", text = "That falls outside my area of specification, and I don't guess outside my specifications; it voids the warranty." } },
  },
}

-- Daera Brightspear: dwarf hunter trainer; sends young dwarf hunters to Grif Wildheart in Kharanos.
P:NPC {
  key = "daera", id = TODO_NPC("Daera Brightspear"), name = "Daera Brightspear", title = "Hunter Trainer",
  bible = "bibles/military_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "steady" }, values = { "practical", "patient" },
  notices = { "pet" },

  impression = {
    first = "She seems to trust beasts more than people.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, an' I've no explanation for it. A wolf'll lie down at a shaman's feet the way it does at a hunter's, an' the hunters dinnae like it one bit. I tell them the beasts know who respects the wild, an' that's no' always the one holdin' the leash." } },
      choices = {
        { text = "Respect the wild, and it'll trust you back.", next = "BACK", reply = "That's how I see it. The hunters in my yard could stand tae hear it from a shaman more often.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The beasts know power. That's all respect ever is.", next = "BACK", reply = "Maybe so, but a wolf that lies down for power is a wolf that'll stand up for more, an' I'd rather have one that stays for trust.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tae watch before ye charge, for a beast tells ye everythin' wi' its ears an' its tail before it moves. Most warriors I meet see a bear an' run at it, an' the bear always knew they were comin'." } },
      choices = {
        { text = "I'll watch first, then strike.", next = "BACK", reply = "Then ye'll outlive most warriors I've trained, an' ye'll make the bears very cross, which is always a pleasure tae see.", fx = { align = { order = 1 } } },
        { text = "Watching's for hunters. I'll charge and see.", next = "BACK", reply = "Then ye'll learn the way most warriors do, flat on yer back wi' a bear on yer chest, so take a healer when ye go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "In the high snows, aye, both trackin' the same trolls for different reasons. I've no quarrel wi' yer trade, so long as ye don't track my students' beasts back tae their stables." } },
      choices = {
        { text = "I'd never harm a hunter's companion. That's beneath me.", next = "BACK", reply = "I'll take ye at yer word. I've no quarrel wi' ye otherwise, so long as the beasts stay safe from yer knives.", fx = { align = { honor = 1 } } },
        { text = "A beast is a beast, Daera. It's only a tool.", next = "BACK", reply = "A tool, is it? Then ye'll never know what a beast can do when it chooses tae stand by ye, an' that's yer loss, no' mine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, an' the second time the wolf never quite forgave anyone. Ye've power enough tae change a creature's shape, an' I'd thank ye tae save it for the Frostmane." } },
      choices = {
        { text = "I'll save my spells for the enemy, Daera.", next = "BACK", reply = "Thank ye, for the wolves in my yard have long memories, an' they'll thank ye too, in their own way, by no' biting ye.", fx = { align = { honor = 1 } } },
        { text = "A sheep's harmless enough. It wears off.", next = "BACK", reply = "It does, but the wolf doesnae forget, an' it'll bite the next mage it sees, so keep yer sheep tae yerself, if ye please.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not quite. A hunter takes a companion an' keeps it close, while a druid lets the wild run free an' walks beside it. Both ways can be honest, if the heart's right." } },
      choices = {
        { text = "A beast should be free, not leashed.", next = "BACK", reply = "Maybe so, an' I've no quarrel wi' a druid who thinks it, but I've seen beasts choose tae stay, an' that's no' a leash.", fx = { align = { order = -1 } } },
        { text = "A well-kept companion lives longer than a wild one.", next = "BACK", reply = "It does. The druids sometimes forget that the wild is a hard place tae grow old.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It can, though most priests don't think tae try, for they're used tae patchin' up dwarves who complain. A beast won't thank ye, but it'll remember ye, an' a beast's memory runs longer than most dwarves' gratitude." } },
      choices = {
        { text = "Every living thing deserves healing. Beasts as much as dwarves.", next = "BACK", reply = "They do! Come by the yard, an' I'll show ye a wolf wi' a sore paw who'd thank ye for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers are for people first. Beasts can wait.", next = "BACK", reply = "Fair enough. But the beasts will remember who healed them an' who didnae, an' so will their hunters.", fx = { align = { light = -1 } } },
        { text = "Tell me about the beasts instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Like a friend, an' no' like a tool, for a beast that fears ye will throw ye when it matters most. I've seen paladins who treat their chargers like their swords, an' I've seen what happens tae them when the fightin' starts." } },
      choices = {
        { text = "A loyal mount deserves loyalty back. I'll treat it well.", next = "BACK", reply = "It'll carry ye through fire an' worse for it. A charger that loves ye is worth ten that fear ye.", fx = { align = { light = 1 } } },
        { text = "A mount is a mount. It carries me where I need to go.", next = "BACK", reply = "Aye, it does, an' it'll keep doin' it, until the day it doesnae, an' then ye'll wish ye'd treated it like a friend.", fx = { align = { light = -1 } } },
        { text = "Something else, Daera.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Aye, as different as a friend is from a prisoner, for a hunter's beast stays because it wants tae. Yers stays because ye've a chain on it, an' the day that chain slips, ye'll learn what it thought o' ye all along." },
      },
      choices = {
        { text = "You're right. I'll never trust it.", next = "BACK", reply = "That's the wisest thing anyone like ye ever said in my yard. It'll keep ye alive longer than any chain.", fx = { align = { order = 1 } } },
        { text = "A chain is honest. Loyalty can lie.", next = "BACK", reply = "Maybe so, but loyalty that lies is rarer than ye think, an' a chain that slips doesnae give ye a second chance.", fx = { align = { order = -1 } } },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My beasts have their hackles up, an' I'd say it's whatever walks behind ye they're lookin' at, no' you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The beasts settle when yer kind walks by, I've noticed, an' my hunters' pets have been sniffin' at ye since ye came in." },
      },
      again = {
        { id = "h_again", text = "Anythin' else?" },
        { id = "h_again2", text = "Go on, then, ask." },
      },
      choices = {
        { text = "Do hunters and druids see the beasts the same way?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you choose a beast?", next = "beast" },
        { text = "Who's Grif Wildheart?", next = "grif", when = { class = "HUNTER" } },
        { text = "Have a look at my beast, Daera.", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Humans don't take the bow much, they tell me.", next = "human", when = { race = "Human", class = "HUNTER" } },
        { text = "I ride a nightsaber at home, Daera.", next = "elf", when = { race = "NightElf", class = "HUNTER" } },
        { text = "Why do dwarves keep rams?", next = "rams" },
        { text = "Do hunters and rogues often cross paths?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've heard a mage once turned a hunter's beast into a sheep.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would a hunter teach a warrior, Daera?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a priest's healing help a wounded beast, Daera?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should a paladin treat a mount, Daera?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is my companion so different from a hunter's beast, Daera?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your hunters' beasts behave differently around shamans, Daera?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    beast = {
      lines = {
        { id = "be_default", text = "Ye don't, mostly; it chooses ye, an' ye find out by how much it bites. A bear's loyal, a cat's clever, an' a boar's too stubborn tae know when it's beaten, which makes it a dwarf's favorite." },
      },
      choices = {
        { text = "A beast should obey its master.", next = "BACK", reply = "Then it'll obey ye, maybe, until ye need it most, an' then ye'll find out what a beast thinks o' masters.", fx = { align = { order = 1 } } },
        { text = "A beast is a partner, not a servant.", next = "BACK", reply = "That's it exactly. Yer beast will know ye mean it, an' that's the best trainin' there is.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "It obeys because I'm the stronger one.", next = "BACK", reply = "Maybe it does, an' maybe it'll keep doin' it, but I've seen stronger hunters thrown by beasts that stopped bein' afraid.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "It stays with me because it chooses to.", next = "BACK", reply = "Then ye've a good beast an' a good heart, an' that's the best partnership a hunter can ask for, so feed it well.", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "I'd guess dwarves look down on human hunters.", next = "human_look" },
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
        { id = "ra_default", text = "Because they're the only beast in Dun Morogh as stubborn as we are, an' they'll climb where a horse would sit down an' weep. Veron Amberstill sells the best o' them out past Kharanos, an' he'll tell ye so himself." },
      },
      choices = {
        { text = "A ram would make a fine hunting companion.", next = "rams_pet" },
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
    the_elements = { { id = "tp_the_elements", text = "The beasts know when the land's angry, an' they've been restless o' late, more than troggs would explain. Ask a shaman, if ye can find one o' ours who still listens." } },
    timbermaw = { { id = "tp_timbermaw", text = "I've met the Timbermaw, an' they're better company than most people. A bear that remembers ye kindly is worth more than a dozen men who forget." } },
    centaur = { { id = "tp_centaur", text = "Centaur hunt like wolves, all together an' all at once. If ye go tae the Barrens, keep yer pet close an' yer back tae a rock." } },
    green_dragons = { { id = "tp_green_dragons", text = "I saw one o' the green dragons once, in Ashenvale, sleepin' wi' its eyes open. My hound wouldnae go near it, an' I didnae argue wi' the hound." } },
    _none = { { id = "tp_none", text = "No' my trade, I'm afraid. Try someone wi' books." } },
  },
}
