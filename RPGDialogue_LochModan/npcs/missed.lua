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
    w2_winter = {
      lines = {
        { id = "w2_winter_l0", text = "Whatever the hunters bring and whatever I have salted away in autumn. Boar mostly, bear when Marek is feeling bold, and fish from the loch when the ice lets us. I put herbs in all of it, and the dwarves pretend not to notice." },
      },
      choices = {
        { text = "Do they really not notice?", next = "w2_winter_herbs" },
        { text = "Boar every night sounds like a hardship.", next = "BACK" },
      },
    },
    w2_winter_herbs = {
      narr = "A small smile.",
      lines = {
        { id = "w2_winter_herbs_l0", text = "Marek asked me last winter why the stew tasted \"of a garden,\" and I told him it was the bear. He has eaten three helpings every night since, and I have not corrected him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What does the lodge eat, through the winter?", next = "w2_winter" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a friend o' the beasts! Come in, for the kettle's on, an' there's a warm spot by the stove for yer companion too." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll train yer beast, for it's no' the beast's fault who holds its lead." },
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
    w2_bench = {
      narr = "He crouches, peers, and straightens with a grunt.",
      lines = {
        { id = "w2_bench_l0", text = "A lynx kit some hunter brought in wi' a broken leg, an' then left, for she said she'd nae use for a lame cat. The leg's mended now, an' she's no' lame, an' she's no' that hunter's either." },
      },
      choices = {
        { text = "Will you keep her?", next = "w2_bench_keep" },
        { text = "A hunter shouldn't abandon an injured beast.", next = "BACK", reply = "Aye, an' if that one comes back for her, she'll hear it from me first.", fx = { align = { honor = 1 } } },
        { text = "A lame beast is no use to a hunter.", next = "BACK", reply = "Then that hunter's nae use tae a beast, an' I'll thank ye no' tae say it again near the kit.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_bench_keep = {
      lines = {
        { id = "w2_bench_keep_l0", text = "Till the right hunter walks in, one who'll sit down on the floor tae meet her instead o' lookin' down at her. She'll pick them; I'll only agree." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Claude Erksine. I teach beasts their manners an' their hunters a bit o' sense, an' I'll tell ye plainly the beasts learn quicker." } },
      again = {
        { id = "h_again", text = "What else, then? Speak up, for my hearin's no' what it was since the owl." },
        { id = "h_again2", text = "Go on, I'm listenin', an' so's whatever's under the bench." },
      },
      choices = {
        { text = "A beast that trusts you deserves to be treated fairly.", next = "BACK", reply = "Aye, it does, an' it'll give ye its life for that trust, so mind ye earn it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A pet's a tool, and tools wear out.", next = "BACK", reply = "Then ye'll never have a beast worth the name, an' I'm sorry for the one ye've got.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Which beasts around the loch make good companions?", next = "beasts" },
        { text = "Those are a lot of scars.", next = "scars" },
        { text = "What can you teach my companion?", next = "teach", when = { class = "HUNTER" } },
        { text = "How do I keep my beast loyal, Claude?", next = "hp", when = { class = "HUNTER" } },
        { text = "Train my companion, Claude.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Does a dwarf's beast differ from anyone else's?", next = "hp_dwarf", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "What's asleep under the bench right now?", next = "w2_bench" },
        { text = "Good day, Claude.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Ye feed it, ye keep it alive, an' ye dinnae let it go hungry, an' then ye wait a long while. A beast's loyalty grows slower than a beard an' falls out quicker, an' a beast that's been neglected too long will walk off one night an' no' come back." },
        { id = "hp_pet", when = { pet = { type = "Beast" } }, text = "Give {pet} here a moment, an' let me look at its eyes. Aye, it's fed, an' it trusts ye some, so keep doin' what ye're doin' an' it'll trust ye more, for loyalty grows slow an' falls out quick." },
      },
      again = { { id = "hp_again", text = "What else? Mind the bench." } },
      choices = {
        { text = "What should I feed it here at the Loch?", next = "hp_feed" },
        { text = "Can my beast learn tricks from wild beasts?", next = "hp_wild" },
        { text = "Something else, Claude.", next = "hello" },
      },
    },
    hp_feed = {
      lines = { { id = "hpf_default", text = "Fish from the loch for a bear or a crocolisk, an' mutton or boar for a cat or a wolf, an' bread only if it's starvin'. Buy from the Stoutlager if ye must, but the best meat's what ye hunt yerself, an' the beast knows the difference." } },
      choices = {
        { text = "I'll hunt its food myself.", next = "BACK", reply = "Good, an' share the best bits wi' it, no' the gristle.", fx = { align = { light = 1 } } },
        { text = "Bread's cheaper, and it'll eat when it's hungry.", next = "BACK", reply = "It will, an' it'll think less o' ye every time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_wild = {
      lines = { { id = "hpw_default", text = "Aye, though no' directly. Ye tame a wild beast that knows the trick an' ye learn it off them, an' then ye let it go an' teach yer own. The owl that took my hearin' knew a trick or two, an' I'd no' recommend tamin' it." } },
      choices = {
        { text = "I'll leave the owls alone.", next = "BACK", reply = "Wise. The owls will thank ye, an' so will yer ears.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_dwarf = {
      lines = { { id = "hpd_default", text = "No' in the beast, but in the hunter. A dwarf keeps a beast like he keeps a rifle, oiled an' fed an' never lent tae anyone, an' the beast picks up on it an' gets possessive, so dinnae be surprised when yer boar bites the next dwarf who pats it." } },
      choices = {
        { text = "That's the way it should be.", next = "BACK", reply = "Aye, it is, though my fingers would argue.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you've come back to keep watch with me. The loch is better company when there's someone to share it with." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand wherever you like, so long as it isn't between me and the water." },
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
    w2_nights = {
      lines = {
        { id = "w2_nights_l0", text = "Writing letters to my sister in Lakeshire, mostly, which she reads aloud to the whole town. By now there are people by Lake Everstill who know more about Loch Modan than most dwarves do." },
      },
      choices = {
        { text = "What do you tell her?", next = "w2_nights_tell" },
        { text = "Lakeshire must think you've lost your mind.", next = "BACK" },
      },
    },
    w2_nights_tell = {
      lines = {
        { id = "w2_nights_tell_l0", text = "The truth, mostly. The colour of the water, the dwarves' songs, the bear Daryl didn't kill. She writes back that Lakeshire has its own trouble with gnolls, and asks when I'm coming home, and I never quite answer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Kelt Thomasin. I've hunted most things that walk on this continent, and I've come to Loch Modan for the one that swims." } },
      again = {
        { id = "h_again", text = "Was there more? The light's good on the water just now." },
        { id = "h_again2", text = "Ask away, and I'll answer between ripples." },
      },
      choices = {
        { text = "Where did you hunt before Loch Modan?", next = "ykelt_past" },
        { text = "One hunter to another: is it worth the wait?", next = "ykelt_hunter", when = { class = "HUNTER" } },
        { text = "What is it you're watching for?", next = "watch" },
        { text = "The dwarves speak well of your hunting.", next = "dwarves" },
        { text = "How do you pass the nights at the lodge?", next = "w2_nights" },
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
    ykelt_past = {
      lines = {
        { id = "yykelt_past_d", text = "Stranglethorn first, under the old hunting parties out of Booty Bay, and then the Redridge hills for bears and the Wetlands for raptors. I took a trophy from most of them and kept none, for they never felt like the end of anything." },
      },
      choices = {
        { text = "What would feel like the end?", next = "ykelt_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykelt_end = {
      narr = "He lifts his gaze back to the far side of the loch and holds it there.",
      lines = {
        { id = "yykelt_end_d", text = "The threshadon, if it's real. I'm not a young man any more, friend, and I'd like one hunt in my life that the tellers can't improve on, because I was there and it was bigger than they said." },
      },
      choices = {
        { text = "And if it isn't real?", next = "ykelt_unreal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykelt_unreal = {
      lines = {
        { id = "yykelt_unreal_d", text = "Then I'll have spent my last good seasons watching water, and Daryl will have a story about me to tell at the lodge fire. I've made my peace with that, mostly, though I'd not say so to him." },
      },
      choices = {
        { text = "What will you do if you find it?", next = "ykelt_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykelt_find = {
      lines = {
        { id = "yykelt_find_d", text = "That's the question that keeps me up some nights. A beast that old has outlived the dam and the dwarves who built it, and part of me wants only to see it once and let it go back down." },
      },
      choices = {
        { text = "Then let it go. Some things should stay wild.", next = "BACK", reply = "You've said what I keep telling myself on the quiet evenings. Thank you for that.", fx = { align = { order = -1 } } },
        { text = "Take it. The lodge wall is where a hunt ends.", next = "BACK", reply = "That's the Farstrider way, and Marek would cheer you for it. I'm still not sure it's mine.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykelt_hunter = {
      lines = {
        { id = "yykelt_hunter_v0", when = { race = "Dwarf" }, text = "You'll have heard the threshadon tale at your grandfather's knee, I'd wager, so you'll know better than I do how much of it to believe. I believe all of it, which is either the patience of a hunter or the foolishness of an old man." },
        { id = "yykelt_hunter_d", text = "Worth it? A hunter who needs to be told that hasn't waited long enough yet, though I'll grant you it's a cold kind of hunting. The bears in the hills will feed your pot, and the loch will feed nothing but your wondering." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    farstrider_lodge = { { id = "tp_yfarstrider_lodge", text = "Marek and his hunters have treated me like kin, though I think they've stopped expecting me to hunt anything with legs." } },
    stonewrought_dam = { { id = "tp_ystonewrought_dam", text = "The dam holds back more water than anyone in Thelsamar likes to think about, and something lives in the deepest of it." } },
    background = { { id = "tp_bg", text = "I've been a hunter all my life, and a guest of this lodge for longer than I meant to be. The loch has a hold on me." } },
    _none = { { id = "tp_none", text = "I can't help you there. I've had my eyes on the water too long to know much else of late." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my best customer returns! I've an axe on the rack wi' a balance ye'll weep over, an' I was hopin' ye'd come by." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll sell ye steel, for the kings up there wouldnae have me turn anyone away, but dinnae expect a chat." },
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
    w2_ore = {
      lines = {
        { id = "w2_ore_l0", text = "Silver Stream Mine, once, before the troggs took it. Now it comes by cart from Ironforge, slow an' dear, an' I've started buyin' from any miner who walks through the gate wi' a full pack." },
      },
      choices = {
        { text = "I could bring you ore.", next = "w2_ore_bring", when = { profession = "Mining" } },
        { text = "Can't the Mountaineers clear the mine?", next = "w2_ore_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_ore_bring = {
      lines = {
        { id = "w2_ore_bring_l0", text = "Then bring it, friend, an' I'll pay ye better than Ironforge pays for the same, for every lump o' copper I dinnae have tae wait on is a sword I can sell this week." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_ore_mine = {
      lines = {
        { id = "w2_ore_mine_l0", text = "They've cleared it twice, an' twice the troggs came back up from below. There's somethin' under Loch Modan that keeps sendin' them, an' nae number o' Mountaineers can fight the whole underneath." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Thorvald Deepforge, smith. I sell swords, axes, maces an' staves, an' I make them here in the valley, where a dwarf cannae do shoddy work wi' those two lookin' down at him." } },
      again = {
        { id = "h_again", text = "What else? Ask under the statues, they've heard worse." },
        { id = "h_again2", text = "Go on, I can talk an' hammer both." },
      },
      choices = {
        { text = "Good steel should be sold for exactly what it's worth.", next = "BACK", reply = "Spoken like a dwarf! An honest blade at an honest price, wi' the kings lookin' on tae see it done.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "I'd sell soft iron as steel if the buyer couldn't tell.", next = "BACK", reply = "Then ye'd best never try it here, for the first trogg ye met would tell ye the truth of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How long have the Deepforges been smiths?", next = "ytho_family" },
        { text = "What do you think of a gnome blacksmith?", next = "ytho_gnome", when = { race = "Gnome" } },
        { text = "Do the kings watch over your work?", next = "ytho_kings" },
        { text = "Those two? The statues?", next = "statues" },
        { text = "Who buys weapons out here?", next = "buys" },
        { text = "You carry a wide range for one smith.", next = "range" },
        { text = "Where do you get your ore out here?", next = "w2_ore" },
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
    ytho_family = {
      lines = {
        { id = "yytho_family_d", text = "Since before Modimus Anvilmar sat the throne, if ye believe my great-grandmother, an' I'd no' dare disbelieve her even now she's gone. Every Deepforge learns the hammer before the alphabet, an' some never quite get tae the alphabet." },
      },
      choices = {
        { text = "Did you ever want another trade?", next = "ytho_trade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytho_trade = {
      lines = {
        { id = "yytho_trade_d", text = "Once, when I was young an' daft, I wanted tae be a brewer, for the brewers had all the lasses. My da put a hammer in my hand an' said a brewer makes folk forget, an' a smith makes sure they live tae remember." },
      },
      choices = {
        { text = "What's the hardest blade you've made?", next = "ytho_hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytho_hardest = {
      narr = "Thorvald sets down his hammer and wipes his hands slowly on his apron.",
      lines = {
        { id = "yytho_hardest_d", text = "A sword for a Mountaineer who'd lost his brother tae the troggs, an' wanted a blade tae avenge him. I made it true, but I've wondered since if I should've told him tae grieve first an' fight after, for he took it straight intae the hills." },
      },
      choices = {
        { text = "You should have counselled him. Vengeance blinds.", next = "BACK", reply = "Aye, maybe I should. A smith's no' a priest, but I could've tried.", fx = { align = { light = 1 } } },
        { text = "You gave him what he needed. Justice is no sin.", next = "BACK", reply = "That's what I told myself, an' maybe it's true. He came back, at least.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytho_gnome = {
      lines = {
        { id = "yytho_gnome_d", text = "A gnome at the anvil? I've seen it, an' the work was finer than I'd expected, for yer folk measure twice an' strike once. I'd hire one if they'd come out tae the valley, but they all want tae stay near Tinker Town." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytho_kings = {
      lines = {
        { id = "yytho_kings_d", text = "Aye, for they stood when the clans broke, an' there's nae better company for a smith. When I make a blade under their eyes, I make it well, for I'd no' want tae disappoint a king, even a stone one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    deepforge = { { id = "tp_ydeepforge", text = "My family's name an' my family's trade. We've been smiths since before the throne." } },
    valley_of_kings = { { id = "tp_yvalley_of_kings", text = "The kings watch my forge, an' I make sure they've nae cause tae frown." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, thank the stone, it's you! Sit a while, would ye, for I sleep better knowin' somebody brave is in town." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Ye can stand there if ye like, but dinnae go creepin' up on me again." },
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
    w2_slept = {
      lines = {
        { id = "w2_slept_l0", text = "Once, the summer before last, when the inn was full o' Mountaineers an' I could hear them snorin' through the wall. Somethin' about a hundred armed dwarves snorin' is the most comfortin' sound I know." },
      },
      choices = {
        { text = "You could sleep at the inn every night.", next = "w2_slept_inn" },
        { text = "Fear is a hard thing to sleep through.", next = "BACK" },
      },
    },
    w2_slept_inn = {
      lines = {
        { id = "w2_slept_inn_l0", text = "On whose coin? Hearthstove charges by the night, an' Vrok says if I'm payin' tae sleep next tae soldiers, I'd may as well join them. I've thought about it, mind; the rifle's no' the problem, it's the dark." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Dakk Blunderblast, an' aye, I'm Vrok's kin, before ye ask. He got the shop an' the steady hands, an' I got a bedroom on the side o' the house that faces the woods." } },
      again = {
        { id = "h_again", text = "What else? Talk a while, it keeps me awake." },
        { id = "h_again2", text = "Go on. I'm awake, near enough, an' that's more than I can say for most nights." },
      },
      choices = {
        { text = "What's wrong with facing the woods?", next = "woods" },
        { text = "You don't look like you've slept.", next = "sleep" },
        { text = "Tell me about Vrok.", next = "vrok" },
        { text = "Have you told the mountaineers about the spiders?", next = "db_told" },
        { text = "What do you do in Thelsamar?", next = "db_work" },
        { text = "Have you ever slept well in Thelsamar?", next = "w2_slept" },
        { text = "Get some rest, Dakk.", next = "END" },
      },
    },
    db_told = {
      lines = {
        { id = "db_told_1", text = "Every one o' them, an' they nod an' say they'll look intae it, an' then they go back tae watchin' for troggs. I cannae blame them, for the troggs are a bigger trouble, but the spiders are the ones outside my window." },
      },
      choices = {
        { text = "I could deal with the spiders myself.", next = "db_help" },
        { text = "Troggs and spiders both. Thelsamar's surrounded.", next = "BACK", reply = "Feels that way, aye, every night." },
      },
    },
    db_help = {
      lines = {
        { id = "db_help_1", text = "Would ye? They come down from the hills north o' town, an' they're thick as my arm, wi' eyes that catch the lamplight. If ye clear a few, I'll sleep a night through for the first time since spring." },
      },
      choices = {
        { text = "I'll clear them for you, Dakk.", next = "BACK", fx = { affinity = 1 } },
        { text = "Thick as your arm? I'll think about it.", next = "BACK" },
      },
    },
    db_work = {
      lines = {
        { id = "db_work_1", text = "I help Vrok wi' the shop when he'll let me, which is no' often, an' I carry for the inn when he won't. It's honest work, though I'm no' sure what I'm best at yet, apart from bein' tired." },
      },
      choices = {
        { text = "What would you like to do?", next = "db_like" },
        { text = "I'm a dwarf. We find our trade eventually.", next = "db_like", when = { race = "Dwarf" } },
      },
    },
    db_like = {
      lines = {
        { id = "db_like_1", text = "Brew, if I'm honest, for I've a knack for it, an' Innkeeper Hearthstove says my stout's the best he's tasted outside Ironforge. But Vrok says brewin's no' a trade for a Blunderblast, an' I've no' the nerve tae argue." },
      },
      choices = {
        { text = "You should brew. Vrok will come round.", next = "BACK", fx = { affinity = 1 } },
        { text = "A Blunderblast brewer. Why not?", next = "BACK" },
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

