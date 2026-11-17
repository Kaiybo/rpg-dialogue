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
    first = "Brock Stoneseeker runs a school of mining out of Thelsamar and talks about ore the way other dwarves talk about beer. He is proud of his students and prouder still that some of them listen.",
    third = "{name} met Brock Stoneseeker, who teaches mining and surveying to the young dwarves of Thelsamar.",
  },

  greetings = {
    { id = "g_default", text = "Brock Stoneseeker, o' Brock's School o' Mining an' Surveying, an' aye, the name on the sign is mine. Come in, an' wipe yer boots, for the students have only just swept." },
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
          text = "Ye've still got my list, then? Gryth Thurden keeps the gryphons in Ironforge, an' he knows what tae do wi' it, so off ye go, an' mind ye don't drop it over the Algaz." },
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
        { id = "h_again2", text = "Ask away. A question costs nothin', an' a wrong guess down a shaft costs a great deal." },
        { id = "h_again3", text = "Go on, then. I've had worse interruptions, an' most o' them were cave-ins." },
      },
      choices = {
        { text = "Tell me about your school.", next = "school" },
        { text = "What ore is there around the loch?", next = "ore" },
        { text = "Do you have work for me?", next = "picks" },
        { text = "I've brought your honorary picks.", next = "picks_done", when = { questDone = TODO_QUEST("Return to Brock") } },
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
        { text = "Rewards are what make the young ones work hard.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Good work should be its own reward.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Then the mine should be cleared for good.", next = "BACK", fx = { align = { order = 1 }, learn = { "kobolds" } } },
        { text = "There's ore enough to share with kobolds.", next = "BACK", fx = { align = { order = -1 }, learn = { "kobolds" } } },
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
        { text = "A little pride never hurt anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You should tell them the truth about Morhan.", next = "BACK", fx = { align = { honor = 1 } } },
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
        { id = "pd_default", text = "Ye did, an' I'll no' forget it. The youngest of them, wee Tamsin, cried when I put hers in her hands, an' then she pretended it was the dust in her eyes." },
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
        { text = "A good miner takes every risk the vein demands.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A good miner comes home. The vein can wait.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdeep = {
      lines = {
        { id = "xd_default", text = "Did ye now! Then ye'll find the loch's seams a holiday, for there's sky above most o' them an' nae foreman countin' yer swings. Do ye miss it?" },
      },
      choices = {
        { text = "I miss the work. The deep is where dwarves belong.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Not for a moment. I'd rather see the sky.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Course ye could! Ye're nearer the ground than I am, which is half the battle in a low tunnel. Only promise me ye'll no' bring one o' those drillin' machines in here, for the last one went through my floor." },
      },
      choices = {
        { text = "Machines are the future of mining, Brock.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A pick and patience it is, then.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know rock, an' I know the folk who dig it, an' that covers most o' Loch Modan." } },
    background = { { id = "tp_bg", text = "Thirty years in the mines under Ironforge an' Dun Morogh, an' then my knees retired before I did, so I opened a school." } },
    advice = { { id = "tp_ad", text = "Listen tae the rock before ye hit it, friend, for it usually tells ye what it's goin' tae do." } },
    troggs = { { id = "tp_troggs", text = "They come up where we dig deep, an' I've never heard a better reason tae dig carefully." } },
    kobolds = { { id = "tp_kobolds", text = "Tunnel Rats in the Silver Stream, an' they'd steal the candle off yer helmet if ye stood still." } },
    _none = { { id = "tp_none", text = "If it's no' in the rock, I'm the wrong dwarf tae ask. Try Jern; he writes everythin' down." } },
  },
}

