-- Farstrider Lodge: Marek Ironheart, who runs the hunting lodge, and Daryl the Youngling, who boasts in it.
-- Voices: bibles/farstrider.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Marek Ironheart: master of the Farstrider Lodge.
P:NPC {
  key = "lm_marek", id = TODO_NPC("Marek Ironheart"), name = "Marek Ironheart",
  bible = "bibles/farstrider.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "gruff", "proud" }, values = { "proud", "practical", "brave" },
  notices = { "pet", "class" },

  impression = {
    first = "Marek Ironheart runs the Farstrider Lodge and prizes hunting skill above all else. He offers his approval like a trophy that has to be earned, and starts a croc story at the slightest excuse.",
    third = "{name} met Marek Ironheart, the grizzled dwarf who runs the Farstrider Lodge in Loch Modan.",
  },

  greetings = {
    { id = "g_default", text = "Welcome tae the Farstrider Lodge. Wipe yer boots, an' if ye've killed somethin' worth talkin' about, I'm listenin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the lodge, eh? Pull up a stool by the fire an' tell me what ye've hunted." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away} an' come back in one piece, which is more than some o' my lodgers manage. Sit down an' tell me where ye've been." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've the walk of a proper hunter now, quiet on the boards an' eyes on the door. That didnae come from nowhere." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Thelsamar says ye've been useful, which from that lot is high praise. The lodge noticed too." },
    { id = "g_croc_active", when = { questActive = TODO_QUEST("Crocolisk Hunting") }, text = "The crocs are on the islands, an' they're no' comin' tae you. Get yer boots wet." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine beast at yer heel, an' it's lookin' at my croc skins like it's hungry. Keep it back from the hides, if ye please." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", faction = "Alliance" },
      text = "A hunter, an' ye carry yer bow like ye mean it. Here at the lodge, that's the first thing we look at." },
  },

  start = "hello",
  nodes = {
    opn_elves = {
      lines = {
        { id = "opn_elves_q", text = "The ones who hunted here were the finest trackers I ever drank wi', an' then Quel'Thalas walked out o' the Alliance after the war like a guest leavin' before the bill. Now there's precious little left o' Quel'Thalas tae walk anywhere. Ye've an opinion, by yer face, so let's have it." },
      },
      choices = {
        { text = "They left the Alliance when it needed them. I don't forget that.", next = "opn_elves_r_distrust", fx = { affinity = 1, align = { honor = 1 }, opinion = { high_elves = "distrust" } } },
        { text = "They've paid for it a hundred times over. Leave them be.", next = "opn_elves_r_pity", fx = { align = { honor = -1 }, trait = { kind = 1 }, opinion = { high_elves = "pity" } } },
        { text = "Proud, but the best archers I've ever seen.", next = "opn_elves_r_admire", fx = { opinion = { high_elves = "admire" } } },
        { text = "My cousins in Quel'Thalas are dead. Speak gently.", next = "opn_elves_r_kin", when = { race = "NightElf" }, fx = { affinity = -1, opinion = { high_elves = "kin" } } },
        { text = "I'd rather talk hunting.", next = "BACK" },
      },
    },
    opn_elves_r = {
      lines = {
        { id = "opn_elves_r_default", text = "Huntin' it is. Ye'll learn more from a bear than from me about elves anyway." },
      },
      choices = {
        { text = "Something else, Marek.", next = "BACK" },
      },
    },
    opn_elves_r_distrust = {
      lines = {
        { id = "opn_elves_r_distrust", text = "Ha! Hold a grudge like a dwarf, do ye? I'll drink tae that, though I'll drink tae the rangers too, for they never left the lodge till they were called home." },
      },
      choices = {
        { text = "Something else, Marek.", next = "BACK" },
      },
    },
    opn_elves_r_pity = {
      lines = {
        { id = "opn_elves_r_pity", text = "Aye, they have, an' I'll no' kick a beast that's already down. Their rangers still come through now an' then, an' they look like folk who've buried everyone they knew." },
      },
      choices = {
        { text = "Something else, Marek.", next = "BACK" },
      },
    },
    opn_elves_r_admire = {
      lines = {
        { id = "opn_elves_r_admire", text = "Best I've seen too, though I'll deny I said it if Daryl asks. Proud's no crime in a hunter, so long as ye can back it up." },
      },
      choices = {
        { text = "Something else, Marek.", next = "BACK" },
      },
    },
    opn_elves_r_kin = {
      lines = {
        { id = "opn_elves_r_kin", text = "Cousins, is it? I didnae know yer folk still claimed 'em. Gently, then, an' I'm sorry for yer loss." },
      },
      choices = {
        { text = "Something else, Marek.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Marek Ironheart. Here at the Farstrider Lodge we prize huntin' skill above all else, so if ye want my approval, ye'll have tae earn it." },
        { id = "h_croc_before", when = { questBefore = TODO_QUEST("Crocolisk Hunting") },
          text = "Loch Modan's famous for its crocs, an' there's always a merchant wantin' skins for armour or meat for the table. The beasts have dug in on the islands, mind, an' they're ferocious about it." },
        { id = "h_croc_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Crocolisk Hunting"), days = 3 } },
          text = "Those were fine specimens ye brought in, as clean a skinnin' as I've seen this season. The merchants'll pay well, an' so did I." },
        { id = "h_sooty", tags = { "news" }, when = { questDone = TODO_QUEST("Vyrin's Revenge") },
          text = "So ye brought down Ol' Sooty! The whole lodge has been tryin' for that bear for a year, an' Daryl's no' said a word since ye walked in wi' the head." },
        { id = "h_hunter", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! Then ye're among friends here, though friends who'll judge every arrow ye loose." },
        { id = "h_warrior", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Ye'll do fine against a croc, for it's mostly wrestlin' once the jaws open." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid at a huntin' lodge. Don't look at the trophies too long, friend; every one o' them was taken fair." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf! We get more high elves than your kind at this lodge, for the place was named for their rangers, but a good eye's a good eye." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's warm an' I've nowhere tae be." },
        { id = "h_again2", text = "Ask on, friend. I'll answer, an' I might throw in a story." },
      },
      choices = {
        { text = "Tell me about the crocolisks.", next = "crocs" },
        { text = "What is this lodge, exactly?", next = "lodge" },
        { text = "Daryl seems a lively sort.", next = "daryl" },
        { text = "A hunter's approval must be hard to earn in this lodge.", next = "approval" },
        { text = "Your trophy wall troubles me, Marek.", next = "druid", when = { class = "DRUID" } },
        { text = "Farewell, Marek.", next = "END" },
      },
    },

    crocs = {
      lines = {
        { id = "cr_default", text = "Big an' mean, an' dug in on the islands where nothin' can come at them but a swimmer. It's quite an experience, wrestlin' wi' the jaws o' one, an' I say that as a dwarf who's done it more than once." },
        { id = "cr_active", when = { questActive = TODO_QUEST("Crocolisk Hunting") },
          text = "I want meat an' skins, an' don't hack the skins tae ribbons gettin' at the meat. Go for the soft under the jaw an' the beast does the rest." },
      },
      choices = {
        { text = "Have you wrestled one yourself?", next = "crocs_story" },
        { text = "Something else, Marek.", next = "BACK" },
      },
    },
    crocs_story = {
      lines = {
        { id = "cs_default", text = "Why, this one time I had a bull croc by the snout an' my axe was at the bottom o' the loch, so the two of us rolled in the shallows till dusk. Come sundown he got bored an' let go, an' I took that as a win." },
      },
      choices = {
        { text = "That's the best hunting story I've heard.", next = "crocs_end", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "So the croc won, then.", next = "crocs_end" },
      },
    },
    crocs_end = {
      big = true,
      lines = {
        { id = "ce_default", text = "Ha! Maybe he did. The point is ye respect a beast that can kill ye, an' ye take only what ye need from it, or the loch runs empty an' we're all out o' work." },
      },
      choices = {
        { text = "Take what you need and leave the rest. Agreed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hunt what you like. The loch will always fill.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lodge = {
      lines = {
        { id = "lo_default", text = "It's a huntin' lodge on the east shore, built where the boar an' the bear are thickest. Hunters come from Ironforge an' further tae test themselves here, an' I keep them fed, housed an' honest." },
      },
      choices = {
        { text = "Farstrider sounds like an elven name to me.", next = "lodge_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge_name = {
      lines = {
        { id = "ln_default", text = "Aye, for the elven rangers who hunted wi' us in the old wars, an' some o' their kin still lodge here. Vyrin keeps the beds, an' she shoots better than any dwarf in the place, though I'll deny I said so." },
      },
      choices = {
        { text = "What do you make of the elves, Marek?", next = "opn_elves" },
        { text = "Something else, Marek.", next = "BACK" },
      },
    },

    daryl = {
      lines = {
        { id = "da_default", text = "Daryl's young, an' loud, an' better wi' a bow than his mouth makes him sound. He'll set ye a challenge if ye let him, an' he'll be very surprised when ye pass it." },
      },
      choices = {
        { text = "Daryl wears that scar of his like a medal.", next = "daryl_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daryl_scar = {
      lines = {
        { id = "dsc_default", text = "A bear called Ol' Sooty gave him that, north in the caves, when he went after it alone tae prove himself. Ask Daryl an' ye'll hear a different story every time, but ask Vyrin an' ye'll hear the true one." },
      },
      choices = {
        { text = "The boy needs humbling, Marek.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Go easy on him. He's learning.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    approval = {
      big = true,
      lines = {
        { id = "ap_default", text = "Bring me somethin' that was hard tae kill, an' bring it clean. I don't care for rank or gold or who yer father was, only for whether ye came back wi' the beast an' all yer fingers." },
        { id = "ap_hunter", when = { class = "HUNTER" },
          text = "Ye've half o' it already, carryin' a bow like that. The other half is patience, an' I'll know if ye have it by how ye skin a croc." },
      },
      choices = {
        { text = "I'll earn it the honest way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll earn it however gets the beast down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    druid = {
      lines = {
        { id = "dr_default", text = "Ha! I'll grant ye a druid's got the strangest claim on my trophy wall. Every beast here was hunted fair an' eaten after, an' that's the only promise I'll make ye." },
      },
      choices = {
        { text = "That's a fair promise, Marek.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the beasts o' this valley better than anyone livin', an' a fair bit about the folk who hunt them. Ask." } },
    background = { { id = "tp_bg", text = "I've hunted Khaz Modan since I was a beardless lad, an' I've run this lodge for longer than I'll admit." } },
    advice = { { id = "tp_ad", text = "Never turn yer back on a croc that's stopped movin', for it's only thinkin'." } },
    troggs = { { id = "tp_troggs", text = "There's nothin' sportin' about troggs. Ye kill them because they're there, an' ye don't hang them on any wall." } },
    _none = { { id = "tp_none", text = "Never hunted it, never ate it, so I couldnae tell ye. Ask Vyrin, for she's read more books than I've skinned crocs." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer hunt from gryphon-back, which is cheatin', but I'll grant ye they're good at it. I'd love tae see one try it in a Loch Modan fog." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire bought a bear pelt off the lodge once for their strongman's cape. It was a better bear than he was a strongman." } },
    magni = { { id = "tp_magni", text = "King Magni loves a hunt as well as any dwarf, an' he's sent word he'd like tae hunt the valley someday. We've kept the best stretch o' the loch ready for him for years." } },
  },
}

-- Daryl the Youngling: a young human hunter at the lodge who calls himself Daryl the Bold.
P:NPC {
  key = "lm_daryl", id = TODO_NPC("Daryl the Youngling"), name = "Daryl the Youngling",
  bible = "bibles/farstrider.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "proud", "cowardly" }, values = { "proud", "ambitious" },
  notices = { "class", "greenness" },

  impression = {
    first = "Daryl the Youngling calls himself Daryl the Bold and sets challenges he plainly expects no one to meet. He boasts about a scar he won't explain the same way twice.",
    third = "{name} met Daryl the Youngling, the boastful young hunter of the Farstrider Lodge.",
  },

  greetings = {
    { id = "g_default", text = "Daryl the Bold, at your service, within reason, for a hunter of my standing has a reputation to look after." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Come for another lesson from Daryl the Bold, have you?" },
    { id = "g_away", when = { away = 14 }, text = "Oh, it's you, back after {away}. I'd assumed the buzzards got you, and I'd already composed a very moving speech." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've... grown a bit more capable than I'd expected. Not that I didn't expect it, of course." },
    { id = "g_boast", when = { questActive = TODO_QUEST("A Hunter's Boast") }, text = "The clock's ticking on those buzzards! Not that I'm counting, though I am." },
    { id = "g_challenge", when = { questActive = TODO_QUEST("A Hunter's Challenge") }, text = "You've twelve minutes, and those are elder boars, not Coldridge piglets. Go on, then!" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Another hunter, is it? Well, there's room for two of us at this lodge, so long as everyone remembers which one is Daryl the Bold." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 14 },
      text = "My, you're fresh! Don't fret about it; I was fresh myself, once, for nearly a whole afternoon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Think you can match wits with Daryl the Bold, do you? I should think not, but you're more than welcome to try, and I'll be very gracious about it when you fail." },
        { id = "h_boast_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Hunter's Boast"), days = 3 } },
          text = "About those buzzards: any unshaven boy with a bow could have managed it, so don't let it go to your head. I kept my word all the same, and Daryl the Bold always does." },
        { id = "h_challenge_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Hunter's Challenge"), days = 3 } },
          text = "Ah, the boars, yes. I'm not surprised in the least, and if anyone mentions a bet, I've no idea what they're talking about." },
        { id = "h_sooty", tags = { "news" }, when = { questDone = TODO_QUEST("Vyrin's Revenge") },
          text = "Please don't bring that thing in here again. I don't want to talk about the bear, and I don't want to talk about the scar, and I'd thank you to stop looking at it." },
        { id = "h_hunter", when = { class = "HUNTER", faction = "Alliance" },
          text = "A fellow hunter! Then you'll appreciate a true master when you see one, which is lucky, because you're looking at one." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Another dwarf. You all look at me the way Marek does, as if I'm a stew that hasn't finished cooking." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a bowstring to wax, and it won't wax itself." },
        { id = "h_again2", text = "Go on, then. I've a moment for an admirer." },
      },
      choices = {
        { text = "Set me a challenge, then.", next = "challenge" },
        { text = "How did you get that scar?", next = "scar" },
        { text = "Why do they call you the Youngling?", next = "youngling" },
        { text = "I killed Ol' Sooty, you know.", next = "sooty", when = { questDone = TODO_QUEST("Vyrin's Revenge") } },
        { text = "Someone at the lodge mentioned a bet, Daryl.", next = "bet", when = { questDone = TODO_QUEST("A Hunter's Challenge") } },
        { text = "Two hunters, one lodge. Let's compare notes.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Good luck with the boasting, Daryl.", next = "END" },
      },
    },

    challenge = {
      lines = {
        { id = "ch_default", text = "A flock of mountain buzzards has nested in the loch hills, and they're quick and mean. Bring down six in a quarter of an hour, and I'll hand over my own bow or gun, since you plainly haven't much to lose." },
        { id = "ch_second", when = { questDone = TODO_QUEST("A Hunter's Boast") },
          text = "Elder mountain boars, and this is no Coldridge boar hunt, so have a care. Five in twelve minutes, and I'd give you the shirt off my back if you managed it." },
      },
      choices = {
        { text = "Why the time limit?", next = "challenge_time" },
        { text = "I'll take that bow off you yet.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    challenge_time = {
      lines = {
        { id = "ct_default", text = "Because anyone can kill a beast in a week! A real hunter reads the hills, finds his quarry and finishes before the light changes, which is exactly what I'd do, if I weren't so busy." },
      },
      choices = {
        { text = "Busy with what, exactly?", next = "challenge_busy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    challenge_busy = {
      big = true,
      lines = {
        { id = "cb_default", text = "Waxing my bowstring, mostly, and thinking about my next great hunt. A hunter of my standing has to choose his quarry carefully, you understand, or he wastes his legend on buzzards." },
      },
      choices = {
        { text = "A real hunter lets his kills do the boasting.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Boast away. A legend is half the hunt.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Daryl.", next = "BACK" },
      },
    },

    scar = {
      lines = {
        { id = "sc_default", text = "Have I never told you? It was two years ago, against a beast the size of a cart, and I faced it with nothing but a knife and my natural courage." },
        { id = "sc_sooty", when = { questDone = TODO_QUEST("Vyrin's Revenge") },
          text = "It was a tree branch. A big one, and very sharp, and it fell on me while I was being heroic. That's the story now, and I'm sticking to it." },
      },
      choices = {
        { text = "Marek says it was a bear called Ol' Sooty.", next = "scar_truth", when = { heardLine = "lm_marek.dsc_default" } },
        { text = "A knife against a cart-sized beast? Impressive.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar_truth = {
      lines = {
        { id = "st_default", text = "Marek talks too much, and so does Vyrin, and neither of them was there. It was a bear, yes, and it was a very large bear, and that's quite enough about it." },
        { id = "st_warm", when = { disposition = { min = 65 } },
          text = "All right, it was Ol' Sooty, and I ran, and I've been running from it every night since in my sleep. Don't tell Marek I said so, or I'll deny everything." },
      },
      choices = {
        { text = "Running was the smart choice, Daryl.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then stop calling yourself the Bold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    youngling = {
      lines = {
        { id = "yo_default", text = "Jealousy, plainly, and a little dwarven humour, which isn't funny. I'm the youngest hunter at the lodge, and they'll be calling me something grander once I've bagged something worth a song." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sooty = {
      lines = {
        { id = "so_default", text = "I know. Vyrin put you up to it, I'd wager, and she's been smiling at breakfast ever since. Well, someone had to kill it, and I'm glad it was you, because I'd rather not have had to." },
      },
      choices = {
        { text = "It was a big bear. No shame in it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bet = {
      lines = {
        { id = "bt_default", text = "What bet? There was no bet. If I said something about a shirt, it was a figure of speech, and a hunter of my standing doesn't hand his shirt to anyone." },
      },
      choices = { { text = "Something else, Daryl.", next = "BACK" } },
    },

    hunter = {
      lines = {
        { id = "hu_default", text = "Notes? Well, I suppose you could take a few of mine. Keep downwind, never trust a buzzard and always keep your best story for when Marek's listening." },
      },
      choices = {
        { text = "Good advice, mostly. Thanks, Daryl.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know everything worth knowing, naturally, about hunting and about my own exploits. Ask, and I'll decide which to tell you." } },
    background = { { id = "tp_bg", text = "I came to the lodge to make my name, and I've very nearly made it. Daryl the Bold, remember that." } },
    advice = { { id = "tp_ad", text = "Never hunt in a cave alone. That's just good sense, and it has nothing to do with anything." } },
    _none = { { id = "tp_none", text = "That's beneath my notice, I'm afraid. Try Marek, for he notices everything and never lets you forget it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I've been to the Faire, naturally, and won every game there twice. They asked me not to come back, which I consider a compliment." } },
    onyxia = { { id = "tp_onyxia", text = "Onyxia? A black dragon in some swamp in Kalimdor, I'm told. I'd hunt her myself, of course, only I'm needed here." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The arena in Stranglethorn is where real hunters prove themselves, and I'll be going any day now. Any day." } },
  },
}
