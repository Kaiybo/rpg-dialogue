-- Everlook: the Steamwheedle Cartel's trading post at Winterspring's crossroads. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "vizzie", id = TODO_NPC("Innkeeper Vizzie"), name = "Innkeeper Vizzie",
  bible = "bibles/winterspring.md", role = "innkeeper", tier = "service",
  communities = { "everlook" }, temper = { "jumpy" }, values = { "friendly", "practical" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Vizzie checked me for bugs before she let me near the fire. She moved to the top of the world to get away from insects, and she's still losing to one beetle.",
    third = "{name} met Innkeeper Vizzie, the jumpy goblin who keeps the only inn in Everlook.",
  },

  greetings = {
    { id = "g_inn", text = "Come in and shut the door, shut it, sugar, before the cold gets in, and the bugs, because I pay good gold for firewood and I'm not heatin' the whole mountain! You didn't bring any bugs, did you?" },
    { id = "g_home", when = { homeInn = { "Everlook" } }, text = "Welcome back, sugar! There's a warm bed, a hot drink and no bugs, because I checked twice, and the room rate's the same as last time, which in Everlook is practically a miracle." },
    { id = "g_away", when = { away = 14 }, text = "Shut the door, shut it, you've been gone {away} and you're letting all the warm out, and warm costs money up here! Let me look at you, sugar, and make sure you didn't bring any bugs back." },
    { id = "g_away_long", when = { away = 60 }, text = "Sugar, you've been gone {away}, and I'd half rented your room to a trapper, because an empty bed earns nothin'. Come in and get warm, and tell me there were no bugs where you've been." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody came in here smiling about something you told them, sugar, and in this cold a smile's harder to come by than a dry pair of socks. Whatever you said, say it more often, because happy customers order seconds." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I heard you gave somebody a fright in town, sugar, and they were telling it at my bar for an hour, so save it for my beetle, would you?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look frozen through and then some, sugar. Sit by the fire, but slowly, because thawing hurts, and I can't bill you for the screaming." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Careful out there in that state, sugar. People fall asleep in the snow and wake up as a furbolg's breakfast, and then who pays for the room?" },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, all the time, sugar, mostly on their way to fight the Winterfall or coming back from them with claw marks. They eat like bears, sleep like bears and tip like bears, which is to say not at all, and every one of 'em swears they'll kill my beetle and then leaves it alive." } },
      choices = {
        { text = "In a neutral town, a warrior keeps the blade sheathed and the temper too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If someone starts trouble at your fire, I'll finish it, Bruisers or no.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, sugar.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Something in their firewater, the trappers say, and it's made 'em nasty all the way up the valley. They used to come and trade pelts at the gate, and good pelts at that, and now nobody goes past the edge of town without a sword." } },
      choices = {
        { text = "They're sick, not wicked. They can be saved.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sick or not, they're dangerous. Keep the door shut.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Never, and I didn't mind at first, because bugs hate the cold even more than I do! But now there's the beetle, and the furbolgs gone mean out past the springs, and the wind howls so loud at night I swear it's saying something. You'd know better than me whether it's angry, wouldn't you?" } },
      choices = {
        { text = "I'll speak to the wind for you. That's what I'm for.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "For a hot bowl of soup, I'll tell it anything you like.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not in my inn, sugar, because the Cartel's bruisers stand at the gate and every goblin in town counts their coin twice, and I count mine three times. Pick a pocket in Everlook and you'll be walking back to Felwood in your smallclothes, and that's a long, cold walk." } },
      choices = {
        { text = "Good. A neutral town needs rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bruisers can't watch every pocket, though.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll behave myself, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I did, sugar, and the fella who sold me this place swore nothing creepy could live in the cold, and then the yetis brought in fleas and the frostsabers brought in ticks, so I'm still waiting on my refund. A mage could freeze the lot of 'em solid, I suppose, but then I'd have a frozen inn, and that's bad for business." } },
      choices = {
        { text = "I'll freeze any bug that bothers you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bugs are your problem, not mine.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Good luck with the fleas.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mostly is the word that worries me, sweetie. The last warlock who stayed here let his little friend sleep by the fire, and I found singe marks on the rug for a week and put the rug on his bill, so your demon stays on your side of the room." } },
      choices = {
        { text = "I'll keep it off your rug, I promise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where I go.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll sit by the door.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Mostly I see priests when somebody's come down off the mountain half frozen and the Light's the only thing keeping them breathing. So I keep the back room warm for that, and I keep the soup on, and I don't ask what they were doing up there." } },
      choices = {
        { text = "That's good work, Vizzie. A warm room saves lives.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Anyone who climbs Winterspring unprepared has earned their frostbite.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Less than you'd think, sugar, because the bruisers are bigger than anybody, and the cold puts everyone in a mood to share a fire. Now and then somebody starts a quarrel over an old war, and I remind 'em the inn's neutral, the snow outside isn't, and broken chairs go on the tab." } },
      choices = {
        { text = "Good. Old grudges should stay outside your door.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some grudges are earned. This truce won't last.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Warmth first, a bowl of something hot second, and somebody to listen to them third, because the ones who come down off the mountain have usually seen something nasty in the passes. A priest who sat by the fire and listened would do more good here than any spell." } },
      choices = {
        { text = "Then I'll sit a while and listen.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Listening's your trade, not mine. I'll be on my way.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_vizzie = {
      lines = {
        { id = "xalt_vizzie_default", text = "{alt}, sugar, and a lovely guest, because {alt} squashed a beetle by the hearth without my even asking, and you can't put a price on that. Stayed a night, ate two bowls of soup and went off toward the hot springs." },
        { id = "xalt_vizzie_other", when = { alt = { faction = "other" } }, text = "{alt}, sugar, a {altrace} from the other side, and if you two ever end up in my inn the same night, I'm putting you at opposite ends of the room, related or not. Not because I expect trouble, mind, but because the beetle likes a crowd." },
      },
      choices = {
        { text = "Kin or not, I'd share a fire with anyone up here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Opposite ends sounds right. Some lines shouldn't be crossed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Oh, sugar, you gave me a turn, because a {altrace} called {alt} sat right there by the fire a while back, from the other side of things, with exactly your way of eyeing the rafters for beetles. Is everybody in the world related except me?" },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" }, metBefore = false },
          text = "You've got kin come through Everlook, I'd bet my best mop on it, because {alt} stamped the snow off a pair of boots just like yours and told me there were no bugs in Winterspring, the sweet liar." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and dressed for it! Stamp the snow off those boots at the door, sugar, and if you see a beetle on the hearth, you have my permission to cut it in half, just not the hearth." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, sugar, tell me the spirits don't send bugs, because if one of your totems starts buzzing it's going straight outside." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You've got good eyes and quick hands, sugar, so if you see anything with too many legs scuttling about my rafters, you squash it, and I'll love you forever, though I'll still charge you for the room." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Oh, a mage, thank goodness! Could you conjure a little fire for the back room, sugar? The hearth never reaches that far, the bugs love a cold corner, and firewood up here costs more than the furniture." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, and is that an imp? Keep it off the tables, please, because it looks exactly like a big red beetle, and I'll scream if it so much as twitches." },
        { id = "h_default", key = true,
          text = "I'm Innkeeper Vizzie, sugar, and this is the best inn in Everlook, and sure, it's the only inn in Everlook, but that doesn't make it not the best. It's the warmest place for a hundred miles at a very fair rate, and the cold keeps the creepy-crawlies down, mostly." },
        { id = "h_bugs", tags = { "gossip" },
          text = "People ask why a goblin would run an inn at the top of the world, sugar, and it's two words: no bugs. Well, fewer bugs, anyway, because there's still that one beetle, and I know it's in here eatin' my profits." },
        { id = "h_beetle", when = { metBefore = true }, text = "I found the beetle, behind the bar! It looked at me and I looked at it, and we've agreed to stay out of each other's way, which is the cheapest contract I ever signed." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid in my inn! You'll be wanting to know about the furbolgs, I bet, sugar, since everybody from the Circle does, and the answer is they've gone mean and I keep the door shut and the bolt oiled." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, sugar, you don't know a prayer against beetles, do you? I'd light a candle every night for one, because that bug by the hearth has outlived three traps and a boot." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, all shiny! Mind you don't drip snowmelt off that plate onto my floor, sugar, because I've only just mopped it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, up in the snow with the rest of us! Warm yourself at the fire, and if your loa or your Light have anything to say about beetles, I'd dearly love to hear it." },
      },
      again = {
        { id = "h_again", text = "More? Sit by the fire, then, sugar, only not too close, because the beetle lives there and it doesn't pay rent." },
        { id = "h_again2", text = "What else, sugar? I've got gossip and soup, both of 'em hot, and only one of 'em costs you." },
      },
      choices = {
        { text = "Does the wind up here ever let up, Vizzie?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's happened to the Winterfall, Vizzie?", next = "druid_q", when = { class = "DRUID" } },
        { text = "A room, please.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Who comes through Everlook?", next = "guests" },
        { text = "Why are you so scared of bugs?", next = "bugs" },
        { text = "Who are your neighbours here?", next = "neighbours" },
        { text = "I could track that beetle for you.", next = "beetle_hunt", when = { class = "HUNTER" } },
        { text = "Do rogues cause much trouble in Everlook?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You came all the way up here to get away from bugs?", next = "xmage", when = { class = "MAGE" } },
        { text = "My imp's harmless. Mostly.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'm afraid the Light doesn't do beetles. What else brings priests here?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Everlook see much trouble, with Horde and Alliance under one roof?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the folk at your fire need most, Vizzie?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you get many warriors through Everlook, Vizzie?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Someone like me stayed at your inn, Vizzie?", next = "xalt_vizzie", when = { alt = true } },
        { text = "Goodbye.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "g_default", text = "Traders, mostly, and Argent Dawn folk, with Horde and Alliance at the same tables glaring at each other over the soup. Nobody fights, though, because the bruisers see to that, and so does the soup, and so does the bill for the furniture." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = {
        { id = "nb_default", text = "Umi's building something furry, Legacki's laughing at it, and Felnok won't let anybody near his bench without gloves. Then there's the Dark Iron fellow, who calls my customers ants and still tips better than any of 'em, so he can call 'em whatever he likes." },
        { id = "nb_yeti", when = { questDone = TODO_QUEST("Are We There, Yeti?") }, text = "Legacki hasn't stopped glaring at the door since that yeti came through it, and Umi hasn't stopped grinning. I serve them at opposite ends of the bar now." },
      },
      choices = {
        { text = "Tell me about the Dark Iron.", next = "neighbours_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_dark = {
      lines = { { id = "nd_default", text = "Malyfous, of the Thorium Brotherhood, and he's polite to nobody, but he pays on time and he's never once brought a bug in, sugar. In my ledger that makes him a model guest." } },
      choices = {
        { text = "Coin's coin. Whoever pays is welcome.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A Dark Iron should earn his welcome first.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beetle_hunt = {
      lines = { { id = "bh_default", text = "You'd do that? No, no, don't, sugar, because we've got a truce, and if you scare it off it'll only come back angrier with its cousins and I'll be payin' for traps all winter. Just keep your pet off the bar, that's all I ask." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    bugs = {
      lines = { { id = "b_default", text = "Ever woken up with one in your ear? I have, in Tanaris, and that's why I live where it snows. Don't laugh... oh, fine, laugh, but quietly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Tanaris girl, bug survivor, innkeeper at the top of the world. I followed the cold, sugar, and the cold was hiring." } },
    advice = { { id = "tp_ad", text = "Shake out your bedroll before you sleep in it, sugar. Up here it's yetis; anywhere else, it's worse." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel set this place up for trade, and I set up the inn because traders need beds and beds pay by the night. It's good business, sugar, if cold business." } },
    _none = { { id = "tp_none", text = "No idea, sugar, so ask a trader, because they know everything worth money and charge for the rest." } },
  },
}

P:NPC {
  key = "umi", id = TODO_NPC("Umi Rumplesnicker"), name = "Umi Rumplesnicker",
  bible = "bibles/winterspring.md", role = "trainer", tier = "service",
  communities = { "everlook" }, temper = { "playful" }, values = { "inventive", "mischievous" },
  notices = { "race", "class" },

  impression = {
    first = "Umi Rumplesnicker told me not to touch anything, then changed her mind three times about which things. Whatever she's building, it's furry, and someone is going to scream.",
    third = "{name} met Umi Rumplesnicker, the playful goblin engineer of Everlook with a prank in progress.",
  },

  greetings = {
    { id = "g_shop", text = "Oh, a customer! Don't touch that, or that, though that one's fine... no, wait, don't touch that one either!" },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin! Then you know: a good invention is half engineering and half making your friends scream." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mischief, mostly, and I'm the only one allowed to teach it that! Legacki screams every time it rounds a corner, which is the whole point, but an imp would set it on fire, and fur is terribly expensive this far north." } },
      choices = {
        { text = "A prank's harmless. My imp isn't. I'll keep it leashed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little fire would make the joke better.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I haven't the faintest idea, which is exactly why it's exciting! A priest blessed it once by accident and it blinked at me, and either that was the Light or a loose wire, and I'd hate to find out it was the wire." } },
      choices = {
        { text = "Leave the Light out of your pranks, Umi. It isn't a toy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If the Light makes it scarier, I'd call that a fine use.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll keep my distance from the yeti.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a scare's no good if it only frightens goblins, and I want to know it would make a proper fighter jump too! Legacki screams at anything, but if a warrior in plate takes one step back, then I'll know the yeti's ready." } },
      choices = {
        { text = "A trained warrior holds the line, Umi. Your yeti won't move me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd charge it on sight and smash it to bits. That's half the fun.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, before it starts ticking.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I do, I really do, because you've tracked the yetis out in the Ice Thistle Hills, and I've only ever seen their fur on a skinner's table. If a hunter can't tell mine from the real thing at twenty paces, then Legacki certainly won't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} away from the bench, please! The last animal that sniffed this fur decided it was a rival and bit the yeti's leg off." },
      },
      choices = {
        { text = "I'll judge it fairly, but a prank should stay harmless, Umi.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Make it walk like a real one and let all Everlook panic.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_um = {
      lines = {
        { id = "gum_default", text = "Finally, someone with taste! The goblins here think a sense of humour is something you sell by the pound. Bring me the fur and the springs, and I'll put your name on the schematic, small, in the corner, but it'll be there." },
      },
      choices = {
        { text = "Make it big. Goblins deserve big.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Isn't it a little cruel?", next = "prank_cruel" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Trouble them? Oil turns to jelly, springs snap and gears freeze solid if I turn my back for a minute! I've started wrapping my best work in yeti fur, which counts as respecting the local spirits, doesn't it? I'm sure your earth friends would approve, as long as nobody tells the yetis." } },
      choices = {
        { text = "Build what you like. The spirits can bear a little mischief.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Machines don't belong in the wild. Mind what you build.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because I can, and because Legacki laughed at me, and you don't laugh at an engineer unless you want a furry metal monster waiting by your door. Magic's very well, but nothing beats a good gear train when you want to scare someone properly." } },
      choices = {
        { text = "Engineering beats magic for a good prank, I'll grant you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Scaring people isn't much of a goal for a craftsman.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my sparks to myself.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nobody's, officially, and certainly not Legacki's, because she'd never suspect a yeti behind her counter. Engineers and rogues are cousins, really, since we both love a mechanism and we both hate being caught." } },
      choices = {
        { text = "A harmless prank never hurt anyone.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Leave her shop alone. It's hers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my hands to myself.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Gnomeregan's gone, half my friends are sleeping in Ironforge's spare rooms, and the whole world's gone grim, so yes, a good scare and a good laugh are worth every gear. I'd have thought a priest of all people would know a laugh mends more than a bandage does, some days." } },
      choices = {
        { text = "Mischief has its place. Life's grim enough without it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "There are better uses for your skill than frightening goblins.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Harmless? It's a work of art, and it's only going to frighten Legacki and Sprinkle and Quixxil a little bit, which they deserve. Everlook is cold and dull and full of goblins counting money, so somebody has to keep it lively." } },
      choices = {
        { text = "Frightening people isn't much of a gift, Umi.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A bit of chaos does a cold town good.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "To scare goblins, mostly, and because nobody's ever done it! I know your kind would say a real yeti is better than any machine, and maybe so, but a real yeti won't sit still while I fit it with a whistle. Mine won't hurt the wild ones, I promise; it's a joke, not a hunter." } },
      choices = {
        { text = "Leave the wild yetis be. A joke's fine if no beast pays for it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A machine that scares goblins? Build ten of them, Umi.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Never mind the yeti.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Oh, don't let your imp near my yeti, because it's already got one bad habit, which is frightening people, and I don't want it picking up a second." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Stand right there, please, because I've been wondering whether my yeti's eyes would glow if a holy sort walked past, and I need a witness who won't lie about it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Stand still a moment, would you? I need to know how tall a yeti has to be before somebody in armour stops being brave about it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Oh, you'll know a real yeti's tracks better than anybody, so tell me honestly, does mine walk like one or like a gnome in a fur coat?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do you think the spirits would mind a mechanical yeti? I'd hate to offend the snow, because it's been so good to me." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Could you make something glow? No, wait, don't, the last spark nearly set my yeti's fur alight, and that fur took me three weeks to get." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, eh? You've got the right hands for fiddly work, and I always need someone to slip a part into somebody's shop when they're not looking, purely for science." },
        { id = "h_default", key = true,
          text = "Umi Rumplesnicker, engineer! I teach, I tinker, and right now I'm building something wonderful. It's big, it's furry, it's mechanical, and it's going to scare the bolts off every goblin I know." },
        { id = "h_yeti", tags = { "news" }, when = { questActive = TODO_QUEST("Are We There, Yeti?") },
          text = "Yeti parts, real fur and real horns! The mechanical bits I've got already, so bring me the rest and we'll make a monster." },
        { id = "h_own", when = { questActive = TODO_QUEST("A Yeti of Your Own") },
          text = "An engineer who wants a yeti of their own? Oh, you have good taste. Let me show you how it's done." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Don't bless the yeti, please, because I've no idea what holy water does to clockwork, and I'd rather not find out before Legacki screams." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Don't bless anything in here, please; the last time someone said a prayer over my yeti its eyes lit up, and I don't think that was me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You can turn into a bear, can't you? I'm building a yeti, and I'd love to know how a real animal moves, because mine keep falling over on the ice." },
      },
      again = {
        { id = "h_again", text = "More? Ooh, I love questions, because questions are how pranks start." },
        { id = "h_again2", text = "Ask away, but quickly, because something on that bench is ticking." },
      },
      choices = {
        { text = "Does the cold up here trouble your machines, Umi?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who are you scaring?", next = "prank" },
        { text = "Teach me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Why a yeti?", next = "yeti" },
        { text = "A gnome scaring goblins? Count me in.", next = "gnome_um", when = { race = "Gnome" } },
        { text = "Why build a mechanical yeti at all?", next = "xmage", when = { class = "MAGE" } },
        { text = "Slip a part into someone's shop? Whose?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is all this mischief really worth the trouble, Umi?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is your mechanical yeti really just a harmless prank, Umi?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why measure your yeti against a warrior, Umi?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you want a hunter's opinion of your yeti, Umi?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why build a mechanical yeti at all, Umi?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why would a holy sort make your yeti's eyes glow, Umi?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would my imp teach a mechanical yeti, Umi?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll find parts.", next = "END", fx = { affinity = 2 } },
      },
    },
    prank = {
      lines = {
        { id = "p_default", text = "My friends, all of them! They've been laughing at my inventions for years, so let's see them laugh when a yeti comes round the corner. They can laugh after." },
        { id = "p_legacki", when = { questActive = TODO_QUEST("Are We There, Yeti?") }, text = "Legacki first, because she laughs loudest and she bet me a gold piece my last invention would fall apart. Walk the yeti up to her and watch her face, and then come and tell me every detail." },
        { id = "p_done", when = { questDone = TODO_QUEST("Are We There, Yeti?") }, text = "Did you hear Legacki scream? The whole of Everlook did! She'll be checking behind doors for a month, and I've never been prouder." },
      },
      choices = {
        { text = "Count me in.", next = "BACK", fx = { affinity = 3, trait = { curious = 1 } } },
        { text = "Isn't that a bit cruel?", next = "prank_cruel" },
      },
    },
    prank_cruel = {
      lines = { { id = "pc_default", text = "Cruel? It's a hug from a robot, a big, loud, furry hug, and they'll love it afterwards, once they've stopped running." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yeti = {
      lines = { { id = "y_default", text = "Because nobody expects a yeti indoors! Bears, maybe, and ogres sometimes, but a yeti in your bedroom at midnight? That's unforgettable." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Inventor, prankster, engineering trainer by day and menace by night! My friends say menace all day, but they're biased." } },
    advice = { { id = "tp_ad", text = "Always build an off switch, then hide it somewhere you'll remember." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost their whole city to their own machines, and I just want to frighten a few people, on a small, responsible scale." } },
    _none = { { id = "tp_none", text = "Never heard of it, but does it have gears?" } },
  },
}

P:NPC {
  key = "gregor", id = TODO_NPC("Gregor Greystone"), name = "Gregor Greystone",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook", "argent_dawn" }, temper = { "steady" }, values = { "devout", "dutiful" },
  notices = { "race", "class" },

  impression = {
    first = "Gregor Greystone keeps the Argent Dawn's ear among Everlook's traders and greets everyone the same, whatever banner they fly. He is steady and kind, and he forgets to eat.",
    third = "{name} met Gregor Greystone, who speaks for the Argent Dawn in Everlook.",
  },

  greetings = {
    { id = "g_hello", text = "Good day to you, and may the Light keep you warm. Winterspring could use the help." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Light has kept you, I see. Welcome back to Everlook, and come warm yourself by the fire." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a great deal since we first met, and I can see the Light's work in it, or at least a good deal of hard road. The Dawn always has need of hands as steady as yours have become." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Everlook has been speaking well of you, and the traders here don't praise anyone for free, so I'd say you've earned it, and I thank you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear someone in town parted from you in anger, and I'd not take sides without hearing both, though I'll say the Dawn's work always goes better when the living aren't quarreling." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own! The Dawn could use you, friend, when you're ready for the Plaguelands." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, are you? The Dawn takes anyone who fights the Scourge, and you've more cause than most, so you're welcome here." },
  },

  start = "hello",
  nodes = {
    xpt_gregor = {
      big = true,
      lines = { { id = "xpt_gregor_default", text = "I'd never tell anyone who to trust, because trust is earned at the campfire and not at the cradle. But the Dawn takes dwarf and human, elf and orc alike, and we've found the fight against the dead goes better when nobody is fighting the living too." } },
      choices = {
        { text = "Kin first. A company works best when it shares a home.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Dawn is right. Fight beside anyone who stands against the dead.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Its master, yes, but not its pupils, and the Scourge never has trouble finding more. Caer Darrow was a quiet town once, with the Barov family up in the keep, and they handed it to the Cult of the Damned to save their own skins." } },
      choices = {
        { text = "Even the Barovs might be redeemed, if they really repent.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Barovs earned their fate. Let them rot with their keep.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What does the Dawn want with Scholomance now?", next = "xcl_scholo2" },
      },
    },
    xcl_scholo2 = {
      lines = { { id = "xcl_scholo2_default", text = "To see it emptied and cleansed, so the island can belong to the living again. That will take more than one headmaster's death, but every lesson the Cult can't teach is one fewer necromancer walking out of that keep." } },
      choices = {
        { text = "Then I'll keep at it, Gregor.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than the banners would suggest. The Cult of the Damned keeps agents in the towns, and a cultist rarely confesses to a knight in shining plate, so the Dawn needs people who can listen at doors and follow a man home. I only ask that whatever you learn comes back to the Dawn, and not to the highest bidder." } },
      choices = {
        { text = "What I learn for the Dawn stays with the Dawn.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything has a price, Gregor, even secrets about cultists.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone who stands still when the ghouls come, mostly, because the dead never tire and a line that breaks once breaks for good. The Plaguelands are full of brave fighters who charged in alone, and the Scourge raised every one of them." } },
      choices = {
        { text = "Then I'll hold the line and leave the glory to others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd sooner cut down their necromancers from behind than wait in a line.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gregor.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It could, because half the trouble there is the beasts the plague has twisted, and a hunter knows how a sick animal moves. Our scouts tell me the wolves of the eastern Plaguelands have turned on anything living, and I'd like someone who understands wolves to see why." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} close if you go east, though, and keep it away from the corpses. The plague takes beasts as easily as men, and I'd hate to see it turn on you." },
      },
      choices = {
        { text = "A sick beast deserves a clean end. I'll give them that much.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll skin whatever's worth skinning and leave the rest to rot.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It is, in the Plaguelands at least, where the very soil has gone grey and the rivers carry it downstream. Some in the Dawn think it can be scrubbed clean in a generation, and others say it must be burned out and begun again." } },
      choices = {
        { text = "The land can be healed with patience.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Burn it out. Some sickness can't be cured.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_gr = {
      lines = {
        { id = "pgr_default", text = "The Dawn needs every paladin who'll come, and it doesn't ask whether you knelt in Stormwind or Ironforge. The Silver Hand has been broken for years, and some of its knights found their way to us instead, so you'd not be alone at Light's Hope." },
        { id = "pgr_risen", when = { race = "Scourge", class = "PALADIN" },
          text = "You carry the Light, and you're dead. I've seen a great many strange things for the Dawn, but never that, and I don't know whether to kneel or reach for my sword, so I'll do neither and say you're welcome." },
      },
      choices = {
        { text = "The Light chooses whom it will. I'm proof.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I fight the Scourge. The Light is just a tool.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not into the snow itself, thank the Light, but the cold doesn't stop fear, and plenty come through Everlook with the plague still behind their eyes. Further south the Scourge poisons the earth wherever it walks, and I'd wager your spirits could tell you more of that than any report of mine. If the very earth is sick in the Plaguelands, the Dawn needs those who can hear it." } },
      choices = {
        { text = "Then the spirits and I will go and fight the Scourge.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lordaeron's ruin is the Alliance's mess. Let them clean it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "We accept anyone who stands against the Scourge, and some of our best scouts in the Plaguelands are not the sort the Church would bless. But the Cult of the Damned began with men who thought they could master dark things, so we watch, and we hope we're wrong to." } },
      choices = {
        { text = "Watch me, then. I'll fight the Scourge all the same.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Cult failed because they were weak.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll do my part.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Bad enough that the Dawn sends people like me to every trading post that will have us, looking for help and for reagents. Light's Hope Chapel holds, and Chillwind Camp holds, but Stratholme and Scholomance are still full of the dead, and the dead do not tire." } },
      choices = {
        { text = "I'll go east and burn them myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the Dawn handle it. It's their fight.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Gladly, and without asking which faith you pray to, since the Scourge doesn't ask either. I'll only say that some at Light's Hope are wary of shadow, so if that's your craft, let your deeds against the dead speak first." } },
      choices = {
        { text = "Then I'll heal for the Dawn and let that speak.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My shadow kills the dead as well as any Light.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "You remind me of {alt}, a {altrace} who came through Everlook not long ago and asked how the Dawn might use another blade. Horde and Alliance both fight the Scourge, friend, and I was glad to see the same resolve on {alt}'s face that I see on yours." },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" } },
          text = "One of your people stood here only a little while ago, a {altclass} called {alt}, and asked about the Plaguelands with the same frown you're wearing now. The Dawn will take every one of you who comes, and gladly." },
        { id = "h_pt_gregor", tags = { "news" }, when = { party = { kin = true } },
          text = "You travel with your own kin, I see, and there's comfort in that this far north. Still, the Argent Dawn would remind you that the Scourge doesn't care whose cousin you are." },
        { id = "h_cl_scholo", tags = { "news" }, when = { cleared = "Scholomance" }, text = "Word has reached even Everlook that Darkmaster Gandling is dead and Scholomance has lost its headmaster. The Dawn owes you more than I can say, and I'll say it anyway, to anyone who'll listen." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, and welcome. The Dawn has learned that the Scourge's servants hide among the living, and it takes a quiet hand and a sharp eye to find them before they find us." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and a seasoned one by the look of your shield. The Dawn always needs steady arms at Light's Hope Chapel, though Everlook is quieter work than that." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Your eyes would serve the Dawn well in the east, where the plaguebats and the twisted hounds run ahead of the dead themselves." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, welcome. The Dawn has learned to value every kind of strength against the Scourge, and the spirits you speak to hate the plague as much as we do." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. The Argent Dawn welcomes anyone who fights the Scourge, and I'll hold to that, but forgive me if I ask what you mean to do with that power here in Everlook." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! We could use your kind in the east, where the Scourge are thick and their necromancers study in Scholomance. How are you with fire against the dead?" },
        { id = "h_default", key = true,
          text = "Gregor Greystone, of the Argent Dawn. I keep the Dawn's interests here among the Cartel's traders, and Horde and Alliance both pass through Everlook; the Scourge doesn't care which banner you fly, so neither do we." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "Carry my report to Argent Officer Pureheart for me, if you would. Every set of eyes the Dawn has counts." },
        { id = "h_duke", when = { questActive = TODO_QUEST("Duke Nicholas Zverenhoff") },
          text = "Duke Zverenhoff will want to meet you, because not many walk into the Plaguelands of their own will, and fewer walk out." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, welcome! The Dawn fights the Scourge and the Circle fights the rot in Felwood, and I've often thought we fight the same kind of sickness from two ends." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and of the Horde! The Dawn has need of healers who know the Scourge for what it is, and I suspect you know it better than most." },
      },
      again = { { id = "h_again", text = "What else? The Light keeps late hours, and so do I." } },
      choices = {
        { text = "Does the plague reach even this far north, Gregor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the plague a sickness of the land too?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about the Argent Dawn.", next = "dawn" },
        { text = "What does the Dawn want with Winterspring?", next = "why_here" },
        { text = "What's the difference between you and the Scarlet Crusade?", next = "scarlet" },
        { text = "Jessica Redpath says you're kind to her.", next = "jessica", when = { heardLine = "jessica.h_default" } },
        { text = "The Dawn would take one of the Forsaken?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Does the Dawn really accept warlocks?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How bad is it in the Plaguelands now?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would the Argent Dawn take a Horde priest's help, Gregor?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does the Dawn need from a warrior, Gregor?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could the Dawn use a hunter in the Plaguelands?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should a company keep to its own kind, Gregor?", next = "xpt_gregor", when = { party = { kin = true } } },
        { text = "I'll carry word.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I carry the Light. Does the Dawn need paladins?", next = "paladin_gr", when = { class = "PALADIN" } },
        { text = "What use does the Argent Dawn have for a rogue, Gregor?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Gandling is dead, Gregor. Scholomance has lost its master.", next = "xcl_scholo", when = { cleared = "Scholomance" } },
        { text = "The Dawn can carry its own reports; I've business of my own.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    dawn = {
      big = true,
      lines = {
        { id = "d_default", text = "We stand against the Scourge and anything else that would end this world, under no crown and no warchief: humans, dwarves, orcs, tauren, even the Forsaken. Light's Hope Chapel in the east is our heart, and out here I'm one of our ears." },
      },
      choices = {
        { text = "I'd like to help.", next = "BACK", fx = { affinity = 3, learn = { "argent_dawn" } } },
        { text = "How do I prove myself?", next = "dawn_prove" },
      },
    },
    dawn_prove = {
      lines = { { id = "dp_default", text = "Fight the Scourge and bring back what they carry. The Dawn keeps careful records, and every token you bring in is a mark beside your name." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },
    why_here = {
      lines = { { id = "w_default", text = "Everlook sees everyone who crosses the north, and travellers talk. Some of them have seen things in the east they'd rather forget, and I write those things down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scarlet = {
      lines = { { id = "s_default", text = "They began where we began, with the dead walking in Lordaeron. Then they decided everyone not wearing red was the enemy. We decided the enemy was the enemy." } },
      choices = {
        { text = "Is the Dawn really so different, inside?", tag = "Persuade", next = "scarlet_inside",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { questDone = TODO_QUEST("The Everlook Report") } } } },
          fail = { next = "scarlet_record", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "If you fight the Scourge, yes. You know them better than any of us, since they made you and you walked away, and that's worth something; not everyone here agrees, but I do." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    scarlet_inside = {
      lines = {
        { id = "si_default", text = "I'll give you a straight answer, since you asked a straight question. There are Dawn soldiers who'd rather the Forsaken weren't welcome at our fires, and a few who flinch at an orc, and I've had to write that down in my reports too, because the Dawn keeps careful records of its own failings or it's no better than the Crusade." },
      },
      choices = {
        { text = "Writing it down is a start.", next = "BACK", fx = { affinity = 2, learn = { "argent_dawn" } } },
        { text = "Every banner has its zealots.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jessica = {
      lines = {
        { id = "j_default", text = "She waits for news from Darrowshire, and I've had none good enough to give her. I write down every word that comes from the east, in case one of them is her sister's name." },
        { id = "j_done", when = { questDone = TODO_QUEST("Sister Pamela") }, text = "You went to Darrowshire for her, I hear. Whatever you found there, tell it gently, and then let her sit by Vizzie's fire for a while; I'll see she isn't alone." },
      },
      choices = {
        { text = "She deserves to hear the truth, plainly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some truths are kinder left unsaid.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scarlet_record = {
      lines = {
        { id = "sr_default", text = "We're very different, friend, and that's what goes in the record. Ask me again when you've stood with us a while." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everlook sees everyone who crosses the north, and I write down what they tell me. These are the matters I can speak to." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've stood with the Dawn, so you'll have my whole notebook, so to speak. Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "I'd seen enough of the plague to want to do something about it. The Dawn gave me somewhere to stand." } },
    advice = { { id = "tp_ad", text = "Carry holy water if you're going east, and a friend, though the holy water's easier to find." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "Prove yourself against the Scourge, and the Dawn will remember you. We keep good records." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "They began where we began, with the dead walking in Lordaeron, but they took a darker road. Pity them, and then stay well away from them." } },
    _none = { { id = "tp_none", text = "I can't say, but if it touches the Scourge, I'd ask about it at Light's Hope." } },
  },
}
