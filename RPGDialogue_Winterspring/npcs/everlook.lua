-- Everlook: the Steamwheedle Cartel's trading post at Winterspring's crossroads. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "vizzie", id = TODO_NPC("Innkeeper Vizzie"), name = "Innkeeper Vizzie",
  gender = "female",
  bible = "bibles/winterspring.md", role = "innkeeper", tier = "service",
  communities = { "everlook" }, temper = { "jumpy" }, values = { "friendly", "practical" },
  notices = { "weary", "drink", "lock_shards" },

  impression = {
    first = "She checked me for bugs before she let me near the fire.",
    third = "{name} met Innkeeper Vizzie, the jumpy goblin who keeps the only inn in Everlook.",
  },

  greetings = {
    { id = "g_hu_human", when = { race = "Human" }, priority = 5,
      text = "Shut the door, shut it, sugar, I know how you humans are with doors! There, that's better, and don't you dare tell me Stormwind inns are warmer." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "vizzie_human_soft" }, priority = 10,
      text = "Oh, it's my door-shutting human! Come in, come in, sugar; you're the only one of your kind who never lets the bugs in." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4 }, text = "Come in, shut the door, and oh, look at you, sugar, with frost in your hair like somethin' carved for a trade prince's mantelpiece! You didn't bring any bugs in, did you? Not on a face like that, surely." },
    { id = "g_flirt_warm", when = { flirt = true, npcFlagBefore = "flirt_warm" }, text = "Sugar, you came back! I warmed the seat by the fire for you and checked it twice for beetles, which you should know is the nicest thing I do for anybody." },
    { id = "g_flirt_cool", when = { flirt = true, npcFlagBefore = "flirt_declined", chance = 0.5 }, text = "Shut the door, sugar, and come get warm. I'll keep my chatter to the price list, like you wanted, and the price list is very short." },
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
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Sugar, what's that clinking in your bag, and why is it colder than the wind I just shut out? Those little purple stones hum like beetles in a jar, so keep 'em buckled up and nowhere near my bedding." },
  },

  start = "hello",
  nodes = {
    flirt = {
      lines = { { id = "fl_default", text = "The fire? Sure, sugar, let's say it's the fire, because I'm not about to admit a customer made me go all pink. Only, listen, it gets awful long and cold up here, and a girl with a warm hearth and no bugs is a girl worth knowin', that's all I'm sayin'." } },
      choices = {
        { text = "I'd like to know you better, Vizzie.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Do you say that to every frozen traveller?", next = "flirt_every" },
        { text = "You're sweet, but I only came in for the fire.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Oh, sure, sure, the fire's very popular, and it doesn't talk back. No harm done, sugar, and the room rate's the same either way." },
        { text = "I'm not interested, innkeeper. Just the room.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Right, right, the room, just the room, got it. I'll stop flappin' my mouth and start flappin' the bedsheets, which is what you're payin' for anyway." },
      },
    },
    flirt_warm = {
      lines = { { id = "flw_default", text = "Oh! Well, good, that's settled then, and I'll stop fussin' with this rag before I wipe a hole in the bar. Come by after the trappers have gone to bed, sugar, and I'll put the kettle on and we'll see what's what." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flirt_every = {
      lines = { { id = "fle_default", text = "Every one? Sugar, most of 'em come in smellin' of wet furbolg, and I make 'em stand by the door till they drip dry! You're the first in a month I've let straight up to the fire, and I don't do that for just anybody." } },
      choices = {
        { text = "Then I'll take the warm seat, Vizzie.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Something else, sugar.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, all the time, sugar, mostly on their way to fight the Winterfall or coming back from them with claw marks. They eat like bears, sleep like bears and tip like bears, which is to say not at all, and every one of 'em swears they'll kill my beetle and then leaves it alive." } },
      choices = {
        { text = "In a neutral town, a warrior keeps the blade sheathed and the temper too.", next = "BACK", reply = "Oh, bless you, sugar, because the last fella who drew steel by my fire knocked over a whole pot of stew. The bruisers love a guest who keeps his hands still.", fx = { align = { order = 1 } } },
        { text = "If someone starts trouble at your fire, I'll finish it, Bruisers or no.", next = "BACK", reply = "Oh no, no, no, sugar, please don't, because the bruisers bill me for every broken chair! Let them do the finishing, and you just keep eating your soup.", fx = { align = { order = -1 } } },
        { text = "Something else, sugar.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Something in their firewater, the trappers say, and it's made 'em nasty all the way up the valley. They used to come and trade pelts at the gate, and good pelts at that, and now nobody goes past the edge of town without a sword." } },
      choices = {
        { text = "They're sick, not wicked. They can be saved.", next = "BACK", reply = "That's a sweet thought, sugar, and I hope you're right, because they used to bring the softest pelts. If anybody can coax them back to trading, I'll put the kettle on.", fx = { align = { light = 1 } } },
        { text = "Sick or not, they're dangerous. Keep the door shut.", next = "BACK", reply = "Oh, it's shut, sugar, it's bolted and barred, and I've got a broom by it besides. I just miss the days when a furbolg knocking meant pelts, not claws.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Never, and I didn't mind at first, because bugs hate the cold even more than I do! But now there's the beetle, and the furbolgs gone mean out past the springs, and the wind howls so loud at night I swear it's saying something. You'd know better than me whether it's angry, wouldn't you?" } },
      choices = {
        { text = "I'll speak to the wind for you. That's what I'm for.", next = "BACK", reply = "Oh, would you, sugar? Tell it to blow somewhere else for a week, and tell it I've been very good, and maybe mention the beetle while you're at it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "For a hot bowl of soup, I'll tell it anything you like.", next = "BACK", reply = "Ha! You're a cheeky one, sugar, but I like you, and I'll ladle you the thick part from the bottom of the pot. Tell the wind I said hello.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not in my inn, sugar, because the Cartel's bruisers stand at the gate and every goblin in town counts their coin twice, and I count mine three times. Pick a pocket in Everlook and you'll be walking back to Felwood in your smallclothes, and that's a long, cold walk." } },
      choices = {
        { text = "Good. A neutral town needs rules.", next = "BACK", reply = "It does, sugar, and it keeps the riffraff honest, which keeps my rooms full. You'd be surprised how polite folks get with a bruiser leaning on the doorframe.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bruisers can't watch every pocket, though.", next = "BACK", reply = "Oh, don't you say that, sugar, don't even think it in here! If anything goes missing under my roof, it's me who has to answer for it, and I'm a terrible liar.", fx = { align = { order = -1 } } },
        { text = "I'll behave myself, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I did, sugar, and the fella who sold me this inn swore nothing creepy could live in the cold, and then the yetis brought in fleas and the frostsabers brought in ticks. A mage could freeze the lot of 'em solid, but then I'd have a frozen inn, and that's bad for business." } },
      choices = {
        { text = "I'll freeze any bug that bothers you.", next = "BACK", reply = "Oh, sugar, would you? Start with the big black one under the stairs, because it looks at me, I swear it looks at me when I walk past.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bugs are your problem, not mine.", next = "BACK", reply = "Well, I suppose they are, sugar, but you'll be sleeping on my mattresses tonight, so don't come crying to me when something nibbles your toes.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Good luck with the fleas.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Mostly is the word that worries me, sweetie. The last warlock who stayed here let his little friend sleep by the fire, and I found singe marks on the rug for a week and put the rug on his bill, so your demon stays on your side of the room." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Mostly is the word that worries me, sweetie, and that one's already eyeing my hearth like it owns the place. The last warlock's friend left singe marks on my rug for a week and I put the rug on his bill, so walk your demon round the long way, please, and keep it off the good carpet." },
      },
      choices = {
        { text = "I'll keep it off your rug, I promise.", next = "BACK", reply = "Oh, thank you, sweetie, and I'll hold you to it, because rugs that good don't come up the mountain every day. Maybe a nice cold corner for it, away from the fire?", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where I go, and it sleeps by the fire.", next = "BACK", reply = "Oh dear, oh dear, then I'm putting a bucket of water by the hearth, sweetie, and I'm not ashamed of it. Please tell it the rug is very old and very precious.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll sit by the door.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Mostly I see priests when somebody's come down off the mountain half frozen and the Light's the only thing keeping them breathing. So I keep the back room warm for that, and I keep the soup on, and I don't ask what they were doing up there." } },
      choices = {
        { text = "That's good work, Vizzie. A warm room saves lives.", next = "BACK", reply = "Thank you, sugar, though it's the priests who do the hard part, I just keep the coals going. Still, nobody's died in my back room yet, and I'd like to keep it that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Anyone who climbs Winterspring unprepared has earned their frostbite.", next = "BACK", reply = "Oh, that's a hard thing to say, sugar, and you wouldn't say it if you'd seen them come in. Nobody earns frostbite, they just get unlucky with the weather.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not often, sugar, because the bruisers are bigger than anybody, and the cold puts everyone in a mood to share a fire. Now and then somebody starts a quarrel over an old war, and I remind 'em the inn's neutral, the snow outside isn't, and broken chairs go on the tab." } },
      choices = {
        { text = "Good. Old grudges should stay outside your door.", next = "BACK", reply = "That's what I always say, sugar, leave the axes and the grudges at the gate and bring in your appetite. The soup tastes better without anybody glaring over it.", fx = { align = { order = 1 } } },
        { text = "Some grudges are earned. This truce won't last.", next = "BACK", reply = "Oh, don't say that, sugar, you'll jinx it! If the truce breaks, it'll break right through my common room, and I've only just fixed the tables.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Warmth first, a bowl of something hot second, and somebody to listen to them third, because the ones who come down off the mountain have usually seen something nasty in the passes. A priest who sat by the fire and listened would do more good here than any spell." } },
      choices = {
        { text = "Then I'll sit a while and listen.", next = "BACK", reply = "Oh, you're a dear, sugar, and some of them do so need an ear. Pull up a stool by the fire, and I'll bring you something hot while you sit.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Listening's your trade, not mine. I'll be on my way.", next = "BACK", reply = "All right, sugar, I won't keep you, but mind how you go out there. The mountain doesn't care whose trade is whose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_vizzie = {
      lines = {
        { id = "xalt_vizzie_default", text = "{alt}, sugar, and a lovely guest, because {alt} squashed a beetle by the hearth without my even asking, and you can't put a price on that. Stayed a night, ate two bowls of soup and went off toward the hot springs." },
        { id = "xalt_vizzie_other", when = { alt = { faction = "other" } }, text = "{alt}, sugar, a {altrace} from the other side, and if you two ever end up in my inn the same night, I'm putting you at opposite ends of the room, related or not. Not because I expect trouble, mind, but because I've seen what a long winter does to tempers." },
      },
      choices = {
        { text = "Kin or not, I'd share a fire with anyone up here.", next = "BACK", reply = "That's the spirit up here, sugar, because the cold doesn't care what colours you wear. Anybody who shares the fire and doesn't bring bugs is family to me.", fx = { align = { light = 1 } } },
        { text = "Opposite ends sounds right. Some lines shouldn't be crossed.", next = "BACK", reply = "Well, it's your business, sugar, and I won't pry, but you'd be surprised how quickly lines blur when you're both freezing. The bowls are the same size either way.", fx = { align = { light = -1 } } },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    dd_pamela = {
      lines = {
        { id = "dd_pamela_1",
          text = "Not once, and she's worked my bar since before the last bug infestation, which is a long time in inn years. She came up here from Lordaeron with nothing but an apron and a bad feeling about her family, and the bad feeling turned out to be right." },
        { id = "dd_pamela_2",
          text = "Whatever you found down there, it wasn't all good news, I can tell that much. But knowing beats wondering, and she's been sleeping through the night since, which is more than I can say for me with that beetle loose." },
      },
      choices = {
        { text = "Knowing is better. She deserved the truth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some truths are better left buried, Vizzie.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    hu_vizzie = {
      lines = {
        { id = "hu_default", key = true,
          text = "Humans? Oh, sugar, humans are my most dramatic guests! They come up the Felwood road half frozen, they complain about the cold, then about the price of firewood, and then they leave the door open and let in the bugs, and do you know what a bug does in a warm inn?" },
      },
      choices = {
        { text = "What does a bug do in a warm inn?", next = "hu_vizzie_2" },
        { text = "Surely they're not all that bad.", next = "hu_vizzie_2" },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    hu_vizzie_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "It stays, sugar, it stays and it multiplies! And then the human who left the door open tells me Stormwind inns are cleaner, and I'd like to see a Stormwind inn keep warm halfway up a mountain with yetis on the roof. Everlook's neutral, so I let 'em all in, but I count my blankets after the humans leave." },
      },
      choices = {
        { text = "Humans just miss home. Be patient with them, Vizzie.", next = "BACK",
          reply = "Patient! Sugar, I'm the most patient goblin on this mountain, and I've got the chewed fingernails to prove it. But all right, I'll give the next one a cup of something hot before I count the blankets.",
          fx = { align = { light = 1 }, opinion = { humans = "respect" } } },
        { text = "Count the blankets twice. Humans always take extra.", next = "BACK",
          reply = "Twice! Oh, sugar, I count them three times, and the spoons four. It's nice to finally have a guest who understands the hospitality business.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { humans = "distrust" } } },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    hu_vizzie_x = {
      lines = {
        { id = "hux_default", key = true,
          text = "Not glaring, sugar, watching, and there's a difference! The last human who sat where you're sitting left with two of my blankets, a candle and the spoon, and then he told the gate guard that goblins overcharge." },
      },
      choices = {
        { text = "Did you ever get the spoon back?", next = "BACK",
          reply = "No, sugar, and it was my good spoon! I like to think he's somewhere in Elwynn right now, stirring his porridge and feeling just awful about it." },
        { text = "I'll shut the door and leave the spoon, Vizzie. I promise.", tag = "Persuade", next = "hu_vizzie_soft",
          check = { pass = { any = { { disposition = { min = 50 } }, { trait = "kind" } } } },
          fail = { next = "hu_vizzie_fail", fx = { affinity = -1 } } },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    hu_vizzie_soft = {
      lines = {
        { id = "hus_default", key = true, fx = { npcFlag = { set = { "vizzie_human_soft" } } },
          text = "Oh, sugar, that's all I ask, the door and the spoon, and you'd be amazed how few people manage both! All right, no more watching; you're one of my regulars now." },
      },
      choices = {
        { text = "Then we understand each other.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Vizzie.", next = "BACK" },
      },
    },
    hu_vizzie_fail = {
      lines = {
        { id = "huf_default",
          text = "Promises, promises, sugar, and the last one promised too. I'll believe it when the spoon's still here in the morning." },
      },
      choices = {
        { text = "Something else, Vizzie.", next = "BACK" },
        { text = "I'll be going.", next = "END" },
      },
    },
    hu_vizzie_ns = {
      lines = {
        { id = "huns_default",
          text = "I counted it this morning, sugar, and I nearly cried. You're the best human guest Everlook's ever had, and I've told the yeti hunters so." },
      },
      choices = {
        { text = "Glad to hear it. Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be going.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu_human", when = { race = "Human" },
          text = "A human, sugar, and from the look of you, you came up from Felwood with no proper coat. Your people never pack for the snow, and I swear that on my firewood bill." },
        { id = "h_dd_pamela", tags = { "news" }, when = { questDone = TODO_QUEST("Sister Pamela") },
          text = "Jessica's been humming behind the bar all week, sugar, and she never hums. She says you found word of her little niece down in the Plaguelands, and if that's true, your next bowl of stew comes with my very best wishes." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You look like someone who's been dying a lot lately, and I say that as a friend. Sit by the fire for a bit; the cold doesn't care how tough you are." },
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Oh, sugar, you gave me a turn, because a {altrace} called {alt} sat right there by the fire a while back, from the other side of things, with exactly your way of eyeing the rafters for beetles. Is everybody in the world related except me?" },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" }, metBefore = false },
          text = "You've got kin come through Everlook, I'd bet my best mop on it, because {alt} stamped the snow off a pair of boots just like yours and told me there were no bugs in Winterspring, the sweet liar." },
        { id = "o_steamwheedle_distrust", tags = { "news" }, when = { gossip = { topic = "steamwheedle", stance = "distrust" } },
          text = "Harlo Wigglesworth says you called us thieves with a ledger. Thieves don't give receipts, sweetheart, and I give receipts!" },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and dressed for it! Stamp the snow off those boots at the door, sugar, and if you see a beetle on the hearth, you have my permission to cut it in half, just not the hearth." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, sugar, tell me the spirits don't send bugs, because if one of your totems starts buzzing it's going straight outside." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You've got good eyes and quick hands, sugar, so if you see anything with too many legs scuttling about my rafters, you squash it, and I'll love you forever, though I'll still charge you for the room." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Oh, a mage, thank goodness! Could you conjure a little fire for the back room, sugar? The hearth never reaches that far, the bugs love a cold corner, and firewood up here costs more than the furniture." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ooh, I know that smell. Keep your little friend off the tables, please, because the last one I saw looked exactly like a big red beetle, and I'll scream if it so much as twitches." },
        { id = "h_default", key = true,
          text = "I'm Innkeeper Vizzie, sugar, and this is the best inn in Everlook, and sure, it's the only inn in Everlook, but that doesn't make it not the best. It's the warmest place for a hundred miles at a very fair rate, and the cold keeps the creepy-crawlies down, mostly." },
        { id = "h_bugs", tags = { "gossip" },
          text = "People ask why a goblin would run an inn at the top of the world, sugar, and it's two words: no bugs. Well, fewer bugs, anyway, because there's still that one beetle, and I know it's in here eatin' my profits." },
        { id = "h_beetle", when = { metBefore = true }, text = "I found the beetle, behind the bar! It looked at me and I looked at it, and we've agreed to stay out of each other's way, which is the cheapest contract I ever signed." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid in my inn! You'll be wanting to know about the furbolgs, I bet, sugar, since everybody from the Circle does, and the answer is they've gone mean and I keep the door shut and the bolt oiled." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, sugar, you don't know a prayer against beetles, do you? I'd light a candle every night for one, because that bug by the hearth has outlived three traps and a boot." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, all shiny! Don't you go dripping snowmelt off that plate onto my floor, sugar, because I've only just mopped it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, up in the snow with the rest of us! Warm yourself at the fire, and if your loa or your Light have anything to say about beetles, I'd dearly love to hear it." },
      },
      again = {
        { id = "h_again", text = "More? Sit by the fire, then, sugar, only not too close, because the beetle lives there and it doesn't pay rent." },
        { id = "h_again2", text = "What else, sugar? I've got gossip and soup, both of 'em hot, and only one of 'em costs you." },
      },
      choices = {
        { text = "Jessica really hasn't hummed before?", next = "dd_pamela", when = { questDone = TODO_QUEST("Sister Pamela") } },
        { text = "Does the wind up here ever let up, Vizzie?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Winterfall seem to have turned nasty, Vizzie.", next = "druid_q", when = { class = "DRUID" } },
        { text = "A room, please.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Who comes through Everlook?", next = "guests" },
        { text = "You seem awfully scared of bugs.", next = "bugs" },
        { text = "Who are your neighbours here?", next = "neighbours" },
        { text = "I could track down your bugs for you.", next = "beetle_hunt", when = { class = "HUNTER" } },
        { text = "Do rogues cause much trouble in Everlook?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "So you came all the way up here to get away from bugs.", next = "xmage", when = { class = "MAGE" } },
        { text = "My demon only bites when I tell it to. Mostly.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'm afraid the Light doesn't do beetles. What else brings priests here?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Everlook see much trouble, with Horde and Alliance under one roof?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The folk at your fire look like they've had a hard road, Vizzie.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you get many warriors through Everlook, Vizzie?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Someone like me stayed at your inn, Vizzie?", next = "xalt_vizzie", when = { alt = true } },
        { text = "You're blushing, Vizzie. Or is that the fire?", next = "flirt", when = { flirt = true } },
        { text = "What do you make of humans, Vizzie?", next = "hu_vizzie" },
        { text = "You keep glaring at me, Vizzie. Is it because I'm human?", next = "hu_vizzie_x", when = { race = "Human" } },
        { text = "The spoon's still where you left it, Vizzie.", next = "hu_vizzie_ns", when = { race = "Human", npcFlagBefore = "vizzie_human_soft" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "g_default", text = "Traders, mostly, and Argent Dawn folk, with Horde and Alliance at the same tables glaring at each other over the soup. Nobody fights, though, because the bruisers see to that, and so does the soup, and so does the bill for the furniture." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = {
        { id = "nb_default", text = "Umi's building something furry to frighten Legacki with, and Felnok won't let anybody near his bench without gloves. Then there's the Dark Iron fellow, who calls my customers ants and still tips better than any of 'em, so he can call 'em whatever he likes." },
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
        { text = "Coin's coin. Whoever pays is welcome.", next = "BACK", reply = "Now you're talking like a goblin, sugar, and I'll put you in my good books for it. He still makes me nervous, though, standing there all black iron and silence.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A Dark Iron should earn his welcome first.", next = "BACK", reply = "Maybe so, sugar, and I've heard the stories about Thaurissan's lot. But he pays, he's quiet, and he's never once brought a beetle, so he's earned more than most.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beetle_hunt = {
      lines = { { id = "bh_default", text = "You'd do that? No, no, don't, sugar, because me and the one beetle by the hearth have got a truce, and if you scare it off it'll only come back angrier with its cousins and I'll be payin' for traps all winter. Just keep your pet off the bar, that's all I ask." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    bugs = {
      lines = { { id = "b_default", text = "Ever woken up with one in your ear? I have, in Tanaris, and that's why I live where it snows. Don't laugh... oh, fine, laugh, but quietly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    humans = { { id = "tp_humans", text = "Humans come up from Felwood half frozen, complain about the firewood and leave the door open for the bugs. One took my good spoon, sugar, and I haven't forgiven his whole kingdom." } },
    background = { { id = "tp_ba", text = "Tanaris girl, bug survivor, innkeeper at the top of the world. I followed the cold, sugar, and the cold was hiring." } },
    advice = { { id = "tp_ad", text = "Shake out your bedroll before you sleep in it, sugar. Up here it's yetis; anywhere else, it's worse." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel set this place up for trade, and I set up the inn because traders need beds and beds pay by the night. It's good business, sugar, if cold business." } },
    everlook = { { id = "tp_everlook", text = "Everlook's the top of the world, pal, too cold for bugs and too far for trouble, or that's what the brochure said. The brochure lied about the bugs, and I'm still fighting one beetle that won't quit." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a fine town if you like sweat, sharks and every insect ever hatched. I worked a kitchen there for a season, and I still check my boots every morning." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got scorpids the size of a hound, and I'm not going back there for any price. Everlook's cold, but at least the bugs freeze." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw come through the tunnel sometimes, and they're polite enough, if you don't mind fur on the furniture. I check them for fleas when they're not looking." } },
    _none = { { id = "tp_none", text = "No idea, sugar, so ask a trader, because they know everything worth money and charge for the rest." } },
  },
}

P:NPC {
  key = "umi", id = TODO_NPC("Umi Rumplesnicker"), name = "Umi Rumplesnicker",
  bible = "bibles/winterspring.md", role = "trainer", tier = "service",
  communities = { "everlook" }, temper = { "playful" }, values = { "inventive", "mischievous" },
  notices = { "race", "class", "lock_armor" },

  impression = {
    first = "Whatever she's building is furry, and someone is going to scream.",
    third = "{name} met Umi Rumplesnicker, the playful goblin engineer of Everlook with a prank in progress.",
  },

  greetings = {
    { id = "g_shop", text = "Oh, a customer! Don't touch that, or that, though that one's fine... no, wait, don't touch that one either!" },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin! Then you know as well as I do that a good invention is half engineering and half making your friends scream." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Ooh, is that demon hide you've wrapped round yourself, the dark stuff that crawls when you breathe? I'd give a week of pranks to know how it flexes in this cold, because my yeti's fur cracks every time it frosts." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Mischief, mostly, and I'm the only one allowed to teach it that! Legacki screams every time it rounds a corner, which is the whole point, but a demon would set it on fire, and fur is terribly expensive this far north." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Mischief, mostly, and from the way {pet} is grinning at the yeti right now, it already knows the lesson! Legacki screams every time the yeti rounds a corner, which is the whole point, but your demon would set it on fire, and fur is terribly expensive this far north." },
      },
      choices = {
        { text = "A prank's harmless. My demon isn't. I'll keep it leashed.", next = "BACK", reply = "Oh, would you? Thank you, because a flaming yeti is a whole different project and I haven't designed the fire-suppression yet! Keep it at least three yards away from the fur.", fx = { align = { order = 1 } } },
        { text = "A little fire would make the joke unforgettable.", next = "BACK", reply = "Ooh, a pyrotechnic module, now that's a thought, though the fur's about eighty percent flammable, by my last count. Let me run the numbers before your imp runs anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I haven't the faintest idea, which is exactly why it's exciting! A priest blessed it once by accident and it blinked at me, and either that was the Light or a loose wire, and I'd hate to find out it was the wire." } },
      choices = {
        { text = "Leave the Light out of your pranks, Umi. It isn't a toy.", next = "BACK", reply = "It's not a toy, it's a prototype, which is completely different! But all right, I'll keep the priests away from it, mostly, unless one of them wants to bless the hydraulics.", fx = { align = { light = 1 } } },
        { text = "If the Light makes it scarier, I'd call that a fine use.", next = "BACK", reply = "Oh, I knew I liked you! A holy terror with a glowing chassis, I could get Legacki to faint outright, and that's the highest score on my chart.", fx = { align = { light = -1 } } },
        { text = "I'll keep my distance from the yeti.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a scare's no good if it only frightens goblins, and I want to know it would make a proper fighter jump too! Legacki screams at anything, but if a warrior in plate takes one step back, then I'll know the yeti's ready." } },
      choices = {
        { text = "A trained warrior holds the line, Umi. Your yeti won't move me.", next = "BACK", reply = "Oh, really? That's a challenge, and I love a challenge, so I'll add another forty decibels to the roar. You just wait, plate or no plate, everybody jumps eventually.", fx = { align = { order = 1 } } },
        { text = "I'd charge it on sight and smash it to bits. That's half the fun.", next = "BACK", reply = "No no no, not my yeti! It took three months and two of my fingertips' worth of burns, so please, at most a gentle tap. Then scream if you like, that's useful data.", fx = { align = { order = -1 } } },
        { text = "Something else, before it starts ticking.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I do, I really do, because you've tracked the yetis out in the Ice Thistle Hills, and I've only ever seen their fur on a skinner's table. If a hunter can't tell mine from the real thing at twenty paces, then Legacki certainly won't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I do, I really do, because if a hunter can't tell mine from a real yeti at twenty paces, Legacki certainly won't. Just keep {pet} away from the bench, please, because the last animal that sniffed this fur bit the yeti's leg off." },
      },
      choices = {
        { text = "I'll judge it fairly, but a prank should stay harmless, Umi.", next = "BACK", reply = "It's harmless, I promise, unless you count heart palpitations, and goblins have spare hearts, I'm fairly sure. Judge it honestly and I'll adjust the gait.", fx = { align = { order = 1 } } },
        { text = "Make it walk like a real one and let all Everlook panic.", next = "BACK", reply = "Oh, the whole town, running and shrieking? That would be the greatest triumph since the steam-powered sock! I'll have to tighten the knee joints first, they wobble.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_um = {
      lines = {
        { id = "gum_default", text = "Finally, someone with taste! The goblins here think a sense of humour is something you sell by the pound. Bring me the fur and the springs, and I'll put your name on the schematic, small, in the corner, but it'll be there." },
      },
      choices = {
        { text = "Make it big. Goblins deserve a big scare.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Isn't it a little cruel?", next = "prank_cruel" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Trouble them? Oil turns to jelly, springs snap and gears freeze solid if I turn my back for a minute! I've started wrapping my best work in yeti fur, which counts as respecting the local spirits, doesn't it? I'm sure your earth friends would approve, as long as nobody tells the yetis." } },
      choices = {
        { text = "Build what you like. The spirits can bear a little mischief.", next = "BACK", reply = "Thank you! I knew the spirits had a sense of humour, because something keeps freezing my sprockets and giggling about it. I'll leave a gear out for them as an offering.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Machines don't belong in the wild. Mind what you build.", next = "BACK", reply = "I am minding it, I wrap the joints in fur and everything! Gnomeregan's machines were the trouble, not mine, and mine only go boo, honestly.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because I can, and because Legacki laughed at me, and you don't laugh at an engineer unless you want a furry metal monster waiting by your door. Magic's very well, but nothing beats a good gear train when you want to scare someone properly." } },
      choices = {
        { text = "Engineering beats magic for a good prank, I'll grant you.", next = "BACK", reply = "Ha! I'll write that down, because no mage has ever said it to me before. A fireball's over in a second, but a mechanical yeti haunts you for a week.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Scaring people isn't much of a goal for a craftsman.", next = "BACK", reply = "Not much of a goal? It's the best goal! The whole world's gone grey since the Scourge came, and if I can't make somebody laugh, what was all that engineering for?", fx = { align = { order = 1 } } },
        { text = "I'll keep my sparks to myself.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nobody's, officially, and certainly not Legacki's, because she'd never suspect a yeti behind her counter. Engineers and rogues are cousins, really, since we both love a mechanism and we both hate being caught." } },
      choices = {
        { text = "A harmless prank never hurt anyone.", next = "BACK", reply = "Exactly, and I'm very careful with the voltage, mostly. Nobody's ever been seriously frightened past a minute or two, by my measurements.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Leave her shop alone. It's hers.", next = "BACK", reply = "Oh, all right, all right, I'll put it behind the inn instead, and Vizzie will scream louder anyway. You're no fun at all, but you're probably right.", fx = { align = { order = 1 } } },
        { text = "I'll keep my hands to myself.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Half the north is burned or haunted, Everlook is nothing but snow and ledgers, and the whole world's gone grim, so yes, a good scare and a good laugh are worth every gear. I'd have thought a priest of all people would know a laugh mends more than a bandage does, some days." } },
      choices = {
        { text = "Mischief has its place. Life's grim enough without it.", next = "BACK", reply = "You understand! Half the world's in mourning, and if a yeti in a back alley makes a goblin squeal, that's one less sad face in the snow.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "There are better uses for your skill than frightening goblins.", next = "BACK", reply = "Probably, but nobody pays a goblin for her best ideas unless they explode. A scare is free, a laugh is free, and both of them are better than sulking over ledgers.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Harmless? It's a work of art, and it's only going to frighten Legacki and Sprinkle and Quixxil a little bit, which they deserve. Everlook is cold and dull and full of goblins counting money, so somebody has to keep it lively." } },
      choices = {
        { text = "Frightening people isn't much of a gift, Umi.", next = "BACK", reply = "It's a gift to me, at least! Still, I'll take the warning, and maybe I'll set it off at a party instead, where everyone is braced for nonsense.", fx = { align = { order = 1 } } },
        { text = "A bit of chaos does a cold town good.", next = "BACK", reply = "That's exactly what I keep saying! Everlook needs a jolt, and I'm just the goblin with the battery to give it one.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "To scare goblins, mostly, and because nobody's ever done it! I know your kind would say a real yeti is better than any machine, and maybe so, but a real yeti won't sit still while I fit it with a whistle. Mine won't hurt the wild ones, I promise; it's a joke, not a hunter." } },
      choices = {
        { text = "Leave the wild yetis be. A joke's fine if no beast pays for it.", next = "BACK", reply = "I'd never hurt a real yeti, honestly, I'm a coward around anything with that many teeth! It's only goblin feathers I'm ruffling, and those grow back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A machine that scares goblins? Build ten of them, Umi.", next = "BACK", reply = "Ten! Oh, a whole fleet, a mechanical stampede, I'd need about four hundred more gears and a bigger shed. Don't tempt me, I mean it.", fx = { align = { light = -1 } } },
        { text = "Never mind the yeti.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Oh, don't let that demon of yours near my yeti, because it's already got one bad habit, which is frightening people, and I don't want it picking up a second." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Stand right there, please, because I've been wondering whether my yeti's eyes would glow if a holy sort walked past, and I need a witness who won't lie about it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Stand still a moment, would you? I need to know how tall a yeti has to be before somebody in armour stops being brave about it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Oh, you'll know a real yeti's tracks better than anybody, so tell me straight, does mine walk like one or like a goblin in a fur coat?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do you think the spirits would mind a mechanical yeti? I'd hate to offend the snow, because it's been so good to me." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Could you make something glow? No, wait, don't, the last spark nearly set my yeti's fur alight, and that fur took me three weeks to get." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, eh? You've got the right hands for fiddly work, and I always need someone to slip a part into somebody's shop when they're not looking, purely for science." },
        { id = "h_default", key = true,
          text = "Umi Rumplesnicker, engineer! I teach, I tinker, and right now I'm building something wonderful that's roughly seventy percent fur, twenty-five percent gears and five percent pure goblin genius, and it's going to scare the bolts off every goblin I know." },
        { id = "h_yeti", tags = { "news" }, when = { questActive = TODO_QUEST("Are We There, Yeti?") },
          text = "Yeti parts, real fur and real horns! The mechanical bits I've got already, so bring me the rest and we'll make a monster." },
        { id = "h_own", when = { questActive = TODO_QUEST("A Yeti of Your Own") },
          text = "An engineer who wants a yeti of their own? Oh, you have good taste. Let me show you how it's done." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Don't bless the yeti, please, because I've no idea what holy water does to clockwork, and I want to find out after Legacki screams, not before." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Don't bless anything in here, please; the last time someone said a prayer over my yeti its eyes lit up, and I don't think that was me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You can turn into a bear, can't you? I'm building a yeti, and I'd love to know how a real animal moves, because mine keep falling over on the ice." },
      },
      again = {
        { id = "h_again", text = "More? Ooh, I love questions, because questions are how experiments start, and experiments are how pranks start, which is the proper scientific order." },
        { id = "h_again2", text = "Ask away, but quickly, because something on that bench is ticking." },
      },
      choices = {
        { text = "Does the cold up here trouble your machines, Umi?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Somebody in Everlook is in for a fright.", next = "prank" },
        { text = "Teach me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Why a yeti?", next = "yeti" },
        { text = "A gnome scaring goblins? Count me in.", next = "gnome_um", when = { race = "Gnome" } },
        { text = "Why build a mechanical yeti at all?", next = "xmage", when = { class = "MAGE" } },
        { text = "Slip a part into someone's shop? Whose?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "All this mischief hardly seems worth the trouble, Umi.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is your mechanical yeti really just a harmless prank, Umi?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why measure your yeti against a warrior, Umi?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you want a hunter's opinion of your yeti, Umi?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "A mechanical yeti seems a strange thing to build, Umi.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why would a holy sort make your yeti's eyes glow, Umi?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would my demon teach a mechanical yeti, Umi?", next = "xlock", when = { class = "WARLOCK" } },
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
    everlook = { { id = "tp_everlook", text = "Everlook's the perfect place for an inventor, because nobody comes up here to tell you not to build things. Well, Legacki does, but she doesn't count." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages build everything with magic and nothing with gears, which I think is very lazy of them. I'd love a look at their workshops all the same." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has the best mechanical wonders in the world, and I'm going to have something on display there one day. It'll be furry, and someone will scream." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are big and furry and very polite, and they'd make a wonderful test subject for my latest work. They said no, rather firmly." } },
    _none = { { id = "tp_none", text = "Never heard of it, but does it have gears? If it has gears, I can probably make it louder by at least a third." } },
  },
}

P:NPC {
  key = "gregor", id = TODO_NPC("Gregor Greystone"), name = "Gregor Greystone",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook", "argent_dawn" }, temper = { "steady" }, values = { "devout", "dutiful" },
  notices = { "race", "class", "lock_soulstone" },

  impression = {
    first = "He is steady and kind, and he forgets to eat.",
    third = "{name} met Gregor Greystone, who speaks for the Argent Dawn in Everlook.",
  },

  greetings = {
    { id = "g_hello", text = "Good day to you, and may the Light keep you warm. Winterspring could use the help." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Light has kept you, I see. Welcome back to Everlook, and come warm yourself by the fire." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since we first met, and I can see the Light's work in it, or at least a long stretch of hard road. The Dawn always has need of hands as steady as yours have become." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Everlook has been speaking well of you, and the traders here don't praise anyone for free, so I'd say you've earned it, and I thank you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear someone in town parted from you in anger, and I'd not take sides without hearing both, though I'll say the Dawn's work always goes better when the living aren't quarreling." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the Light's own! The Dawn could use you, friend, when you're ready for the Plaguelands." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, are you? The Dawn takes anyone who fights the Scourge, and you've more cause than most, so you're welcome here." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone has tucked your soul into a warlock's stone, and I feel it in the Light like a pebble in a boot. The Cult of the Damned keeps souls too, so I hope whoever holds yours is someone you would trust with your life, because that is exactly what you've given them." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The Crusade calls us soft, the Dawn calls them mad, and the Scourge doesn't care which of us is right. You've seen both, I expect, so tell me what you make of the Scarlet Crusade." },
      },
      choices = {
        { text = "Zealots. They murder the innocent and call it purging.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { scarlet_crusade = "hate" } } },
        { text = "They kill Scourge. I'll forgive them a great deal for that.", next = "op_r2", fx = { align = { honor = -1 }, trait = { stern = 1 }, opinion = { scarlet_crusade = "useful" } } },
        { text = "Some are good men lost in a bad cause.", next = "op_r3", fx = { trait = { kind = 1 }, opinion = { scarlet_crusade = "pity" } } },
        { text = "They'd burn me on sight. That tells you enough.", next = "op_r4", fx = { affinity = 1, opinion = { scarlet_crusade = "hate" } }, when = { race = "Scourge" } },
        { text = "They shame the Light I serve, Gregor.", next = "op_r5", fx = { affinity = 1, opinion = { scarlet_crusade = "wrong", the_light = "trust" } }, when = { class = "PALADIN" } },
        { text = "I'd rather not judge them.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "You've seen Hearthglen, then, or heard from someone who has. The Dawn won't stain itself that way, whatever it costs us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "They kill plenty besides Scourge, friend, and they keep poor records of which was which." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Some are, and the Dawn takes them in when they come to their senses. More come every season than you'd guess." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "It does, and the Dawn will not, and you've my word on that much, for whatever an old soldier's word is worth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r5 = {
      lines = { { id = "op_r5_default", text = "Aye, and they'd say you shame it by talking to me. The Light will sort it out, though I wish it would hurry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_gregor = {
      big = true,
      lines = { { id = "xpt_gregor_default", text = "I'd never tell anyone who to trust, because trust is earned at the campfire and not at the cradle. But the Dawn takes dwarf and human, elf and orc alike, and we've found the fight against the dead goes better when nobody is fighting the living too." } },
      choices = {
        { text = "Kin first. A company works best when it shares a home.", next = "BACK", reply = "There's sense in that, and I won't pretend shared bread doesn't make a company easier. Still, I've seen kin break and strangers hold, and the Scourge teaches you to take a hand where it's offered.", fx = { align = { order = 1 } } },
        { text = "The Dawn is right. Fight beside anyone who stands against the dead.", next = "BACK", reply = "Then you've already learned what took me years to see. The dead don't care about our banners, so we'd be fools to let them divide us.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Its master, yes, but not its pupils, and the Scourge never has trouble finding more. Caer Darrow was a quiet town once, with the Barov family up in the keep, and they handed it to the Cult of the Damned to save their own skins." } },
      choices = {
        { text = "Even the Barovs might be redeemed, if they really repent.", next = "BACK", reply = "I pray you're right, and I'd sooner see a soul saved than a keep burned. But I've seen what walks the halls of Caer Darrow now, and the Barovs opened the door to it themselves.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Barovs earned their fate. Let them rot with their keep.", next = "BACK", reply = "There are days I'd agree with you, Light forgive me. Still, I'd rather the Dawn judged them than our own anger did.", fx = { align = { light = -1 } } },
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
        { text = "What I learn for the Dawn stays with the Dawn.", next = "BACK", reply = "Good, because loose talk has cost us more than any ghoul. I'll remember your face, and so will Lord Maxwell when I tell him.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything has a price, Gregor, even secrets about cultists.", next = "BACK", reply = "Then the Dawn will pay what it can, though I'd hoped you'd do it for more than coin. The cultists will certainly pay better, and that's what worries me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone who stands still when the ghouls come, mostly, because the dead never tire and a line that breaks once breaks for good. The Plaguelands are full of brave fighters who charged in alone, and the Scourge raised them all to fight for it." } },
      choices = {
        { text = "Then I'll hold the line and leave the glory to others.", next = "BACK", reply = "That's exactly the soldier we need, and they're rarer than any hero. Glory never held a gate at Chillwind, but steady folk like you have.", fx = { align = { honor = 1 } } },
        { text = "I'd sooner cut down their necromancers from behind than wait in a line.", next = "BACK", reply = "Necromancers die as well as any ghoul, I'll grant you, and the Dawn won't scorn the help. Only remember that someone has to stand in that line while you're behind them.", fx = { align = { honor = -1 } } },
        { text = "Something else, Gregor.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It could, because half the trouble there is the beasts the plague has twisted, and a hunter knows how a sick animal moves. Our scouts tell me the wolves of the eastern Plaguelands have turned on anything living, and I'd like someone who understands wolves to see why." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It could, because the plague has twisted the beasts of the east, and a hunter knows how a sick animal moves. Keep {pet} close if you go, though, and away from the corpses, because the plague takes beasts as easily as men." },
      },
      choices = {
        { text = "A sick beast deserves a clean end. I'll give them that much.", next = "BACK", reply = "Then you'll do them more good than most, because those beasts didn't choose the plague. Burn what's left after, if you can bear the smell.", fx = { align = { light = 1 } } },
        { text = "I'll skin whatever's worth skinning and leave the rest to rot.", next = "BACK", reply = "That's your trade, I suppose, but I'd beg you to burn what you leave rather than let it rot. I've seen plague carried from one carcass to a whole valley of deer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It is, in the Plaguelands at least, where the very soil has gone grey and the rivers carry it downstream. Some in the Dawn think it can be scrubbed clean in a generation, and others say it must be burned out and begun again." } },
      choices = {
        { text = "The land can be healed with patience.", next = "BACK", reply = "I hope so, with all my heart, and the Cenarion folk say the same. It will take longer than any of us will live, but patience is cheaper than fire.", fx = { align = { light = 1 } } },
        { text = "Burn it out. Some sickness can't be cured.", next = "BACK", reply = "Some in the Dawn would agree with you, and on the worst days I'm one of them. But burning the sickness out of a land leaves nothing for anyone to come home to.", fx = { align = { light = -1 } } },
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
        { text = "The Light chooses whom it will. I'm proof.", next = "BACK", reply = "And proud I am to see it, for the Light has never cared what crown you knelt under. The Dawn would be honoured to have you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I fight the Scourge. The Light is just a tool.", next = "BACK", reply = "A tool? I'll pray that changes for you, because a tool wears out, and faith does not. Still, the Dawn will take your blade gladly until then.", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not into the snow itself, thank the Light, though plenty come through Everlook with the plague still behind their eyes. Further south the Scourge poisons the earth wherever it walks, and the Dawn needs those who can hear the land tell of it." } },
      choices = {
        { text = "Then the spirits and I will go and fight the Scourge.", next = "BACK", reply = "Then go with my blessing, and with whatever the spirits give you. I've watched a shaman's fire take down a whole pack of ghouls at Light's Hope, and I'll not say a word against it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lordaeron's ruin is the Alliance's mess. Let them clean it.", next = "BACK", reply = "It was Lordaeron's ruin, and the plague has already crossed into Kalimdor in places, friend. The dead won't stop at any border the Horde draws.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "We accept anyone who stands against the Scourge, and some of our best scouts in the Plaguelands are not the sort the Church would bless. But the Cult of the Damned began with men who thought they could master dark things, so we watch, and we hope we're wrong to." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "We accept anyone who stands against the Scourge, and I'd sooner your servant was watching the road than watching me the way it is now. The Cult of the Damned began with men who thought they could master such things, so we watch you both, and we hope we're wrong to." },
      },
      choices = {
        { text = "Watch me, then. I'll fight the Scourge all the same.", next = "BACK", reply = "I will watch you, and gladly, because I'd like nothing better than to be proven wrong about your kind. Fight well, and I'll be the first to say so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Cult failed because they were weak.", next = "BACK", reply = "They failed because they trusted what they summoned, and it devoured them. Mind that you don't think yourself stronger than they were.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll do my part.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Bad enough that the Dawn sends people like me to every trading post that will have us, looking for help and for reagents. Light's Hope Chapel holds, and Chillwind Camp holds, but Stratholme and Scholomance are still full of the dead, and the dead do not tire." } },
      choices = {
        { text = "I'll go east and burn them myself.", next = "BACK", reply = "Then the Light go with you, and bring back word of what you see. Burn the bodies too, or they'll be back on their feet by the next moon.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the Dawn handle it. It's their fight.", next = "BACK", reply = "It's everyone's fight, whether they choose it or not, and the plague doesn't stop at a choice. I hope you'll think on that as you travel.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Gladly, and without asking which faith you pray to, since the Scourge doesn't ask either. I'll only say that some at Light's Hope are wary of shadow, so if that's your craft, let your deeds against the dead speak first." } },
      choices = {
        { text = "Then I'll heal for the Dawn and let that speak.", next = "BACK", reply = "That's all any of us ask, and the wounded don't care where the healing comes from. Your hands will speak louder than any doubts at Light's Hope.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My shadow kills the dead as well as any Light.", next = "BACK", reply = "I don't doubt it, and I'll not pretend otherwise. I only ask that you keep it pointed at the dead and never at the living.", fx = { align = { light = -1 } } },
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
          text = "The Argent Dawn welcomes anyone who fights the Scourge, and I'll hold to that, though there's a chill on you I don't care for. I must ask what you mean to do with that power here in Everlook." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! We could use your kind in the east, where the Scourge are thick and their necromancers study in Scholomance. How are you with fire against the dead?" },
        { id = "h_default", key = true,
          text = "Gregor Greystone, of the Argent Dawn. I keep the Dawn's interests here among the Cartel's traders, and Horde and Alliance both pass through Everlook; the Scourge doesn't care which banner you fly, so neither do we." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "Carry my report to Argent Officer Pureheart for me, if you would. Every set of eyes the Dawn has counts." },
        { id = "h_duke", when = { questActive = TODO_QUEST("Duke Nicholas Zverenhoff") },
          text = "Duke Nicholas Zverenhoff, who leads the Dawn at Light's Hope Chapel, will want to meet you, because not many walk into the Plaguelands of their own will, and fewer walk out." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, welcome! The Dawn fights the Scourge and the Circle fights the rot in Felwood, and I've often thought we fight the same kind of sickness from two ends." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and of the Horde! The Dawn has need of healers who know the Scourge for what it is, and I suspect you know it better than most." },
      },
      again = { { id = "h_again", text = "What else? The Light keeps late hours, and so do I." } },
      choices = {
        { text = "Does the plague reach even this far north, Gregor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the plague a sickness of the land too?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about the Argent Dawn.", next = "dawn" },
        { text = "Winterspring seems a long way from the Plaguelands for the Dawn.", next = "why_here" },
        { text = "What's the difference between you and the Scarlet Crusade?", next = "scarlet" },
        { text = "Jessica Redpath says you're kind to her.", next = "jessica", when = { heardLine = "jessica.h_default" } },
        { text = "I didn't think the Dawn would take one of the Forsaken.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Does the Dawn really accept people like me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How bad is it in the Plaguelands now?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would the Argent Dawn take a Horde priest's help, Gregor?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess the Dawn needs warriors more than most, Gregor.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could the Dawn use a hunter in the Plaguelands?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should a company keep to its own kind, Gregor?", next = "xpt_gregor", when = { party = { kin = true } } },
        { text = "I'll carry word for you.", next = "END", reply = "Bless you for it, and may the Light keep the cold from your bones on the road. Ask for Lord Maxwell at Light's Hope, and tell him Gregor sent you.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I carry the Light. Does the Dawn need paladins?", next = "paladin_gr", when = { class = "PALADIN" } },
        { text = "What use does the Argent Dawn have for a rogue, Gregor?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Gandling is dead, Gregor. Scholomance has lost its master.", next = "xcl_scholo", when = { cleared = "Scholomance" } },
        { text = "The Dawn can carry its own reports; I've business of my own.", next = "END", reply = "As you like, friend, and I wish you well in it. If the dead ever cross your path, you'll know where to find us.", fx = { align = { light = -1 } } },
      },
    },
    dawn = {
      big = true,
      lines = {
        { id = "d_default", text = "We stand against the Scourge and anything else that would end this world, under no crown and no warchief: humans, dwarves, orcs, tauren, even the Forsaken. Light's Hope Chapel in the east is our heart, and out here I'm one of our ears." },
      },
      choices = {
        { text = "I'd like to help.", next = "BACK", fx = { affinity = 3, learn = { "argent_dawn" } } },
        { text = "I'd like to prove myself to the Dawn.", next = "dawn_prove" },
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
        { text = "And what do you make of the Crusade yourself?", next = "op_ask" },
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
        { id = "si_default", text = "You asked straight, so I'll answer straight. There are Dawn soldiers who'd rather the Forsaken weren't welcome at our fires, and a few who flinch at an orc, and I've had to write that down in my reports too, because the Dawn keeps careful records of its own failings or it's no better than the Crusade." },
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
        { text = "She deserves to hear the truth, plainly.", next = "BACK", reply = "Perhaps she does, and perhaps I'm a coward for waiting. When the word comes, whatever it is, I'll give it to her honestly, and I'll sit with her after.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some truths are kinder left unsaid.", next = "BACK", reply = "That's what I keep telling myself, and I'm afraid it's mostly for my own sake. Light grant I never have to choose between hope and truth for her.", fx = { affinity = 1, align = { honor = -1 } } },
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
    scourge = { { id = "tp_scourge", text = "The Scourge holds the north, and the Dawn needs eyes everywhere, even up here in the snow. I listen to what the traders say and send it south to Light's Hope." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad's necropolis floats over the east, and every trader who's seen it says the same thing. It doesn't move, and it doesn't sleep, and it watches." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is the Dawn's great concern in the east, and every scourgestone you bring me helps the fight there. That's why I'm here, so far from it." } },
    everlook = { { id = "tp_everlook", text = "Everlook is a neutral town, and the goblins take anyone's gold, which makes it a good place to keep the Dawn's ear. Horde and Alliance both pass through, and I greet them the same." } },
    holy_light = { { id = "tp_holy_light", text = "I'm not a priest, but I've seen the Light do great things at Light's Hope. I'd like to see it again someday, when I've a moment to eat." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken bring me scourgestones as readily as anyone, and I give them the same thanks. The Dawn doesn't ask what you are, only whom you fight." } },
    _none = { { id = "tp_none", text = "I can't say, but if it touches the Scourge, I'd ask about it at Light's Hope." } },
  },
}
