-- Starfall Village: Wynd Nightchaser, who knows the ruins, and Jaron Stoneshaper of the
-- Explorers' League, who was chased off his dig by wildkin. Voices: bibles/wynd.md, bibles/jaron.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Wynd Nightchaser
---------------------------------------------------------------------------
P:NPC {
  key = "wynd", id = TODO_NPC("Wynd Nightchaser"), name = "Wynd Nightchaser",
  bible = "bibles/wynd.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "calm", "warm" }, values = { "wise", "careful" },
  notices = { "arcane", "travel" },

  impression = {
    first = "He speaks of the Highborne like a family scandal, sadly and quietly.",
    third = "{name} met Wynd Nightchaser of Starfall Village, who knows the old elven ruins of Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, and welcome to Starfall Village. Come in out of the wind, and tell me what brings you." },
    { id = "g_ivy", when = { questActive = TODO_QUEST("To Winterspring!") }, text = "A friend of Ivy Leafrunner's, all the way from Felwood? Then you're doubly welcome." },
    { id = "g_crystal", when = { questActive = TODO_QUEST("The Crystal of Zin-Malor") }, text = "Keep the crystal wrapped, and don't look into it too long. Darnassus is where it belongs." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the snow has covered your tracks twice over. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you first came through the snow to us, and the ruins will notice it too." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word reaches even Starfall, and it says good things of you. I'm glad to hear it." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Someone says you told them a tale that didn't hold up. Up here we rely on each other's word, so mind it." },
  },

  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = "MAGE" },
      text = "You've the arcane about you, and Kel'Theril is full of what's left of people who loved it too much. Be careful near the lake." },
    { id = "n_cold", cat = "travel", when = { mounted = true },
      text = "Let your mount rest by the fire a while. Winterspring's cold gets into the legs before anything else." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The blue dragons keep to Mazthoril and watch us with eyes older than Kel'Theril, and my people have fought both beside and against dragons in our time. What do you make of the dragonflights?" },
      },
      choices = {
        { text = "Dangerous and proud, so best left alone.", next = "op_r1", fx = { align = { order = -1 }, trait = { cautious = 1 }, opinion = { dragons = "dangerous" } } },
        { text = "Wise guardians. The world would fall without them.", next = "op_r2", fx = { affinity = 1, align = { order = 1 }, opinion = { dragons = "admire" } } },
        { text = "The black flight is the danger. The rest can watch.", next = "op_r3", fx = { trait = { stern = 1 }, opinion = { black_dragonflight = "hate" } } },
        { text = "Malygos's flight guards magic. I respect that.", next = "op_r4", fx = { affinity = 1, opinion = { dragons = "respect" } }, when = { class = "MAGE" } },
        { text = "I've never met a dragon.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Most of my people would agree, and the blues seem to prefer it that way. Haleh, who leads the blues in Mazthoril, does not come down from her caves to make friends." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Some of them, perhaps. I have read that the Aspects stood with us once, at the Well, and that not all of them kept standing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "The black flight burned more than one kaldorei village in the old days. The blues have only ever burned what came for their books." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "They guard it from you as much as for you, {class}, so keep your respect at a careful distance." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_dd_spirits", when = { questDone = TODO_QUEST("Troubled Spirits of Kel'Theril") },
          text = "Jaron tells me the spirits of Kel'Theril are quieter since you went among them. He'll call it an archaeologist's triumph, but I'll call it a kindness, and I'll thank you for it." },
        { id = "h_default", key = true, text = "I am Wynd Nightchaser, and I've spent more years at Starfall than I'd care to count, even by kaldorei reckoning. Winterspring is a harsh land, but it holds a great many old elven ruins, and most of them hold Highborne secrets that someone would rather were forgotten." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("The Ruins of Kel'Theril") },
          text = "Jaron Stoneshaper has been down to Kel'Theril more recently than I have, and he'll tell you what he saw. He's a dwarf, so he'll tell you at length." },
        { id = "h_remorse", tags = { "news" }, when = { questActive = TODO_QUEST("Remorseful Highborne") },
          text = "Is that what I think it is? The crystal of Zin-Malor, whole again, after all these years. I never thought I'd see it with my own eyes." },
        { id = "h_crystal_done", when = { questDone = TODO_QUEST("The Crystal of Zin-Malor") },
          text = "Fandral has the crystal now, I hear, and the spirits at the lake are quieter for it. You did a rare thing there, and an old wrong is a little less wrong." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of our own, this far north. Welcome, though I'll warn you that the ruins here are not the kind of history our people like to remember." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "We don't see many of the Horde at Starfall, and I'll not pretend the Sentinels wouldn't frown. But the snow doesn't care who you are, so come in out of it." },
      },
      again = {
        { id = "h_again", text = "What else would you know? There's always more buried in this snow, some of it from before the Sundering." },
        { id = "h_again2", text = "Go on. I've little to do but talk, between the storms." },
      },
      choices = {
        { text = "What do the kaldorei make of the blue dragons?", next = "op_ask" },
        { text = "Which ruin holds the darkest secret?", next = "kel" },
        { text = "Tell me about Starfall Village.", next = "village" },
        { text = "There must be other ruins up here.", next = "ruins" },
        { text = "Why give the crystal to Fandral?", next = "crystal", when = { questDone = TODO_QUEST("Remorseful Highborne") } },
        { text = "Couldn't a mage use the crystal properly?", next = "xmage", when = { class = "MAGE", questDone = TODO_QUEST("Remorseful Highborne") } },
        { text = "The Highborne of Kel'Theril regret what they did. Should we forgive them?", next = "kal_forgive", when = { race = "NightElf", questDone = TODO_QUEST("Remorseful Highborne") } },
        { text = "Our elders don't speak of the Highborne. Why?", next = "kal_silence", when = { race = "NightElf" } },
        { text = "Farewell, Wynd.", next = "END" },
      },
    },
    kel = {
      lines = {
        { id = "k_default", text = "Kel'Theril, by the frozen lake. The Highborne who lived there stole a sacred artifact, believing they could drain its power and become greater than they were. They tried a ritual on it, and it shattered in a great blast that drove the pieces deep under the ice of the lake." },
      },
      choices = {
        { text = "The Highborne themselves must have paid a price.", next = "kel_ghosts", fx = { learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_ghosts = {
      lines = {
        { id = "kg_default", text = "They're still there, bound to the place where they tried it, and they're not friendly to the living. They wander the shore looking for the pieces of the very thing that cursed them, and they've been doing it for a very long time." },
      },
      choices = {
        { text = "Do they deserve it?", next = "kel_deserve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_deserve = {
      big = true,
      lines = {
        { id = "kd_default", text = "That's the question I've never settled. They were greedy and proud, and what they did was a crime, but an age of wandering a frozen shore is a long sentence for anyone." },
      },
      choices = {
        { text = "Their sentence is just. They chose their greed.", next = "BACK", reply = "You speak as the Sentinels speak, and I cannot say you're wrong, for I saw what their greed brought down on us. Still, I hope you never have to wander that long for your own mistakes.", fx = { align = { light = -1 } } },
        { text = "No crime earns forever. They should be freed.", next = "BACK", reply = "Elune is merciful, and I'd like to think she agrees with you. Yet who would free them, and what would they do first with their freedom, I wonder?", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "v_default", text = "A few houses and a fire against the wind, and those of us who'd rather watch over the old places than leave them to the furbolgs and the snow. Jaron the dwarf stays with us now, since the wildkin chased him off his dig." },
      },
      choices = {
        { text = "What chased him off?", next = "wildkin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildkin = {
      lines = {
        { id = "w_default", text = "Wildkin, mad and furious, as the ones in these valleys have been for as long as I've kept watch here. He'll tell you he got too close to something they were guarding, and I believe him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = {
        { id = "r_default", text = "Kel'Theril is the one you'll hear about most, but there are older stones all through these valleys. The Highborne liked the north, once, because the snow kept curious people away from their work." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal = {
      lines = {
        { id = "c_default", text = "Because the temple it came from lies in ruin, and it can never go home. A crystal like that should rest in the hands of people who won't abuse it, and only a handful of the strongest would be able to control it at all." },
      },
      choices = {
        { text = "You trust Darnassus with it?", next = "crystal_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal_trust = {
      big = true,
      lines = {
        { id = "ct_default", text = "I trust the Arch Druid more than I trust anyone who'd be tempted to use it, and that includes me. You could have kept it, you know, and you didn't, and I shall remember that." },
      },
      choices = {
        { text = "Power like that should be locked away.", next = "BACK", reply = "Then we agree, and Elune knows I sleep easier with it in Rabine's keeping. I would not want it within a day's ride of Everlook's auction house.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd have kept it, if I'd known what it was.", next = "BACK", reply = "Then I am glad you didn't know, and I think you'd be gladder still, given time. I have seen what the Highborne left of Eldarath, and they knew exactly what they held.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xm_default", text = "That's exactly what the Highborne said, word for word, I'd imagine. The crystal grants great power only to those worthy of it, and the trouble is that everyone believes they are." },
      },
      choices = {
        { text = "Then the wise mage leaves it alone.", next = "BACK", reply = "Yes, and that is the hardest wisdom of all, to leave a power in its box when you know you could use it well. I have watched good mages fail at it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some mages really are worthy of it.", next = "BACK", reply = "Perhaps, and the Highborne were certain they were among them, every last one. Forgive me if ten thousand years have made me slow to believe anyone again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kal_silence = {
      lines = { { id = "ksi_d", text = "Because every elder you know either served them or envied them, once, and that is not a thing anyone enjoys remembering. When the Well was lost, the Highborne who survived were cast out across the sea, and the rest of us found it easier to speak as though we had always been druids and Sentinels." } },
      choices = {
        { text = "Cast out where?", next = "kal_silence2" },
        { text = "Something else, Wynd.", next = "BACK" },
      },
    },
    kal_silence2 = {
      lines = { { id = "ksi2_d", text = "East, over the sea, to lands we do not speak of, and some were left behind in places like Kel'Theril and Eldre'Thalas, still clinging to their magic in the ruins. You will find their ghosts here, and in Feralas some say a few still live, which is a stranger thing than any ghost." } },
      choices = { { text = "Strange indeed. Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },
    kal_forgive = {
      big = true,
      lines = { { id = "kfo_d", text = "That is a question I have asked myself every night since you brought the crystal back. They are sorry, I believe it, but sorrow did not raise the drowned shores of the old world, and our people paid for their hunger for ten thousand years." } },
      choices = {
        { text = "Regret is the beginning of mending. We should forgive.", next = "BACK", reply = "Then you are kinder than I am, and perhaps wiser. I will try to keep your words in mind when I walk past the lake.", fx = { align = { light = 1 } } },
        { text = "Some debts can't be forgiven, only remembered.", next = "BACK", reply = "That is the older view, and the Sentinels' view. I do not think it is wrong, only very heavy.", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a watcher of old stones, and Starfall is where I watch from. Anything more and I'd have to start keeping a diary." } },
    advice = { { id = "tp_ad", text = "Don't go to Kel'Theril at night, and don't stay longer than you have to. The spirits there don't forgive company." } },
    highborne = { { id = "tp_hb", text = "Our ancestors, or some of them, and the ones who brought the sea down on all of us. Kel'Theril is one small piece of what they did." } },
    furbolgs = { { id = "tp_furb", text = "The Winterfall have gone bad lately, worse than the cold ever made them. Donova Snowden at the hot springs knows more of it than I do." } },
    elune = { { id = "tp_elune", text = "Elune's light falls on the snow here like nowhere else in Kalimdor, and the old shrines still remember her. I keep watch over them as best I can." } },
    nordrassil = { { id = "tp_nordrassil", text = "The World Tree stands on Hyjal, south of here, and our people guard it still. I've never been to its roots, but I feel its strength even here." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "Azshara ruled the Highborne in the old days, and her pride brought the Legion to our world. We don't speak her name lightly, and I'd ask you not to either." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess leads our people from Darnassus, and her word is law among the Kaldorei. I'm proud to serve her, even so far from home." } },
    _none = { { id = "tp_none", text = "That's beyond the snow I know, I'm afraid. Try Everlook, where the goblins hear everything and charge for the hearing." } },
  },
}

---------------------------------------------------------------------------
-- Jaron Stoneshaper
---------------------------------------------------------------------------
P:NPC {
  key = "jaron", id = TODO_NPC("Jaron Stoneshaper"), name = "Jaron Stoneshaper",
  bible = "bibles/jaron.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds", "explorers_league" }, temper = { "jovial", "chatty" }, values = { "curious", "practical" },
  notices = { "race", "craft" },

  impression = {
    first = "Wildkin chased him off his own camp, and he laughs about it.",
    third = "{name} met Jaron Stoneshaper, an Explorers' League digger in Winterspring with a grudge against wildkin.",
  },

  greetings = {
    { id = "g_default", text = "Aye, what can I do for ye, {g:lad|lass}?" },
    { id = "g_wildkin", when = { questActive = TODO_QUEST("Enraged Wildkin") }, text = "Any sign o' my camp, {g:lad|lass}? Or what's left of it?" },
    { id = "g_pick", when = { questActive = TODO_QUEST("Troubled Spirits of Kel'Theril") }, text = "Mind my pick, now. It's the only one I've got left after those feathered lunatics." },
    { id = "g_away", when = { away = 14 }, text = "There ye are, back after {away}! I thought the snow had got ye." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've filled out since I last saw ye, and I'd have ye along on any dig now." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk speak well o' ye round here, and in this cold that's worth a fire." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody's sore at ye, I hear. Best mend that; it's a small north and a long winter." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Now there's a face from home! Ye've not got any dry socks on ye, by chance? Mine went with the camp." },
    { id = "n_arch", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Then ye'll know a good pick when ye see one, and ye'll know why I'm so fond o' mine." },
  },

  start = "hello",
  nodes = {
    dw_titan = {
      lines = {
        { id = "dw_titan_default", text = "That's what the League would dearly love to know! The elves built most of what ye see here, Highborne towers and the like, but the League's after older marks. We found titan carvings in Uldaman and in the Badlands, and if they're here too, it means the makers walked all over this world before anyone else did." },
      },
      choices = {
        { text = "Then keep digging. Whatever you find matters.", next = "BACK", reply = "Aye, it matters to me, and to the King. It'll matter to the wildkin too, sadly, for they hate a pick.", fx = { align = { order = -1 } } },
        { text = "The elves won't thank you for digging up their land.", next = "BACK", reply = "No, they won't, and the ones at Everlook have told me so twice. But it's our history too, if the titans made us both.", fx = { align = { order = 1 } } },
        { text = "Something else, Jaron.", next = "BACK" },
      },
    },
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The kaldorei tell me Kel'Theril belonged to the Highborne, the ones who went east and became the high elves of Quel'Thalas. You've met high elves, maybe. What do you make of them?" },
      },
      choices = {
        { text = "Brave allies. Quel'Thalas bled against the Horde and the Scourge.", next = "op_r1", fx = { align = { honor = 1 }, opinion = { high_elves = "respect" } } },
        { text = "Arrogant. They left the Alliance the moment it suited them.", next = "op_r2", fx = { align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { high_elves = "distrust" } } },
        { text = "Magic-mad, like their ancestors. Same as here.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { arcane_magic = "dangerous" } } },
        { text = "They are our lost kin, and they chose wrongly.", next = "op_r4", fx = { affinity = 1, opinion = { high_elves = "pity" } }, when = { race = "NightElf" } },
        { text = "I've not met enough of them to say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Aye, they did, and Silvermoon's still licking its wounds. I'll put that in my notes, and the elves here will scold me for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Anasterian did pull out after the Second War, and I'll not defend it. They paid for it when the Scourge came through, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "You'd get along with the priestesses of the Moon, then. I just dig up the pots and let the scholars argue." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Lost kin, aye. You say it gently, for someone talking about an exile ten thousand years old." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dd_crystal = {
      lines = {
        { id = "dd_crystal_1",
          text = "Not a peek, not a sketch, not so much as a rubbin' for the archives in Ironforge! He says some things the Highborne made ought tae stay locked away, an' I say the League's been lockin' things away in display cases for years with no complaints." },
        { id = "dd_crystal_2",
          text = "The night elves have long memories, mind, an' I'll grant ye theirs are worse than mine. Still, ye cannae learn from a thing ye won't look at, an' that's the whole o' my philosophy." },
      },
      choices = {
        { text = "Wynd's right. Some magic should stay buried.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Knowledge belongs to everyone, Jaron.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jaron.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_crystal", when = { questDone = TODO_QUEST("The Crystal of Zin-Malor") },
          text = "Wynd's been tellin' me you brought him back some old Highborne crystal from the ruins o' Kel'Theril, an' he won't let me near it. I'm an Explorers' League man, {g:lad|lass}, an' it's breakin' my heart." },
        { id = "o_explorers_league_admire", tags = { "news" }, when = { opinion = { topic = "explorers_league", stance = "admire" } },
          text = "Word is you think history belongs to everyone. The League could use a few more like you." },
        { id = "o_titans_believe", tags = { "news" }, when = { opinion = { topic = "titans", stance = "believe" } },
          text = "I hear you're a believer in the titans' work. Then you'll forgive a dwarf for digging in the snow for more of it." },
        { id = "h_default", key = true, text = "Jaron Stoneshaper, Explorers' League, at yer service. I've been hunting artifacts in Winterspring, because they say it's full of very magical things, though most of 'em are guarded by something that wants to kill ye." },
        { id = "h_harlo", tags = { "news" }, when = { questActive = TODO_QUEST("Enraged Wildkin") },
          text = "Harlo Wigglesworth in Everlook sent ye, did he? Aye, I'm the survivor he's been gossiping about. I was chased clean out of my camp in the south by a pack of bloodthirsty wildkin, and I'm lucky I've still got all my beard." },
        { id = "h_kel", tags = { "news" }, when = { questActive = TODO_QUEST("The Ruins of Kel'Theril") },
          text = "Wynd sent ye about Kel'Theril? Well, I'm no historian, mind, but I can tell ye what I saw there, and what I saw was a lot of very unhappy ghosts." },
        { id = "h_amulet", tags = { "news" }, when = { questRecent = { TODO_QUEST("Enraged Wildkin"), days = 3 } },
          text = "My tools, and the amulet besides! I wonder why those beasts fought so hard over a bit o' blue feathers and stone. Either way, I'll think twice before I dig near them again." },
        { id = "h_aurora", when = { questDone = TODO_QUEST("Troubled Spirits of Kel'Theril") },
          text = "Did Aurora Skycaller make anything of those fragments? She's a sad sort, but if anyone knows what those Highborne broke, it's her." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Don't touch my pick, it's perfect as it is, and I know that look ye're giving it." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}? I've stories enough for a whole winter, and ale enough for half of one." },
        { id = "h_again2", text = "Go on, ask. I'm not going anywhere till the wildkin calm down." },
      },
      choices = {
        { text = "Wynd won't let you see the crystal?", next = "dd_crystal", when = { questDone = TODO_QUEST("The Crystal of Zin-Malor") } },
        { text = "How has the digging gone?", next = "camp" },
        { text = "Have you seen any of the old ruins?", next = "kel" },
        { text = "What brings the Explorers' League this far north?", next = "league" },
        { text = "Who should I ask about those fragments?", next = "aurora", when = { questActive = TODO_QUEST("Troubled Spirits of Kel'Theril") } },
        { text = "Let me look at that pick, Jaron.", next = "xpick", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Is there titan work this far north, Jaron?", next = "dw_titan" },
        { text = "Good luck, Jaron.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "I was set up in southern Winterspring, digging, minding my own business, when the wildkin came down on us like a storm. I suppose I got too close to something they were guarding, but they didn't stop to explain." },
      },
      choices = {
        { text = "You said \"us,\" so someone was with you.", next = "camp_friend" },
        { text = "What were you digging for?", next = "camp_amulet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_friend = {
      lines = {
        { id = "cf_default", text = "A buddy o' mine from the League, and I fear he wasn't as quick as me. I've told myself he ran the other way and he's sitting in Everlook now, laughing at me, but I haven't seen him there." },
      },
      choices = {
        { text = "I'll look for him out there.", next = "camp_promise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_promise = {
      big = true,
      lines = {
        { id = "cp_default", text = "That's kind o' ye, and I'll not stop ye, but don't go getting yerself killed over an old dwarf's guilt. One of us lost in the snow is enough for this season." },
      },
      choices = {
        { text = "No one gets left out there. I'll look.", next = "BACK", reply = "Bless ye, and may the stone keep yer feet steady out there. If ye find any trace of my lads, even a boot, bring word back to an old dwarf who's been waitin' too long.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You're right. The living matter more than the lost.", next = "BACK", reply = "Aye, ye're wiser than me, and that's not hard. Still, I'll be keeping a lantern lit by the tent, just in case one of 'em finds his way back on his own.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_amulet = {
      lines = {
        { id = "ca_default", text = "Nothing in particular, just whatever the ground would give up, but the day before they came I'd unearthed an amulet with blue feathers worked into it. Pretty thing, and I'd like it back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kel = {
      lines = {
        { id = "k_default", text = "I've seen Kel'Theril, aye, and the ghosts of the Highborne wandering its lake, all moaning and looking for the bits of the relic they broke. They're still searching for pieces of the very thing that cursed them there, and that's a hard sort of punishment." },
      },
      choices = {
        { text = "Who were the elves who built Kel'Theril?", next = "op_ask" },
        { text = "Could the pieces be found?", next = "kel_pieces" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_pieces = {
      lines = {
        { id = "kp_default", text = "If ye're that curious, take my pick and go south to the lake, and see what ye can dig out of the ice. I can't tell ye what ye'll find, but I know someone who might." },
      },
      choices = {
        { text = "Who?", next = "aurora" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aurora = {
      lines = {
        { id = "a_default", text = "Aurora Skycaller, a high elf who lives near the Northpass Tower in the Eastern Plaguelands. It's a long walk and an ugly one, but she knows more about the old elves than anyone I've met." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    league = {
      lines = {
        { id = "l_default", text = "The same thing as brings us everywhere: we want to know where we came from, and where everyone else came from too. The north's full of old elf stones, and old elf stones have a way of telling ye things they shouldn't." },
      },
      choices = {
        { text = "Digging up here seems dangerous work.", next = "league_danger", fx = { learn = { "explorers_league" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_danger = {
      big = true,
      lines = {
        { id = "ld_default", text = "Part of the job, {g:lad|lass}. Every ruin worth digging has something sitting on it, and if we waited for the north to be safe we'd never dig at all." },
      },
      choices = {
        { text = "Knowledge is worth the risk. Keep digging.", next = "BACK", reply = "That's the League spirit, and I'd shake yer hand if mine weren't frozen to this trowel. The titans didnae leave all this lying about for nobody to read it.", fx = { align = { order = -1 } } },
        { text = "Some ruins should be left in peace.", next = "BACK", reply = "Ach, ye sound like my old mother, rest her. Mebbe some ruins should sleep, but I've never met one that didnae have something worth learnin' in it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpick = {
      lines = {
        { id = "xp_default", text = "Ye may look, but ye'll not tinker with it. That pick has broken more ice than any engine ever built, and it doesn't need improving." },
      },
      choices = {
        { text = "It's a fine pick, Jaron.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge born, League by trade, and cold since the day I came north. That's about the size of it." } },
    advice = { { id = "tp_ad", text = "If a wildkin's standing on something, leave it be. I'm living proof, just about." } },
    explorers_league = { { id = "tp_el", text = "Best outfit in the world, if ye ask me, though our pay's poor and our camps keep getting wrecked." } },
    highborne = { { id = "tp_hb", text = "Old elves with more magic than sense, from what I've dug up. Wynd knows the sad parts better than I do." } },
    magni = { { id = "tp_magni", text = "King Magni's a great king and a greater patron, and the Explorers' League owes him everything. I'd raise a pint to him if I had one, and I'm fairly sure I don't." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's the greatest dig in the world, {g:lad|lass}, and I'd give my beard to see the inside of those vaults again. The troggs make it difficult, though." } },
    everlook = { { id = "tp_everlook", text = "Everlook's a good town for supplies, and the goblins don't ask what you're digging for. I like that in a merchant." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are a canny folk, and they know these lands better than anyone. I'd love to see what's in their tunnels, but they won't let me dig." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, {g:lad|lass}. Ask Wynd; he's been here longer than the snow, and that's an elf for ye." } },
  },
}
