-- Loch Modan folk the first passes missed, part 1: the Farstrider Lodge's keepers and traders, and the
-- smiths and merchants at the dig, the dam, Algaz Station, the Valley of Kings and Thelsamar.
-- (Ashlan Stonesmirk stands at the Dun Modr camp over the border; he is filed here with the roster.)
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Vyrin Swiftwind: high elf innkeeper of the Farstrider Lodge; gives Vyrin's Revenge.
P:NPC {
  key = "lm_vyrin", id = TODO_NPC("Vyrin Swiftwind"), name = "Vyrin Swiftwind", title = "Innkeeper", gender = "female",
  bible = "bibles/missed.md", role = "innkeeper", tier = "quest",
  communities = { "lochmodan" }, temper = { "dry", "composed" }, values = { "honest", "proud" },
  notices = { "class", "race" },
  impression = {
    first = "Vyrin Swiftwind keeps the beds and the table at the Farstrider Lodge, a high elf among dwarves who seems entirely at ease there. She speaks softly, misses nothing, and has no patience at all for Daryl's boasting.",
    third = "{name} met Vyrin Swiftwind, the high elf innkeeper of the Farstrider Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome at the Farstrider Lodge, {class}. There is a bed if you need one, and a seat by the fire if you only need to stop walking for a while." },
    { id = "g_back", when = { metBefore = true }, text = "You have found your way back to us. The loch has a way of drawing hunters twice, I have noticed." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You keep late hours. The dwarves are long abed, and it is only the elf and the owls awake to greet you." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry your weapon the way a ranger does, low and ready. Marek will like you, though he will make you earn hearing it." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A child of Kalimdor, here among the dwarves. Our peoples parted a very long time ago, and I confess I am curious which of us you see when you look at me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_sooty", when = { questDone = TODO_QUEST("Vyrin's Revenge") },
          text = "Breakfast has been wonderfully quiet since you laid that bear's head in front of Daryl. I had forgotten how pleasant this hall is without a hero in it." },
        { id = "h_default", text = "I am Vyrin Swiftwind, and I keep this lodge fed and bedded while Marek keeps it loud. The hunting here is the best in Khaz Modan, and the company is tolerable, with one exception." },
      },
      again = {
        { id = "h_again", text = "Was there something more? I have the evening's table to set, though it will keep a moment." },
        { id = "h_again2", text = "Ask, then. An innkeeper hears everything sooner or later." },
      },
      choices = {
        { text = "Who is the exception?", next = "daryl" },
        { text = "A high elf, keeping a dwarven lodge?", next = "elf" },
        { text = "Tell me about the hunting here.", next = "hunting" },
        { text = "I hunt myself. What should I go after first?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Thank you, Vyrin. I'll rest a while.", next = "END" },
      },
    },
    daryl = {
      big = true,
      lines = {
        { id = "d_done", when = { questDone = TODO_QUEST("Vyrin's Revenge") },
          text = "It was Daryl, as you well know, and you cured him of the worst of it. He still calls himself the Bold, but he says it more quietly now, and never when I am pouring." },
        { id = "d_default", text = "Daryl, who calls himself the Bold and the rest of us call the Youngling. He sits at my table every morning and tells the room how he came by the scar on his face, and it is a different tale each time." },
      },
      choices = {
        { text = "How did he really come by it?", next = "scar" },
        { text = "He seems harmless enough to me.", next = "harmless" },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    scar = {
      lines = { { id = "sc_default", text = "A bear gave it to him two years ago, an old black brute the dwarves call Ol' Sooty that dens in the hills north-west of here. Daryl went up alone to make his name and came down running, and I know because I was the one who stitched him." } },
      choices = {
        { text = "And you want the bear dead.", next = "revenge" },
        { text = "You've kept his secret all this time.", next = "secret" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    revenge = {
      lines = {
        { id = "rv_done", when = { questDone = TODO_QUEST("Vyrin's Revenge") },
          text = "I wanted it, and you did it, and I will not pretend I was above enjoying his face. The bear had it coming as well; it has mauled better hunters than Daryl." },
        { id = "rv_active", when = { questActive = TODO_QUEST("Vyrin's Revenge") },
          text = "You will find Ol' Sooty in the hills to the north-west, above the road. Bring its head to Daryl rather than to me, and say only that Vyrin sends her regards." },
        { id = "rv_default", text = "I want its head set down in front of him by someone who is not Daryl. Call it revenge if you like, though I think of it as two years of breakfasts paid back in a single morning." },
      },
      choices = {
        { text = "That's a cold sort of lesson.", next = "BACK", reply = "Perhaps it is. He has had two years of the warm sort, and it has taught him nothing at all." },
        { text = "He'll deserve every moment of it.", next = "BACK", reply = "He will, and he will be the better for it afterwards. The young usually are, once the blushing stops." },
      },
    },
    secret = {
      lines = { { id = "se_default", text = "It was his to tell, and I am older than I look and can hold my tongue for a good deal longer than two years. I only tire of hearing the lie polished brighter each morning." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    harmless = {
      lines = { { id = "hm_default", text = "He is harmless, and that is what worries me. A hunter who believes his own boasts walks into a den one day expecting the bear to believe them too." } },
      choices = { { text = "So it's concern, under the needling.", next = "BACK", reply = "Do not tell him so. I have a reputation at this table, and I mean to keep it." } },
    },
    elf = {
      lines = { { id = "e_default", text = "The lodge was raised in friendship, for the rangers of my people who came south to hunt beside the dwarves, and it keeps their name. There are few of us left to claim a bed here now, so I look after the beds instead." } },
      choices = {
        { text = "Few of you left?", next = "quel" },
        { text = "The dwarves seem glad to have you.", next = "dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quel = {
      lines = { { id = "q_default", text = "The Scourge came through our forests in the last war, and what it left of Quel'Thalas would not fill this valley. I would rather not walk through it again for a stranger, however kindly the stranger asks." } },
      choices = {
        { text = "Forgive me. I shouldn't have pressed.", next = "BACK", fx = { affinity = 1 }, reply = "There is nothing to forgive. You asked honestly, and that is rarer than you might think." },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "dw_default", text = "They are loud, they are stubborn, and they have never once asked me to be anything other than what I am. Marek gave me the keys to the larder the week I arrived, and among dwarves there is no higher trust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunting = {
      lines = { { id = "hu_default", text = "The crocolisks on the loch's islands are Marek's great love, and he will set you after them the moment you look capable. The bears and boars in the hills are easier quarry, and the buzzards over the eastern ridge make a fine test of anyone's aim." } },
      choices = {
        { text = "And the ogres to the north-east?", next = "ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres = {
      lines = { { id = "og_default", text = "The Mo'grosh are not quarry, they are neighbours of the worst kind, and they grow bolder each season. If you go north along the shore, go quietly, and do not light a fire where the hill can see it." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hn_default", text = "Then speak with Dargh if you want teaching and with Marek if you want a challenge, and take the bears before you take the crocolisks. A bear will tell you when you have made a mistake, whereas a crocolisk simply keeps your leg." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came south after the last war and found a lodge that bore my people's name and needed someone to keep it. That is as much of the story as I tell." } },
    troggs = { { id = "tp_tr", text = "They do not come this far east, which is one of the lodge's quieter blessings. Captain Rugelfuss in Thelsamar has the whole of that trouble." } },
    _none = { { id = "tp_none", text = "That is beyond what an innkeeper hears, I am afraid. Marek may know, and if he does not he will tell you a story regardless." } },
  },
}

-- Claude Erksine: pet trainer at the Farstrider Lodge.
P:NPC {
  key = "lm_claude", id = TODO_NPC("Claude Erksine"), name = "Claude Erksine", title = "Pet Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "lochmodan" }, temper = { "gentle", "gruff" }, values = { "nature", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Claude Erksine trains hunters' beasts at the Farstrider Lodge and plainly likes the beasts better than the hunters. His hands are a map of old bites, and he is fond of every one of them.",
    third = "{name} met Claude Erksine, the pet trainer at the Farstrider Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Mind where ye step, for there's usually somethin' asleep under the bench. What can I do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? I remember the face, though I'd have remembered a beast's sooner." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Now there's a fine animal. Let {pet} come an' have a sniff o' me, an' we'll talk after." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} looks well fed an' well walked, an' that tells me more about ye than anythin' ye could say." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter wi' no beast at heel is half a hunter, {g:lad|lass}. The hills here are full o' good companions, if ye've the patience tae earn one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Claude Erksine. I teach beasts their manners an' their hunters a bit o' sense, an' I'll tell ye plainly the beasts learn quicker." } },
      again = {
        { id = "h_again", text = "What else, then? Speak up, for my hearin's no' what it was since the owl." },
        { id = "h_again2", text = "Go on, I'm listenin', an' so's whatever's under the bench." },
      },
      choices = {
        { text = "Which beasts around the loch make good companions?", next = "beasts" },
        { text = "Those are a lot of scars.", next = "scars" },
        { text = "What can you teach my companion?", next = "teach", when = { class = "HUNTER" } },
        { text = "Good day, Claude.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "The mountain boars are loyal an' daft, the bears are loyal an' hungry, an' the loch crocs are neither, though Marek'll swear otherwise. If I were startin' fresh I'd take a bear from the western hills an' never look back." } },
      choices = {
        { text = "Why a bear?", next = "bear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear = {
      lines = { { id = "br_default", text = "Because a bear decides for itself whether ye're worth followin', an' once it's decided, nothin' short o' a dragon will change its mind. I trained naught but bears for years, an' I've never had truer friends, on four legs or two." } },
      choices = { { text = "That's a fine thing to say. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scars = {
      lines = { { id = "s_default", text = "Aye, an' every one's a lesson I only needed the once. This one across the thumb was a wolf pup who thought I was takin' his supper, an' he was right, so I've nae complaint." } },
      choices = {
        { text = "You don't hold it against them?", next = "grudge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grudge = {
      lines = { { id = "g_default2", text = "Ye cannae hold a grudge against a beast for bein' a beast, {g:lad|lass}. It's the folk who beat their animals I hold grudges against, an' those I keep for life." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "Thicker hide, a harder bite, an' the sense tae stay put when ye tell it tae stay. Bring yer companion close an' we'll see what it's ready for, because I'll no' push a beast past what it can bear." } },
      choices = { { text = "Understood. Something else first.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've been wi' the Lodge longer than some o' the trophies on the wall. Beasts are my trade, an' I've never wanted another." } },
    _none = { { id = "tp_none", text = "If it doesnae have fur, feathers or scales, I've likely nae opinion on it. Ask Marek." } },
  },
}

-- Cliff Hadin: human bowyer at the Farstrider Lodge.
P:NPC {
  key = "lm_cliff", id = TODO_NPC("Cliff Hadin"), name = "Cliff Hadin", title = "Bowyer", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "easy", "wry" }, values = { "craft", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "Cliff Hadin sells bows at the Farstrider Lodge, the one man in a hall of dwarves who will not hear a good word about gunpowder. He argues the point with Irene Sureshot daily and seems to enjoy losing by volume.",
    third = "{name} met Cliff Hadin, the bowyer at the Farstrider Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. If you've come for something that kills quietly, you've found the only stall in the lodge that sells it." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The string's held, I hope?" },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the night elves! I'd give a month's takings to see how your people lay up a bow limb, and I don't suppose you'd tell me." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You've a hunter's shoulders. Draw one of mine before you let the dwarves sell you a thunder-stick." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Cliff Hadin, bowyer. I cut the staves myself from the ash on the east shore, and I string them here where the dwarves can watch and shake their heads." } },
      again = {
        { id = "h_again", text = "Anything more? I've a stave drying and nowhere to be." },
        { id = "h_again2", text = "Go on, then. It's a pleasure to talk to someone at eye level." },
      },
      choices = {
        { text = "A human bowyer, in a dwarven lodge?", next = "human" },
        { text = "Bow or gun? Settle it for me.", next = "bow" },
        { text = "What would you put in a hunter's hands?", next = "pick", when = { class = "HUNTER" } },
        { text = "Good day, Cliff.", next = "END" },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "The lodge takes anyone who can shoot straight, and it's been that way since the elven rangers lodged here. I came up from the south to hunt one season, and Marek told me I could stay as long as my bows were better than my jokes." } },
      choices = {
        { text = "And are they?", next = "jokes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jokes = {
      lines = { { id = "j_default", text = "I'm still here, so you may draw your own conclusion. Kat Sampson came north the same way, and between the two of us we keep the dwarves from forgetting what tall looks like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bow = {
      lines = { { id = "b_default", text = "A bow, and I'll tell you why. A rifle tells every beast between here and the dam that you've arrived, and a bow tells only the one you were aiming at." } },
      choices = {
        { text = "Irene would say otherwise.", next = "irene" },
        { text = "A rifle hits harder, though.", next = "BACK", reply = "It does, once. Then you spend the rest of the day wondering where the herd went." },
        { text = "Something else.", next = "BACK" },
      },
    },
    irene = {
      lines = { { id = "i_default", text = "Irene says otherwise every morning, loudly, and then proves it against the target behind the lodge. She's the finest shot I've ever seen, and I'd thank you not to tell her I said so." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    pick = {
      lines = { { id = "p_default", text = "For the loch, a short bow you can carry through brush, because the bears don't give you room for a long draw. Save the longbow for the buzzards on the ridge, where you can see what you're shooting at." } },
      choices = { { text = "Good to know. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came north for one hunting season and never packed to leave. The ash here makes a better stave than anything back home." } },
    _none = { { id = "tp_none", text = "You've wandered outside what a bowyer knows, I'm afraid. Vyrin hears most things, so try her." } },
  },
}

-- Irene Sureshot: dwarf gunsmith at the Farstrider Lodge.
P:NPC {
  key = "lm_irene", id = TODO_NPC("Irene Sureshot"), name = "Irene Sureshot", title = "Gunsmith", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "loud", "confident" }, values = { "craft", "proud" },
  notices = { "class", "craft" },
  impression = {
    first = "Irene Sureshot sells rifles at the Farstrider Lodge and settles every argument at the target range behind it. She is loud, exact, and entirely certain that the bow is a thing of the past.",
    third = "{name} met Irene Sureshot, the gunsmith at the Farstrider Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Step up, {g:lad|lass}! If ye want a beast tae drop where it stands, ye want one o' mine an' no' one o' Cliff's bent sticks." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Has she been shootin' true for ye?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, an' one wi' a steady eye by the look o' ye. Come round the back later an' we'll see what ye can do at a hundred paces." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that powder on yer cuffs? Ye're an engineer, then, an' ye'll understand why I'll no' sell a barrel I havenae bored myself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Irene Sureshot, an' the name's earned, as anyone in the lodge'll tell ye. I build huntin' rifles for folk who'd rather shoot once than chase a wounded bear through the heather." } },
      again = {
        { id = "h_again", text = "What else can I tell ye? Make it quick, I've a barrel coolin'." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "How did you earn the name?", next = "name" },
        { text = "Cliff says a bow is the better weapon.", next = "cliff" },
        { text = "What makes a good hunting rifle?", next = "rifle" },
        { text = "Good shooting, Irene.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "There's a buzzard's skull over the door that I took on the wing from the lodge steps, wi' Marek standin' beside me sayin' it couldnae be done. He bought the ale that night an' he's never said 'couldnae' tae me since." } },
      choices = {
        { text = "Has anyone at the lodge outshot you?", next = "outshot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outshot = {
      lines = { { id = "o_default", text = "Vyrin did, once, wi' a bow, an' she was polite enough no' tae mention it afterwards. I've been meanin' tae ask for a rematch, but she's always got the table tae lay, the sly thing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cliff = {
      lines = { { id = "c_default", text = "Cliff says a great many things, bless him, an' most o' them quietly, which is all a bow's good for. He's a fine craftsman an' a good neighbour, an' he's wrong, an' I tell him so every mornin' so he doesnae forget." } },
      choices = {
        { text = "A bow doesn't scare off the herd.", next = "BACK", reply = "Neither does a rifle, if ye only need the one shot. That's the whole point o' learnin' tae aim." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifle = {
      lines = { { id = "r_default", text = "A long barrel bored true, a stock that fits yer shoulder an' no' yer grandfather's, an' dry powder. Most folk blame the gun when it's the damp off the loch that's spoiled their charge." } },
      choices = {
        { text = "How do you keep powder dry here?", next = "powder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder = {
      lines = { { id = "p_default", text = "A horn wi' a waxed stopper, kept inside yer coat an' never on yer belt. Any gunsmith on the loch'll tell ye the same, for Vrok Blunderblast in Thelsamar lost a whole keg tae the mist one spring an' still mourns it." } },
      choices = { { text = "I'll keep mine close. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've been borin' barrels since I was tall enough tae reach the lathe. The lodge has the best range in Loch Modan, so here I stay." } },
    _none = { { id = "tp_none", text = "Ye've got me there, {g:lad|lass}. If it cannae be shot, I've likely no' studied it." } },
  },
}

-- Kat Sampson: human leather armor merchant at the Farstrider Lodge.
P:NPC {
  key = "lm_kat", id = TODO_NPC("Kat Sampson"), name = "Kat Sampson", title = "Leather Armor Merchant", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "brisk", "practical" }, values = { "craft", "thrifty" },
  notices = { "kit", "craft" },
  impression = {
    first = "Kat Sampson sells leather armor at the Farstrider Lodge and makes most of it from what the hunters bring in. She looks a customer over the way a tanner looks over a hide, for the weak places.",
    third = "{name} met Kat Sampson, the leather armor merchant at the Farstrider Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Hello there. I've boots, belts and jerkins, all of it cut from beasts that were walking round this loch a month ago." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Turn round and let me see how the stitching's held." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something's had a proper go at you. Whatever you're wearing won't take another day of it, and I'd sooner tell you now than hear about it from Vyrin." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You've a skinner's knife on your belt, and it's seen use. Take the bear hides off in one piece and the tanner will bless you for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Kat Sampson. The hunters bring me hides, I turn them into something that keeps claws out, and then I sell it back to the same hunters, which is a tidy arrangement for everybody." } },
      again = {
        { id = "h_again", text = "What else? I can talk and stitch at once." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Which hides make the best armor?", next = "hides" },
        { text = "How does a human end up trading here?", next = "here" },
        { text = "I'd rather wear leather than plate any day.", next = "leather", when = { class = { "ROGUE", "HUNTER", "DRUID" } } },
        { text = "Good day, Kat.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hd_default", text = "Bear for warmth and boar for wear, and crocolisk if you can get it, though it's the devil's own job to cut. Marek's crocs make boots that'll outlast the feet in them." } },
      choices = {
        { text = "What's so hard about crocolisk?", next = "croc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    croc = {
      lines = { { id = "cr_default", text = "The scales turn a needle the same way they turn a knife, so every hole has to be punched with an awl first. I broke three awls on one belly hide last winter, and the fellow who ordered it still complained about the price." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    here = {
      lines = { { id = "he_default", text = "I followed the hides. Stormwind's tanners pay dearly for what the dwarves here throw on a pile, so I came to the pile, and I found I liked the quiet and the company." } },
      choices = {
        { text = "The company? Dwarves aren't known for quiet.", next = "company" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "co_default", text = "The quiet's outside and the company's inside, and you learn to want one after an hour of the other. Cliff Hadin's the only other human here, and he's good for a game of cards when the dwarves start singing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leather = {
      lines = { { id = "le_default", text = "Then you've sense. Plate's fine until you have to run in it or swim in it, and round this loch you'll do both before the week's out." } },
      choices = { { text = "I already have. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a leatherworker from the south who came north for the hides. That's the whole of it, and I've not regretted the trip." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. I know hides and what they cost, and not a great deal past that." } },
  },
}

-- Kelt Thomasin: human hunter lodging at the Farstrider Lodge.
P:NPC {
  key = "lm_kelt", id = TODO_NPC("Kelt Thomasin"), name = "Kelt Thomasin", gender = "male",
  bible = "bibles/missed.md", role = "hunter", tier = "service",
  communities = { "lochmodan" }, temper = { "intent", "quiet" }, values = { "patient", "nature" },
  notices = { "class", "craft" },
  impression = {
    first = "Kelt Thomasin lodges at the Farstrider Lodge and spends his days watching the water rather than the hills. He is a hunter of real skill by the dwarves' account, and of one fixed idea by his own.",
    third = "{name} met Kelt Thomasin, a hunter at the Farstrider Lodge who watches the loch.",
  },
  greetings = {
    { id = "g_default", text = "Good day. You'll forgive me if I keep one eye on the loch while we talk, for I'd hate to miss it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Nothing's surfaced since we spoke, if you were wondering." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a rod. Tell me, have you ever had a line taken so hard and so deep that you let go rather than follow it?" },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Another hunter. You'll have come for the bears or the crocolisks, I expect, as they all do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Kelt Thomasin. I've hunted most things that walk on this continent, and I've come to Loch Modan for the one that swims." } },
      again = {
        { id = "h_again", text = "Was there more? The light's good on the water just now." },
        { id = "h_again2", text = "Ask away, and I'll answer between ripples." },
      },
      choices = {
        { text = "What is it you're watching for?", next = "watch" },
        { text = "The dwarves speak well of your hunting.", next = "dwarves" },
        { text = "Good luck with your watch.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "A threshadon, and an old one. The dwarves have a tale of a great beast in the deep water by the dam, far larger than the ones that sun themselves in the shallows, and I believe there is something behind it." } },
      choices = {
        { text = "Have you seen it yourself?", next = "seen" },
        { text = "Old tales grow in the telling.", next = "tales" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "I've seen a wake with nothing in front of it, twice, and a crocolisk on the eastern island bitten clean in half. That isn't proof, I know, but it's more than a tale leaves behind." } },
      choices = { { text = "That would keep me watching too. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tales = {
      lines = { { id = "t_default", text = "So they do, and Marek has told me as much, kindly, over more than one ale. But the dwarves dammed this loch a long time ago, and nobody has seen the bottom of it since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They're generous. Marek put my name on the wall for a boar I took in Dun Morogh years ago, and I've not hunted the hills since I first heard about the loch." } },
      choices = {
        { text = "Doesn't Marek mind you sitting idle?", next = "idle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    idle = {
      lines = { { id = "i_default", text = "He minds a little, and Daryl minds a great deal, because it's hard to boast at a man who won't look round. Waiting is hunting too, though the young ones never believe it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've been a hunter all my life, and a guest of this lodge for longer than I meant to be. The loch has a hold on me." } },
    _none = { { id = "tp_none", text = "I can't help you there. I've had my eyes on the water too long to know much else of late." } },
  },
}

-- Xandar Goodbeard: general supplies at the Farstrider Lodge.
P:NPC {
  key = "lm_xandar", id = TODO_NPC("Xandar Goodbeard"), name = "Xandar Goodbeard", title = "General Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "cheerful", "fussy" }, values = { "thrifty", "kind" },
  notices = { "greenness", "race" },
  impression = {
    first = "Xandar Goodbeard keeps the Farstrider Lodge supplied with everything a hunter forgets to pack. He is cheerful, fussy about his beard, and convinced that most hunting accidents begin with a missing length of rope.",
    third = "{name} met Xandar Goodbeard, who sells general supplies at the Farstrider Lodge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome! Whatever ye left behind in Thelsamar, I've likely got it on a shelf here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! What did ye run out o' this time?" },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "Ye're a wee bit new tae be this far round the loch, {g:lad|lass}. Take a spare waterskin an' stay off the north shore till ye've a few more scars." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Now that's a well-kept beard, or the makings o' one. It's good tae see somebody in this lodge takes the trouble." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Xandar Goodbeard, an' the beard speaks for itself. I keep rope, flint, skins an' feed, an' all the wee things that turn a bad day's huntin' intae a bad week when ye havenae got them." } },
      again = {
        { id = "h_again", text = "Anythin' else ye need tae know? Askin's free." },
        { id = "h_again2", text = "Aye, go on, I'm only countin' candles." },
      },
      choices = {
        { text = "What do hunters forget most?", next = "forget" },
        { text = "How do your goods get out here?", next = "goods" },
        { text = "That is a remarkable beard.", next = "beard" },
        { text = "Good day, Xandar.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Rope, every time. They'll carry three rifles an' a keg up a hill, an' then stand over a dead bear wonderin' how tae get it back down." } },
      choices = {
        { text = "Who was the worst for it?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Young Daryl, who came back from the hills one evenin' draggin' a boar by its tail an' told the hall he'd chosen tae do it that way. I sold him a rope the next mornin' an' said nothin', because a shopkeeper has tae live wi' his customers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goods = {
      lines = { { id = "go_default", text = "By cart from Thelsamar, round the south shore, whenever the road's safe enough for a carter tae risk it. Yanni Stoutheart packs my orders at the Stoutlager, an' she's never shorted me a candle." } },
      choices = {
        { text = "What makes the road unsafe?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Kobolds in the hills on the east side, mostly, who'll take a cart apart for the candles alone. The ogres are worse, but they keep tae the north, thank the stone.", fx = { learn = { "kobolds" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beard = {
      lines = { { id = "b_default", text = "It is, an' thank ye for noticin'! It's a family matter, ye understand, for wi' a name like Goodbeard a dwarf cannae go about lookin' like a singed goat." } },
      choices = { { text = "No, I suppose not. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept the lodge's stores for years. Somebody has tae count the candles while the rest o' them count trophies." } },
    kobolds = { { id = "tp_kob", text = "Thievin' wee pests in the eastern hills. They'd steal the wick out o' a lit lamp." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. If it's no' on my shelves I've likely never thought about it." } },
  },
}

-- Aldren Cordon: clothier at Ironband's Excavation Site.
P:NPC {
  key = "lm_aldren", id = TODO_NPC("Aldren Cordon"), name = "Aldren Cordon", title = "Clothier", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "mild", "weary" }, values = { "craft", "tidy" },
  notices = { "class", "craft" },
  impression = {
    first = "Aldren Cordon sells cloth goods at Ironband's dig, which is a hard place to keep anything clean. He brushes dust from his wares between every sentence and has stopped expecting it to stay off.",
    third = "{name} met Aldren Cordon, the clothier at Ironband's Excavation Site.",
  },
  greetings = {
    { id = "g_default", text = "Good day tae ye. Everythin' on the table was clean this mornin', I promise ye, whatever it looks like now." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come back tae the dust, have ye? Ye're braver than my last three customers." },
  },
  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Robes, at a dig! Ye'll be brown tae the knees by nightfall, friend, but at least I've somebody tae sell tae who knows wool from linen." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Ye've a tailor's callus on that finger. Tell me honestly, how d'ye keep grit out o' a seam, because I've given up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Aldren Cordon, clothier. I sell shirts, gloves an' good wool tae the Prospector's diggers, who wear through all three faster than any folk I've ever served." } },
      again = {
        { id = "h_again", text = "Anythin' else? Mind the table, it's just been brushed." },
        { id = "h_again2", text = "Go on, then, while the wind's blowin' the other way." },
      },
      choices = {
        { text = "Why sell cloth at an excavation?", next = "why" },
        { text = "How is the dig going?", next = "dig" },
        { text = "The dust seems to bother you.", next = "dust" },
        { text = "Good day, Aldren.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because a digger goes through a pair o' gloves in a week an' a shirt in a month, an' Thelsamar's half a day's walk. Ironband himself asked me tae come, an' a dwarf doesnae say no tae the Explorers' League.", fx = { learn = { "explorers_league" } } } },
      choices = {
        { text = "Do you regret saying yes?", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = { { id = "r_default", text = "Only when it rains, an' the dust turns tae mud, an' the mud gets intae the wool. The rest o' the time I'm proud tae be clothin' the folk who'll dig up our beginnin's, even if they'll do it in rags." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dig = {
      lines = {
        { id = "d_done", when = { questDone = TODO_QUEST("Ironband's Excavation") },
          text = "Better since the powder came through, an' I hear ye had a hand in that. The Prospector's been smilin', which is hard on the rest of us, for now he wants everythin' done twice as fast." },
        { id = "d_default", text = "Slowly, though ye'll no' hear the Prospector say it. Magmar Fellhew keeps the tally, an' I can tell how the week's gone by how many gloves he orders." },
      },
      choices = {
        { text = "And the troggs?", next = "troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "They came up out o' the lower diggin's an' they've no' gone back down. I sell bandage linen now as well as shirts, an' I'd give a great deal tae sell less of it.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dust = {
      lines = { { id = "du_default", text = "It's in the wool, it's in my beard, an' I found some in a sealed tin o' buttons last week, which I still cannae explain. A clothier at a dig is a man bailin' a boat wi' a thimble." } },
      choices = { { text = "Keep bailing. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a clothier who followed the League tae the dig. It's honest trade, if a filthy one." } },
    troggs = { { id = "tp_tr", text = "Out o' the lower diggin's, an' meaner every week. Ask Fellhew for the count." } },
    explorers_league = { { id = "tp_el", text = "The League digs an' I keep them decent while they do it." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. I know cloth, an' more than I'd like about dust." } },
  },
}

-- Nillen Andemar: macecrafter on the Stonewrought Dam.
P:NPC {
  key = "lm_nillen", id = TODO_NPC("Nillen Andemar"), name = "Nillen Andemar", title = "Macecrafter", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "blunt", "hearty" }, values = { "craft", "strong" },
  notices = { "class" },
  impression = {
    first = "Nillen Andemar makes maces on the Stonewrought Dam, with the whole weight of the loch at his back. He has a low opinion of edged weapons and a habit of thumping the parapet to make his point.",
    third = "{name} met Nillen Andemar, the macecrafter on the Stonewrought Dam.",
  },
  greetings = {
    { id = "g_default", text = "Well met! Ye've walked a long way out on a dam tae buy a mace, so I'll assume ye know quality." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did it hit as hard as I told ye it would?" },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "Yer order's always favoured the mace, an' rightly. There's nae sharpenin' it, nae sheath tae lose, an' it works on the dead as well as the livin'." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, an' carryin' an edge, I'll wager. Ye'll come round tae the mace the first time ye meet somethin' in a shell." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Nillen Andemar, macecrafter. I forge up here because the wind off the water keeps the fire honest, an' because nobody complains about the hammerin' when there's a waterfall drownin' it out.", fx = { learn = { "stonewrought_dam" } } } },
      again = {
        { id = "h_again", text = "What else? Speak up, mind, over the water." },
        { id = "h_again2", text = "Aye, go on wi' ye." },
      },
      choices = {
        { text = "Why maces and nothing else?", next = "mace" },
        { text = "Isn't it strange, smithing on a dam?", next = "dam" },
        { text = "I'll stick with a blade, thanks.", next = "blade" },
        { text = "Good day, Nillen.", next = "END" },
      },
    },
    mace = {
      lines = { { id = "m_default", text = "Because a mace doesnae care what the other fellow's wearin'. A sword asks politely for a gap in the armour, an' a mace makes its own." } },
      choices = {
        { text = "What do you make them for, out here?", next = "troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "Troggs, these days, for the Mountaineers. A trogg's skull is the nearest thing tae a boulder that walks, an' a rifle butt's nae answer tae it once they're over the wall.", fx = { learn = { "troggs" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dam = {
      lines = { { id = "d_default", text = "It's the finest piece o' stonework in Khaz Modan, an' I'd rather work on it than look at it from the shore. Chief Engineer Hinderweir frets about every drip, but she's stood since before my grandfather an' she'll stand after me." } },
      choices = {
        { text = "The Chief Engineer seems less sure.", next = "hinder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hinder = {
      lines = { { id = "hi_default", text = "Frettin' is what he's paid for, an' he's the seventh of his line tae do it, so he's had the practice. I'll worry the day he stops, an' no' a day before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blade = {
      lines = { { id = "b_default", text = "Then stick wi' it, an' good luck tae ye, an' I'll be here when it snaps. They all come back in the end, usually holdin' half a sword." } },
      choices = { { text = "We'll see. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've made maces all my life an' I've made them on this dam for the better part of it. I'll no' be moved from either." } },
    stonewrought_dam = { { id = "tp_dam", text = "The finest stonework in Khaz Modan. She leaks a wee bit, as every dam does." } },
    troggs = { { id = "tp_tr", text = "Hard heads. Ye want weight on them, an' nae edge." } },
    _none = { { id = "tp_none", text = "Ye've lost me, friend. Ask me about iron an' I'll talk till the loch runs dry." } },
  },
}

-- Gothor Brumn: armorer at Algaz Station.
P:NPC {
  key = "lm_gothor", id = TODO_NPC("Gothor Brumn"), name = "Gothor Brumn", title = "Armorer", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "grim", "practical" }, values = { "craft", "dutiful" },
  notices = { "kit", "class" },
  impression = {
    first = "Gothor Brumn sells armor at Algaz Station, the last smith before the Wetlands road. He sizes up every traveller heading north as if working out what he'll be hammering flat when they come back.",
    third = "{name} met Gothor Brumn, the armorer at Algaz Station.",
  },
  greetings = {
    { id = "g_default", text = "Headin' north, are ye? Then ye'd best let me see what ye're wearin' before the orcs do." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back wi' all yer limbs. That's better than some manage on that road." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "By my beard, that's hangin' off ye by the rivets. Ye'll no' go through the tunnel like that if I've any say in it." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye carry the weight well, {class}. Most who come through here wear their armour like a borrowed coat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Gothor Brumn, armorer tae Algaz Station. I keep the Mountaineers here in mail, an' I sell what's left tae folk daft enough tae walk the Dun Algaz road." } },
      again = {
        { id = "h_again", text = "What else d'ye want tae know? The forge'll keep a minute." },
        { id = "h_again2", text = "Aye?" },
      },
      choices = {
        { text = "What's wrong with the road north?", next = "road" },
        { text = "What does the garrison wear out fastest?", next = "wear" },
        { text = "This seems a lonely place for a smith.", next = "lonely" },
        { text = "Good day, Gothor.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Dragonmaw orcs, holed up in the old tunnels o' Dun Algaz like rats in a granary. They've been there since the Second War ended an' nobody's had the numbers tae dig them out.", fx = { learn = { "dragonmaw" } } } },
      choices = {
        { text = "What do they fight with?", next = "orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "Axes, heavy ones, an' they swing for the shoulder. I've mended enough pauldrons tae tell ye that much, so if ye buy one thing from me, make it somethin' for yer shoulders." } },
      choices = { { text = "I'll bear it in mind. Something else.", next = "BACK" } },
    },
    wear = {
      lines = { { id = "w_default", text = "Boots, would ye believe. Mountaineer Brokk walks tae Dun Algaz an' back every day o' his life, an' Ganin walks the other way, an' between the two o' them they keep a cobbler's worth o' work on my bench." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lonely = {
      lines = { { id = "l_default", text = "It's quiet, an' I'll no' pretend otherwise. But Mountaineer Rockgar's lot need a smith within shoutin' distance, an' I'd sooner be needed here than comfortable in Thelsamar." } },
      choices = {
        { text = "That's well said.", next = "BACK", fx = { affinity = 1 }, reply = "It's only sense, but thank ye. Mind yer shoulders out there." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the station's armorer an' I have been since Rockgar took the post. It's steady work, more's the pity." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs in the Dun Algaz tunnels. They swing for the shoulder, so armour it." } },
    _none = { { id = "tp_none", text = "I've nae notion. Ask Rockgar, for he hears what comes down the road." } },
  },
}

-- Thorvald Deepforge: smith in the Valley of Kings.
P:NPC {
  key = "lm_thorvald", id = TODO_NPC("Thorvald Deepforge"), name = "Thorvald Deepforge", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "proud", "talkative" }, values = { "craft", "tradition" },
  notices = { "class", "craft" },
  impression = {
    first = "Thorvald Deepforge keeps a smithy in the Valley of Kings, under the eyes of the great statues, and sells arms to whoever comes through the gate. He works as though the stone kings were inspecting every blade.",
    third = "{name} met Thorvald Deepforge, a weaponsmith in the Valley of Kings.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae the Valley o' Kings! Ye'll want steel in yer hand before ye go further, an' I've steel tae spare." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returnin' customer. The edge held, I trust?" },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "Ye look at a weapon rack the way a brewer looks at a barrel. Go on an' heft what ye like, for I've nothin' tae hide in the balance." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A fellow smith! Tell me what ye think o' the temper on that claymore, an' be honest, for I've nobody here tae argue craft wi' but the Mountaineers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Thorvald Deepforge, smith. I sell swords, axes, maces an' staves, an' I make them here in the valley, where a dwarf cannae do shoddy work wi' those two lookin' down at him." } },
      again = {
        { id = "h_again", text = "What else can I tell ye?" },
        { id = "h_again2", text = "Go on, I can talk an' hammer both." },
      },
      choices = {
        { text = "Those two? The statues?", next = "statues" },
        { text = "Who buys weapons out here?", next = "buys" },
        { text = "You carry a wide range for one smith.", next = "range" },
        { text = "Good day, Thorvald.", next = "END" },
      },
    },
    statues = {
      lines = { { id = "s_default", text = "Aye, the kings o' stone on either side o' the pass. Every dwarf comin' up from Dun Morogh walks between them, an' I like tae think it straightens his back a wee bit." } },
      choices = {
        { text = "Does it straighten yours?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "Every mornin', {g:lad|lass}. I've thrown out more than one blade because I looked up from the quench an' felt I'd been caught at somethin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buys = {
      lines = { { id = "bu_default", text = "The Mountaineers, first an' most, for the troggs in the hills west o' here blunt an axe in a week. After them it's young folk like yerself, fresh through the South Gate an' carryin' whatever Kharanos sold them.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "The troggs come this far south?", next = "troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "They hold the valley tae the west, Stonesplinter they call it, an' they test the towers whenever they're feelin' bold. Captain Rugelfuss pays for every one put down, if ye've a mind tae earn yer steel back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    range = {
      lines = { { id = "r_default", text = "A valley smith has tae be everythin' tae everybody, for there's nae second shop tae send ye tae. My kin are smiths from here tae Ironforge, an' we were all raised tae turn a hand tae any pattern." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Deepforges have been smiths as far back as anyone's bothered tae count. I chose the valley because I like the company o' kings." } },
    troggs = { { id = "tp_tr", text = "West o' here, in Stonesplinter Valley. Hard on axes, the lot o' them." } },
    _none = { { id = "tp_none", text = "That's beyond me, friend. I know steel, an' I know this valley, an' there it ends." } },
  },
}

-- Dakk Blunderblast: Thelsamar townsman, kin to Vrok the gunsmith.
P:NPC {
  key = "lm_dakk", id = TODO_NPC("Dakk Blunderblast"), name = "Dakk Blunderblast", gender = "male",
  bible = "bibles/missed.md", role = "townsman", tier = "service",
  communities = { "thelsamar" }, temper = { "jumpy", "talkative" }, values = { "family", "comfort" },
  notices = { "class", "weary" },
  impression = {
    first = "Dakk Blunderblast lives in Thelsamar and has not had a full night's sleep in some time, by the look of him. He is kin to Vrok the gunsmith and shares the family's volume, though not its nerve where spiders are concerned.",
    third = "{name} met Dakk Blunderblast, a sleepless townsman of Thelsamar.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Ye gave me a start, creepin' up like that. I've no' been sleepin' well, ye understand." },
    { id = "g_back", when = { metBefore = true }, text = "It's yerself again. Ye didnae see anythin' wi' too many legs on yer way intae town, did ye?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're up late as well? Good, then there's two of us tae keep watch." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye walk awful quiet, friend, an' I'd take it kindly if ye didnae do it behind me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Dakk Blunderblast, an' aye, I'm Vrok's kin, before ye ask. He got the shop an' the steady hands, an' I got a bedroom on the side o' the house that faces the woods." } },
      again = {
        { id = "h_again", text = "What else? Talk a while, it keeps me awake." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "What's wrong with facing the woods?", next = "woods" },
        { text = "You don't look like you've slept.", next = "sleep" },
        { text = "Tell me about Vrok.", next = "vrok" },
        { text = "Get some rest, Dakk.", next = "END" },
      },
    },
    woods = {
      big = true,
      lines = { { id = "w_default", text = "Spiders, {g:lad|lass}, the great hairy lurkers that live under the trees west o' town. They come down off the hill after dark, an' twice now I've woken tae one sittin' on the windowsill, bold as a magistrate." } },
      choices = {
        { text = "On the windowsill? Inside the house?", next = "sill" },
        { text = "They're only spiders, Dakk.", next = "only" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sill = {
      lines = { { id = "si_default", text = "Inside, I swear it on my beard, wi' the shutter pushed open as neat as ye please. I threw a boot at the first one an' I've no' seen the boot since, so now I sleep in the pair that's left." } },
      choices = { { text = "I'll thin them out if I pass that way.", next = "BACK", fx = { affinity = 1 }, reply = "Would ye? I'd sleep the sounder for every one o' them ye put down, an' that's the truth." } },
    },
    only = {
      lines = { { id = "o_default", text = "Only spiders the size o' a ram, wi' fangs like tent pegs! Ye go an' say 'only' tae one at arm's length in the dark an' then come back an' tell me how it went." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    sleep = {
      lines = { { id = "s_default", text = "I've had perhaps three hours a night since the thaw. The Mountaineers say they've troggs enough tae worry about without standin' guard over one dwarf's window, an' I suppose they're right, though it's cold comfort at midnight." } },
      choices = {
        { text = "Why not sleep at the inn?", next = "inn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "I tried it, an' the Stoutlager sings till all hours, so I was awake for a different reason. At least at home the thing keepin' me up is quiet about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vrok = {
      lines = { { id = "v_default", text = "He's the loud one, if ye can credit it, an' the finest gunsmith in the loch. He offered me a blunderbuss for the spiders, but I'd only put a hole in my own wall, an' then they'd have a door." } },
      choices = { { text = "Wise of you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Thelsamar born, an' a Blunderblast, for my sins. I'd be a happy dwarf if I could only get a night's sleep." } },
    troggs = { { id = "tp_tr", text = "The troggs keep tae the hills, at least. It's the things wi' eight legs that come callin'." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. I can barely tell ye what day it is, the sleep I've had." } },
  },
}

