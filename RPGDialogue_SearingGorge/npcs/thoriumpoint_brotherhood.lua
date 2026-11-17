-- Thorium Point, more of the Brotherhood: Taskmaster Scrange (who pays out on the Wanted board) and Evonice Sootsmoker.
-- Voice: bibles/thoriumpoint_brotherhood.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_CULL = TODO_QUEST("JOB OPPORTUNITY: Culling the Competition")
local Q_STOLEN = TODO_QUEST("STOLEN: Smithing Tuyere and Lookout's Spyglass")

---------------------------------------------------------------------------
-- Taskmaster Scrange
---------------------------------------------------------------------------
P:NPC {
  key = "scrange", id = TODO_NPC("Taskmaster Scrange"), name = "Taskmaster Scrange",
  title = "The Thorium Brotherhood",
  bible = "bibles/thoriumpoint_brotherhood.md", role = "questgiver", tier = "quest",
  communities = { "thorium_point" }, temper = { "gruff", "wry" }, values = { "practical", "proud" },
  notices = { "race", "kit" },

  impression = {
    first = "Taskmaster Scrange pays out on the Brotherhood's Wanted board and has a ledger, a set of scales and a sense of humour that is mostly about blood. He used to drive slaves for the Dark Irons and now he pays strangers to kill the ones who still do.",
    third = "{name} met Taskmaster Scrange, the Thorium Brotherhood dwarf who pays bounties at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Ye've read the board, then, or ye've come tae gawk at a Dark Iron who isnae tryin' tae kill ye. Either way, ye're on my time." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still breathin', which is the first thing I look for in a hireling." },
    { id = "g_bloody", when = { questActive = Q_CULL }, text = "Not bloody enough yet, by the look o' ye, so get back out there afore the slavers notice ye're slackin'." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "An Ironforge dwarf takin' Dark Iron coin tae kill Dark Irons. I've seen stranger things in this gorge, but not many." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's hangin' off ye in strips. Hansel'll mend it, if ye ask nicely an' dinnae mention his fingers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Taskmaster Scrange, an' I pay out on the Brotherhood's board. Somethin' gets stolen, somebody gets culled, an' I'm the one wi' the purse at the end of it, so long as ye bring proof." },
        { id = "h_cull", when = { questActive = Q_CULL },
          text = "The slavers an' their taskmasters, fifteen o' each, an' I'll know when ye've done it, because ye'll come back lookin' like ye've been swimmin' in the Cauldron. Dinnae ask me how I'll know; ye'll know." },
        { id = "h_cull_done", tags = { "news" }, when = { questRecent = { Q_CULL, days = 3 } },
          text = "Fifteen pounds an' some, on the apparel alone! I've had the scales out for years an' nobody's come close, so ye've set a record at Thorium Point, for whatever that's worth tae ye." },
        { id = "h_stolen", when = { questActive = Q_STOLEN },
          text = "Ye've got the notice, then: one tuyere, one spyglass, both pinched by our own unhappy kin out in the gorge. Hansel's been sulkin' over his tuyere for a week, an' Lolo's been squintin' since he lost the glass." },
        { id = "h_stolen_done", tags = { "news" }, when = { questRecent = { Q_STOLEN, days = 3 } },
          text = "Hansel's forge is singin' again an' Lolo can see past the end o' his own nose, an' both o' them are pretendin' they never doubted ye. I doubted ye, mind, so consider yerself paid an' surprised me besides." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "An Ironforge dwarf at the Point, takin' work from a Dark Iron taskmaster. Yer grandfather would choke on his ale, an' so would mine, so we've that in common at least." },
      },
      again = {
        { id = "h_again", text = "What else? The board's no' gettin' any shorter." },
        { id = "h_again2", text = "Go on, ask. I'm payin' bounties, no' charity, but talk's free." },
        { id = "h_again3", text = "Still here? Then ye're either curious or ye're hopin' I'll pay ye for standin'." },
      },
      choices = {
        { text = "What work is there on the board?", next = "board" },
        { text = "Why do you call it culling the competition?", next = "cull" },
        { text = "A taskmaster? What did you used to do?", next = "past" },
        { text = "What exactly was stolen?", next = "stolen", when = { questBefore = Q_STOLEN } },
        { text = "Why weigh my clothes?", next = "scales", when = { any = { { questActive = Q_CULL }, { questDone = Q_CULL } } } },
        { text = "Ironforge and the Dark Irons can't both be right.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    board = {
      lines = { { id = "bo_default", text = "Two jobs right now, an' they're the same as they've been all season. The Dark Irons in the gorge keep stealin' our tools, an' they keep drivin' slaves through the Slag Pit, so I pay for the tools back an' I pay for the slavers dead." },
        { id = "bo_done", when = { all = { { questDone = Q_CULL }, { questDone = Q_STOLEN } } },
          text = "Ye've done both, an' done them well, which leaves the board lookin' thin until the Dark Irons think o' somethin' new. They always do, mind, so check back." } },
      choices = {
        { text = "Why do they steal tools?", next = "board_tools" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_tools = {
      lines = { { id = "bot_default", text = "Spite, mostly, an' because a tuyere from the Point is worth more tae a Dark Iron smith than his own forge. They think we stole the craft from the mountain when we left, an' they're no' entirely wrong, so they take it back a piece at a time." } },
      choices = {
        { text = "Then the Brotherhood did steal it?", next = "board_craft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_craft = {
      big = true,
      lines = { { id = "boc_default", text = "We took what was in our heads an' our hands, an' nobody can steal that, whatever the Emperor says. A smith's craft is his own, or it's nothin' at all, an' I'll fight any dwarf who says otherwise." } },
      choices = {
        { text = "A craft belongs to the one who learned it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A craft belongs to the people who taught it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cull = {
      lines = { { id = "cu_default", text = "Because that's what it is, plain an' simple. The slavers sell labour tae the mountain an' we sell craft tae the world, an' every slaver ye put down is one less man drivin' the price o' a Dark Iron's sweat intae the dirt." } },
      choices = {
        { text = "You make it sound like business.", next = "cull_business" },
        { text = "And the slaves themselves?", next = "cull_slaves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cull_business = {
      big = true,
      lines = { { id = "cub_default", text = "Everythin' up here is business, friend, or it's war, an' business is the one where fewer of us die. Oilfist says it's justice, an' I say justice pays the same rate, so I'm no' about tae argue wi' him." } },
      choices = {
        { text = "It's justice. Slavers deserve what they get.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It's business. Call it what pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    cull_slaves = {
      lines = { { id = "cus_default", text = "Most o' them run, when the slaver drops, an' some o' them run here, an' Oilfist feeds them an' I find them work. It's no' freedom, exactly, but it's paid, an' they can leave when they like, which is more than the Slag Pit offered." } },
      choices = {
        { text = "That's more than most would do.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    past = {
      lines = { { id = "pa_default", text = "I drove slaves for the Shadowforge, if ye must know, down in the Slag Pit wi' a whip an' a quota. I was good at it, an' I'm no' proud o' that, an' I'll thank ye no' tae make a face." } },
      choices = {
        { text = "What made you leave?", next = "past_leave" },
        { text = "I'm not making a face.", next = "past_leave", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_leave = {
      lines = { { id = "pal_default", text = "A Ragnaros feast-day, when they marched the weak ones intae the fire tae please him, an' I was meant tae count them in. I counted them in, an' then I walked up the road tae the Point an' never went back, an' I still count them some nights." } },
      choices = {
        { text = "You're doing better work now.", next = "past_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_now = {
      big = true,
      lines = { { id = "pan_default", text = "Maybe, an' maybe I'm just a taskmaster wi' a better master. Oilfist trusts me wi' the purse, an' I've no' stolen a copper of it, so that's somethin', though I dinnae think it settles the account." } },
      choices = {
        { text = "No account is ever settled. Keep paying it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The past is ash. Stop counting.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stolen = {
      lines = { { id = "st_default", text = "A smithing tuyere, which is the nozzle that feeds the bellows' air intae the forge, an' a lookout's spyglass, the good brass one. Both taken by Dark Irons out in the gorge, an' both missed somethin' terrible." } },
      choices = {
        { text = "Who'd steal a nozzle?", next = "stolen_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stolen_who = {
      lines = { { id = "stw_default", text = "Somebody who knows the Point cannae make good steel without it, an' that's a Dark Iron who used tae work here or knows one who did. Check the camps in the gorge, an' check the pockets o' anyone ye put down." } },
      choices = { { text = "I'll look. Something else.", next = "BACK" } },
    },

    scales = {
      lines = { { id = "sc_default", text = "Because ye cannae count fifteen slavers by lookin' at a body, an' I'm no' about tae walk the gorge tae check. So I weigh ye wi' yer clothes an' without, an' the difference tells me how much o' the Slag Pit ye brought home." } },
      choices = {
        { text = "That's disgusting, Scrange.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "And it works?", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    xdwarf = {
      lines = { { id = "xd_default", text = "They cannae, an' neither of us is, an' that's the trouble wi' a long feud. Ironforge says we chose the fire, an' the fire says we betrayed it, an' up here at the Point we just get on wi' the smithing an' let the kings argue." } },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Taskmaster in the Slag Pit, then a deserter, now the Brotherhood's purse-keeper. I've kept the title because Oilfist says it's good tae be reminded." } },
    _none = { { id = "tp_none", text = "If it's no' on the board, it's no' my concern. Ask Oilfist; everythin's his responsibility." } },
  },
}

---------------------------------------------------------------------------
-- Evonice Sootsmoker
---------------------------------------------------------------------------
P:NPC {
  key = "evonice", id = TODO_NPC("Evonice Sootsmoker"), name = "Evonice Sootsmoker",
  title = "The Thorium Brotherhood",
  bible = "bibles/thoriumpoint_brotherhood.md", role = "citizen", tier = "service",
  communities = { "thorium_point" }, temper = { "cheerful", "sly" }, values = { "ambitious", "curious" },
  notices = { "race", "purse" },

  impression = {
    first = "Evonice Sootsmoker is a Dark Iron of the Thorium Brotherhood who left the Depths, she says, to explore the world, though the word she started to say was 'exploit'. She is friendly, quick and keeps a very sharp eye on what everyone is carrying.",
    third = "{name} met Evonice Sootsmoker, a cheerful and slightly mercenary Dark Iron at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Oh, a visitor! Come in, come in, mind the slag, an' tell me where ye've been, because I want tae go there next." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did ye find anythin' worth bringin' home? I'm only askin' for science." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I've heard ye can make a machine that does the work o' ten dwarves, an' I've been dyin' tae see one, preferably for sale." },
    { id = "n_rich", cat = "purse", when = { money = { min = 100000 } },
      text = "That's a fine heavy purse, friend, an' I'm no' sayin' that because I'm interested in it, though I am." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Evonice Sootsmoker, o' the Thorium Brotherhood. We chose tae leave the comfort o' the Depths tae exploit, er, I mean, tae explore the world, an' that's exactly what I've been doin'." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "An Ironforge dwarf! I've always wanted tae see the Great Forge, ye know, just tae look, an' maybe tae see what they charge for their ore." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, all the way up here! Ye've come through the Badlands, I expect, an' ye'll know where the good ore is in Kargath's hills, so let's talk." },
      },
      again = {
        { id = "h_again", text = "What else? I'm all ears, an' most o' my ears are for business." },
        { id = "h_again2", text = "Go on, I've time. The slag's no' goin' anywhere." },
      },
      choices = {
        { text = "Exploit? Did you mean to say that?", next = "slip" },
        { text = "What's it like out of the Depths?", next = "outside" },
        { text = "What are you working on?", next = "work" },
        { text = "Gnomes don't sell their best machines.", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    slip = {
      lines = { { id = "sl_default", text = "Did I? I'm sure I said explore, an' anyway, what's the difference between the two, really, apart from who ends up wi' the gold? Oilfist made me say it twenty times when I joined, an' I still get it wrong." } },
      choices = {
        { text = "There's a big difference.", next = "slip_diff" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slip_diff = {
      big = true,
      lines = { { id = "sld_default", text = "Is there? The Emperor exploited us an' called it glory, an' the Brotherhood pays us an' calls it work, an' I'd say the Brotherhood's the honest one. If I'm goin' tae exploit anythin', I'd rather it was a seam o' ore than a dwarf." } },
      choices = {
        { text = "Take what the world gives. That's fair.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Explore it, but leave something behind. That's fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    outside = {
      lines = { { id = "ou_default", text = "Bright! Too bright, at first, an' I walked about squintin' for a month, but now I cannae get enough of it. In the Depths everything's red an' black an' hot, an' out here there's sky, which I'm told goes on forever, though I havenae checked." } },
      choices = {
        { text = "Where do you want to go first?", next = "outside_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outside_go = {
      lines = { { id = "oug_default", text = "The sea, because I've heard there's more water in it than in all the mountain's cisterns put together, an' I'd like tae see if that's true. An' then wherever the gold is, which I'm told is often near the sea." } },
      choices = { { text = "Good luck to you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    work = {
      lines = { { id = "wo_default", text = "Prospectin', mostly, out in the gorge, which is half mine an' half war these days. I find a seam, I mark it, an' the Brotherhood sends the miners, an' I get a share, which is a very good arrangement for everybody except the Dark Irons who were standin' on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xgnome = {
      lines = { { id = "xg_default", text = "No? Then I'll have tae trade for the second best, an' learn how it works, an' build the best one myself. That's how the Dark Irons learned smithin' in the first place, ye know, though we dinnae like tae say so." } },
      choices = { { text = "That's how gnomes learn too. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I grew up in Shadowforge City, sweepin' soot out o' the forges, which is where the name comes from, an' I got tired o' sweepin'. So I walked up the road one day an' kept walkin'." } },
    _none = { { id = "tp_none", text = "I dinnae know, but if there's money in it, come back an' tell me." } },
  },
}