-- Ghak Healtouch: alchemy trainer, works from a house behind the Stoutlager Inn.
P:NPC {
  key = "lm_ghak", id = TODO_NPC("Ghak Healtouch"), name = "Ghak Healtouch",
  bible = "bibles/thelsamar_trades.md", role = "trainer", tier = "quest",
  communities = { "thelsamar" }, temper = { "dry", "steady" }, values = { "craft", "curious", "careful" },
  notices = { "race", "craft", "class" },

  impression = {
    first = "Ghak Healtouch brews potions in a house behind the Stoutlager Inn and talks about Badlands buzzards as if they were a pantry. He is careful, a little dry, and married to the herbalist next door.",
    third = "{name} met Ghak Healtouch, Thelsamar's alchemist, who sends the brave into the Badlands for his reagents.",
  },

  greetings = {
    { id = "g_default", text = "Mind the shelves, friend, for half those jars bite an' the other half explode. Ghak Healtouch, alchemist, an' what can I do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still wi' both eyebrows! That's more than I can say for my last apprentice." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been away {away}, an' I've had three batches go cloudy in that time. Not your fault, I'll grant, but I like tae blame someone." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown hardier since I saw ye last. Hardy enough for the Badlands, I'd say, an' that's lucky, for I've a list." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Ye smell o' peacebloom an' singed glass, which is the smell o' a fellow alchemist. Sit, sit, an' don't touch the green one." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A healer by trade, are ye? Then ye'll know a potion's only prayer in a bottle, an' it works whether ye believe in it or no'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I make the potions that keep Thelsamar's mountaineers on their feet, an' I train any alchemist wi' the patience tae learn. My wife Kali minds the herbs next door, an' between the two o' us, there's very little in this valley we cannae brew." },
        { id = "h_run1", tags = { "news" }, when = { questActive = TODO_QUEST("Badlands Reagent Run") },
          text = "Buzzard gizzards, coyote fangs an' shards off the rock elementals, all from the Badlands. I know it's a long list, but ye'll no' find any o' them on the loch." },
        { id = "h_run1_done", when = { questDone = TODO_QUEST("Badlands Reagent Run"), ["not"] = { questDone = TODO_QUEST("Uldaman Reagent Run") } },
          text = "My shelves are fuller than they've been in a year, thanks tae you. Now, there's somethin' growin' down in the Uldaman dig I'd dearly like a look at, if ye're brave." },
        { id = "h_ulda", tags = { "news" }, when = { questActive = TODO_QUEST("Uldaman Reagent Run") },
          text = "Magenta caps, friend, twelve o' them, from the tunnels at the Uldaman dig. Don't jostle the clusters, for they puff out spores, an' the spores are nasty." },
        { id = "h_run2", tags = { "news" }, when = { questActive = TODO_QUEST("Badlands Reagent Run II") },
          text = "This is the last run, I promise, an' then I'll show ye a restorative worth the walk. The Badlands again, I'm afraid; it's where the good things grow, or bleed." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A good stout dwarf! Ye'll take the Badlands better than most, for the dust there's no worse than a mine, only hotter." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! I've a gnome-made still in the back that I don't understand an' daren't touch, so if ye've a minute, I'd value yer opinion." },
      },
      again = {
        { id = "h_again", text = "What else? The cauldron needs stirrin' every few minutes, so ask quick." },
        { id = "h_again2", text = "Go on. I'll listen while I measure, an' if I miscount, it's yer fault." },
        { id = "h_again3", text = "Anythin' more? Mind, the jar by yer elbow is the one that bites." },
      },
      choices = {
        { text = "Do you need anything brought in?", next = "runs" },
        { text = "Why send folk to the Badlands for reagents?", next = "badlands" },
        { text = "What's growing at the Uldaman dig?", next = "caps" },
        { text = "Tell me about Kali.", next = "kali" },
        { text = "I'm an alchemist too.", next = "xalch", when = { profession = "Alchemy" } },
        { text = "Can I see the gnome still?", next = "xstill", when = { race = "Gnome" } },
        { text = "I'd like some training.", next = "BUSINESS" },
        { text = "Good day, Ghak.", next = "END" },
      },
    },

    runs = {
      big = true,
      lines = {
        { id = "rn_default", text = "I always do, but what I need lives in the Badlands, so ye'd best be ready for it. Five buzzard gizzards, ten crag coyote fangs, an' five shards off the rock elementals, an' I'll pay ye fairly once they're on my bench." },
        { id = "rn_low", when = { maxLevel = 34 },
          text = "I do, but no' from someone your size, if ye'll pardon me. The Badlands would eat ye whole, so come back when ye've a few more scars." },
        { id = "rn_all", when = { questDone = TODO_QUEST("Badlands Reagent Run II") },
          text = "Ye've done every run I had, an' my shelves have never looked so fine. I've nothin' left tae ask but that ye take care o' yerself." },
      },
      choices = {
        { text = "Why rock elemental shards?", next = "runs_shards" },
        { text = "Can I bring friends along?", next = "runs_friends" },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    runs_shards = {
      lines = {
        { id = "rs_default", text = "Ground fine, they bind a potion so it'll keep in a pack for a month instead o' a week. The mountaineers carry my draughts up tae the towers for days at a time, so it matters more than ye'd think." },
      },
      choices = {
        { text = "The mountaineers are lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    runs_friends = {
      lines = {
        { id = "rf_default", text = "Bring as many as ye like, for the coyotes run in packs an' so should you. I'll pay for the reagents, mind, no' for the number o' boots that went tae fetch them." },
      },
      choices = {
        { text = "Then the reward should be shared evenly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whoever lands the killing blow keeps the fang.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    badlands = {
      lines = {
        { id = "bd_default", text = "Because nothin' useful grows in a comfortable place, friend. Things that live in the Badlands are hard an' dry an' angry, an' that toughness goes straight intae the bottle." },
      },
      choices = {
        { text = "Who else works the Badlands?", next = "badlands_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    badlands_who = {
      lines = {
        { id = "bw_default", text = "The Explorers' League at the Uldaman dig, which is Prospector Ryedol's lot, an' a gnome or two wi' more ideas than sense. There's an orc camp out there an' all, I'm told, so keep yer head down near Kargath." },
      },
      choices = {
        { text = "The orcs have no business in Khaz Modan.", next = "BACK", fx = { align = { order = 1 }, learn = { "uldaman" } } },
        { text = "The Badlands belong to whoever can live there.", next = "BACK", fx = { align = { order = -1 }, learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    caps = {
      big = true,
      lines = {
        { id = "cp_default", text = "A magenta fungus, growin' in clusters in the tunnels at the Uldaman dig, an' nobody's studied it properly. I think it might be the makin' o' a fine elixir, if it doesnae poison me first." },
        { id = "cp_done", when = { questDone = TODO_QUEST("Uldaman Reagent Run") },
          text = "Ye brought me the caps, an' I've been at them ever since. They're mean little things, but there's a restorative in there, an' I've nearly coaxed it out." },
      },
      choices = {
        { text = "Is it dangerous to gather?", next = "caps_spores" },
        { text = "Why risk poisoning yourself?", next = "caps_risk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caps_spores = {
      lines = {
        { id = "cs_default", text = "Only if ye jostle the clusters, an' then they spit a cloud o' spores at ye that'll make yer lungs feel like a forge. Pick them gentle, from the side, an' hold yer breath if ye can." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caps_risk = {
      lines = {
        { id = "cr_default", text = "Because every potion on that shelf was a poison once, until somebody stubborn found the right dose. That's alchemy, friend: the brave part is the tastin'." },
      },
      choices = {
        { text = "Knowledge is worth a little danger.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Some things shouldn't be tasted at all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kali = {
      lines = {
        { id = "ka_default", text = "My wife, an' the best herbalist on this side o' the mountains. She grows what she can an' picks what she cannae, an' she tells me which o' my brews are a waste o' good silverleaf." },
        { id = "ka_warm", when = { disposition = { min = 65 } },
          text = "My wife, an' I'll tell ye a secret: I took up alchemy so I'd have an excuse tae buy herbs off her every day. Thirty years married, an' I still pay full price." },
      },
      choices = {
        { text = "You two make a good pair.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xalch = {
      lines = {
        { id = "xa_default", text = "Are ye now! Then ye'll know the worst part o' the trade is runnin' out o' somethin' halfway through a batch. Do ye keep a proper ledger o' yer stock, or do ye trust tae luck?" },
      },
      choices = {
        { text = "Every vial counted and written down.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I trust my nose and improvise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstill = {
      lines = {
        { id = "xs_default", text = "Through the back, but don't turn the brass wheel, for I did once an' it whistled for an hour. A gnome sold it tae me after Gnomeregan, an' I think he was glad tae see it go." },
      },
      choices = {
        { text = "I'll have a look at it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what's in every bottle on these shelves, an' a good deal about where it came from." } },
    background = { { id = "tp_bg", text = "Thelsamar born an' brewed. I learned the trade in Ironforge an' brought it home." } },
    advice = { { id = "tp_ad", text = "Label everythin', friend. The day ye don't is the day ye drink the wrong one." } },
    uldaman = { { id = "tp_ulda", text = "Old stone an' strange fungus, an' Ryedol's League folk diggin' at the door of it." } },
    _none = { { id = "tp_none", text = "If it doesnae go in a bottle, I've no' given it much thought. Ask Kali; she reads." } },
  },
}

-- Kali Healtouch: herbalism trainer, Ghak's wife.
P:NPC {
  key = "lm_kali", id = TODO_NPC("Kali Healtouch"), name = "Kali Healtouch",
  bible = "bibles/thelsamar_trades.md", role = "trainer", tier = "service",
  communities = { "thelsamar" }, temper = { "warm", "sharp" }, values = { "nature", "practical", "kind" },
  notices = { "craft", "class" },

  impression = {
    first = "Kali Healtouch teaches herbalism in Thelsamar and keeps her husband Ghak's alchemy honest. She knows every plant that grows on the loch's shores and has opinions about all of them.",
    third = "{name} met Kali Healtouch, Thelsamar's herbalist and the wife of its alchemist.",
  },

  greetings = {
    { id = "g_default", text = "Kali Healtouch, an' if ye've come for Ghak, he's next door makin' smoke. If ye've come for herbs, ye've found the right one o' us." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did ye find the briarthorn where I told ye, or did ye find the nettles?" },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the silverleaf's come up an' gone over in that time. Ye missed the best o' it." },
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
        { text = "What grows around the loch?", next = "herbs" },
        { text = "How do you pick properly?", next = "picking" },
        { text = "What's Ghak like to live with?", next = "ghak" },
        { text = "Do druids pick herbs differently?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'd like some training.", next = "BUSINESS" },
        { text = "Good day, Kali.", next = "END" },
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
        { text = "They're right to be watchful.", next = "BACK", fx = { align = { order = 1 }, learn = { "stonewrought_dam" } } },
        { text = "Suspicion like that does more harm than spies.", next = "BACK", fx = { align = { order = -1 }, learn = { "stonewrought_dam" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    picking = {
      lines = {
        { id = "pk_default", text = "Take the leaves an' leave the root, an' never strip a patch bare, for then there's nothin' next year for you or anyone. Half the herbalists who come through here pull like they're weedin' a field, an' it breaks my heart." },
      },
      choices = {
        { text = "Leave some for whoever comes after.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "If I don't take it, someone else will.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghak = {
      lines = {
        { id = "gh_default", text = "Like livin' wi' a kettle that's always about tae boil over, an' I wouldnae change a thing. He's singed the curtains four times this year, an' I've stopped buyin' nice ones." },
      },
      choices = {
        { text = "Has he ever blown anything up?", next = "ghak_boom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghak_boom = {
      lines = {
        { id = "gb_default", text = "Only the privy, an' only the once, an' he swears it was a gnome's still that did it. The whole o' Thelsamar heard it, an' Bluntnose made him rebuild it wi' his own two hands." },
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
        { text = "Thanks is enough. The land understands.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Plants are plants. They don't hear thanks.", next = "BACK", fx = { align = { light = -1 } } },
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
