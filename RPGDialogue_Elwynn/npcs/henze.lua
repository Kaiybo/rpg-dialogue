-- Henze Faulk, on the stone ring outside Heroes' Vigil. Voice: bibles/henze.md
-- Killed by the Defias saving his friend; brought back by a young paladin's Symbol of Life.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "henze", id = TODO_NPC("Henze Faulk"), name = "Henze Faulk",
  bible = "bibles/henze.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "brave", "honest" },
  spiritSensitive = true,
  notices = { "paladin" },
  impression = {
    first = "He jokes about having been dead, and I think it helps him.",
    third = "{name} met Henze Faulk, the dwarf who went after his friend Gazin and was caught by the Defias for it.",
  },

  greetings = {
    { id = "g_low", text = "Still breathin', just about. Don't make me laugh, it hurts." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Symbol of Life") }, text = "Ah, my favourite paladin! Ye're the only one I've got, mind." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", questActive = TODO_QUEST("The Symbol of Life") },
      text = "Is that the Symbol of Life ye've got there? Then mind yer aim. I'd rather not come back halfway." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, it was just the two of us an' a lot o' bad luck. A mage would've been handy, though, for the Defias don't care for fire an' they care even less for bein' frozen where they stand, an' I'd have liked tae see that." } },
      choices = {
        { text = "Next time, take a mage with you, Henze.", next = "BACK", reply = "I'll do that, an' I'll buy the mage a drink after for the trouble. Next time's a long way off, I hope.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Two men alone did more than an army. Keep it that way.", next = "BACK", reply = "Did more, maybe, an' one o' them ended up dead for it, so I'd no' recommend it. Next time I'm bringin' friends.", fx = { align = { order = -1 } } },
        { text = "Something else, Henze.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, I reckon one o' yer beast shapes could've sniffed me out in an hour, an' I'd have been a deal less dead for it. Gazin did his best, but Gazin couldn't smell a fire in a hayloft." } },
      choices = {
        { text = "A friend who comes for you matters more than any nose.", next = "BACK", reply = "Aye, that's true, an' I'll no' forget he came. Gazin's a fool, but he's my fool.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Gazin should've left you. Two dead men help nobody.", next = "BACK", reply = "He'd no' have left me, an' I'd no' have left him. That's what friends are, an' I'll hear nae different.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I went in alone and quiet, which is fine for a rogue an' daft for a dwarf. If I'd had a warrior at my back, makin' noise at the front door, I'd have walked out the back with Gazin an' all." } },
      choices = {
        { text = "Next time, call for help before you go in.", next = "BACK", reply = "Aye, I've learned that lesson the hard way. Dead's a terrible teacher, but a memorable one.", fx = { align = { order = 1 } } },
        { text = "Alone was brave, Henze. That counts for something.", next = "BACK", reply = "Brave an' daft are close cousins, an' I've met them both. Kind of ye tae say so all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, easily, for I left boot prints like a ram on a snowfield. Gazin found me eventually, but a beast with a good nose would've found me before I was quite so dead, I'd wager." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, easily, for I left boot prints like a ram on a snowfield. Is that your {pet}? Grand beast, so keep it close, for the Defias don't play fair with animals either." },
      },
      choices = {
        { text = "I'd have come for you, Henze, Defias or not.", next = "BACK", reply = "That's kindly said, an' I believe ye. I'll mind my boot prints next time.", fx = { align = { honor = 1 } } },
        { text = "I'd have let Gazin sort out his own mess.", next = "BACK", reply = "Ha, ye'd have left me lyin' there? Well, I'll no' share my ale wi' ye, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cold, an' boring, an' then suddenly very warm an' very loud, which is how I ended up lyin' here. The Defias have folk watchin' the watchers, so if ye ever do that work, look behind ye more than ye look ahead." } },
      choices = {
        { text = "I'd serve the king's eyes proudly, Henze.", next = "BACK", reply = "Aye, an' they'd be glad o' ye, I'd wager. Just mind what I said about watchin' behind.", fx = { align = { order = 1 } } },
        { text = "I'd never spy for nobles. The work's thankless and deadly.", next = "BACK", reply = "Thankless an' deadly, aye, an' ye've just described my last job. I'll no' argue.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Nothin' but cold an' quiet, which I'll admit was peaceful after the Defias. If there's somethin' waitin' on the other side wi' horns like yer friend there, I'm glad I didnae stay long enough tae meet it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Nothin' but cold an' quiet, which I'll admit was peaceful after the Defias. Yer friend there's been starin' at me like it knows the way back, an' I'd thank ye tae tell it I'm no' goin' anywhere." },
      },
      choices = {
        { text = "The dead deserve their peace. I'll not disturb it.", next = "BACK", reply = "Good, because I'd like tae keep mine, now I've seen how quiet it is. Keep yer friend away from it too.", fx = { align = { light = 1 } } },
        { text = "Death's just a door. Some of us go through on purpose.", next = "BACK", reply = "Aye, it is, but some doors ye go through only once, an' ye'd be wise tae remember it. Mind yerself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, if Gazin needed me, though my knees say otherwise. The Defias have men in every hollow from here tae Westfall, an' they don't take prisoners; they take what's in yer pockets an' leave ye for the crows." } },
      choices = {
        { text = "Then I'll go in with you next time, Henze.", next = "BACK", reply = "Ye'd do that? Then I'll go, knees an' all, an' we'll see what the Defias make o' a paladin.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave the Defias to the army. You've done enough.", next = "BACK", reply = "Aye, maybe, but the army's no' here an' Gazin is. I'll sit tight till he's back on his feet.", fx = { align = { honor = -1 } } },
        { text = "Something else, Henze.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ah, now, I said I'd bring one next time, an' here ye are, a mite late but welcome all the same." },
        { id = "h_default", text = "Henze Faulk. Gazin an' me were watchin' the Defias for the king's advisors, an' when they near enough caught Gazin, I went in after him, an' they caught me properly." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Symbol of Life"), days = 3 } },
          text = "I was dead, I know I was: cold an' quiet an' nothin'. Then there was you, an' a light, an' a terrible taste in my mouth, so thank ye, an' I mean it." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Symbol of Life"), days = 7 } },
          text = "Gazin's still feelin' guilty, so tell him to stop. I'd go in after him again; I'd just bring a paladin next time." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Ye wouldnae have a drop of somethin' warmin' on ye, for medicinal purposes? Strictly medicinal." },
        { id = "h_dwarf_shaman", when = { race = "Dwarf", class = "SHAMAN" },
          text = "A dwarf talkin' to the elements! My granddad would've fallen off his stool, but I'm glad somebody's listenin' to the ground, for it's got plenty to say." },
        { id = "h_dead", when = { metBefore = true }, text = "Still dead-ish? No, still alive; I check every mornin'. It's a good habit once ye've been the other thing." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. If ye've come to read me the last rites, ye're late, for I've been dead already an' come back." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye walk like Gazin does, quiet as a cat. Are ye one o' the king's eyes as well, or just a thief wi' good manners?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Is that a demon ye've got wi' ye? I've been dead once already, so I'd be obliged if ye'd keep it from takin' an interest." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'd have been handy in that Defias camp, so ye would; I could've done with someone bigger than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Is that a dwarven rifle, or a bow? Either way, I like a body who hits things from a distance." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf! I was dead a good while, so I've missed who's been comin' an' goin', but you're a fine surprise to wake up to." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can ye work a spell for a man who can't move his legs? No? Well, it never hurts tae ask, an' I ask everybody." },
      },
      again = {
        { id = "h_again", text = "What else? I'm no' goin' anywhere, mind, since my legs are still on strike." },
        { id = "h_again2", text = "Go on, then, since talkin' keeps me warm." },
      },
      choices = {
        { text = "What was it like?", next = "dead" },
        { text = "What were you and Gazin doing out here?", next = "defias" },
        { text = "Strange place to lie down and die.", next = "place" },
        { text = "How's Gazin?", next = "gazin" },
        { text = "Let me tend to your wounds.", next = "heal", when = { class = "PRIEST" } },
        { text = "Need a drink, kinsman?", next = "drink", when = { race = "Dwarf" } },
        { text = "The stone remembers you, Henze. It told me where you fell.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What was it like watching the Defias for the king?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you remember anything from when you were dead, Henze?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What went wrong when you went in after Gazin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A hunter could have tracked you to that camp, Henze.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I doubt you'd go back into Defias country, Henze.", next = "xapala", when = { class = "PALADIN" } },
        { text = "A druid could have found you sooner out there.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did mages watch the Defias alongside you and Gazin?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Rest easy, Henze.", next = "END" },
      },
    },

    dead = {
      big = true,
      lines = {
        { id = "d_default", text = "Quiet, not bad nor good, just quiet, like the forge on a holiday. I didnae mind it, though I mind bein' back less." },
      },
      choices = {
        { text = "The priests say the Light waits there.", next = "dead_priest", when = { class = "PRIEST" } },
        { text = "I'm glad you're back.", next = "BACK", reply = "So am I, mostly, an' Gazin's even gladder. Pull up a stone.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "That's oddly comforting.", next = "BACK", reply = "Aye, I suppose it is, an' I'd no' have said so till I'd been there. Strange, the things ye learn.", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },
    dead_priest = {
      lines = {
        { id = "dp_default", text = "Maybe it does, but I didnae see it, an' maybe I wasnae far enough in. Don't go tellin' the Cathedral I said so." },
      },
      choices = {
        { text = "Your secret's safe. The Light knows anyway.", next = "BACK", reply = "Thank ye, an' I'll no' tell them ye said that either. We'll keep each other's secrets.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Maybe there's nothing waiting there at all.", next = "BACK", reply = "Maybe there isnae, an' that's no' as frightenin' as it sounds once ye've seen it. I'll take quiet over somethin' worse.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    defias = {
      lines = {
        { id = "df_default", text = "We were watchin' the Defias for the king's advisors, takin' down names an' who meets who in the woods. They caught Gazin first, an' I couldnae leave him." },
      },
      choices = {
        { text = "What did you find?", next = "defias_found" },
        { text = "You were brave.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    defias_found = {
      lines = {
        { id = "dfo_default", text = "Enough to get killed for, an' the rest's in Gazin's head an' the advisors' desks now. Ask him at the Cathedral, if ye want the dull parts." },
      },
      choices = {
        { text = "Do the advisors ever act on it?", next = "defias_advisors" },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    defias_advisors = {
      lines = {
        { id = "da_default", text = "They read it, I'm told. What happens after it's read is above a dwarf lyin' on a rock. I'd like to think somebody's doin' somethin'." },
      },
      choices = {
        { text = "Somebody should.", next = "BACK", reply = "Aye, somebody should, an' I'd go myself if my ribs would let me. Maybe it'll be ye.", fx = { learn = { "defias" }, align = { order = -1 } } },
        { text = "These things take time.", next = "BACK", reply = "Aye, they do, an' I've plenty o' time now tae wait. Still, I'd no' mind if they took a wee bit less.", fx = { learn = { "defias" }, align = { order = 1 } } },
      },
    },

    place = {
      lines = {
        { id = "pl_default", text = "This island's Heroes' Vigil, a stone for the folk who died when the orcs came through Goldshire in the First War. It seemed a fittin' place to die, while I was doin' it." },
      },
      choices = {
        { text = "Who holds the island now?", next = "place_wizards" },
        { text = "Less fitting now?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    place_wizards = {
      lines = {
        { id = "pw_default", text = "Rogue wizards, mutterin' an' glowin' an' generally unpleasant. They let a dyin' dwarf lie, an' I'll no' thank them for it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gazin = {
      lines = {
        { id = "gz_default", text = "He's up at the Cathedral in Stormwind, last I heard, prayin' for me by the altar. Tell him it worked an' he can stop." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } } },
    },

    heal = {
      lines = {
        { id = "he_default", text = "Kind of ye. The paladin who raised me did the big work, so yours can do the small, an' my ribs'll thank ye loudly." },
      },
      choices = {
        { text = "Hold still.", next = "BACK", reply = "Holdin' still, though my ribs are complainin' about it. Go on, then.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Rest will mend your ribs better than my prayers.", next = "BACK", reply = "Aye, maybe, but rest is slow an' ye're right here. Suit yerself, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = {
        { id = "dr_default", text = "Strictly medicinal, ye understand, an' ah, I see ye've nothin'. Then tell me a joke from home, which is near as good." },
      },
      choices = {
        { text = "What's a dwarf's favourite stone? The one with ale under it.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Maybe later.", next = "BACK" },
      },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Did it now? Then it's a better friend than the Defias were. My granny used to say the stone hears everythin' an' tells nobody; I'm glad it made an exception." } },
      choices = {
        { text = "It only speaks to those who listen.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Mostly it complains about the damp.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf far from the mountain, watchin' thieves for the humans. I got killed for it, an' then I got better." } },
    advice = { { id = "tp_ad", text = "If yer friend's caught, go in after him, but bring a paladin." } },
    defias = { { id = "tp_defias", text = "They don't fight fair an' they don't leave witnesses, an' I'm the exception, which I'm very proud of." } },
    tome_of_divinity = { { id = "tp_tome", text = "Whatever's in that book, it brought me back. I'll read it myself one day, maybe." } },
    _none = { { id = "tp_none", text = "I was dead for a bit. I've missed some news." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "This island's for the humans' dead from the First War, an' I died on it too, which I reckon gives me a say. Them wizards in the ring don't respect the stone, an' that's another thing I'll be havin' words about." } },
    holy_light = { { id = "tp_holy_light", text = "A young paladin brought me back with a symbol an' a prayer, an' I'll not hear a word against the Light now. I used to think it was mostly singin'." } },
    magni = { { id = "tp_magni", text = "King Magni's a good king an' a loud one, an' I'll drink to him wherever I am. Even here, with a wet beard an' humans for company." } },
    wildhammer = { { id = "tp_wildhammer", text = "Me cousin flies with the Wildhammer an' says the Hinterlands are a fine place if ye like rain an' trolls. I like neither, so I came here an' got killed instead." } },
  },
}
