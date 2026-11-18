-- Senator Barin Redstone, the High Seat, Ironforge. Voice: bibles/barin_redstone.md
-- Sour senator who takes Senir Whitebeard's reports (The Reports) and resents the King's name on
-- Grelin's letter. Hates the Dark Iron, blames the gnomes for Gnomeregan, and has no time for the
-- Wildhammer. Under the gnome grudge: the Senate's three days of arguing (authored).
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q = TODO_QUEST("The Reports")

P:NPC {
  key = "barin_redstone", id = TODO_NPC("Senator Barin Redstone"), name = "Senator Barin Redstone",
  bible = "bibles/barin_redstone.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "sharp" }, values = { "lawful", "proud", "dutiful" },
  likesTone = "polite", race = "Dwarf",
  notices = { "gnome", "wildhammer", "fel" },

  impression = {
    first = "Senator Barin Redstone keeps a list of everyone who has wronged Ironforge, and it is a long list. The Dark Iron head it, the gnomes come close behind, and the Wildhammer are on it for good measure.",
    third = "{name} heard Senator Barin Redstone's opinions on the Dark Iron, the gnomes and the Wildhammer, at length.",
  },

  greetings = {
    { id = "g_default", text = "If ye've business wi' the Senate, state it. If ye've business wi' the King, he's over there, an' he'll sign anythin'." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, the Senate's patience is long, even if mine isnae." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "Aye, what is it? Speak up; I cannae hear ye from all the way down there, an' I've no time tae bend." },
    { id = "g_gnome_soft", when = { race = "Gnome", heardLine = "barin_redstone.gv_default" },
      text = "Ah, it's you. Come up, then, an' mind the step; it's high for yer folk, an' nobody's thought tae fix it." },
    { id = "g_vote", when = { heardLine = "barin_redstone.gv_default", ["not"] = { race = "Gnome" } },
      text = "Ye'll remember what I told ye last time, an' ye'll remember tae keep it tae yerself. Now, what is it?" },
    { id = "g_reports", when = { questActive = Q }, text = "Is that Senir Whitebeard's report? Hand it over, for it's the Senate that should be readin' it, no' the King's clerks." },
    { id = "g_done", when = { questDone = Q }, text = "Ye brought Whitebeard's report up the proper way, through the Senate. That's more than I can say for his brother Grelin." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were ye? The Senate's sat eleven times since, an' got nothin' done in any o' them." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { origin = "gnome_gnomeregan_refugee" },
      text = "Ye've the look o' the ones who came up the road from Gnomeregan wi' nothin' but their boots. The Senate fed ye, ye know. Ye might remember that." },
    { id = "n_wild", cat = "wildhammer", when = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } },
      text = "Is that paint on yer arm? Wash it off before ye come up these steps again; this is the High Seat, no' an aerie." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "A warlock. Thaurissan was a sorcerer as well, an' his summonin' burned the Searing Gorge tae glass, so keep yer hands where I can see them." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Barin Redstone, Senator o' Ironforge. The King rules, but the Senate keeps the mines diggin' an' the soldiers paid, an' somebody has tae read the reports an' say no now an' then." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome in the High Seat. Yer tinkers have the run o' Tinker Town an' a fair stretch o' the Commons these days, so I suppose I shouldnae be surprised tae find one on my steps as well." },
        { id = "h_gnome_soft", when = { race = "Gnome", heardLine = "barin_redstone.gv_default" },
          text = "I've been thinkin' about what I told ye, gnome, an' I've no' enjoyed it. Ask what ye came tae ask." },
        { id = "h_wild", when = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } },
          text = "Wildhammer blood, by the look o' ye. Yer kin left this mountain an' the High King's throne behind them, so I'll no' be rollin' out a carpet." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A Bronzebeard, by the cut o' yer beard, an' welcome. There are few enough o' us left in the city who'll stand up an' say what this mountain's owed." },
        { id = "h_reports", tags = { "news" }, when = { questActive = Q },
          text = "Senir Whitebeard's report, at last. His brother Grelin went over the Senate's head wi' a letter carryin' the King's name, an' I've been waitin' for somebody tae send me the proper papers." },
        { id = "h_reports_done", when = { questDone = Q },
          text = "Whitebeard's report is wi' the Senate now, an' they're arguin' about trolls instead o' tunnels, for once. I'll take my small mercies." },
      },
      again = {
        { id = "h_again", text = "Well? The Senate sits in an hour, an' I'd like tae eat first." },
        { id = "h_again2", text = "Go on. I've another grievance or two left in me, if ye're askin'." },
        { id = "h_again_gnome", when = { race = "Gnome" }, text = "Anythin' else? Quickly, now." },
      },
      choices = {
        { text = "Senir Whitebeard sent me with his report.", next = "reports", when = { questActive = Q } },
        { text = "What's your quarrel with the Dark Iron?", next = "darkiron" },
        { text = "You don't think much of the gnomes.", next = "gnomes", when = { ["not"] = { race = "Gnome" } } },
        { text = "Do you blame my people for Gnomeregan, Senator?", next = "xgnome", when = { race = "Gnome" } },
        { text = "And the Wildhammer?", next = "wildhammer" },
        { text = "What does the Senate actually do?", next = "senate" },
        { text = "My kin are Wildhammer, Senator.", next = "xwild", when = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } } },
        { text = "Have you thought more about that vote?", next = "vote_again", when = { heardLine = "barin_redstone.gv_default" } },
        { text = "I've business for the Senate.", next = "BUSINESS" },
        { text = "I'll leave you to the Senate.", next = "END" },
      },
    },

    reports = {
      lines = {
        { id = "r_default", text = "Good. Ye see, there's a right way an' a wrong way tae ask this mountain for help, an' Grelin Whitebeard chose the wrong one. He wrote straight tae the King, an' the King signed it wi'oot a word tae the Senate, an' now every clerk in the city thinks he can do the same." },
      },
      choices = {
        { text = "The Senate should have its say.", next = "reports_say", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trolls don't wait for the Senate to sit.", next = "reports_trolls", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Does the King often go around the Senate?", next = "senate" },
      },
    },
    reports_say = {
      lines = { { id = "rs_default", text = "Aye, an' thank ye. A king who signs whatever's put in front o' him is a king wi' a very short reign, an' the Senate exists so Ironforge doesnae have tae learn that the hard way." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll be on my way.", next = "BUSINESS" } },
    },
    reports_trolls = {
      lines = { { id = "rt_default", text = "Ye sound like Grelin. The Frostmane have been in those hills since before my grandfather's day, an' they'll be there next week whether the Senate sits on Tuesday or Friday." } },
      choices = { { text = "Something else.", next = "BACK" }, { text = "I'll be on my way.", next = "BUSINESS" } },
    },

    senate = {
      lines = {
        { id = "s_default", text = "It keeps the mines producin' an' decides what goes tae the soldiers an' what goes tae the forges, an' it argues. Mostly it argues. Some o' my colleagues will tell ye there are nae Dark Iron in Dun Morogh at all, an' they'll tell ye wi' a straight face." },
      },
      choices = {
        { text = "And you think otherwise?", next = "darkiron" },
        { text = "Senator Stonehallow fights troggs himself, I hear.", next = "senate_stonehallow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senate_stonehallow = {
      lines = { { id = "ss_default", text = "Mehr Stonehallow does, out at Gol'Bolar wi' a hammer in his fist, an' the Senate laughs at him for it. I dinnae laugh, for I think he's the only one o' us who's seen what comes up out o' the deep when ye dig too far." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    darkiron = {
      lines = {
        { id = "d_default", text = "My quarrel? They tried tae take this mountain wi' fire an' sorcery, an' when that failed they called up somethin' worse an' let it burn the Searing Gorge tae glass. Now they've the King's own daughter, an' some in the Senate still say we should wait an' see.",
          fx = { learn = { "dark_iron", "thaurissan" } } },
      },
      choices = {
        { text = "Why is it so personal for you?", next = "darkiron_why" },
        { text = "What about Princess Moira?", next = "darkiron_moira" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron_why = {
      big = true,
      lines = {
        { id = "dw_default", key = true, text = "My great-grandfather stood at these gates when Thaurissan's sorcerers came, an' the family story is that they found him wi' his hammer still in his hand. We've a stone for him in the Mystic Ward, an' I touch it every mornin' on my way up, an' I've never once forgiven them." },
      },
      choices = {
        { text = "Every Dark Iron should answer for Thaurissan.", next = "darkiron_answer", fx = { affinity = 1, align = { light = -1 } } },
        { text = "They're slaves to the Firelord now, Senator.", next = "darkiron_slaves", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron_answer = {
      lines = { { id = "da_default", text = "Every one. They chose their thane, an' their thane chose fire, an' I'll no' be told the bairns o' traitors are innocent while they're still stokin' the same forges under Blackrock." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darkiron_slaves = {
      lines = { { id = "dl_default", text = "Slaves, are they? Then they're slaves who sharpen their axes for their master an' bring down the Thandol Span on our heads, an' I cannae tell the difference, so I'll no' try. Ye've a soft heart, an' that's yer business, but keep it out o' the Senate." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darkiron_moira = {
      lines = {
        { id = "dm_default", text = "Taken on the road through the Burning Steppes, wi' twenty o' our best around her. The King willnae say her name in the Senate, an' the Senate willnae say it in front o' him, an' meanwhile she's somewhere under that mountain in the hands o' Thaurissan's heir." },
      },
      choices = {
        { text = "Ironforge should march on Blackrock.", next = "BACK", reply = "Aye, an' I've said it in the Senate a dozen times, but nobody wants tae be the one who marches the King's army past the King's silence.", fx = { align = { honor = 1 } } },
        { text = "Better to send someone quiet, not an army.", next = "BACK", reply = "Quiet, aye, there's sense in that, an' fewer graves, but I'd want tae know who ye'd send, because Blackrock eats quiet folk for breakfast.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnomes = {
      lines = {
        { id = "g_gnomes", text = "They built a city under the snow wi'oot askin' this mountain's leave, let the troggs into it, an' then poisoned the whole place tae drive them out. Now the ground west o' Kharanos isnae safe tae walk, an' the Senate feeds every refugee who came up that road.",
          fx = { learn = { "gnomeregan" } } },
      },
      choices = {
        { text = "Is that all of it, Senator?", tag = "Persuade", next = "gnomes_vote",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = Q }, { origin = "dwarf_military_ward" }, { origin = "gnome_gnomeregan_refugee" } } } },
          fail = { next = "gnomes_fail", fx = { affinity = -1 } } },
        { text = "They were our allies. We owed them shelter.", next = "gnomes_owed", fx = { align = { light = 1 } } },
        { text = "Ironforge has fed them long enough.", next = "gnomes_enough", fx = { affinity = 1, align = { light = -1 } } },
        { text = "And Thermaplugg?", next = "gnomes_traitor" },
      },
    },
    gnomes_owed = {
      lines = { { id = "go_default", text = "Owed them, aye, for the tram an' the guns an' the war. An' we've paid it, three times over, wi' bread an' beds an' the whole o' Tinker Town. At some point a debt is settled, though nobody in this city will say so but me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes_enough = {
      lines = { { id = "ge_default", text = "Ye'd be surprised how few will say it aloud. The King's fond o' Mekkatorque, so the Senate smiles an' signs, an' I'm left tae be the sour one. Well, somebody has tae be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes_traitor = {
      lines = { { id = "gt_default", text = "Sicco Thermaplugg, who sold his own city tae the troggs an' sits in the ruins callin' himself king. One traitor among them, an' they swear he's the only one, an' I'm tae take their word for it, am I?" } },
      choices = {
        { text = "Every people has its traitors. Even dwarves.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_fail = {
      lines = { { id = "gf_default", text = "All of it? It's more than enough, an' I'll thank ye no' tae tell a senator what he does or doesnae mean. Was there somethin' else?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomes_vote = {
      big = true,
      lines = {
        { id = "gv_default", key = true, text = "No. When the troggs came up in Gnomeregan, Mekkatorque sent tae this Senate for the Ironforge Reserve, an' we argued three days over the cost o' sendin' it, an' I argued longest. On the fourth day word came that he'd flooded the halls wi' poison tae save what he could, an' I've been blamin' the gnomes for it ever since, because the other way round is harder tae carry." },
      },
      choices = {
        { text = "You couldn't have known what he'd do.", next = "gnomes_vote_after", fx = { affinity = 2 } },
        { text = "Then you owe them more than bread.", next = "gnomes_vote_after", fx = { affinity = 1 } },
      },
    },
    gnomes_vote_after = {
      lines = { { id = "gva_default", text = "Maybe. Ye'll keep that tae yerself, mind; the Senate's records say only that the matter was under discussion, an' that's how I'd like it tae stay. I've no' said it aloud in all the years since, an' I'm no' sure why I said it tae you." } },
      choices = { { text = "It stays with me.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },

    xgnome = {
      big = true,
      lines = {
        { id = "xg_default", text = "Blame ye? Yer people built a city in our mountain's shadow, lost it tae troggs, an' then poured poison through it so that nobody can have it. Then ye came up the road tae Ironforge an' the Senate's been payin' for yer beds ever since, so aye, I suppose I do." },
      },
      choices = {
        { text = "The troggs came from the deep, same as at Gol'Bolar.", next = "xgnome_troggs" },
        { text = "We lost our home and half our people, Senator.", next = "xgnome_lost", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Half our people are gone. Send your bill to them, Senator.", next = "xgnome_lost", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "There's more to it than that, isn't there?", tag = "Persuade", next = "gnomes_vote",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = Q }, { origin = "gnome_gnomeregan_refugee" }, { origin = "gnome_ironforge_raised" } } } },
          fail = { next = "gnomes_fail", fx = { affinity = -1 } } },
      },
    },
    xgnome_troggs = {
      lines = { { id = "xt_default", text = "Hmph. Aye, they came up at Gol'Bolar too, when our own miners dug where they shouldnae. That's a fair point, gnome, an' I'm no' fond o' fair points from folk I've made up my mind about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgnome_lost = {
      lines = { { id = "xl_default", text = "Half yer people, aye. I've seen the lists, an' I've no' forgotten them. That doesnae make the bill smaller, but I'll grant it makes the arguin' over it uglier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wildhammer = {
      lines = {
        { id = "w_default", text = "When the Three Hammers fought for the High King's throne, the Wildhammer lost an' took themselves off tae Grim Batol, an' then tae the Hinterlands when that went bad. Now they ride gryphons, paint their faces, an' answer tae nobody, least o' all this Senate.",
          fx = { learn = { "grim_batol" } } },
      },
      choices = {
        { text = "They fought beside us in the Second War.", next = "wildhammer_war" },
        { text = "The King has a Wildhammer friend near Gol'Bolar, I hear.", next = "wildhammer_farsen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildhammer_war = {
      lines = { { id = "ww_default", text = "Aye, on their birds, overhead, where it's dry an' safe an' the view's very fine. I'll grant they hate orcs as much as I do, but that's no' the same thing as bein' kin." } },
      choices = {
        { text = "Kin is kin, Senator. Bronzebeard or Wildhammer.", next = "BACK", reply = "Ye sound like Magni at a feast, an' he can afford tae be generous, but I've a long memory, an' the Wildhammer are still on my list.", fx = { align = { order = -1 } } },
        { text = "They chose to leave. That has a cost.", next = "BACK", reply = "At last, somebody who understands, an' ye'll forgive me if I write that down, because I'll be quotin' ye in the Senate the next time it comes up.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildhammer_farsen = {
      lines = { { id = "wf_default", text = "Farsen, the shaman, campin' on the hills above the quarry an' talkin' tae the wind on the King's behalf. Magni calls him an old friend. I call him a Wildhammer wi' the King's ear an' no seat in the Senate, an' I've said so, in session." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xwild = {
      big = true,
      lines = {
        { id = "xw_default", text = "Are they, now. Then ye'll know yer kin walked out o' this mountain after the Three Hammers an' never once asked tae come back. What do ye want from me, an apology on behalf o' the High King?" },
      },
      choices = {
        { text = "My kin bled at Grim Batol too. Remember that.", next = "xwild_blunt", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "I want nothing. I came to understand you.", next = "xwild_soft", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    xwild_blunt = {
      lines = { { id = "xwb_default", text = "Grim Batol. Aye, they did, an' Thaurissan's wife cursed the place so that nobody could live in it after. I'll grant ye that, an' I'll grant ye a temper worthy o' this mountain, whatever yer paint says." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwild_soft = {
      lines = { { id = "xws_default", text = "Understand me? That's a rare thing tae hear in this hall. Ye'll find it's no' complicated: I want the dwarves under one roof an' one law, an' every one who chose otherwise is a stone missin' from the wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    vote_again = {
      lines = {
        { id = "va_default", text = "More than I'd like. I put a question tae the Senate last week about the refugees' rations, an' I voted for more, an' Stonehallow looked at me as if I'd grown a second beard. Dinnae make anythin' of it." },
        { id = "va_gnome", when = { race = "Gnome" },
          text = "I have. I went down tae Tinker Town for the first time in a year an' watched them work, an' I didnae enjoy how much I admired it. Dinnae tell Mekkatorque; he'd be insufferable." },
      },
      choices = { { text = "Your secret's safe, Senator.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well now, that's the first sensible thing anyone's said tae me since the session opened. Ye've an eye for where the real work o' this mountain gets done, an' I'll no' forget it." },
        { id = "s2", text = "Flattery's cheap in this hall, but ye lay it on like someone who's actually read the Senate's record, so I'll take it. Go on, then, an' tell me what ye're after." },
      },
      fail = {
        { id = "f1", text = "I've had petitioners butter me up for forty years, an' every one o' them wanted a seal on somethin' afterwards. Save yer breath for the business ye came on." },
        { id = "f2", text = "That's a pretty speech, an' ye may take it over tae the King, who's fond o' them. The Senate deals in motions an' ledgers, an' I'm no' moved by fine words." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Ye've a tongue on ye that'd do well on the Senate floor, where we've been skinnin' each other for three hundred years. I'll grant ye that one, though ye'll no' get another so easy." },
        { id = "s2", text = "There's more spine in that than in half the clans' delegates, an' I mean it kindly. Aye, I can take a jab, so long as there's a point on the end o' it." },
      },
      fail = {
        { id = "f1", text = "Ye'll mind yer tongue before a Senator o' Ironforge, or ye'll find how long the guards can make the walk tae the gates feel. I've been mocked by better, an' they had the votes tae back it." },
        { id = "f2", text = "That was meant tae sting, I suppose, an' it's only shown me what manner o' guest ye are. I'll remember it the next time yer name crosses my desk." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "He glances toward the throne and lowers his voice.", text = "Easy, now, there's nae call for that in the High Seat. Ye've made yer point, an' I'm no' so proud that I cannae see when a matter's better settled quietly." },
        { id = "s2", text = "I've sat across from Dark Iron envoys who looked at me less hard than that, an' I didnae enjoy them either. Very well, ye have my attention, so say what ye want an' we'll be done." },
      },
      fail = {
        { id = "f1", text = "Are ye threatenin' a Senator in the King's own hall, wi' his guard no' twenty paces off? Ye've more nerve than sense, an' I've a mind tae let them explain the difference." },
        { id = "f2", text = "A Redstone doesnae scare, {g:lad|lass}, we only take notes. Yers is a short one, an' it says ye're no' tae be trusted wi' anythin' that needs a steady head." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's no' a matter I'll open tae someone the Senate barely knows. Come back when ye've given me reason tae think it's safe wi' ye." },
      { id = "gt2", text = "I know well enough, an' I'll keep it behind my teeth for now. A Senator doesnae hand out the mountain's business tae every stranger who asks." },
    },
    knows = {
      { id = "tp_knows", text = "Every report that reaches the Senate crosses my desk, an' I read them, which is more than some o' my colleagues can say. Ask, an' I'll tell ye what's in them, or what should be." },
    },
    background = { { id = "tp_bg", text = "Redstones have sat in the Senate since Madoran's day, an' we've spent most o' that time sayin' no tae kings. It's a family trade, like smithin', only louder." } },
    advice = { { id = "tp_ad", text = "Put it in writin' an' send it through the proper channels. Ye'd be amazed what gets done that way, an' what doesnae get done the other." } },
    dark_iron = { { id = "tp_darkiron", text = "Traitors, sorcerers an' slaves tae fire, an' the only thing standin' between them an' this hall is the Senate keepin' its nerve.", next = "darkiron" } },
    gnomeregan = { { id = "tp_gnomer", text = "A lost city an' an open bill, an' I'll say no more about it in public.", next = "gnomes" } },
    troggs = { { id = "tp_troggs", text = "They come up wherever we dig too deep, an' Stonehallow's the only one in the Senate who'll fight them himself." } },
    frostmane = { { id = "tp_frost", text = "Trolls in the hills, an' Whitebeard's reports say there are more than last year. I've read them twice." } },
    _none = { { id = "tp_none", text = "That's no' a matter before the Senate. Ask a clerk, or better yet, ask the King; he signs anythin'." } },
  },
}
