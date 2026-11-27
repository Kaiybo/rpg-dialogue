-- Thorium Point, more of the Brotherhood: Taskmaster Scrange (who pays out on the Wanted board) and Evonice Sootsmoker.
-- Voice: bibles/thoriumpoint_brotherhood.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_CULL = TODO_QUEST("JOB OPPORTUNITY: Culling the Competition")
local Q_STOLEN = TODO_QUEST("STOLEN: Smithing Tuyere and Lookout's Spyglass")

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
    first = "She keeps a very sharp eye on what everyone is carrying.",
    third = "{name} met Evonice Sootsmoker, a cheerful and slightly mercenary Dark Iron at Thorium Point.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
    { id = "dp_rep_tb_f", when = { rep = { faction = "Thorium Brotherhood", min = "Friendly" } }, text = "The Brotherhood counts you a friend, I hear. Good; we need friends out here more than we need ore." },
    { id = "dp_rep_tb_h", when = { rep = { faction = "Thorium Brotherhood", min = "Honored" } }, text = "The Brotherhood honours you, and I'll show you the finer bits of thorium, the pieces we keep for ourselves." },
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
        { id = "dd_rep", when = { reputation = { faction = "Thorium Brotherhood", min = "friendly" } },
          text = "Overseer Oilfist says ye're a friend o' the Brotherhood now, which means I'm no' allowed tae exploit ye. Explore ye, I mean, explore. Ach, ye know what I mean." },
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
        { text = "The world's there to be taken. Nothing wrong with that.", next = "BACK", reply = "Spoken like a dwarf who's earned a wage, an' I'll drink tae that. The world owes us a bit, after all.", fx = { align = { honor = -1 } } },
        { text = "Explore all you like, but leave something for the next dwarf.", next = "BACK", reply = "Fair, an' sensible, an' I'll grant it's kinder than the Emperor ever was. Leave a bit for the next lot.", fx = { align = { honor = 1 } } },
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
