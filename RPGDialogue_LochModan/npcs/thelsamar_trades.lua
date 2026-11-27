-- Thelsamar's trade teachers: Brock Stoneseeker (mining), Ghak and Kali Healtouch (alchemy, herbalism). Voice: bibles/thelsamar_trades.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brock Stoneseeker: mining trainer, runs Brock's School of Mining and Surveying.
P:NPC {
  key = "lm_brock", id = TODO_NPC("Brock Stoneseeker"), name = "Brock Stoneseeker",
  bible = "bibles/thelsamar_trades.md", role = "trainer", tier = "quest",
  communities = { "thelsamar" }, temper = { "jovial", "proud" }, values = { "craft", "practical", "generous" },
  notices = { "race", "craft", "kit" },

  impression = {
    first = "He is proud of his students, and prouder that some listen.",
    third = "{name} met Brock Stoneseeker, who teaches mining and surveying to the young dwarves of Thelsamar.",
  },

  greetings = {
    { id = "g_default", text = "I'm Brock Stoneseeker, o' Brock's School o' Mining an' Surveying, an' aye, the name on the sign is mine. Come in, an' wipe yer boots, for the students have only just swept." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Either ye've found a seam ye cannae make sense of, or ye've come tae tell me about one. Both are welcome." },
    { id = "g_away", when = { away = 14 }, text = "There ye are, after {away} away! I'd half decided ye'd fallen down a shaft somewhere, an' I was writin' ye intae my safety lecture." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at the shoulders on ye now! Ye've been swingin' somethin' heavier than a pick, I'd say, or swingin' a pick at somethin' that swung back." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Thelsamar says ye've been a help tae folk. I tell my students that a good miner shores up the tunnel for whoever comes after, an' it seems ye do the same above ground." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "There's ore dust in the creases o' yer gloves, an' I'd know it anywhere. Ye're one o' us, then, whether ye learned it here or no'." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf", origin = "dwarf_ironforge_miner" },
      text = "Ye've a miner's stoop, friend, the kind ye get from the deep galleries under Ironforge. Ye'll find the loch's seams shallow by comparison, but honest." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's in a sorry state, an' I'd no' let a student o' mine go down a shaft lookin' like that. Morhan's by the inn, if ye've the coin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "This is my school, an' these hills are my classroom, for there's copper an' tin an' a wee bit o' silver all round the loch if ye know how tae look. I teach the young ones how tae find it without bringin' the hill down on their heads." },
        { id = "h_honor", tags = { "news" }, when = { questActive = TODO_QUEST("Honor Students") },
          text = "Ye've still got my list, then? Gryth Thurden keeps the gryphons in Ironforge, an' he knows what tae do wi' it, so off ye go, an' mind ye don't drop it on the road." },
        { id = "h_return", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Brock") },
          text = "Is that the bundle from Gryth? Oh, I can hear them clinkin' from here! Hand them over, friend, for I've three students who've been waitin' all week." },
        { id = "h_after", when = { questDone = TODO_QUEST("Return to Brock") },
          text = "My honor students are up at the old seams wi' their new picks, an' ye've never seen dwarves so pleased wi' themselves. One o' them has slept wi' his, I'm told." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Yer folk were always better wi' the machinery than the pick, but I've had a gnome student or two since Gnomeregan, an' they've a fine eye for a vein." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, an' a long way from yer farms! Ye'll find these hills harder than Elwynn dirt, but a strong back learns quick." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One o' the kaldorei, in my school! I'm told yer people don't much like diggin' holes in the world, so if ye've come tae learn, ye've surprised me already." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The kettle's on, an' the students are out, so I've a minute." },
        { id = "h_again2", text = "Ask away. A question costs nothin', an' a wrong guess down a shaft costs ye a leg." },
        { id = "h_again3", text = "Go on, then. I've had worse interruptions, an' most o' them were cave-ins." },
      },
      choices = {
        { text = "Tell me about your school.", next = "school" },
        { text = "What ore is there around the loch?", next = "ore" },
        { text = "Do you have work for me?", next = "picks" },
        { text = "Did your students like their honorary picks?", next = "picks_done", when = { questDone = TODO_QUEST("Return to Brock") } },
        { text = "I'm a miner myself. Any advice?", next = "xminer", when = { profession = "Mining" } },
        { text = "I worked the deep galleries under Ironforge.", next = "xdeep", when = { origin = "dwarf_ironforge_miner" } },
        { text = "Could a gnome learn mining from you?", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'd like some training.", next = "BUSINESS" },
        { text = "Good day, Brock.", next = "END" },
      },
    },

    school = {
      lines = {
        { id = "sc_default", text = "Two rooms, a slate board an' a cart o' rock samples I've been collectin' for thirty years, an' that's the whole o' Brock's School. It's no' the Hall o' Explorers, but more good miners have come out o' here than out o' any hall I know." },
      },
      choices = {
        { text = "Who are your students?", next = "school_students" },
        { text = "Why teach, and not dig yourself?", next = "school_why" },
        { text = "Something else, Brock.", next = "BACK" },
      },
    },
    school_students = {
      lines = {
        { id = "ss_default", text = "Lads an' lasses from Thelsamar mostly, an' a few from the farms, an' the odd one sent down from Ironforge because his father thinks the loch air will settle him. The best o' them I call my honor students, an' I like tae see them rewarded." },
      },
      choices = {
        { text = "Rewards are what make the young ones work hard.", next = "BACK", reply = "Aye, a shiny pick goes a long way wi' the young ones. I'd rather they worked hard for a pick than for nothin'.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Good work should be its own reward.", next = "BACK", reply = "In a perfect world, aye, but this is Loch Modan. A wee reward keeps them comin' back tae my stall, an' that's what matters tae me.", fx = { align = { order = -1 } } },
        { text = "How do you reward them?", next = "picks" },
      },
    },
    school_why = {
      lines = {
        { id = "sw_default", text = "My knees, friend, if ye want the honest answer, for they stopped bendin' the way a tunnel wants them tae. An' because a dwarf who teaches ten miners digs ten times as much, even if he never lifts a pick again." },
      },
      choices = {
        { text = "That's a fine way to look at it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ore = {
      lines = {
        { id = "or_default", text = "Copper in the hills, tin wherever the copper gets thin, an' silver in the Silver Stream Mine up north, if ye can get past what's livin' in it. The loch was a minin' country long before it was a fishin' one." },
      },
      choices = {
        { text = "What's living in the Silver Stream Mine?", next = "ore_mine" },
        { text = "Where do the troggs come from?", next = "ore_troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_mine = {
      lines = {
        { id = "om_default", text = "Kobolds, the Tunnel Rat sort, wi' their wee candles an' their wee knives, an' they think every seam in the mine belongs tae them. The mountaineers chase them out every season, an' every season they creep back in." },
        { id = "om_kills", when = { killed = { name = "Tunnel Rat", min = 20 } },
          text = "Kobolds, though fewer o' late, an' I've a fair idea who's tae thank for that. My students might get a season in the Silver Stream at last." },
      },
      choices = {
        { text = "Then the mine should be cleared for good.", next = "BACK", reply = "Cleared for good, aye, if the mountaineers could manage it. They've tried twice, an' the kobolds keep comin' back.", fx = { align = { order = 1 }, learn = { "kobolds" } } },
        { text = "There's ore enough to share with kobolds.", next = "BACK", reply = "Share wi' kobolds? They'd take the lot an' come back for the picks. Ye've a soft heart, I'll give ye that.", fx = { align = { order = -1 }, learn = { "kobolds" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_troggs = {
      lines = {
        { id = "ot_default", text = "From under the hills, as far as anyone can tell, an' they come up wherever a dwarf digs too deep. I teach my students tae listen tae the rock, because when it starts scratchin' back at ye, it's time tae leave." },
      },
      choices = {
        { text = "Then dig shallow and live long.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "troggs" } } },
        { text = "Something else, Brock.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },

    picks = {
      big = true,
      lines = {
        { id = "pk_default", text = "There is, as it happens! I've a list o' my best students, an' I'd like them tae have proper honorary picks, made in Ironforge, wi' their names on the haft. Gryth Thurden at the gryphon roost in Ironforge will see tae it, if ye'll take him the list." },
        { id = "pk_active", when = { questActive = TODO_QUEST("Honor Students") },
          text = "Ye've already got the list, friend! Gryth Thurden, at the gryphon roost in Ironforge, an' he'll send the picks back wi' ye." },
        { id = "pk_done", when = { questDone = TODO_QUEST("Return to Brock") },
          text = "Ye've done that for me already, an' the students still talk about it. I've nothin' else just now, but come back when the next lot earn their picks." },
      },
      choices = {
        { text = "Why have Ironforge make them?", next = "picks_why" },
        { text = "Who is Gryth Thurden?", next = "picks_gryth" },
        { text = "I'll take the list to Ironforge.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    picks_why = {
      lines = {
        { id = "pw_default", text = "Because a pick from Ironforge means somethin' tae a young dwarf from the loch, an' they'll carry it the rest o' their lives. Morhan could make one just as good, but I'd never tell a student that." },
      },
      choices = {
        { text = "A little pride never hurt anyone.", next = "BACK", reply = "Never did, an' it never will. I still keep my first nugget on a string round my neck.", fx = { align = { honor = -1 } } },
        { text = "You should tell them the truth about Morhan.", next = "BACK", reply = "An' break their hearts? No, the pick's from Ironforge, an' that's the end o' it. Morhan doesnae mind.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    picks_gryth = {
      lines = {
        { id = "pg_default", text = "He runs the gryphons in Ironforge, an' he's sent more parcels over these mountains than any dwarf alive. He owes me a favour from years back, an' he'll know what the list is for the moment he sees my hand." },
      },
      choices = {
        { text = "What sort of favour?", next = "picks_favour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    picks_favour = {
      lines = {
        { id = "pf_default", text = "I taught his nephew tae tell copper from fool's gold, an' the lad's foreman now in one o' the king's own mines. Gryth's never let me pay for a parcel since, an' I've stopped tryin'." },
      },
      choices = {
        { text = "Good teaching pays for itself.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    picks_done = {
      lines = {
        { id = "pd_default", text = "They did, an' I'll no' forget what ye did for them. The youngest of them, wee Tamsin, cried when I put hers in her hands, an' then she pretended it was the dust in her eyes." },
      },
      choices = {
        { text = "She'll make a fine miner.", next = "BACK", fx = { affinity = 1, standing = { thelsamar = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xminer = {
      lines = {
        { id = "xm_default", text = "Aye, three things. Never trust a seam that's too easy, never dig wi' yer back tae the open, an' when the lantern flickers an' there's no wind, get out an' ask questions later." },
        { id = "xm_skilled", when = { profession = { name = "Mining", min = 150 } },
          text = "Advice? Ye've more ore under yer nails than half my students will ever see, so I'll ask you instead. Is the iron any good out past the Wetlands, or is it all bog?" },
      },
      choices = {
        { text = "A good miner takes every risk the vein demands.", next = "BACK", reply = "Ye'll find the vein demands more than ye've got, someday. Mind my three rules, an' ye might live tae see it.", fx = { align = { order = -1 } } },
        { text = "A good miner comes home. The vein can wait.", next = "BACK", reply = "Aye, that's the wisest thing ye've said yet. The vein's waited ten thousand years, an' it'll wait till ye've slept.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdeep = {
      lines = {
        { id = "xd_default", text = "Did ye now! Then ye'll find the loch's seams a holiday, for there's sky above most o' them an' nae foreman countin' yer swings. Do ye miss it?" },
      },
      choices = {
        { text = "I miss the work. The deep is where dwarves belong.", next = "BACK", reply = "The deep's where we came from, aye, an' I miss it too some days. But the sky's no' so bad once ye get used tae it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Not for a moment. I'd rather see the sky.", next = "BACK", reply = "The sky, aye, an' the fresh air. I'll no' argue wi' ye, for I felt the same when I came up.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Course ye could! Ye're nearer the ground than I am, an' that's a blessing in a low tunnel. Only promise me ye'll no' bring one o' those drillin' machines in here, for the last one went through my floor." },
      },
      choices = {
        { text = "Machines are the future of mining, Brock.", next = "BACK", reply = "The future, is it? I've seen what those gnome machines do tae a seam, an' it isnae pretty. They chew through good ore like a goat through a hedge.", fx = { align = { order = -1 } } },
        { text = "A pick and patience it is, then.", next = "BACK", reply = "Good, that's the spirit. Patience an' a pick have dug every hall in Ironforge, an' they'll dig yours too.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know rock, an' I know the folk who dig it, an' that covers most o' Loch Modan." } },
    background = { { id = "tp_bg", text = "I spent thirty years in the mines under Ironforge an' Dun Morogh, an' then my knees retired before I did, so I opened a school." } },
    advice = { { id = "tp_ad", text = "Listen tae the rock before ye hit it, friend, for it usually tells ye what it's goin' tae do." } },
    troggs = { { id = "tp_troggs", text = "Troggs come up where we dig deep, an' I've never heard a better reason tae dig carefully." } },
    kobolds = { { id = "tp_kobolds", text = "The Tunnel Rats in the Silver Stream would steal the candle off yer helmet if ye stood still." } },
    _none = { { id = "tp_none", text = "If it's no' in the rock, I'm the wrong dwarf tae ask. Try Jern; he writes everythin' down." } },
  },
}

-- Kali Healtouch: herbalism trainer, Ghak's wife.
P:NPC {
  key = "lm_kali", id = TODO_NPC("Kali Healtouch"), name = "Kali Healtouch",
  bible = "bibles/thelsamar_trades.md", role = "trainer", tier = "service",
  communities = { "thelsamar" }, temper = { "warm", "sharp" }, values = { "nature", "practical", "kind" },
  notices = { "craft", "class" },

  impression = {
    first = "She keeps her husband Ghak's alchemy honest.",
    third = "{name} met Kali Healtouch, Thelsamar's herbalist and the wife of its alchemist.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! The briarthorn's in flower, an' I've been savin' the best patch for ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The herbs are for sale, but I'll no' be tellin' ye where they grow." },
    { id = "g_default", text = "I'm Kali Healtouch, an' if ye've come for Ghak, he's next door makin' smoke. If ye've come for herbs, ye've found the right one o' us." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did ye find the briarthorn where I told ye, or did ye find the nettles?" },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the silverleaf's come up an' gone over in that time. Ye missed the best o' it." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Ye've green under yer nails an' a herb pouch that's seen use. Good, for I've no patience for herbalists who only pick what's by the road." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Ye'll know half o' what I teach already, I expect, though ye might no' know the dwarven names for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I teach herbalism tae anyone who'll kneel in the mud long enough tae learn it. The loch's a kind place for plants, kinder than most of Khaz Modan, an' I mean tae see folk pick it properly." },
        { id = "h_ghak_run", when = { questActive = TODO_QUEST("Badlands Reagent Run") },
          text = "Ghak's sent ye tae the Badlands, has he? Take water, an' more than ye think, for nothin' out there will give ye a drop." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid in my garden! Don't go talkin' tae the peacebloom, mind, for it's slow enough already." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've seedlings tae pot, but they'll wait for a good question." },
        { id = "h_again2", text = "Go on. Ghak's no' the only one in this family who likes tae talk." },
      },
      choices = {
        { text = "Pick herbs with care, and leave enough for them to grow back.", next = "BACK", reply = "Aye, that's the right way, an' ye'll find silverleaf on these hills for years if ye do.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strip the whole patch. Someone else will if I don't.", next = "BACK", reply = "Then there'll be none next year, for ye or for anyone else.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What grows around the loch?", next = "herbs" },
        { text = "How do you pick properly?", next = "picking" },
        { text = "What's Ghak like to live with?", next = "ghak" },
        { text = "Do druids pick herbs differently?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'd like some training.", next = "BUSINESS" },
        { text = "What does Ghak brew from your herbs?", next = "kh_brew" },
        { text = "Are the woods safe for gathering?", next = "kh_woods" },
        { text = "Good day, Kali.", next = "END" },
      },
    },
    kh_brew = {
      lines = {
        { id = "kh_brew_1", text = "Healin' draughts for the mountaineers, mostly, an' a tonic for the miners' lungs that smells like a wet boot. Ghak would brew all night if I let him, so I make sure he only gets what he can use by mornin'." },
      },
      choices = {
        { text = "Do the mountaineers need much healing?", next = "kh_heal" },
        { text = "A tonic that smells like a boot. Lovely.", next = "BACK", reply = "It works, an' that's all a miner cares about." },
      },
    },
    kh_heal = {
      lines = {
        { id = "kh_heal_1", text = "More every week, wi' the troggs pushin' out o' Stonesplinter. I've seen Ghak run out o' draughts by noon, an' then he sits at the table wi' his head in his hands till I bring him more peacebloom." },
      },
      choices = {
        { text = "I'll bring peacebloom if I find it.", next = "BACK", fx = { affinity = 1 } },
        { text = "The troggs are wearing everyone down. Something else.", next = "BACK" },
      },
    },
    kh_woods = {
      lines = {
        { id = "kh_woods_1", text = "Safe enough by day, if ye keep tae the edges an' watch for the big spiders. At night, I'd no' go past the farms, for the spiders come down from the north an' they're no' particular what they bite." },
      },
      choices = {
        { text = "Where do the best herbs grow, then?", next = "kh_best" },
        { text = "I'm a herbalist. Where's the silverleaf?", next = "kh_best", when = { profession = "Herbalism" } },
      },
    },
    kh_best = {
      lines = {
        { id = "kh_best_1", text = "Silverleaf in the shade o' the pines north o' town, an' earthroot by the loch shore. The Farstriders let me pick near the lodge, for they say I'm the only gatherer who leaves the patch better than I found it." },
      },
      choices = {
        { text = "High praise from the Farstriders.", next = "BACK" },
        { text = "North pines and the shore. Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "hb_default", text = "Silverleaf an' peacebloom along the shore, earthroot in the dry ground by the hills, an' briarthorn wherever ye'd least like tae put yer hand. Mageroyal, too, if ye go lookin' up near the dam." },
      },
      choices = {
        { text = "Where's best near the dam?", next = "herbs_dam" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_dam = {
      lines = {
        { id = "hd_default", text = "The north end o' the water, where the spray from the dam keeps the ground wet. Mind the engineers, for they think every herbalist is a Dark Iron spy, an' they've no' been wrong often enough tae stop." },
      },
      choices = {
        { text = "They're right to be watchful.", next = "BACK", reply = "They are, I'll grant ye, but they could be politer about it. Mind ye dinnae look too much like a Dark Iron.", fx = { align = { order = 1 }, learn = { "stonewrought_dam" } } },
        { text = "Suspicion like that does more harm than spies.", next = "BACK", reply = "It does, an' I've lost good herbs tae their shoutin'. Maybe ye could tell them so, for they willnae listen tae me.", fx = { align = { order = -1 }, learn = { "stonewrought_dam" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    picking = {
      lines = {
        { id = "pk_default", text = "Take the leaves an' leave the root, an' never strip a patch bare, for then there's nothin' next year for you or anyone. Too many herbalists who come through here pull like they're weedin' a field, an' it breaks my heart." },
      },
      choices = {
        { text = "Leave some for whoever comes after.", next = "BACK", reply = "Aye, that's the way o' it. Ye'll make a fine herbalist if ye remember that.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "If I don't take it, someone else will.", next = "BACK", reply = "An' then there's nothin' for anyone. I've seen hillsides up by the dam stripped bare by folk who said the very same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghak = {
      lines = {
        { id = "gh_default", text = "It's like livin' wi' a kettle that's always about tae boil over, an' I wouldnae change a thing. He's singed the curtains four times this year, an' I've stopped buyin' nice ones." },
      },
      choices = {
        { text = "Has he ever blown anything up?", next = "ghak_boom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghak_boom = {
      lines = {
        { id = "gb_default", text = "Only the privy, an' only the once, an' he swears it was a gnome's still that did it. The whole o' Thelsamar heard it, an' Magistrate Bluntnose made him rebuild it wi' his own two hands." },
      },
      choices = {
        { text = "That's a story I'll remember.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "Ye ask the plant first, I'm told, which is more manners than most dwarves show it. I don't ask, but I do say thank ye, an' I've a feelin' it amounts tae the same." },
      },
      choices = {
        { text = "Thanks is enough. The land understands.", next = "BACK", reply = "I'd like tae think so, an' it's kind o' ye tae say. I'll keep sayin' thanks, anyway, in case it's listenin'.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Plants are plants. They don't hear thanks.", next = "BACK", reply = "Maybe no', but I hear it, an' it makes me pick gentler. That's enough for me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My mother grew herbs for the dam workers' healers, an' I've had my hands in this dirt since I could walk." } },
    advice = { { id = "tp_ad", text = "Never eat a leaf ye cannae name, an' never trust a dwarf who says he can name them all." } },
    _none = { { id = "tp_none", text = "That's no' somethin' that grows, so I've never troubled myself about it." } },
  },
}
