-- Tavernkeep Smitts, the Scarlet Raven Tavern. Voice: bibles/smitts.md
-- Pours drinks, collects local lore, and has never let the Stalvan murders go.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "smitts", id = TODO_NPC("Tavernkeep Smitts"), name = "Tavernkeep Smitts",
  bible = "bibles/smitts.md", role = "innkeeper", tier = "major",
  communities = { "darkshire" }, temper = { "steady" }, values = { "curious", "generous" },
  notices = { "drink", "lore" },

  impression = {
    first = "He keeps the warmest room in Duskwood and admits that's not much.",
    third = "{name} drank at the Scarlet Raven, where Tavernkeep Smitts pours and listens and remembers what the town would rather forget.",
  },

  greetings = {
    { id = "g_op_worgen_cursed", when = { opinion = { topic = "worgen", stance = "cursed" } }, text = "You're the one who thinks the worgen are cursed men. A watcher sat there last night and said the same, sober as a judge, and the whole room went quiet." },
    { id = "g_raven", text = "Welcome to the Scarlet Raven, friend, the warmest room in Duskwood, which isn't saying much." },
    { id = "g_back", when = { metBefore = true }, text = "Back in out of the fog, are you? Your stool's free." },
    { id = "g_home", when = { homeInn = { "Darkshire", "Scarlet Raven Tavern" } }, text = "Home from the woods! Put your boots by the fire and they'll be dry by midnight." },
    { id = "g_indoors", when = { timeOfDay = "night" }, text = "In you come, and shut the door behind you. It's best to stay indoors these nights." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} and back in out of the fog! Your stool's still free, friend, and the fire's as warm as it ever gets in Duskwood." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, I'd nearly written you into the book of folk who walked into the woods and didn't come back, after {away}. I'm glad to cross that line out." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody in town has been speaking warmly of you by my fire, and warm words are rare enough in Darkshire that I remember them." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "There's talk round the tables that someone swallowed a story of yours whole. I collect stories, friend, so I'll be listening closely to mine." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had a few, and that's fine, but stay inside tonight. The last drunk who went walking in Duskwood came back as a ghoul, or rather, he didn't come back at all." },
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You read; I can tell, because you looked at my shelf before you looked at my bottles. That's rare in here." },
  },

  start = "hello",
  nodes = {
    op_worgen = {
      lines = {
        { id = "op_worgen_a", text = "Depends how much they've had. Sober, they say wolves, big ones, out of the east woods. Drunk, they say the worgen were men once, cursed by something old, and that's why they howl like they're grieving. You've met them in the trees, so what are they to you?" },
      },
      choices = {
        { text = "Beasts. Whatever they were, kill them before they kill you.", next = "op_worgen_1", fx = { opinion = { worgen = "beasts" }, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Cursed men. Somebody should be trying to cure them.", next = "op_worgen_2", fx = { opinion = { worgen = "cursed" }, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Cursed or not, they're a threat. Pity them from behind a wall.", next = "op_worgen_3", fx = { opinion = { worgen = "cursed" }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "My people woke something in those woods. The Scythe was ours.", next = "op_worgen_4", when = { race = "NightElf" }, fx = { opinion = { worgen = "cursed", night_elves = "responsible" }, affinity = 2 } },
        { text = "I'd rather not think about them, Smitts.", next = "BACK" },
      },
    },
    op_worgen_1 = {
      lines = { { id = "op_worgen_r1", text = "That's the sober answer, and it's kept a lot of watchers alive. Have a drink anyway; you'll need one if you ever hear them up close." } },
      choices = { { text = "Something else, Smitts.", next = "BACK" } },
    },
    op_worgen_2 = {
      lines = { { id = "op_worgen_r2", text = "That's what the drunk ones say, and I've always liked the drunk ones better. If anybody ever finds a cure, I'll pour for them free until the barrel's dry." } },
      choices = { { text = "Something else, Smitts.", next = "BACK" } },
    },
    op_worgen_3 = {
      lines = { { id = "op_worgen_r3", text = "Behind a wall and a stout door, and a lamp in the window. You'd make a fine Darkshire citizen; you've already got the habits." } },
      choices = { { text = "Something else, Smitts.", next = "BACK" } },
    },
    op_worgen_4 = {
      lines = { { id = "op_worgen_r4", text = "Was it, now? Then you're the first to stand at my bar and own a piece of it. Sit down; that one's worth a whole evening, and I'll not charge you for the listening." } },
      choices = { { text = "Something else, Smitts.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It wants to forget the dead, the worgen and the missing, and I write them all down so it can't." } },
      choices = {
        { text = "Keep the room warm, Smitts. People need it.", next = "BACK", reply = "I will, as long as there's wood for the fire and ale in the cellar. It's not much of a light in this wood, but it's what we have.", fx = { align = { honor = 1 } } },
        { text = "Forget it all, Smitts. Remembering only hurts you.", next = "BACK", reply = "Maybe it does, but forgetting is how this town lets things happen twice. Someone has to keep the names, and I'm stubborn enough.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The ones who didn't come back, mostly, and the ones who might not tomorrow. I keep a record of every name, because somebody should, and a warrior who drinks with them might keep a few names off my list." } },
      choices = {
        { text = "Then I'll patrol with them, and keep your list short.", next = "BACK", reply = "Then I'll raise a cup tonight and drink to an empty list. That'd be a sight worth seeing in this tavern.", fx = { align = { light = 1 } } },
        { text = "I drink to forget, Smitts. Not to remember.", next = "BACK", reply = "You're in the wrong town for that, friend. Duskwood remembers whether you want it to or not.", fx = { align = { light = -1 } } },
        { text = "Something else, Smitts.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every night, and I've heard of worgs as big as a cart and spiders that could swallow a horse whole. Some of those tales are true, mind, which is the worst part of keeping a tavern in Duskwood." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every night, and some of the tales of cart-sized worgs and horse-swallowing spiders are true, which is the worst part. Your {pet} looks steadier than most of my customers, {class}, and it doesn't ask for credit, which makes it my favourite already." },
      },
      choices = {
        { text = "I'll tell only what's true. The town's frightened enough.", next = "BACK", reply = "Then you're the rarest thing that's ever sat at my bar, a hunter who doesn't stretch the tale. The regulars will be disappointed.", fx = { align = { honor = 1 } } },
        { text = "A good tale's worth a drink, true or not.", next = "BACK", reply = "Ha, you'll fit in at my bar, then, and I'll start the bidding. Just don't tell them the spider was any bigger than a horse.", fx = { align = { honor = -1 } } },
        { text = "Something else, Smitts.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Not much, since the last one through here asked about Karazhan and went up the pass, and nobody's seen him since. Drink your juice and don't follow him, and you'll be my favourite sort of mage." } },
      choices = {
        { text = "I'll not chase ghosts without good reason.", next = "BACK", reply = "Good, then you'll live to be my favourite sort of mage. That pass has eaten wiser heads than yours.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Karazhan's secrets are worth the risk.", next = "BACK", reply = "They were worth it to the last one, too, and we never found his boots. I'll put your name next to his, just in case.", fx = { align = { order = -1 } } },
        { text = "What's the darkest story in your record, Smitts?", next = "murders" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Morbent Fel's name gets whispered at the bar more nights than not, and I pour a little faster when it does. If you're asking because you mean to stop him, I'll tell you what I hear, and if you're asking for another reason, I'll pour you a juice." } },
      choices = {
        { text = "To stop him. Fel's work ends here.", next = "BACK", reply = "Then I'll tell you everything I've heard, and pour it neat. Fel's name has been spoken too long at this bar.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "To learn from him, before he's gone.", next = "BACK", reply = "I'll pour you a juice, then, and I'll not say another word. Some knowledge stays in Duskwood for good reason.", fx = { align = { light = -1 } } },
        { text = "What rumours are going round?", next = "rumors" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I want an answer, and I've stopped being sure that's the same thing. Haggard, who ran the Guard back then, thought justice would let us both sleep, but whoever did it is long gone, and I still don't sleep." } },
      choices = {
        { text = "Then I'll find you the truth and face whoever it names.", next = "BACK", reply = "Do that, and I'll know whether I've been right all these years or just stubborn. Either way, I'll owe you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some truths are better left buried, Smitts.", next = "BACK", reply = "Maybe, but they've been buried long enough and I still don't sleep. I'd rather know, whatever it costs me.", fx = { align = { honor = -1 } } },
        { text = "Something else, Smitts.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Who went in and who came back, and what they said they saw, even when it makes no sense. Someday somebody in Stormwind will want to know how this wood went wrong, and I mean to have the answer in my book." } },
      choices = {
        { text = "Keep writing. Someone must remember what happened here.", next = "BACK", reply = "I will, as long as I've ink and breath. Someday someone will read it and understand what we went through.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things are better forgotten, Smitts.", next = "BACK", reply = "They are, for those who can manage it. I can't, so I write it down instead and pour the drinks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Sit, and I'll tell you about the murders, because I've told everyone else and none of them carried a hammer." },
        { id = "h_default", text = "The name's Smitts. I pour, I listen, and I keep a record of what this town would rather forget, because somebody should." },
        { id = "h_haggard", key = true, when = { heardLine = "haggard.h_raven" },
          text = "Haggard asked after me, did he, the old goat? He and his lads used to fill that corner every night, so tell him I still keep his mug." },
        { id = "h_inquire", tags = { "news" }, when = { questActive = TODO_QUEST("Inquire at the Inn") },
          text = "A shadowy figure writing in a book, in my tavern? I remember him, all right: a jumpy fellow who left in a hurry and never paid." },
        { id = "h_shadowy", when = { questActive = TODO_QUEST("Finding the Shadowy Figure") },
          text = "He went to Raven Hill, last I heard. Nobody goes to Raven Hill on purpose, which is probably why he did." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Those are the mud-stained pages from the murders, in a hand I could never match to anyone. Haggard and I spent a whole season on them, so if you can finish it, finish it." },
        { id = "h_juice", when = { questActive = TODO_QUEST("Zombie Juice") },
          text = "Zombie juice, for the hermit? That's strong stuff, and I wouldn't drink it myself, but he swears it's for his garden." },
        { id = "h_rot", when = { questActive = TODO_QUEST("Gather Rot Blossoms") },
          text = "Rot blossoms grow inside the skulls of the walking dead. Don't ask me how I know that; I read it, I swear I read it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You're the first of the sky people to sit at my bar. Tell me something true about your folk and I'll write it in my book, though only what you'd not mind me knowing." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Sit near the fire, {g:Brother|Sister}. My regulars talk easier when someone's listening who isn't me." },
        { id = "h_case", when = { metBefore = true }, text = "I spent the night with my old notes again. There's never anything new in them, but I read them anyway, same as every night." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I'll pour you something, but you'll drink it with your back to the wall like everyone else in here, because that's how Darkshire drinks." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and your beast is welcome by the fire, so long as it doesn't drink from the bucket under the bar, because that's for washing." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid. I'll write you down, if you don't mind, because I note everyone who walks in out of that forest, and a night elf is a first." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I pour, listen, and remember what Darkshire wants to forget. Your spirits must do the same." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? I've a long memory and a short queue." },
        { id = "h_again2", text = "Go on, then; the fog's bad for trade, so I've time." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask away, since nobody's leaving before dawn anyway." },
      },
      choices = {
        { text = "A drink, please.", next = "BUSINESS" },
        { text = "What does this town want to forget?", next = "murders" },
        { text = "Heard anything?", next = "rumors" },
        { text = "Who drinks here these days?", next = "regulars" },
        { text = "I found your jumpy writer.", next = "jitters", when = { questDone = TODO_QUEST("Finding the Shadowy Figure") } },
        { text = "Your regulars look like they could use a blessing.", next = "priest", when = { class = "PRIEST" } },
        { text = "Was it Mistmantle? Be honest with me.", next = "suspect", when = { topicKnown = "stalvan" } },
        { text = "That juice you sent the hermit...", next = "juice", when = { questDone = TODO_QUEST("Juice Delivery") } },
        { text = "People tell barkeeps things. Tell me what they don't say.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You serve dwarven stout here, I hope.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "A gnome in Darkshire must turn a few heads.", next = "gnome", when = { race = "Gnome" } },
        { text = "What does Darkshire make of mages, Smitts?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do the Watch talk about over a drink, Smitts?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd wager hunters tell tall tales in here, Smitts.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "People talk to you, Smitts. Any of them talk about necromancers?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You still want justice for those murders, I'd wager.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you write down about the forest, Smitts?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does Darkshire want to forget, Smitts?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just warming up.", next = "END" },
      },
    },

    murders = {
      big = true,
      lines = {
        { id = "m_default", key = true,
          text = "A visiting noble family was murdered, years back, when Haggard still ran the Guard. We found pages in the mud but could never tie them to anyone, and it's never sat right with me." },
      },
      choices = {
        { text = "I'll find out who did it.", next = "BACK", fx = { affinity = 2, learn = { "stalvan" }, trait = { curious = 1 } } },
        { text = "Some things stay buried.", next = "buried" },
        { text = "What was on the pages?", next = "murders_pages" },
        { text = "Haggard must have been quite a man, then.", next = "murders_haggard" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Not in Duskwood they don't. Nothing stays buried in Duskwood, and that's rather the problem." } },
      choices = { { text = "Fair point.", next = "BACK" } },
    },
    murders_pages = {
      lines = {
        { id = "mp_default", text = "A man's hand, neat and schooled and careful with its letters, going on about tears and blood. We showed it round half the county and nobody knew it." },
      },
      choices = {
        { text = "Schooled. Sounds like a teacher's hand.", next = "murders_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murders_teacher = {
      lines = {
        { id = "mt_default", text = "Haggard wondered the same. A clerk could settle it, because Daltry has every signature this town ever put to paper, but nobody thought to ask him then." },
      },
      choices = {
        { text = "Then I'll ask him now.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    murders_haggard = {
      lines = {
        { id = "mh_default", text = "Sharp as a tack and twice as stubborn. Last I heard his eyes were going, which is a hard thing for a man who looked at everything." },
      },
      choices = {
        { text = "He still asks after you.", next = "BACK", when = { heardLine = "haggard.h_raven" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rumors = {
      lines = {
        { id = "r_default", text = "There are lights at Manor Mistmantle again, the mayor's written another letter, and somebody up at Raven Hill has been buying black thread by the dozen spools." },
      },
      choices = {
        { text = "And the worgen? What do the regulars say about them?", next = "op_worgen" },
        { text = "Thread?", next = "rumors_thread", fx = { trait = { curious = 1 } } },
        { text = "Lights at the manor?", next = "rumors_manor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rumors_thread = {
      lines = {
        { id = "rt_default", text = "It's the hermit past the cemetery, a polite old fellow. He's had thread from Madame Eva and asked me about a liquor nobody drinks, but I'm sure it's nothing." },
      },
      choices = {
        { text = "You don't sound sure.", next = "BACK", fx = { trait = { skeptical = 1 }, learn = { "raven_hill" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rumors_manor = {
      lines = {
        { id = "rm_default", text = "Manor Mistmantle, north of town, has stood empty for years, and still somebody lights a candle there. The Watch won't go near it after dark, and neither will you, if you've any sense.",
          fx = { learn = { "stalvan" } } },
      },
      choices = {
        { text = "Who lived there?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    regulars = {
      lines = {
        { id = "rg_default", text = "Watchers after a shift, mostly, who drink slow and say little. Grual feeds them, and Trelayne puts the ones who can't walk home upstairs." },
      },
      choices = {
        { text = "And strangers?", next = "regulars_strangers" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    regulars_strangers = {
      lines = {
        { id = "rs_default", text = "Fewer every year. The last one worth remembering took a room for a few nights, wrote at that end of the bar till dawn, and left owing me." },
      },
      choices = {
        { text = "Where did he go?", next = "strangers_west" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers_west = {
      lines = {
        { id = "sw_default", text = "West, muttering that something was hunting him, and there's nothing west of here but Raven Hill and the graves. I hope he found a roof." },
      },
      choices = {
        { text = "I hope so too.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },

    jitters = {
      lines = {
        { id = "jt_default", text = "He's alive? Good! Tell him his tab can wait, and tell him I said so, because he won't believe it from anyone else." },
      },
      choices = {
        { text = "He's sorry he left owing you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "They could. Look at them. Bless the room if you like, but quietly, because some of them lost friends up at Raven Hill and haven't said a word since." },
      },
      choices = {
        { text = "I'll say a prayer for Raven Hill's dead.", next = "BACK", reply = "Do that, and keep it short and kind, because they've had their fill of long speeches. I'll put a bowl of stew in front of each of them afterward, and maybe between the two they'll sleep.", fx = { affinity = 2, standing = { darkshire = 1 }, align = { light = 1 } } },
        { text = "They don't need prayers; they need Raven Hill burned clean.", next = "BACK", reply = "Burned clean, maybe, and I'd hand you the torch myself. But mind these folk tonight, they're not ready to hear it.", fx = { align = { light = -1 } } },
        { text = "Who did they lose?", next = "priest_lost" },
      },
    },
    priest_lost = {
      lines = {
        { id = "pl_default", text = "Watchers, some to the ordinary dead and some to the knight who walks the cemetery. After a while they stop saying the names, and that's when I start to worry.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Then I'll say the names for them.", next = "BACK", reply = "That'd be a kindness, and I'll not forget it. Say them softly, though, so they can join in when they're ready.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Let them forget the names, because remembering won't help them fight.", next = "BACK", reply = "Maybe it helps them fight, but it won't help them live with themselves after. I'll keep the names for them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    suspect = {
      lines = {
        { id = "su_default", text = "Between us, I've thought it, and so did Haggard, but thinking's cheap. A court wants a hand that matches, and we never had one." },
      },
      choices = {
        { text = "Then let's find one.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    juice = {
      lines = {
        { id = "ju_default", text = "I said that juice could wake the dead, but it was a joke. Tell me it was only a joke." },
        { id = "ju_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "I brewed part of that thing, me, and the bit about waking the dead was meant as a joke. I've stopped making the stuff." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'm not sure it was.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    rogue = {
      big = true,
      lines = { { id = "ro_default", text = "That's a trade question, and I'll give you a trade answer: the regulars all talk about the wolves and none of them talk about the Mistmantle manor. Haggard said that was the first thing a sharp eye should notice." } },
      choices = {
        { text = "Then I'll go and look at the manor.", next = "rumors_manor" },
        { text = "Secrets are coin. I'd sell yours to the highest bidder.", next = "BACK", reply = "Then I'll keep my secrets behind the bar where they belong. You're welcome to drink, friend, just not to listen.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll keep what you tell me to myself.", next = "BACK", reply = "Then you're welcome to more of them, and I'll trust you as far as the door. Watch the Mistmantle manor, like Haggard said.", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "When the road's open, yes, and the road's open about one week in three. A dwarf from Menethil swore my last barrel was brewed in a swamp, so I've taken to calling it the Duskwood dark." } },
      choices = {
        { text = "Pour me the Duskwood dark, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Herble up the hill gets stared at for the first month, and then folk start bringing him their broken lanterns. You'll find Darkshire grows used to anyone who's useful after dark." } },
      choices = {
        { text = "I'm very useful after dark.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Who else drinks here, then?", next = "regulars" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone who comes through Darkshire ends up at my bar sooner or later, and they all have a story. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I keep the Scarlet Raven, and a book of everything Darkshire would rather forget. The beer's the easy part." } },
    advice = { { id = "tp_ad", text = "Stay indoors after dark. It's the oldest rule in Darkshire, and the only one everybody keeps." } },
    rumors = {
      { id = "tp_rumors_next", text = "Lights at the manor, thread at Raven Hill and the mayor's eleventh letter; pick one and I'll tell you more.", next = "rumors" },
      { id = "tp_rumors", text = "The fog's thicker, the Watch is thinner, and Grual swears the crab's fresh, and one of those is a lie." },
    },
    stalvan = { { id = "tp_stalvan", text = "That'd be a tutor named Mistmantle, and the manor up the road was his. Don't go there at night." } },
    night_watch = { { id = "tp_watch", text = "They drink here after their shifts, quietly, and you learn to read a watcher's night by just how quietly." } },
    worgen = { { id = "tp_worgen", text = "There's howling past midnight, every night. The regulars stopped flinching years ago, but newcomers never do." } },
    lions_pride = { { id = "tp_inn", text = "Farley's place in Goldshire? I hear the ale's good, and he's certainly got the easier crowd." } },
    ladimore = { { id = "tp_ladimore", text = "He was a knight of this town, before the war, and what walks the cemetery now is what's left of him. I don't talk about it at the bar." } },
    embalmer = { { id = "tp_embalmer", text = "It's a story we told children to keep them out of the graveyard. It worked on me, but it didn't work on the hermit." } },
    _none = { { id = "tp_none", text = "That's not in my book, and my book's thick, so try Daltry at the Town Hall." } },
    raven_hill = { { id = "tp_raven_hill", text = "Raven Hill was a fine village once, with a stone church and a cemetery so peaceful folk picnicked in it. I've the old drawings in my book, and nobody believes me when I show them." } },
    dark_riders = { { id = "tp_dark_riders", text = "The Dark Riders turned up in the same years the dead started walking, and I don't think that's coincidence. I've a page on them in my book, and it's all questions." } },
    scourge = { { id = "tp_scourge", text = "Travellers from the north drink here on their way to Stormwind, and each of them carries a story about the Scourge he can't finish. I write them down after they've gone; it seems the decent thing." } },
    varian = { { id = "tp_varian", text = "When the king went missing, the Watch stopped expecting the army and I stopped expecting good news. I pour the same beer either way." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor's name comes up in my tavern more than you'd expect for a town this far from court, and never fondly. I only pour and listen." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire won't come to Darkshire, and I don't blame them, but I've a copy of their song sheet behind the bar. On a bad night, Hann plays it on a spoon." } },
    booty_bay = { { id = "tp_booty_bay", text = "A Booty Bay captain once told me their rum is distilled from bad decisions. I bought a barrel to see if he was right, and he was." } },
    holy_light = { { id = "tp_holy_light", text = "The Light keeps Darkshire going as much as the Watch does, and the chapel lamp has never once gone out in all my years here. I check it every night on my way home." } },
  },
}
