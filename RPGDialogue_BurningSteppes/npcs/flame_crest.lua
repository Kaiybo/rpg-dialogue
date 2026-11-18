-- Flame Crest: a neutral cave camp on the Steppes' northern rim, goblin dealers, a dragon scholar, an exiled elf and a dwarf with a story. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ragged_john", id = TODO_NPC("Ragged John"), name = "Ragged John",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "major",
  communities = { "flame_crest" }, temper = { "cowardly", "sharp" }, values = { "loyal", "lazy" },
  notices = { "drink", "race", "poison" },

  impression = {
    first = "Ragged John hiccups, laughs at his own jokes and calls his cave home without a trace of shame. Under all the ale there's a sharp old dwarf who knows exactly what people say about him.",
    third = "{name} met Ragged John, the hard-drinking dwarf of Flame Crest who was with Marshal Windsor when he vanished.",
  },

  greetings = {
    { id = "g_op_blackrock", when = { gossip = { topic = "blackrock_clan", stance = "redeemable" } }, text = "Vahgruk says ye think some o' the Blackrock could come home. Ye've no' seen them close, have ye, for I have, an' I ran." },
    { id = "g_default", text = "What'll ye be wantin', then? *hic* Pardon me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye must like my stories, or my ale, and I'll take either one as a compliment." },
    { id = "g_found", when = { questDone = TODO_QUEST("Marshal Windsor") }, text = "Ye found him, didn't ye? I told 'em he weren't dead, and nobody listens to old John." },
    { id = "g_away", when = { away = 14 }, text = "Well, I'll be, ye're back after {away} away! *hic* Sit down, for I've a new story, or an old one I've forgot tellin' ye." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've come on a fair way since we last talked, ain't ye? *hic* Ye'll be in my stories one day, an' I'll tell 'em right." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Folk round the fire say ye got caught tellin' a tall tale. *hic* Nobody tells 'em like old John, so leave it to the expert." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Ye've been at the bottle too, I can tell by the way ye're holdin' that wall up. Dwarves don't get drunk, mind ye, we only get a wee bit sloppy." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and a sober one by the look of ye, which is a shame we can fix. Pull up a rock, cousin." },
    { id = "n_poison", cat = "poison", when = { debuffType = "Poison" },
      text = "Ooh, ye're poisoned, are ye? Hold still, let me have a look at that, purely for science and nothin' to do with brewin'." },
  },

  start = "hello",
  nodes = {
    xpt_crowd = {
      big = true,
      lines = { { id = "xpt_crowd_default", text = "Lonely? Me? I've got the stars and the ash and a jug of something that bites back, and that's three more friends than most folk have. But I'll not lie to you, it's nice when people come up the hill in a bunch, laughing, because it reminds me that I used to." } },
      choices = {
        { text = "Some folk are meant for the hills. Stay where you're happy.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Come down off the hill, John. You'd do well among people.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Orcs, mostly, an' big ones, Rend's lot, who'd sooner die than lose a fight an' generally manage both. Windsor walked up that road wi' his head high an' his sword out, an' I'll say no more about it until I've had another cup." } },
      choices = {
        { text = "Then I'll walk up it the same way, head high.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Head high gets you killed. I'll go quiet and take them from behind.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "All over the bloody place, but thickest round the Altar of Storms an' up toward the Spire, where Rend's orcs breed 'em big an' mean. I used tae hunt in Dun Morogh, back when I could see straight, an' I never met a wolf that hated me like a Blackrock worg does." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} out o' my ale, would ye? *hic* The last beast that got intae it slept for two days an' woke up thinkin' it was a dwarf." },
      },
      choices = {
        { text = "The worgs aren't to blame. Rend's orcs made them cruel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A worg's a worg. I'll kill every one I see.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, an' that was the trouble, because he charged the Dark Irons like there was honour to be had in it, an' there wasnae. I'm alive because I ran, an' he's not here because he didn't, an' I've had a long while tae wonder which o' us was the fool." } },
      choices = {
        { text = "He did right. A charge for honour is never foolish.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You did right, John. A live dwarf can still fight.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It used tae, back when this was Redridge's green neighbour an' the dwarves o' Thaurissan hadn't set the whole mountain alight. Now it's fire below an' Blackrock orcs above, an' the only light I trust comes out o' a lantern, though I'll not stop ye prayin'." } },
      choices = {
        { text = "Even here, the Light endures. I'll keep praying.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A lantern and a sharp axe will serve you better.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Would ye? *hic* Just a wee frost on the staves, mind, for if ye freeze the brew solid I'll have tae chew it. There's no' a dwarf alive who'd say no tae a cold ale in a land that's on fire, an' I'm a dwarf, last I checked." } },
      choices = {
        { text = "Gladly. Every dwarf deserves one cold drink.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It'll cost you a mug, John. Nothing's free.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Everythin' worries me, an' that's what the ale's for. The Dark Irons up there got intae bed wi' fire an' sorcery once, an' look what crawled out, so ye'll forgive an old dwarf for keepin' his ale an' his beard well away from yer wee friend." } },
      choices = {
        { text = "My imp keeps to heel. Your beard's safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little fel never hurt anyone's ale, John.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Green, aye, an' gold, before the Dark Irons called up their fire lord an' burned the whole country black. I remember fields where there's lava now, an' I drink to forget it, an' the drink's the only thing that ever grows back." } },
      choices = {
        { text = "The land will heal one day, John. Stop drowning the memory.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Drink, then. Some losses are too big to look at sober.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Trouble me? They keep me warm, friend, an' they've set my beard alight twice, so call it even. The whole land's been burnin' since the Dark Irons called up their master, an' if ye can talk sense intae fire, ye're a better drinker than me." } },
      choices = {
        { text = "Those spirits are bound and suffering, John.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fire's fire, John. Pour me one and let it burn.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then ye've seen the Grim Guzzler, an' I envy ye, for it's the finest tavern under any mountain an' those Dark Irons brew a stout that'd make a Thunderbrew weep. It's a shame about the rest o' the place, mind, what wi' the lava an' the golems an' the folk who want ye dead." } },
      choices = {
        { text = "Good ale doesn't excuse a cruel people, John.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A people who brew like that can't be all bad.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Were you ever down there yourself, John?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Once, a long time ago, an' I'll no' say how or why, for it's no' a story that flatters me. I came out wi' a cask an' all my fingers, an' I've counted myself lucky on both counts ever since." } },
      choices = {
        { text = "Keep your secrets, then, and your fingers.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_crowd", tags = { "news" }, when = { party = { size = { min = 2 } }, faction = "Alliance" },
          text = "Well, well, a whole parade up my hill! {companion} there looks thirsty, and so do you, and Ragged John hasn't had a crowd to talk at in a dog's age." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my cave! *hic* Tell the fire spirits out there tae calm down, would ye, because they've been rumblin' under the Steppes since before I moved in, an' I'd like a quiet night." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that an imp in my cave? *hic* Mind it keeps off the cask, for the last thing I need is fel in my ale, an' the second last thing is a burnin' beard." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can ye chill a cask, friend? A cold ale in the Burnin' Steppes would be worth all the gold in the Depths, an' I've been dreamin' of one for years." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths" },
          text = "They say ye walked right intae Thaurissan's throne room an' out again wi' the Emperor dead behind ye! *hic* I'm havin' a drink for that, an' ye can't stop me." },
        { id = "h_default", key = true,
          text = "Ragged John, they call me, on account of my good looks. I've a cave, a cask and a story, and only the first two are for sale." },
        { id = "h_business", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "Official business, is it? Maxwell sent ye to hear about Windsor, and I'll bet he called me a coward on yer way out, too. Sit down, then; it's a long one." },
        { id = "h_milk", when = { questActive = TODO_QUEST("Mother's Milk") },
          text = "Have ye let that great spider in the Spire bite ye yet? It's got to be flowin' through yer veins, mind, a gland in a jar won't do it at all." },
        { id = "h_milked", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mother's Milk"), days = 5 } },
          text = "That poison of yers is bubblin' away in the cask as we speak, and it's going to be the best ale this side of Ironforge. What did ye think I wanted it for, murder?" },
        { id = "h_alive", tags = { "news" }, when = { questRecent = { TODO_QUEST("Jail Break!"), days = 7 } },
          text = "They say Windsor walked out of the Depths with his hammer back and a face like thunder. I'm havin' a drink for him, and another for ye, and a third because I'm thirsty." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest in my cave! Ye've come tae save my soul, I'll wager, an' ye're welcome tae try, but ye'll have tae get past a good deal o' ale first." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Now that's a sight, a knight o' the Light in a goblin camp, an' standin' next tae me, the worst-behaved dwarf in the Steppes." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! *hic* Now there's a sight, all that steel an' hardly a dent in it, which means ye haven't been up tae the Spire yet, an' I'd keep it that way." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "Is that a hunter? *hic* Ye'll find nothin' worth shootin' in the Steppes, friend, except the worgs, an' they shoot back, more or less." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Ha! Ye've come to the wrong country, friend, because nothin' grows in the Steppes but ash and trouble, and I've had me fill of both." },
      },
      again = {
        { id = "h_again", text = "What else, eh? *hic* I've got nowhere to be, and that's the best thing about this cave." },
        { id = "h_again2", text = "Go on, ask away; old John's an open book, and most of the pages are stuck together." },
      },
      choices = {
        { text = "Have you got a story for me, John?", next = "st1" },
        { text = "Whatever you're brewing in there smells strong.", next = "ale" },
        { text = "A dwarf is an odd sight in a goblin camp.", next = "crest" },
        { text = "Maxwell calls you a coward.", next = "coward", when = { heardLine = "maxwell.wc_default" } },
        { text = "Pour me one, cousin.", next = "dwarf_drink", when = { race = "Dwarf" } },
        { text = "Why does an Alliance dwarf drink with the Horde's goblins?", next = "neutral", when = { faction = "Horde" } },
        { text = "Running was the smart play, John. I'd have done the same.", next = "k_rogue", when = { class = "ROGUE", heardLine = "ragged_john.st3_default" } },
        { text = "Those Blackrock orcs aren't my Horde, dwarf.", next = "k_orc", when = { race = "Orc" } },
        { text = "Is your ale for the living or the dead, John?", next = "k_scourge", when = { race = "Scourge" } },
        { text = "Shall I chill your cask, John?", next = "xmage", when = { class = "MAGE" } },
        { text = "Fel seems to worry you, John.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does the Light have any place in the Burning Steppes, John?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd guess you ever fought beside a proper knight.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's waiting at the Spire for a warrior, John?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where do the Blackrock worgs run, John?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Was it always ash here, John, or do you remember it green?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do the fire spirits of the Steppes trouble you, John?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I've been to the bottom of Blackrock Depths, John.", next = "xcl_brd", when = { cleared = "Blackrock Depths" } },
        { text = "You must get lonely up here, John.", next = "xpt_crowd", when = { party = { size = { min = 2 } }, faction = "Alliance" } },
        { text = "I'll leave you to your cask.", next = "END" },
      },
    },

    st1 = {
      big = true,
      lines = { { id = "st1_default", text = "Windsor was in a foul temper that day, and believe me, for Windsor that's sayin' something. He kept mutterin' that something felt wrong, and he was righter than he knew." } },
      choices = {
        { text = "Go on.", next = "st2" },
        { text = "Where were you?", next = "st2" },
      },
    },
    st2 = {
      lines = { { id = "st2_default", fx = { learn = { "blackrock" } },
        text = "Smack in the middle of Blackrock Mountain, when the orcs came at us, the filthy beasts. Grunting, clanging, steel everywhere, fifty of 'em if there was one, and ye'd better be payin' attention, because there'll be questions after." } },
      choices = {
        { text = "So what did you do?", next = "st3" },
        { text = "Fifty? Really?", next = "st3", fx = { trait = { skeptical = 1 } } },
      },
    },
    st3 = {
      lines = { { id = "st3_default", text = "Me, against fifty orcs? I'm no fool, whatever the Marshal says. My old pappy always said that discretion is the better part of a biscuit, or some such, and I took his meanin', so I tucked myself behind a slag heap an' held me breath." } },
      choices = {
        { text = "You hid.", next = "st4", fx = { affinity = -1 } },
        { text = "That makes no sense, John. Keep going.", next = "st4", fx = { trait = { witty = 1 } } },
      },
    },
    st4 = {
      lines = {
        { id = "st4_default", fx = { learn = { "windsor" } },
          text = "And Windsor didn't care for that, but he had other worries, so he started swingin' Ironfoe and roarin' like a madman. That hammer was made for his great-great-grandpappy by Franclorn Forgewright himself, and it ate orcs like I eat sausage." },
      },
      choices = {
        { text = "Who's Franclorn Forgewright?", next = "forgewright" },
        { text = "And then?", next = "st5" },
      },
    },
    forgewright = {
      lines = { { id = "fw_default", fx = { learn = { "stonewrought_dam" } },
        text = "Only the finest Dark Iron builder that ever lived, the one who came up with all that stonewrought archimectonical building business. Windsor said there was a twin to Ironfoe, too, Ironfel, that Franclorn kept for his own self." } },
      choices = {
        { text = "A Dark Iron made Windsor's hammer?", next = "forgewright_friend" },
        { text = "Back to the story.", next = "st5" },
      },
    },
    forgewright_friend = {
      lines = { { id = "ff_default", text = "Aye, and his pappy's pappy's pappy was best friends with the fellow, which comes into the story directly, so hush. Not every Dark Iron was born bad, no more than every one of us was born handsome." } },
      choices = { { text = "Go on, then.", next = "st5" } },
    },
    st5 = {
      lines = { { id = "st5_default", text = "Hours, it went on, maybe days, I lost count, and then it stopped, and there he stood, covered in orc from boots to beard and still breathin'. Angry, mind, very angry, but breathin'." } },
      choices = {
        { text = "So that's how Windsor died.", next = "st6" },
        { text = "I think you're drunk, John.", next = "st_drunk" },
      },
    },
    st_drunk = {
      lines = { { id = "sd_default", text = "Dwarves don't get drunk, I've told ye, we get a wee bit sloppy, which is a different thing altogether and a lot more dignified. Now where was I?" } },
      choices = { { text = "Windsor. Standing. Covered in orc.", next = "st6" } },
    },
    st6 = {
      lines = { { id = "st6_default", text = "Die? Who said he died? I never said he died, did I, so stop puttin' words in my mouth; there's barely room in there for the ale. He went missin', that's all." } },
      choices = {
        { text = "Then where is he?", next = "st_end" },
        { text = "John. Please. Where is he?", next = "st_end", fx = { trait = { kind = 1 } } },
      },
    },
    st_end = {
      big = true,
      lines = {
        { id = "st_end", key = true, fx = { hear = "windsor_alive", learn = { "blackrock_depths", "dark_iron" } },
          text = "The Dark Irons turned up, three hundred of 'em, craftier than the orcs and better prepared, and they didn't kill him, on account of the old friendship between his family and Franclorn's. Their emperor, Thaurissan, took Ironfoe for himself and dragged Windsor off into the Depths, and that's the last I saw of him. *hic* Pardon." },
      },
      choices = {
        { text = "Thank you, John. That was... informative.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } },
          journal = { first = "Ragged John finally told me what became of Marshal Windsor: taken alive by the Dark Irons, into Blackrock Depths.",
                      third = "{name} sat through Ragged John's whole tale: Windsor was taken alive into Blackrock Depths." } },
        { text = "Why didn't you go after him?", next = "coward" },
        { text = "Enough stories, John. What did you actually see?", tag = "Intimidate", next = "st_truth",
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { deed = "dungeon:Blackrock Depths" } } } },
          fail = { next = "st_huff", fx = { affinity = -1 } } },
      },
    },

    coward = {
      big = true,
      lines = { { id = "cw_default", text = "Because one dwarf with a hangover against three hundred Dark Irons is a funeral, not a rescue, and somebody had to live to tell the Marshal. Maxwell can call me what he likes; I'm the reason he knows anything at all." } },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2, opinion = { ragged_john = "sensible" } } },
        { text = "You could have tried.", next = "coward_push", fx = { affinity = -1, opinion = { ragged_john = "coward" } } },
      },
    },
    coward_push = {
      lines = { { id = "cp_default", text = "Aye, I could have, and I think about it every night at the bottom of the cask. Don't tell Maxwell I said that." } },
      choices = {
        { text = "I won't.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ale = {
      lines = { { id = "a_default", text = "A little of everything, my friend, which is the secret of all great brewing. What it really wants, though, is a dash of the deadliest poison in the Spire, the stuff the orcs call Mother's Milk." } },
      choices = {
        { text = "You want to put poison in ale?", next = "ale_milk" },
        { text = "That sounds dreadful.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    ale_milk = {
      lines = { { id = "am_default", fx = { learn = { "blackrock_spire" } },
        text = "Not poison, ye daft thing, a live sample, flowin' warm through somebody's veins, and then I milk it out of ye. Mother Smolderweb's the spider, deep in Blackrock Spire, and she's very generous with a bite." } },
      choices = {
        { text = "And you'd 'milk' me how, exactly?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },

    crest = {
      lines = { { id = "c_default", text = "The goblins don't ask where ye're from or which banner ye drink under, and the Marshal's camp asks far too many questions. Besides, the view's lovely, if ye like lava." } },
      choices = {
        { text = "You've some odd neighbours up here, I'd guess.", next = "crest_neighbours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest_neighbours = {
      lines = { { id = "cn_default", text = "Kibler and his foul-mouthed bird, Tinkee and her contraptions, a pair of goblins countin' coin, and that elf who looks at ye like ye're a snack. Mind yer purse with all of them, and mind yer soul with the elf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dwarf_drink = {
      lines = { { id = "dd_default", text = "Now there's a proper request! Here, it's mostly ale and a bit of something else; don't ask what, and don't drink it near an open flame." } },
      choices = {
        { text = "To Windsor.", next = "BACK", fx = { affinity = 3 } },
        { text = "To the Bronzebeards.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    neutral = {
      lines = { { id = "ne_default", text = "Because nobody else'll drink with me, and the goblins only care if ye pay. I'm nobody's soldier now, orc; sit down and have one, and we'll both forget whose side we're on." } },
      choices = {
        { text = "One drink, then, and sides can wait until morning.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "I remember whose side I'm on.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    st_truth = {
      big = true,
      lines = {
        { id = "stt_default", text = "Alright, alright, put that face away! I saw it from behind a rock a good long way off, and I never heard Thaurissan say a word, I put that bit together after. But I saw the hammer go one way and Windsor go the other, alive and kickin', and I'll swear to that on my beard." },
      },
      choices = {
        { text = "That's all I needed, John.", next = "BACK", fx = { affinity = 1 } },
        { text = "Why not tell it that way?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_huff = {
      lines = {
        { id = "sh_default", text = "Actually see? I saw what I said I saw, and I'll not be bullied in my own cave by somebody who wasn't there! Buy a drink or go and bother the Marshal." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_rogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Would ye, now? *hic* Then ye're either honest or a liar, an' I cannae tell which from here. Maxwell says I ran, an' ye say I was smart, an' I've been in this cave a long while decidin' which o' ye's right." },
      },
      choices = {
        { text = "Dead men carry no warnings. You did right.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "Smart, maybe. Still running, though.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "What did you see before you ran?", next = "st1" },
      },
    },
    k_orc = {
      lines = {
        { id = "xor_default", text = "No, they're no', an' that's the only reason I let ye in the cave. Thrall's lot drink their grog an' mind their manners round Flame Crest, an' Rend's lot set fire tae anythin' that moves, so I can tell ye apart, mostly by the smell o' burnin'." },
      },
      choices = {
        { text = "Then drink with me, dwarf. Truce.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Mostly? Watch your tongue.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    k_scourge = {
      lines = {
        { id = "xsc_default", text = "Ha! For the livin', mostly, but I'll pour ye a cup an' we'll see what it does tae a dead man. *hic* Ye've no' got a stomach left tae burn, so ye might be the only one in the Steppes who can drink it straight." },
      },
      choices = {
        { text = "Pour it. I've drunk worse in the Undercity.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll pass. Some of us still have standards.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Ye'd be amazed what a dwarf picks up at the bottom of a mug in a goblin camp. Ask old John about any o' this." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For a friend o' the cask, I'll even tell it straight, mostly. Here's what I know, *hic*." },
    },
    background = { { id = "tp_bg", text = "I rode with Windsor, once, and now I ride a cask. It's a quieter horse.", next = "st1" } },
    advice = { { id = "tp_ad", text = "When fifty orcs come over a hill, find a shadow; when three hundred Dark Irons come after, find a deeper one." } },
    windsor = { { id = "tp_windsor", text = "Not dead, whatever they tell ye in Morgan's Vigil. Ask me properly and I'll tell ye the whole of it.", next = "st1" } },
    blackrock_spire = { { id = "tp_spire", text = "Full of orcs, worgs, spiders and dragons, and I've been in and out more times than I can count. Mostly out." } },
    magni = { { id = "tp_magni", text = "Magni's a good king an' a better drinker, an' I'd raise a mug to him right now if I had one. Oh, look, I do." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War when these hills were still green, if ye can believe it, an' I watched the Horde an' their dragons burn them black. They've never grown back." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons have a whole city under that mountain, an' a bar, they say, wi' the best ale in the world. I'd go in just for that, if I weren't so fond o' breathin'." } },
    onyxia = { { id = "tp_onyxia", text = "There's a black dragon in Dustwallow, they say, an' she's the daughter o' the biggest black dragon there ever was. I'd stay well clear o' that family, lad." } },
    firegut = { { id = "tp_firegut", text = "The Firegut ogres on Dreadmaul Rock are loud an' stupid an' they can't hold their drink. I tried to share a cask wi' one once, an' I'm lucky I've still got my beard." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I've heard of most things, usually at the bottom of a mug." } },
  },
}

P:NPC {
  key = "maxwort", id = TODO_NPC("Maxwort Uberglint"), name = "Maxwort Uberglint",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "flame_crest" }, temper = { "shrewd" }, values = { "greedy", "curious" },
  notices = { "purse", "class" },

  impression = {
    first = "Maxwort Uberglint asked whether I'd come to make him rich before he asked my name. He chases the legends of the Seven for the money, and he doesn't pretend otherwise.",
    third = "{name} met Maxwort Uberglint, a treasure hunter at Flame Crest chasing the lost knowledge of the Seven.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, welcome, my friend! Are you here to make me rich? Please say yes, because I've already budgeted for it." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite scribe returns! Do you have anything shiny, buddy, or only your charming face, which I can't sell?" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Oh, you've a heavy purse, my friend, I can hear it clinkin' from here. We should be partners, you and I, and I mean that in the most expensive way possible." },
    { id = "n_scholar", cat = "class", when = { class = { "MAGE", "PRIEST" } },
      text = "You've the look of somebody who reads things, and reading things is how goblins get rich, eventually, with interest. Do you read dwarven, by any chance?" },
    { id = "n_scav", cat = "origin", when = { origin = "gnome_scavenger" },
      text = "A gnome who goes back into Gnomeregan for parts, they tell me! Now that's my kind of business, my friend, because a ruin nobody's brave enough to rob is just a treasure vault with bad manners." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Anything with old script on it, anything that glows, and anything the Dark Irons look particularly cross about losing, and I pay by the pound. The Seven left their works scattered all over these ruins, and a strong arm is worth more to me than a clever tongue, since I already own the tongue." } },
      choices = {
        { text = "I'll fight for the relics, but they go to scholars, not buyers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Treasure's treasure. I'll carry it out and we'll split the gold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Maxwort.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I don't see why not, buddy, since Kibler swears his worg pups can find a scrap of meat under a yard of ash. If they can find meat they can find a buried Dark Iron coffer, and if they can find a coffer, I can retire somewhere with a balcony." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Let me see {pet} sniff at this old Dark Iron coin, would you? If its tail wags, I'll know I've been carrying the real thing about all along, and I'll stop insuring the fake." },
      },
      choices = {
        { text = "My beast won't dig up the dead for coin, Maxwort.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it can find gold, it'll find gold. Show me the coin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Maxwort.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Dangerous, yes, and profitable, which is how I take my work and my coffee. The Dark Irons called up something in the mountain that burned their own city, and anything that survived a fire like that is worth a fortune to the right collector in Stormwind, or Orgrimmar, whoever bids higher." } },
      choices = {
        { text = "Some things are cursed for a reason. Leave them buried.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it can be sold, someone will. Better you than them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Whatever glitters, my friend, and whatever's written down, because one makes you rich and the other tells you where to find more. I'd never ask you to break any laws, of course, but the Dark Irons haven't got any laws worth the paper, so the books are clean." } },
      choices = {
        { text = "Robbing the Dark Irons is practically a public service.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'm nobody's burglar, Maxwort, not even a goblin's.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Maxwort.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I don't know, buddy, I've never had one try, but I've seen your kind find water in a desert, and gold can't be any harder. The Seven buried their secrets in the ash, and I'd cut a fair share for anyone who could find them faster than my shovel." } },
      choices = {
        { text = "My gifts are not for treasure-hunting, Maxwort. Find another partner.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A fair share is a fair share. I'll keep my nose open.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Where the Seven hid their best work, for a start, because the Dark Irons buried their history under Blackrock Mountain and then dropped the mountain on it. You talk to stone and I sell what's under it, so we'd make a fine pair, my friend, if your spirits don't mind a modest commission." } },
      choices = {
        { text = "The earth's secrets aren't for sale, Maxwort.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "For a fair cut, I might ask the stones for you.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The earth here is full of Dark Iron secrets, my friend, and if it's ever in the mood to whisper one, I'd pay handsomely to hear it, cash on delivery." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now there's a professional I respect, buddy, because the Dark Irons won't sell me what I want, and you look like somebody who's never paid full price for anything." },
        { id = "h_default", key = true,
          text = "Maxwort Uberglint, treasure hunter, finder of things and seller of the things I find. I came to the Steppes chasing the legends of the Seven, because where you find old knowledge you find power, and where you find power, my friend, you find wealth." },
        { id = "h_tablet", when = { questActive = TODO_QUEST("Tablet of the Seven") },
          text = "The tablet's in the ruins of Thaurissan, under the statue of a dwarf, if the stories are right, and I've paid good silver for those stories. Copy every mark on it, every last scratch, and bring it to me, buddy." },
        { id = "h_tablet_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tablet of the Seven"), days = 5 } },
          text = "Your transcription is beautiful, by the way, better than any scribe I could hire and cheaper, too. I'm still reading it, and every line makes me poorer in patience and richer in hope." },
        { id = "h_heart", when = { questActive = TODO_QUEST("The Heart of the Mountain") },
          text = "The Dark Irons keep the Heart in the vault deep in their city, behind a guard who won't show himself until every coffer's open. I tried to buy it, cross my ledger, and made them a very generous offer, but they wouldn't sell." },
        { id = "h_heart_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Heart of the Mountain"), days = 7 } },
          text = "I take it out every night and just look at it, the size of your fist and twice as beautiful as I imagined, and I haven't once worked out its price, which worries me. Don't tell anybody where I keep it, my friend, and don't ask." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Now there's a fine thing, because the Dark Irons have a great many relics of Thaurissan's old faith, and I could use somebody who'll tell me which ones are cursed before I sell them and get sued." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Good, buddy, because the Dark Irons guard their old relics with hammers the size of my cave, and I need somebody who can stand up to that and still carry the treasure out in one piece." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? I've no interest in pelts, my friend, but if your beasts can sniff out old gold, you and I are about to become very good partners, junior partners on your side." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, I don't suppose you can sniff out buried treasure in that bear shape? I'd make it very much worth your while, my friend, on a sliding scale." },
      },
      again = {
        { id = "h_again", text = "What else, my friend? Time is money, and I'm generously givin' you mine for nothing." },
        { id = "h_again2", text = "Ask away, buddy. Every question is an investment, I always say, and I always collect." },
      },
      choices = {
        { text = "Who were the Seven?", next = "seven" },
        { text = "What treasure do you want most, Maxwort?", next = "heart" },
        { text = "A cave beside a volcano is a strange place to live.", next = "cave" },
        { text = "I can read old scripts, if you need a scribe.", next = "scholar", when = { class = { "MAGE", "PRIEST" } } },
        { text = "The Royal Historian told me about Thaurissan.", next = "archesonus", when = { heardLine = "archesonus.t_default" } },
        { text = "The Seven's sorcery interests me, Maxwort. Professionally.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "What would you have me take from the Dark Irons?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Trading in Dark Iron relics sounds dangerous, Maxwort.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you need carried out of the Dark Iron ruins?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You think a beast can sniff out treasure?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Could a druid really sniff out treasure for you, Maxwort?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What would you pay the earth to tell you, Maxwort?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Good hunting, Maxwort.", next = "END" },
      },
    },

    seven = {
      lines = { { id = "s_default", fx = { learn = { "thaurissan" } },
        text = "Dwarves of great knowledge and greater power, from the old days before the city burned, and that's about all anyone agrees on for free. The ruins of Thaurissan are said to keep their tablet, which is where you come in, my friend." } },
      choices = {
        { text = "What did the Seven do?", next = "seven_did" },
        { text = "You don't strike me as one who seeks knowledge for its own sake.", next = "seven_wealth" },
      },
    },
    seven_did = {
      lines = { { id = "sd_default", text = "Something big enough that the stones still whisper about it two hundred years later, and I mean to find out exactly what. If it melted mountains once, buddy, imagine what it'd fetch at auction." } },
      choices = {
        { text = "That's a terrible idea.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seven_wealth = {
      lines = { { id = "sw_default", text = "There's no such thing, my friend, there's only knowledge nobody's found a buyer for yet. The quest for wealth is the only proper goal for a goblin, and I'm a very proper goblin with very proper ledgers." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { greedy = 1 } } } },
    },

    heart = {
      lines = { { id = "he_default", fx = { learn = { "blackrock_depths" } },
        text = "A gem the size of your fist, locked in the Dark Iron vault under Blackrock Depths, and I've wanted it for years. To me its value is beyond any price, which is a strange thing for a goblin to say, so you know I mean it, on my mother's ledger." } },
      choices = {
        { text = "Why that gem?", next = "heart_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heart_why = {
      lines = { { id = "hw_default", text = "Some things you want because they'll make you rich, buddy, and some because they're beautiful and nobody else can have them. That one's both, and I've been chasing it longer than I've been chasing anything, debts included." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cave = {
      lines = { { id = "c_default", text = "Cheap rent, no tax collectors, and nobody bothers you here except adventurers, who are the best customers in the world. And if the mountain goes up one day, well, my friend, I'll have had a front seat, and you can't buy a ticket like that." } },
      choices = {
        { text = "You'd die.", next = "cave_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_death = {
      lines = { { id = "cd_default", text = "Wealth, my friend, and maybe one big, loud death at the very end, with fireworks and a crowd: that's the goblin dream. Quietly in bed is for gnomes and accountants." } },
      choices = {
        { text = "To a big, loud death, then.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll take quietly in bed.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    scholar = {
      lines = { { id = "sc_default", text = "Then you're worth twice what I'd pay a sword, buddy! Go to the ruins, copy that tablet, and if your transcription's good I'll pay you like a scribe and thank you like a partner." } },
      choices = { { text = "Partner, you said?", next = "BACK", fx = { affinity = 1, trait = { greedy = 1 } } } },
    },
    archesonus = {
      lines = { { id = "ar_default", text = "The blind historian in Ironforge? She knows more about that city than anyone alive, and she'll never sell a word of it, which I find personally offensive as a businessman. Did she mention the Seven at all?" } },
      choices = {
        { text = "She said the accounts all stop at the blast.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not telling you.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "Professionally! Now that's a word I like, my friend, because professionals pay for what they want and don't ask silly questions about the price. The Seven called up something big under that mountain, and you can bet your last copper they wrote down how." },
      },
      choices = {
        { text = "Find me the tablet and name your price.", next = "BACK", fx = { align = { light = -1 }, affinity = 2 } },
        { text = "Whatever they called up, I want it kept down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Who were the Seven?", next = "seven" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know what's worth money around here, buddy, and that's most things, if you look at 'em properly. Ask me about any of these." },
    },
    background = { { id = "tp_bg", text = "Booty Bay born, by way of every ruin that ever had a rumour attached to it. The Seven are just the latest rumour.", next = "seven" } },
    advice = { { id = "tp_ad", text = "Never pay for anything you can find, my friend, and never find anything you can't sell." } },
    thaurissan = { { id = "tp_thaurissan", text = "A dwarven city that went up in one great flash, leaving nothing but ash and treasure for patient goblins.", next = "seven" } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons have a city under the mountain, an' it's full o' treasure, an' I'd sell my mother to see it. I wouldn't sell her cheap, mind." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I was born, an' where I'll go back rich someday. Every ruin's a step closer to the docks." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are greedy an' cruel an' they've got all the best treasure. I hate them for the first two an' envy them for the third." } },
    _none = { { id = "tp_none", text = "Is there money in it? If not, buddy, I'm afraid I've never looked." } },
  },
}

P:NPC {
  key = "tinkee", id = TODO_NPC("Tinkee Steamboil"), name = "Tinkee Steamboil",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "quest",
  communities = { "flame_crest" }, temper = { "earnest", "nervous" }, values = { "curious", "proud" },
  notices = { "craft", "race" },

  impression = {
    first = "Tinkee Steamboil names her gadgets with great ceremony and warned me off a bench of things that are very nearly stable. When her patron comes up she goes quiet, which I noticed.",
    third = "{name} met Tinkee Steamboil, an excitable goblin scholar of dragonkin working out of Flame Crest.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello! Don't touch anything on that bench, sweetie, because some of it is very nearly stable and all of it is very nearly paid for." },
    { id = "g_back", when = { metBefore = true }, text = "It's you! I've got a new device and it needs testing, and you're so good at testing things, and you've hardly exploded at all!" },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "Oh, an engineer! You'll appreciate the Draco-Incarcinatrix 900, pal, because nobody else here appreciates it at all, they just ask whether it explodes, and it only does that on Tuesdays." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Please, please don't look at my wiring, because I know you'll want to fix it, and it's fine, it's perfectly fine, and I'd have to charge you for the lookin' anyway." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everything, but mostly that they come in fours and fives, and their mothers come in ones that are much, much bigger. A warrior with a good shield could hold the little ones off for a minute or two, pal, which is all I need to get the Draco-Incarcinatrix runnin'." } },
      choices = {
        { text = "I'll hold them off while you work. We stick to your plan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Holding back's for cowards. I'll charge the nest and clear it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Tinkee.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A very generous gentleman who pays very generously, on time and in full, and doesn't like his name in anybody's mouth, so I'll just call him my patron. He wants to know about dragonkin, and I want to know about dragonkin, so the contract's lovely, I'm sure, completely lovely." } },
      choices = {
        { text = "A patron who hides his name hides worse. Be careful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gold's gold, Tinkee. Take it and ask no questions.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because if they do, then my patron's experiments are a very different line item, and that's a cost I don't like to tally. It's all for science, of course, and science doesn't need to worry about souls, I've been told, quite firmly, by the fellow paying." } },
      choices = {
        { text = "Every soul matters, Tinkee. Science answers to the Light.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your patron's right. Study first, worry later.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For study, of course, and because my patron wants them kept fresh, very fresh, for reasons he says are scholarly and I'm not paid to question. Frozen eggs don't hatch, you see, which is the only thing that makes collecting them safe, or insurable." } },
      choices = {
        { text = "Dragon eggs for a stranger? Be careful, Tinkee.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Science first. What your patron wants is his affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tinkee.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everybody in Flame Crest, I think, and Felnok up in Everlook would only steal them to tell me they're wrong and then charge me for the corrections. The only one who never asks is my patron, because he says the eggs are all he needs, which is very generous of him, or very strange." } },
      choices = {
        { text = "Trust nobody, Tinkee, least of all your patron.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A patron who pays deserves your loyalty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That they're cleverer than anybody gives them credit for, and that the black ones nest in the mountain and send their whelps to bother everybody else. I'd love to know whether your Circle studies dragons too, pal, because I've a few notes I'd trade, though only note for note, and only for good ones." } },
      choices = {
        { text = "Dragons should be studied carefully, not provoked. Mind your experiments.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dragons are beasts like any other. Study them however you like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "For science, and for my patron, who pays for every measurement I send him and never says what he does with them, which is fine, a customer's a customer. I'd rather be studying the dragons, but fire is fire, and if I understand how it moves, I might keep my eyebrows a little longer this time." } },
      choices = {
        { text = "If he pays, that's his business, Tinkee.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ask your patron what he wants with it, Tinkee.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only a little, and only if it volunteers, since I'm a scientist and not a monster, and I'd pay it in coal. The whelps keep scorching my workbench, you see, and if I can build somethin' an imp can't burn through, I'll have something a whelp can't either, which is the theory." } },
      choices = {
        { text = "My imp isn't a test subject, Tinkee.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Go ahead. It could use the discipline.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ubrs = {
      big = true,
      lines = { { id = "xcl_ubrs_default", text = "Then you've seen the black dragonflight's own nursery, which is the most important place in all of dragonkin studies and the least safe! General Drakkisath kept that whole floor runnin' like a goblin factory, so I expect there's a terrible muddle up there now, scientifically speaking, and probably a few fires nobody's paying to put out." } },
      choices = {
        { text = "Even dragon whelps don't choose who hatched them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Those eggs should be smashed before a single one hatches.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do you actually want the eggs for?", next = "xcl_ubrs2" },
      },
    },
    xcl_ubrs2 = {
      lines = { { id = "xcl_ubrs2_default", text = "Study, of course, and my patron wants them too, which pays for the study, which is how science works, pal. I measure the warmth and the shell and the way the essence moves inside, and nobody's ever done it properly, because nobody else has been mad enough or funded enough to try." } },
      choices = {
        { text = "Do be careful with them, Tinkee.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Is it true imps can breathe fire? I've been trying to build a whelp-proof furnace, and an imp would make a lovely test subject, if it doesn't mind, and I'd pay a reasonable fee." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do you think the fire elementals around the mountain would hold still long enough for me to measure 'em? No? I didn't think so either, pal, but asking's free." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Ooh, are you here to steal my schematics? You can't, sweetie, because I keep them in my head, mostly, and the rest are on fire, which is cheaper than a lockbox." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you do frost? My device is supposed to freeze dragon eggs, but you could probably do it with a flick of your wrist, and I'd love to compare results, and maybe your rates." },
        { id = "h_cl_ubrs", tags = { "news" }, when = { cleared = "Upper Blackrock Spire" },
          text = "You've been up to the very top of the Spire, where the rookery is? Oh, did you see the eggs, and were any of them glowin'? I need to know whether they glow, pal, it's worth a whole chapter." },
        { id = "h_default", key = true,
          text = "Tinkee Steamboil, scholar of dragonkin, inventor, and very reasonable rates! The Burning Steppes are dangerous, but a real scholar will do almost anything to learn somethin' new, and I've learned so much here already, mostly about burns." },
        { id = "h_essence", when = { questActive = TODO_QUEST("Broodling Essence") },
          text = "Zap a broodling with the device, defeat it while it's still glowing, and the essence should come right out, pal. Should, I said, because that's what the testing is for, and you're the testing." },
        { id = "h_felnok", when = { questActive = TODO_QUEST("Felnok Steelspring") },
          text = "Felnok's in Everlook, up in Winterspring, where it's lovely and cold and nothing is on fire, which must be awful for business. Give him my letter and he'll know exactly which parts to make, and exactly what to charge me." },
        { id = "h_parts", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Tinkee"), days = 5 } },
          text = "Felnok's parts are perfect, and he says I owe him, which is true, and which I'll never admit to his face or in writing. The eggscilloscope is nearly ready, and it's only smoked a little!" },
        { id = "h_freeze", when = { questActive = TODO_QUEST("Egg Freezing") },
          text = "The dragons hatch their eggs in a rookery high up in Blackrock Spire, pal. Freeze one, just one, and come back and tell me it worked, and that you've still got all your fingers." },
        { id = "h_collect", when = { questActive = TODO_QUEST("Egg Collection") },
          text = "Freeze them first, then collect them, never the other way round, unless you want your eyebrows on account! My patron's heard you're getting them for me, and he's very eager, very eager, and he's already built a shelf for them." },
        { id = "h_leonid", tags = { "news" }, when = { questActive = TODO_QUEST("Leonid Barthalomew") },
          text = "Why would my master want the eggs sent to you, and not to me? Never mind, pal, never mind, just take them to this Leonid and tell him I did everything I was told and kept every receipt." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Do dragons have souls, do you think? I've been meaning to ask somebody qualified, and nobody at Flame Crest is qualified for anything except overcharging." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, all shining and serious! You won't smash my gadgets, will you, pal? They're perfectly harmless, mostly, and the ones that aren't are for dragons and they cost a fortune." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Oh, excellent, could you stand between me and the whelps while I take a measurement? They're only small, but they bite and they're on fire, which hardly seems fair, and I'm not insured for either." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, here! Tell me, have you ever turned into a dragon? No? Pity, pal, because I'd have a thousand questions, and you'd have been my favourite subject, and I'd even have paid you." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I'm all ears, and only slightly singed ones." },
        { id = "h_again2", text = "Go on, go on! Questions are my favourite thing after dragons and gadgets and getting paid." },
        { id = "h_again3", text = "Ask, ask, pal! I think faster when somebody's asking, and I explode less, too." },
      },
      choices = {
        { text = "What are you studying?", next = "study" },
        { text = "What does that big device on your bench do?", next = "gadgets" },
        { text = "Who pays for all this research?", next = "patron" },
        { text = "Do you work with any other engineers?", next = "felnok" },
        { text = "I'd like a look at those schematics.", next = "engineer", when = { profession = "Engineering" } },
        { text = "Leonid told me who your patron really serves.", next = "leonid", when = { questDone = TODO_QUEST("Leonid Barthalomew") } },
        { text = "I could tame one of those whelps, I think.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Why freeze dragon eggs at all, Tinkee?", next = "xmage", when = { class = "MAGE" } },
        { text = "Who else wants your schematics, Tinkee?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why do you care whether dragons have souls, Tinkee?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who pays for your gadgets, Tinkee, and what do they want?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Those whelps don't look so dangerous to me.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What have you learned about the dragons of the Steppes, Tinkee?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why do you want to measure fire elementals, Tinkee?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I don't trust you near my imp with that furnace.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I've been to the top of Blackrock Spire, Tinkee.", next = "xcl_ubrs", when = { cleared = "Upper Blackrock Spire" } },
        { text = "Good luck with the dragons.", next = "END" },
      },
    },

    study = {
      lines = { { id = "s_default", fx = { learn = { "black_dragonflight" } },
        text = "The black dragonkin of the Steppes: the whelps, the broodlings, the drakes, and how they grow. If I could learn to capture a living whelp, or an egg, I'd be the envy of every dragon scholar in the world, and I could charge admission." } },
      choices = {
        { text = "That sounds like dangerous work for a gnome.", next = "study_danger" },
        { text = "Why eggs?", next = "study_eggs" },
      },
    },
    study_danger = {
      lines = { { id = "sd_default", text = "Extremely, pal, and that's what adventurers are for! I'm a scholar, not a lunatic, though the others in this cave would argue about that, and they'd lose." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    study_eggs = {
      lines = { { id = "se_default", text = "A frozen egg stays an egg, and an egg can be studied, and carried, and kept, and shipped. Frozen eggs are harmless, you see, and it's the warm ones you need to worry about, because they hatch, and then they bill you." } },
      choices = {
        { text = "And what does your patron want with them?", next = "patron" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gadgets = {
      lines = { { id = "g2_default", text = "It catches the essence of a dragon broodling at the moment of its defeat! After that came the eggscilloscope, which freezes eggs, and then the collectronic module, which collects them, and I named all three myself, pal, and trademarked 'em too." } },
      choices = {
        { text = "The names are... something.", next = "gadgets_names" },
        { text = "I'd guess some of it explodes.", next = "gadgets_boom" },
      },
    },
    gadgets_names = {
      lines = { { id = "gn_default", text = "They're wonderful names, and you know it, and good names sell. Felnok wanted to call the eggscilloscope 'the cold thing', and that's why Felnok does the wiring and I do the selling." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gadgets_boom = {
      lines = { { id = "gb_default", text = "Not yet! Well, not much, and never while anybody important was standing near it, and the scorch marks wash right off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    patron = {
      big = true,
      lines = { { id = "p_default", text = "Oh, he's... a very important man, a scholar much grander than me, and he pays very well for my research, always on time, always in gold. He's not the sort of client you want to disappoint, pal, so I try very hard never to." } },
      choices = {
        { text = "You sound frightened of him.", next = "patron_fear" },
        { text = "What's his name?", next = "patron_name" },
      },
    },
    patron_fear = {
      lines = { { id = "pf_default", text = "Frightened? No, no, respectful, very respectful, which is a different thing entirely and a very sensible business practice. Could we talk about broodlings instead, please?" } },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Tinkee, who is he?", next = "patron_name" },
      },
    },
    patron_name = {
      lines = { { id = "pn_default", text = "I call him my master, and he likes it that way, and the customer is always right. Nobody knows him unless he wants them to, pal, so please don't go asking around about him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    felnok = {
      lines = { { id = "f_default", text = "Felnok Steelspring, my colleague in Everlook, and the best engineer north of anywhere, which he'll tell you himself if you stand still long enough, and then he'll invoice you for the conversation. He makes the parts I'm too busy to make." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      lines = { { id = "e_default", text = "You may look, pal, but not touch, and not laugh at my soldering. The trick with the cold coil is that it has to be colder than the egg is hot, which sounds obvious but took me eleven tries and one workbench." } },
      choices = { { text = "That's clever work.", next = "BACK", fx = { affinity = 2 } } },
    },
    leonid = {
      big = true,
      lines = { { id = "l_default", text = "He did? I... I'd rather you didn't tell me, if it's anything dreadful, and I can see by your face that it is. I only wanted to study dragons, pal, and get paid a little for it." } },
      choices = {
        { text = "The eggs are safe now. You did well.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Next time, ask who's paying.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Curiosity's no crime. Study what you like and ignore the paymasters.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Tame one! Oh, I'd love to see you try, and I'd write it all down, every scream, and sell the notes. A black whelp has a dragon's temper in a dog's body, pal, and I've lost three gloves and a very good hat learning that much." },
      },
      choices = {
        { text = "Some beasts aren't meant to be tamed.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Every beast can be tamed, with patience.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've written notes on nearly everything in the Steppes, pal, and drawn little pictures in the margins too, and the pictures cost extra! Ask me about any of these." },
    },
    background = { { id = "tp_bg", text = "A goblin who'd rather study than sell, which most goblins find about as sensible as giving away free samples. The Steppes have the best dragonkin anywhere, so here I am.", next = "study" } },
    advice = { { id = "tp_ad", text = "Freeze it first, then pick it up, sweetie. That rule has saved my life more than once, and my eyebrows twice." } },
    black_dragonflight = { { id = "tp_dragons", text = "Fascinating creatures, terribly clever and terribly rude, and they grow so fast you can almost watch it happen.", next = "study" } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Spire is full of dragonkin and orcs and things I don't have names for yet. I'd give anything to study them up close, if I could do it without being eaten." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost Gnomeregan to their own inventions, and I respect that kind of ambition. I'd never be so careless, of course." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's goblins think I'm mad for studying dragons instead of selling things. They're probably right, but I'm having more fun." } },
    _none = { { id = "tp_none", text = "Is it a dragon? If it isn't, pal, then I'm afraid I haven't studied it, and nobody's paid me to." } },
  },
}

P:NPC {
  key = "yuka", id = TODO_NPC("Yuka Screwspigot"), name = "Yuka Screwspigot",
  bible = "bibles/burningsteppes.md", role = "vendor", tier = "quest",
  communities = { "flame_crest" }, temper = { "shrewd" }, values = { "greedy", "practical" },
  notices = { "craft", "purse" },

  impression = {
    first = "Yuka Screwspigot sells engineering supplies with a cheerful grin and talks about her family as a business arrangement. I would not want to owe her money, or be her brother.",
    third = "{name} met Yuka Screwspigot, who sells engineering supplies at Flame Crest and keeps the Screwspigot family accounts.",
  },

  greetings = {
    { id = "g_default", text = "Supplies in hot demand at rock-bottom prices, pal! Well, rock-bottom for a volcano, and the volcano's not charging rent." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Course you are, sweetheart, everybody runs out of blasting powder up here, and I'm the only one who sells it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, pal, and blasting powder's gone up twice since! For you, though, I'll only charge the first increase, because loyalty's good for repeat business." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is somebody up here got taken for a ride, and your name came up. I don't judge, pal, but I do count my coins twice and my fingers once." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll want tubes, flux and powder, and you'll want 'em now, before your next explosion, so step right up and bring the purse." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "My, what a lovely full purse you've got there, sweetheart. It'd look even lovelier half empty, and my till half full, and wouldn't that be nice for both of us?" },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only when they want somethin', which is always, so I sell to them too, pal. Don't look at me like that, because a merchant who only sells to her friends doesn't stay a merchant for long, and the Dark Irons pay in good iron." } },
      choices = {
        { text = "Selling to the Dark Irons arms the enemy. That's wrong, Yuka.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Good business is good business. I'd do the same.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Yuka.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because it comes up the road through Searing Gorge, past more Dark Irons than you'd believe, and every cart I lose goes on the price of the rest. You'd be amazed how many carts the worgs have eaten this season, pal, and they don't even like the taste." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And don't let {pet} chew on the blasting powder, please, sweetheart. I know it smells interesting, but the last beast that tried it learned to fly, very briefly, and its owner still owes me for the crate." },
      },
      choices = {
        { text = "A fair price for a hard road. I'll pay it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll loot my shot off the Dark Iron dead, thanks.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Yuka.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A paladin would ask a lot of questions about it first, I'd guess, and I'd answer 'em straight, because my books are clean. Ribbly owes the family, the family wants him home, and how he comes home is up to Ribbly, pal." } },
      choices = {
        { text = "Justice isn't a family's to buy. I won't hunt him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "He broke faith with his kin. That's his own doing.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Family counts for everything, which is exactly why Ribbly has to pay, because he cheated his own kin and ran off to hide with the Dark Irons. A goblin who cheats strangers is a businessman, pal, but a goblin who cheats his family is a debt, and debts get collected." } },
      choices = {
        { text = "Forgive him. Mercy costs less than a bounty.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A debt's a debt. Fair is fair, Yuka.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He's paying it now, a little every month, through his cousin in Booty Bay, with interest compounded. The Screwspigots never forget a debt, friend, and that's why we're still in business while everybody else in Flame Crest is on their third shop." } },
      choices = {
        { text = "Debts get paid. Ribbly should've known that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He blew up a crate. Call it a lesson and move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Yuka.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Could it? Maybe, but then I'd owe a demon a favour, and the Screwspigots don't owe anybody anything, least of all somethin' that lives in a fire and charges in souls. Find him yourself if you like, pal, and leave the imp out of the family business." } },
      choices = {
        { text = "Then I'll find him myself, no demons involved.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Use every tool you've got, Yuka. Demons included.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because they were rusted, mostly, and because the Steppes eat metal faster than anywhere else I've traded, which is murder on the margins. The druid said the ash would make good soil one day, if anybody waited long enough, and I said I'd be long dead and rich by then, so it wasn't my problem." } },
      choices = {
        { text = "It is everyone's problem, Yuka. The land outlasts all of us.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Make your fortune while there's ash to stand on.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only near the stock, friend, because one spark in the wrong place and Flame Crest gets a new crater and I get a new shop. Otherwise I'd sell to a shaman as happily as anybody, since your coin spends like everybody's, and my dear brother Ribbly never paid me in anything but excuses." } },
      choices = {
        { text = "I'll keep my lightning to myself in here, Yuka.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If your stock can't take a spark, that's your trouble.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Mind your lightning near the blasting powder, pal, because I've a whole crate of it under the counter and my insurance is very particular about weather." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Lovely, sweetheart, though I'm told imps are terrible around engineering supplies, so do keep yours outside where it can't ruin my stock or my eyebrows." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Don't conjure anything in my shop, please, because the last mage who did set off a crate of sappers, and I'm still billing him for the ceiling." },
        { id = "h_default", key = true,
          text = "Yuka Screwspigot, engineering supplies, best prices this side of the mountain, mostly because I'm the only supplier this side of the mountain. What can I sell you, pal?" },
        { id = "h_sought", tags = { "news" }, when = { questActive = TODO_QUEST("Yuka Screwspigot") },
          text = "Yorba sent you? Good old Yorba, she always did know who'd be useful and what they'd cost. Yes, I'm looking for our brother, bless his worthless little heart and his overdue accounts." },
        { id = "h_ribbly", when = { questActive = TODO_QUEST("Ribbly Screwspigot") },
          text = "Ribbly's hiding somewhere deep in Blackrock Depths with the Dark Irons, pal. Bring him back to me, or if he won't come along quietly, his head will do nicely, and it's lighter to carry." },
        { id = "h_ribbly_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Ribbly Screwspigot"), days = 7 } },
          text = "The Baron's paid, the family's happy, and little Ribbly's never looked so peaceful, pal. You've done the Screwspigots a great service, and we remember our creditors and our friends." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! If you're here to pray for Ribbly, don't bother, sweetheart, because the Screwspigot family has already decided what he's owed, and it's not a prayer, it's an invoice." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Lovely armour, pal, very shiny, and if it ever needs bolts or a new hinge, I'm the only shop for leagues that sells 'em." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Your armour's been chewed on by Dark Irons, I can tell from here, pal, and I've got rivets, plates and a very reasonable price list for exactly that." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Ammunition's two shelves down, sweetheart, and I'll warn you now, it's dearer up here, because every bullet in the Steppes had to climb a mountain to reach me and I pay it by the step." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I sell gears and bolts, friend, so I doubt we'll do business, but you're welcome to stand here and frown at my wares like the last one did, and frowning's still free." },
      },
      again = {
        { id = "h_again", text = "Anything else, pal? Browsing's free, but only for so long." },
        { id = "h_again2", text = "What else can I do for you, sweetheart? I'm very reasonable, for a price." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why sell supplies in a volcano?", next = "shop" },
        { text = "Do you have family in the business, Yuka?", next = "ribbly" },
        { text = "Your sister Yorba says hello.", next = "yorba", when = { questDone = TODO_QUEST("Yuka Screwspigot") } },
        { text = "An engineer could use some of this stock.", next = "engineer", when = { profession = "Engineering" } },
        { text = "I could find Ribbly for you. Quietly.", next = "k_rogue", when = { class = "ROGUE", heardLine = "yuka.r_default" } },
        { text = "I'd guess that mage never paid his bill.", next = "xmage", when = { class = "MAGE" } },
        { text = "Could my imp find Ribbly for you?", next = "xlock", when = { class = "WARLOCK", heardLine = "yuka.r_default" } },
        { text = "Doesn't family count for anything with you, Yuka?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would a paladin collect Ribbly's bounty, Yuka?", next = "xapala", when = { class = "PALADIN", heardLine = "yuka.r_default" } },
        { text = "The Dark Irons must give you trouble, Yuka.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why is your shot so expensive, Yuka?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why did the last druid frown at your wares, Yuka?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does a shaman make you nervous, Yuka?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Goodbye, Yuka.", next = "END" },
      },
    },

    shop = {
      lines = { { id = "s_default", text = "Because everybody who comes through here is about to walk into Blackrock Mountain, pal, and everybody who walks into Blackrock Mountain runs out of something. Location, location, lava, that's the whole secret." } },
      choices = {
        { text = "Your prices are steep.", next = "shop_prices" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_prices = {
      lines = { { id = "sp_default", text = "Steep? Have you seen how I get my stock up here, pal? Every crate comes past the Blackrock, the ogres and the dragons, and every last one wants a cut, so you're paying for a very dangerous delivery route." } },
      choices = {
        { text = "Suits me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Still steep.", next = "BACK", fx = { affinity = -1, trait = { greedy = 1 } } },
      },
    },

    ribbly = {
      lines = { { id = "r_default", text = "My little brother, and a drain on the family books since the day he could walk. He took our money and wasted it on one scheme after another, and his last scheme must have been the worst of the lot, because it worked on a baron." } },
      choices = {
        { text = "What did he do?", next = "ribbly_bounty" },
        { text = "That's harsh, about your own brother.", next = "ribbly_family" },
      },
    },
    ribbly_bounty = {
      lines = { { id = "rb_default", fx = { learn = { "blackrock_depths" } },
        text = "Whatever it was, Baron Revilgaz of Booty Bay put a price on his head, and for the first time in his life Ribbly's finally worth somethin'. Now he's hiding with the Dark Irons, of all people, in Blackrock Depths, which is a terrible place to hide a valuable asset." } },
      choices = {
        { text = "And you'll collect the bounty?", next = "ribbly_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribbly_family = {
      big = true,
      lines = { { id = "rf_default", text = "Harsh? Family's a business, pal, and Ribbly's been running at a loss for years. Yorba and I are simply closing the account, and I'll even shed a tear about it, once the gold's counted." } },
      choices = {
        { text = "That's cold, Yuka.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Business is business.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    yorba = {
      lines = { { id = "y_default", text = "Hello right back, and tell her I want my share of the bounty in gold, not in IOUs, because I know her, pal. Steamwheedle Port's treating her well, I hope?" } },
      choices = { { text = "She seemed well.", next = "BACK", fx = { affinity = 1 } } },
    },
    engineer = {
      lines = { { id = "e_default", text = "Flux, tubes, powder, the odd schematic that fell off the back of a caravan, nothing too exotic, sweetheart. Have a look, and don't ask where the schematic came from, because that's extra." } },
      choices = {
        { text = "Show me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Quietly's how you'd have to do it, pal, because he's down in the Depths with the Dark Irons and a price on his head big enough to buy this shop twice. Family's family, but a bounty's a bounty, and I haven't decided which I like better." },
      },
      choices = {
        { text = "Family first, Yuka.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Take the bounty. He'd do the same.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Tell me about Ribbly.", next = "ribbly" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Screwspigot, which means I sell things and my family owes people money. One of those is improving.", next = "ribbly" } },
    advice = { { id = "tp_ad", text = "Buy your powder before you need it, pal, because the moment you need it, I double the price." } },
    blackrock_depths = { { id = "tp_depths", text = "Where my brother's hiding, sweetheart, and where most of my customers go to spend what they buy from me." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where my family's business is, and where my family's debts are. I'm working on the second." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got good engineers, but they're all so serious. I like a little fun with my explosions." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost their city to radiation, and I'll never understand how anybody could be so careless. I'm very careful with my gadgets, mostly." } },
    _none = { { id = "tp_none", text = "I don't sell that, so I don't know about it, pal. Want some flux?" } },
  },
}

P:NPC {
  key = "kibler", id = TODO_NPC("Kibler"), name = "Kibler",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "flame_crest" }, temper = { "cheerful", "shrewd" }, values = { "greedy", "kind" },
  notices = { "pet", "purse" },

  impression = {
    first = "Kibler talks like a salesman and handles his animals like a man who loves them. His parrot, Opus, keeps interrupting him, and I'm not sure which of them runs the shop.",
    third = "{name} met Kibler, the goblin behind Kibler's Exotic Pets in the caves at Flame Crest.",
  },

  greetings = {
    { id = "g_op_quel", when = { gossip = { topic = "high_elves", stance = "distrust" } }, text = "Mathredis says you called his hunger a sickness, right to his face! He's been stalking around the camp ever since, pal, and I've had to charge double for my nerves." },
    { id = "g_default", text = "Welcome, welcome to Kibler's Exotic Pets, my friend! How can you help me today, and how much can you help me?" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite supplier's back! Opus, say hello, and say it nicely, because this one pays." },
    { id = "g_away", when = { away = 14 }, text = "My favourite supplier, back after {away} away! Business has been terrible without you, buddy, so let's fix that before Opus eats the profits." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked somebody round to your side of a deal, and I like that in a supplier, buddy. Just don't use it on me, because Opus bites and I don't refund." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Oh, look at that beauty at your heel! Good coat, clear eyes, nice manners, my friend, and somebody's been taking proper care of that one, which is worth more than gold, nearly." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now there's a customer who could afford one of my finest! Ever thought about a pet worg, buddy? Very loyal, very fierce, very, very expensive." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With the right handling it would fight beside you and die for you, which is what the Blackrock orcs know and Stormwind has forgotten. I once watched a Blackrock rider and his worg fight back to back, my friend, and Opus kept quiet for a whole day afterwards, which is worth a fortune all by itself." } },
      choices = {
        { text = "A fighting beast should be raised with care, not cruelty.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Worgs are weapons. Train them hard and point them at the enemy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kibler.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stolen's a strong word, my friend, when the alternative is the pups growin' up to carry orcs into Lakeshire. I'd call it rescue, and a profitable rescue at that, which is the best kind of charity there is." } },
      choices = {
        { text = "Then it's a rescue. Better a pet than a war beast.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A rescue for profit is still a theft.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "If you get 'em young enough, before the orcs teach 'em to hate, then yes, they're as sweet as hounds. That's the trick with most creatures, buddy, and maybe with folk too, though I sell pets, not sermons, and sermons don't sell anyway." } },
      choices = {
        { text = "Every creature can be redeemed. The Light sees to that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things are bred for war. Kindness won't change that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No? How long does it last, then? Never mind, don't tell me, buddy, because I've already promised two and taken the deposits, and what my clients wake up to is not my department. Opus thinks it's funny, but then Opus thinks everything is funny." } },
      choices = {
        { text = "Tell your clients the truth, Kibler. It's only fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Buyer beware. That's their problem, not yours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They're Blackrock worgs, raised to follow a scent across the whole of the Steppes, and the first scent they learn in my shop is mine, which is my theft insurance. Somebody pinched one last spring, my friend, and it walked back in the next morning with his boot in its mouth." } },
      choices = {
        { text = "Then I'll pay for one, like a proper customer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Clever pup. I'd still have tried, Kibler.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kibler.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I reckon they smell the wolves on you, friend, since your people ride 'em, and a pup knows its betters by the smell. These are Blackrock worgs, though, bred mean by Rend's handlers, so if you can gentle one with a look, I'll want to know how you do it and what you'd charge to teach it." } },
      choices = {
        { text = "Pups taken from their pack shouldn't be sold, Kibler.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A pup's a pup. Sell them to whoever pays.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_lbrs = {
      big = true,
      lines = { { id = "xcl_lbrs_default", text = "Then you've seen where my best stock comes from, buddy, and where most of my suppliers stop coming back from! The Blackrock raise those worgs for war and the poor things never hear a kind word, so every pup I gentle is one less beast that ends up eatin' a scout." } },
      choices = {
        { text = "You're giving those pups a kinder life, Kibler. Keep at it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A worg's a beast of war. Train them mean and sell them dear.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Where do the pups end up after you sell them?", next = "xcl_lbrs2" },
      },
    },
    xcl_lbrs2 = {
      lines = { { id = "xcl_lbrs2_default", text = "All over, my friend! Stormwind nobles, Orgrimmar captains, a baron in Gadgetzan who dresses his in a tiny hat. I don't ask what side anybody's on, because a worg doesn't either, and gold doesn't either, and that's good business." } },
      choices = {
        { text = "I'd like to see the one in the tiny hat.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The worg pups go quiet when your sort walks in, buddy, which is either respect or fear, and Opus says it's fear, but Opus says a lot of things, most of 'em bad for business." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You're not here to pinch a worg pup out of the cage, are you, buddy? They bite, they howl, and they always find their way back to me, which makes 'em the worst investment a thief ever made." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can you turn things into sheep? I've had clients ask for a sheep that used to be a worg, my friend, and I haven't the faintest idea where to start, or what to charge." },
        { id = "h_cl_lbrs", tags = { "news" }, when = { cleared = "Lower Blackrock Spire" },
          text = "Word is you went all the way through the lower Spire and came out with the overlord dead behind you! Did you see any worg pups in there, buddy? Askin' for business reasons, purely." },
        { id = "h_default", key = true,
          text = "Kibler, at your service, animal lover by nature and salesman by trade, and very good at both. I find exotic beasts for the rich and famous, my friend, and teach 'em to behave like proper pets, more or less." },
        { id = "h_pups", when = { questActive = TODO_QUEST("Kibler's Exotic Pets") },
          text = "Worg pups, from the Spire, in that cage, buddy, and get 'em young or they're untrainable and unsellable! Bring me one and I'll gentle a worg just for you." },
        { id = "h_eggs", when = { questActive = TODO_QUEST("En-Ay-Es-Tee-Why") },
          text = "Spire spider eggs, fifteen of 'em, from wherever the spiders are nastiest. Believe it or not, my friend, there are folk who'll pay a fortune for the vilest beast you can imagine, as long as it's housebroken." },
        { id = "h_pup_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Kibler's Exotic Pets"), days = 7 } },
          text = "How's the little fella settling in? Feed him twice a day and don't let him near your boots, buddy, because worgs love boots and I don't sell replacements." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You'll bless my little worgs, won't you? They've had a hard start in life up in the Spire, my friend, and a blessing couldn't hurt their prospects with the buyers." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Mind the worg cage, if you please, buddy, because the pups can smell holy folk, and they get excited about it in a way I haven't worked out how to sell yet." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! I don't suppose you've come for a pet, but I always say there's a beast for every soldier and a price for every beast, and a well-raised worg pup is the finest shield-mate in the Steppes." },
      },
      again = {
        { id = "h_again", text = "What else, buddy? Opus is listening, so mind your language, because he'll repeat it to customers and I'll lose the sale." },
        { id = "h_again2", text = "Go on, ask me anything, my friend. Except about G.E.T.A., because we don't talk about them." },
      },
      choices = {
        { text = "Exotic pets? In a volcano?", next = "pets" },
        { text = "Tell me about the parrot.", next = "opus" },
        { text = "Who fetches your stock from the Spire?", next = "bijou" },
        { text = "I'd guess you'd pay well for my companion.", next = "hunter", when = { class = "HUNTER" } },
        { text = "A druid could teach you a thing about beasts.", next = "druid", when = { class = "DRUID" } },
        { text = "Would your rich clients buy an imp?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "A polymorphed worg won't stay a sheep, Kibler.", next = "xmage", when = { class = "MAGE" } },
        { text = "How do your worg pups always find their way back?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I doubt a Blackrock worg pup can ever be gentled.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it right to sell pups stolen from the Blackrock orcs?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a worg pup really fight beside a soldier?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your worg pups go quiet whenever I come near, Kibler.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I've been through the lower Spire, Kibler.", next = "xcl_lbrs", when = { cleared = "Lower Blackrock Spire" } },
        { text = "Goodbye, Kibler.", next = "END" },
      },
    },

    pets = {
      lines = { { id = "p_default", fx = { learn = { "blackrock_spire" } },
        text = "Where else, buddy? Blackrock Spire's full of worgs, spiders and things nobody's even named yet, and every one of 'em is a pet waiting to happen and a price tag waiting to be written. Look at the cages, ain't it obvious?" } },
      choices = {
        { text = "I can't imagine who buys a pet worg.", next = "pets_clients" },
        { text = "That's cruel to the beasts.", next = "pets_cruel" },
      },
    },
    pets_clients = {
      lines = { { id = "pc_default", text = "Nobles, merchant princes, the odd baron with a big house and a small reason to feel important, my friend. A worg at the gate says more than a dozen guards, and it doesn't ask for wages, which is my whole sales pitch." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    pets_cruel = {
      lines = { { id = "pcr_default", text = "Cruel? I feed 'em better than the orcs do, buddy, and I never send 'em out to die for a warchief, so I'd say I'm the kindest thing that ever happened to a worg pup, and the most expensive." } },
      choices = {
        { text = "I suppose that's true.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not convinced.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    opus = {
      lines = { { id = "o_default", text = "That's Opus, the most expensive mistake I ever made, because nobody will buy him, not even at a loss. He smokes, he swears, and he tells every customer I'm being investigated by G.E.T.A., which I am not, probably." } },
      choices = {
        { text = "What's G.E.T.A.?", next = "opus_geta" },
        { text = "He seems lovely.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    opus_geta = {
      lines = { { id = "og_default", text = "Nobody knows, my friend, and that's what worries me. Opus heard it somewhere and won't stop saying it, and I'd swear on my best cage he gets louder whenever a customer walks in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    bijou = {
      lines = { { id = "b_default", text = "A goblin I hired to fetch spider eggs from the Spire, and a very capable one, for an operative, at a very capable rate. I haven't heard from her in weeks, buddy, and Opus won't stop saying she's lost." } },
      choices = {
        { text = "You sound worried about her.", next = "bijou_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bijou_worry = {
      lines = {
        { id = "bw_default", text = "Worried about her and about my eggs, in that order, mostly, and the eggs are paid for. If you're going into the Spire anyway, my friend, keep an eye out for a goblin with a lot of notes and not much patience." },
        { id = "bw_found", when = { questDone = TODO_QUEST("Bijou's Belongings") },
          text = "You found her, alive and scribbling? Ha! I knew it, buddy, and she still owes me fifteen eggs, so tell her that next time you see her, and tell her I'm counting." },
      },
      choices = { { text = "I'll look for her.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "h2_default", text = "Not a copper, friend, because you'd never sell, and I respect that more than I'd ever respect a sale. Opus would bite me for saying so, but a beast that's chosen you beats anything in my cages." } },
      choices = { { text = "That's surprisingly kind.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "I'm sure you could, buddy, but could you teach a spider to sit? No? Then we're both still learning, and I'll stick to cages and you stick to buying from 'em." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "An imp? Pal, I sold a worg pup to a baron who cried when it chewed his boots, so I know my market, and my market doesn't want something that sets the drapes on fire and laughs about it. Keep your little friend on a short leash near my cages, would you?" },
      },
      choices = {
        { text = "My imp behaves better than your worgs.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'll keep it close. Your animals don't deserve that.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A good dealer knows his territory, my friend, and I know mine down to the last spider. Ask about any of these, no charge for the talk." },
    },
    background = { { id = "tp_bg", text = "Booty Bay's finest dealer in beasts, now operating from a cave for reasons that have nothing to do with G.E.T.A.", next = "pets" } },
    advice = { { id = "tp_ad", text = "Get 'em young, feed 'em well, and never let 'em see you scared, buddy. Works on worgs, and it works on customers too." } },
    blackrock_spire = { { id = "tp_spire", text = "The best hunting ground in the world, my friend, if you don't mind most of the stock trying to eat you before you can price it." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I made my name, and where G.E.T.A. made my life difficult. I'm doing better business out here, in a cave." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons are the finest pets a person could ask for, if they didn't burn everything down. I'm working on the second part." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got good animal traders, but none as good as me. Opus agrees." } },
    _none = { { id = "tp_none", text = "Can I sell it? If I can't, buddy, then I wouldn't know the first thing about it." } },
  },
}

P:NPC {
  key = "mathredis", id = TODO_NPC("Mathredis Firestar"), name = "Mathredis Firestar",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "quest",
  communities = { "flame_crest" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  notices = { "class", "race" },

  impression = {
    first = "Mathredis Firestar told me I was standing in his light and never quite let me out of it. There's a hunger in him for magic, and under the contempt, something that looks like grief.",
    third = "{name} met Mathredis Firestar, a cold elven mage of Quel'Thalas who seeks the lost librams of his masters.",
  },

  greetings = {
    { id = "g_default", text = "You are standing in my light, {race}; speak, or move aside and let me work." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you found a libram, or only more of my time to waste?" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. I can taste the arcane on you from here, thin and watery as it is; human teachers, no doubt." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "A night elf, who would rather we had all forgotten magic. Your people cast mine out once, and look where it brought us both." },
  },

  start = "hello",
  nodes = {
    op_quel = {
      lines = {
        { id = "opq_default", text = "Pity, mostly, and distaste, from people who never drank from the Sunwell and never lost it. You have an opinion of us written on your face, {race}, so say it aloud." },
      },
      choices = {
        { text = "Your people deserved better than what Arthas gave them.", next = "op_quel_pity", fx = { align = { light = 1 }, opinion = { high_elves = "pity" } } },
        { text = "Your hunger is a sickness. I'll keep my distance.", next = "op_quel_distrust", fx = { align = { light = -1 }, opinion = { high_elves = "distrust" } } },
        { text = "Magic is no sin. Starving for it isn't your fault.", next = "op_quel_pity", fx = { affinity = 1, opinion = { high_elves = "pity", arcane_magic = "useful" } }, when = { class = "MAGE" } },
        { text = "I've no opinion worth your time.", next = "BACK" },
      },
    },
    op_quel_pity = {
      lines = {
        { id = "opqp_default", text = "Deserved is such a soft word from someone with a full belly. Keep your pity, {race}, and bring me an arcanum's spill instead; it would do more good." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_quel_distrust = {
      lines = {
        { id = "opqd_default", text = "Then keep it, and keep your purse close, and see how long your own virtues last when the thing you live on is torn out of the world." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very little, I'm afraid, though my people's rangers held the forests of Quel'Thalas for thousands of years with nothing more than bow and blade. They held right up until the Scourge came, which I suppose makes my point for me." } },
      choices = {
        { text = "Your rangers fought with honor to the end. That counts for something.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll let others face the spells, and strike when they're spent.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I will ask something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I knew a great many of them, as one knows the soldiers one passes in the street, and I thought very little of them at the time. They died on the borders while scholars like me fled with our books, and the librams are no comfort at all when I remember that." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} watches me as though I were prey, {class}. It may be right, for I'm not what I was, and beasts always know it before people do." },
      },
      choices = {
        { text = "Honour their sacrifice, Mathredis. Make your work worth it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Guilt's no use to the dead. Take your librams and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I will ask something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "To sell it, of course, to someone like me, for more than it is worth to anyone but me. Your kind have picked over the ruins of Quel'Thalas since the Scourge came through, so I know exactly what you are, and I pay accordingly." } },
      choices = {
        { text = "I'd sooner see them returned to your people.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then we understand each other. Name your price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That reaching for power too eagerly would cost us something we couldn't replace, and they were right, though they never said what. I seek the librams of my masters because they're all that's left, and I'm aware a druid would call that the same mistake twice." } },
      choices = {
        { text = "It is the same mistake, Mathredis. Let the old power go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your people deserve their knowledge back. I'd seek it too.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Beside the Sunwell everything is small, and I say that without pride, because I no longer have the Sunwell either. Your elements answer when you ask politely, and the arcane answered my people whenever they commanded it, and I sometimes wonder which of us was wiser." } },
      choices = {
        { text = "Asking is wiser than commanding, Mathredis.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Command is power. Your people had the right of it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, standing in my light. You commune with spirits of stone and wind, I'm told, which seems a very small sort of magic beside what my people once commanded." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, standing in my light. At least you have the decency to do it quietly; most who come here clank like a kettle." },
        { id = "h_default", key = true,
          text = "Mathredis Firestar, of Quel'Thalas, while there was a Quel'Thalas. I seek the lost librams of the elven masters, and if you bring me one, I will make you something of power, at a price you will find high." },
        { id = "h_libram", when = { questActive = TODO_QUEST("Libram of Rumination") },
          text = "You have the libram and the components, I see. Lay them down and let me drink what's written in them, and then you'll have your trinket." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, come to stand in my light. You think that sword makes you safe in these lands, but the Seven would have unmade you before you finished drawing it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The rangers of Quel'Thalas walked as you walk, and they went to war with a bow and a hawk, and very few of them came home." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Your people warned mine, long ago, that magic has a cost, and mine did not listen, and now I stand in the ash of a dwarf's kingdom asking strangers for books." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be quick; I don't care for idle company." },
        { id = "h_again2", text = "Ask, then. I'll answer what I choose to." },
      },
      choices = {
        { text = "What are these librams?", next = "librams" },
        { text = "You must gain something from all this.", next = "hunger" },
        { text = "What happened to Quel'Thalas?", next = "quelthalas" },
        { text = "Teach me what your master knew.", next = "mage", when = { class = "MAGE" } },
        { text = "The Light could ease whatever burden you carry.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Your people brought this on themselves.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "My people are Highborne too, from Eldre'Thalas.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "Power always has a price. Mine comes from the Nether.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "What would a rogue want with an elven libram?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A sword seems little use against magic like that.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Did you know any of the rangers of Quel'Thalas?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What did the druids warn the elves about, Mathredis?", next = "xdruid", when = { class = "DRUID" } },
        { text = "You make the magic of the elements sound small, Mathredis.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'll leave you.", next = "END" },
      },
    },

    librams = {
      lines = { { id = "l_default", text = "Ten books, written by my master, Telmius Dreamseeker, and scattered across the world when the Scourge was loosed on Quel'Thalas. Each holds a pattern for a lesser arcanum, and I can work them, given the libram and the materials." } },
      choices = {
        { text = "Where is your master now?", next = "librams_telmius" },
        { text = "Only lesser ones?", next = "librams_lesser" },
      },
    },
    librams_telmius = {
      big = true,
      lines = { { id = "lt_default", text = "Dead. He went into the ruins the night elves call Dire Maul, seeking what the old Highborne there still knew, and he was murdered there for asking. I will not speak of it twice." } },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then I won't ask again.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    librams_lesser = {
      lines = { { id = "ll_default", text = "His three greatest works are beyond me, and that knowledge is a knife I turn over every day. I make what I can, and I make you pay for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hunger = {
      big = true,
      lines = { { id = "h2_default", text = "When an arcanum is made, power spills from it, and I take that spill for myself, because I need it. We of Quel'Thalas were raised in magic, and now that the fount is gone, the hunger never leaves." } },
      choices = {
        { text = "That sounds like an addiction.", next = "hunger_word" },
        { text = "Then I'll bring you librams.", next = "BACK", fx = { affinity = 2, trait = { greedy = 1 } } },
      },
    },
    hunger_word = {
      lines = { { id = "hw_default", text = "Call it what you like, {race}, from your full belly. You have never been hungry the way I am hungry, and I hope for your sake you never are." } },
      choices = {
        { text = "I meant no offence.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quelthalas = {
      lines = { { id = "q_default", text = "The Scourge came through it like a fire through dry grass, and what it didn't kill, it scattered. I will not describe it to someone who'll only nod and say how sad." } },
      choices = {
        { text = "What do others make of your people now?", next = "op_quel" },
        { text = "Then I won't say it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "Your teachers gave you fire and frost and called it wisdom, while my master spent a long elven life on patterns you could not begin to follow. Bring me a libram, mage, and watch me work, and perhaps you'll learn the difference." } },
      choices = {
        { text = "I'd like that.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Your Light warms, and I am not cold, I am starving. Keep your prayers for the dying; I am only diminished, and that is worse." } },
      choices = {
        { text = "The offer stands.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then I'll save my prayers for someone who wants them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "As you wish.", next = "BACK" },
      },
    },
    kaldorei = {
      lines = { { id = "k_default", text = "Perhaps we did. And perhaps you'll find, on a cold night far from your moon, that every people pays for its gifts sooner or later." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    k_sky = {
      big = true,
      lines = {
        { id = "xsk_default", text = "Eldre'Thalas. My master died there, in the place they call Dire Maul now, and you tell me your ancestors walked its halls when they were whole. Pardon my staring; I have met very few elves since Quel'Thalas burned who were not mourning something." },
      },
      choices = {
        { text = "We mourn too. Our winds fell silent.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Your hunger is what drove my people away.", next = "BACK", fx = { align = { light = 1 }, affinity = -2 } },
        { text = "Magic is our birthright. Take what you need.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "Then you know nothing of it, for mine is a thirst and yours is a bargain. I drink what the librams give and pay for it in my own hands shaking, while you pay in something you will not see the bill for until the end." },
      },
      choices = {
        { text = "At least I chose my price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Perhaps neither of us should be drinking.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A mage of Quel'Thalas and the last student of Telmius Dreamseeker. The rest is not yours to know.", next = "librams" } },
    advice = { { id = "tp_ad", text = "Never sell power cheaply, and never buy it from someone who does." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was where I studied, before the Scourge came and everything burned. I've no wish to see it rebuilt, because it won't be the same." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are fools who thought they could master magic with rules and councils. My master knew better, and he paid for it." } },
    sylvanas = { { id = "tp_sylvanas", text = "Sylvanas Windrunner was Ranger-General of Silvermoon, and she died defending our home. What leads the dead in her name now is a stranger to me." } },
    scourge = { { id = "tp_scourge", text = "The Scourge burned Quel'Thalas, and I've no home to return to. Don't speak to me of it again." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons hold the secrets of the Steppes, and I'll have them, one way or another." } },
    _none = { { id = "tp_none", text = "That is beneath my notice, and it should be beneath yours." } },
  },
}

P:NPC {
  key = "vahgruk", id = TODO_NPC("Vahgruk"), name = "Vahgruk",
  bible = "bibles/burningsteppes.md", role = "flightmaster", tier = "service",
  communities = { "flame_crest" }, temper = { "steady" }, values = { "loyal", "dutiful" },
  notices = { "race" },

  impression = {
    first = "Vahgruk keeps the wind riders at Flame Crest and doesn't waste words on anything else. He seems content to be the way home for whoever comes this far north.",
    third = "{name} met Vahgruk, the orc who keeps the wind riders at Flame Crest.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar, {class}. Do you need a rider, or are you lost?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The riders are rested, and so am I, almost, though I still cough up black every morning from the ash." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Good to see a brother this far from Durotar, among all these goblins. Keep your axe close; the Blackrock down there call themselves orcs too." },
  },

  start = "hello",
  nodes = {
    op_blackrock = {
      lines = {
        { id = "opb_default", text = "They were, and Blackhand led us all once, before his son went to the mountain and took the dragon's coin. Some say the Blackrock can be brought home when Rend falls, and some say they should all be put down. What do you say?" },
      },
      choices = {
        { text = "Some of them could come home, if Rend fell.", next = "op_br_home", fx = { affinity = 1, align = { light = 1 }, opinion = { blackrock_clan = "redeemable" } } },
        { text = "They chose Rend. Put every one of them down.", next = "op_br_down", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { blackrock_clan = "hate" } } },
        { text = "My clan or theirs, we all drank the blood once.", next = "op_br_home", fx = { affinity = 1, opinion = { blackrock_clan = "pity" } }, when = { race = "Orc" } },
        { text = "I'll decide when I'm standing in the Spire.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    op_br_home = {
      lines = {
        { id = "opbh_default", text = "The Warchief thinks so, or he'd not have sent an army to Kargath instead of an executioner. I hope you're both right, though I've seen what comes down off that mountain." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_br_down = {
      lines = {
        { id = "opbd_default", text = "Hard words, and I've said them myself after a bad flight. My riders will carry you to Kargath either way, and the Blackrock will find out what you think of them soon enough." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The Horde, if you'll fight for it, and the Undercity, if you won't. I've flown the dead and the living both, and you're the first who's asked me that, so maybe you're still deciding." } },
      choices = {
        { text = "The Horde is my home. I'll fight for it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I go where the Light leads me, not the Horde.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They fight well, and that's what makes it worse, because they fight well for a dragon. The old Horde made warriors like that, all fury and no sense, and Thrall spent years teaching us to be better." } },
      choices = {
        { text = "Thrall is right. Fury needs a leash.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fury wins battles. The old Horde understood that much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No, but they respect each other, which out here is the same thing. A wind rider sees a wolf the way a wolf sees a rabbit, so I keep them apart, and nobody gets eaten." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} is watching my riders. Good, because they're watching it back, and out here the first to blink is usually lunch." },
      },
      choices = {
        { text = "Then I'll keep them apart, as you do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them settle it themselves. That's how the wild works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because from up there you see how far the Blackrock reach, right to the edge of the mountain, and how few of us hold Flame Crest. A mage who has seen that spends fire more carefully." } },
      choices = {
        { text = "Careful fire wins wars. I'll remember that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll burn every Blackrock between here and the Spire.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They do, and they've no Thrall to tell them no, which is the difference that matters. Keep your demons on a short chain while you're at Flame Crest, so nobody mistakes you for one of Rend's." } },
      choices = {
        { text = "I'll never be like Rend's warlocks. Mark that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Rend's warlocks have power worth learning from.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vahgruk.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Ash in their wings and heat rising off the lava, and the black whelps that come out of the mountain to snap at them. They'll fly for anyone I tell them to, but they settle for druids, and I've stopped asking why." } },
      choices = {
        { text = "Rest them more often, Vahgruk. They carry too much here.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They're riders' beasts. They fly where the Horde needs them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They bite anyone who surprises them, because in this land a surprise usually comes with a Blackrock axe behind it. Walk heavy and speak before you reach the perch, and they'll carry you home without a scratch." } },
      choices = {
        { text = "Understood. I'll walk heavy and speak first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go quiet anyway. It keeps me sharp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More every week, since Rend's orcs started holding the Spire like a fortress and every fool with an axe wants a piece of him. I strap them to the saddle and send them to Kargath, and the riders know to fly smooth when the passenger is bleeding." } },
      choices = {
        { text = "Then I'll tend them before they fly, Vahgruk.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fools who charge the Spire earn their wounds.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every flight, because the air above the mountain is hot and wrong, and it bucks a rider like a bad wolf. The old shamans say the fire under Blackrock is bound to something that hates the sky, and after a few years here, I believe them." } },
      choices = {
        { text = "Fly the routes anyway, Vahgruk. The Horde needs them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "On the worst days, ground the riders and wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. The sky over the Steppes is thick with ash and angry fire, and my riders feel it, so if the spirits have anything to say about it, tell them to say it quietly." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Wounded come through Flame Crest on their way home from the mountain, and most of them wish they'd met you sooner." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. My riders don't like anyone they can't hear coming, so walk heavy near the perch, or you'll learn how sharp their beaks are." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The Blackrock up on the mountain keep warlocks too, the old kind, and my riders can't tell the difference by smell." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could open your own way home, but my riders show you the Steppes on the way, and the Steppes should be seen once, burning." },
        { id = "h_default", key = true,
          text = "I am Vahgruk, and I keep the Horde's wind riders at Flame Crest, so that any warrior the Warchief sends this far north has a way home again." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. The riders will take you, and the armour, but they'll want you to sit still, and warriors never sit still." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Keep your beasts away from the riders' feed, because a wind rider will eat anything that fits in its mouth, and some things that don't." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of Thunder Bluff. The wind riders hate this sky, friend, but they've never yet refused to carry one of the Earth Mother's own." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The beasts will take you home, wherever home is for one like you." },
      },
      again = { { id = "h_again", text = "Anything else, or do you want a rider?" } },
      choices = {
        { text = "Where do your riders fly?", next = "routes" },
        { text = "What do you make of the Blackrock?", next = "rend" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Why should I see the Steppes from above?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The Blackrock still keep warlocks, I'd guess.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do you make of Rend's warriors, Vahgruk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do wind riders and hunters' beasts get along?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why do the wind riders hate the Steppes' sky, Vahgruk?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do your wind riders really bite anyone they can't hear, Vahgruk?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Many wounded must fly out of Flame Crest.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The elements here must trouble your wind riders.", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Where is home for one like me, Vahgruk?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    routes = {
      lines = { { id = "r_default", text = "Kargath in the Badlands, Stonard in the swamp, and over the mountain to Thorium Point. None of them goes near the Spire, because the drakes hate wind riders more than they hate anything." } },
      choices = {
        { text = "Kargath?", next = "routes_kargath" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_kargath = {
      lines = { { id = "rk_default", text = "The Warchief's expedition against the Blackrock waits there. If you're sent to fight them, that's where the orders come from." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rend = {
      lines = {
        { id = "re_default", text = "Rend Blackhand sits in that Spire and calls himself Warchief, as if a name were a thing you could steal. Thrall is Warchief, and Rend is a traitor with a big chair." },
        { id = "re_alliance", when = { faction = "Alliance" },
          text = "They're no friends of the Horde, if that's what you're asking. Rend Blackhand would see Thrall dead, and you too, so we have that much in common." },
      },
      choices = {
        { text = "The Blackrock were orcs of the Horde once. What now?", next = "op_blackrock" },
        { text = "Then he'll fall.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } }, when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Warchief where he sends me, and he sent me to a rock full of goblins. Don't ask me how I feel about it." } },
    advice = { { id = "tp_ad", text = "Fly high over the lava; the heat lifts you, and the riders like it, though they come down smelling of singed feathers." } },
    blackrock = { { id = "tp_blackrock", text = "Orcs who never learned what Thrall taught the rest of us. That makes them more dangerous than humans, not less." } },
    thrall = { { id = "tp_thrall", text = "The Warchief sent me to a rock full of goblins, and I go where he sends me. That's all there is to it." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock in the Spire are what the Horde used to be, and the Warchief means to see them gone. I'll fly anyone who wants to help." } },
    firegut = { { id = "tp_firegut", text = "The Firegut ogres on Dreadmaul Rock shoot at my wind riders. I'd like to see them gone, and I'm not picky about how." } },
    _none = { { id = "tp_none", text = "I keep wind riders, nothing more. Ask the goblins, because they know everything, for a price." } },
  },
}
