-- More of Eastvale and the farms: Sara Timberlain and Gerard Tiller.
-- Voices: bibles/sara.md, bibles/gerard.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sara Timberlain: turns Defias bandanas into fine linen, sewing out front where she hears everything.
P:NPC {
  key = "sara", id = TODO_NPC("Sara Timberlain"), name = "Sara Timberlain",
  bible = "bibles/sara.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "steady" }, values = { "ambitious", "witty" },
  notices = { "craft", "red" },

  greetings = {
    { id = "g_loom", text = "Careful, that's a warp thread you're standing on." },
    { id = "g_bandanas", when = { questActive = TODO_QUEST("Red Linen Goods") }, text = "Have you brought me bandanas? Only the red ones are any use to me, mind." },
    { id = "g_after", when = { questDone = TODO_QUEST("Red Linen Goods") }, text = "Hello again, my best supplier of thieves' laundry!" },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Feel this; that's Defias linen, washed twice, and nobody would believe where it came from. That's the beauty of it." },
    { id = "n_red", cat = "red", when = { questObjective = { TODO_QUEST("Red Linen Goods"), left = { max = 2 } } },
      text = "Nearly six, then; I can see the red poking out of your pack from here. Lovely colour, isn't it, though it's a shame about the people inside it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sara Timberlain. The loggers cut wood; I cut cloth. Somebody in this camp has to make something you'd want to wear." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Red Linen Goods") },
          text = "The Defias in Elwynn wear the best red linen I've ever seen. Wasted on thieves. Bring me their bandanas and I'll make something honest of them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Red Linen Goods") },
          text = "Six. Red, not burlap; the Northshire lot wear sacks on their heads, and I can't do anything with sacks." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Red Linen Goods"), days = 3 } },
          text = "A sash and a shirt out of six thieves' bandanas. If any of them come asking for their linen back, send them to me." },
        { id = "h_thread", when = { metBefore = true }, text = "I ran out of blue thread halfway through a hem and finished it in brown. Nobody's noticed, and you didn't either until I told you." },
        { id = "h_sit", when = { timesTalked = { max = 1 } },
          text = "Sit, if you like. Don't mind the needle; I can sew and listen at once. Most of this camp's news comes past my front step." },
      },
      again = {
        { id = "h_again", text = "Go on, I'm listening, and so is the needle." },
        { id = "h_again2", text = "What else? Only mind the thread while you think." },
      },
      choices = {
        { text = "Isn't that a little grim?", next = "grim" },
        { text = "What makes red linen so good?", next = "cloth" },
        { text = "What news comes past your step?", next = "camp" },
        { text = "I'm a tailor myself.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Robes from thieves' cloth, for a priest?", next = "priest", when = { class = "PRIEST" } },
        { text = "Red's a poor colour for sneaking.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll keep an eye out for red.", next = "END" },
      },
    },

    grim = {
      lines = { { id = "g_default", text = "Grim is leaving good cloth on a dead thief. I'm practical, Raelen says, and she says almost nothing nice about anyone." } },
      choices = {
        { text = "Where do the bandanas come from?", next = "grim_where" },
        { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    grim_where = {
      lines = {
        { id = "gw_default", text = "Defias camps, tucked all over Elwynn. Off the ones you've dealt with, preferably. I don't ask, and they don't complain." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },

    cloth = {
      lines = {
        { id = "c_default", text = "Dyed deep and woven tight. Somebody in that Brotherhood knows cloth, or stole from someone who did." },
      },
      choices = {
        { text = "The Defias Brotherhood?", next = "cloth_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_defias = {
      lines = {
        { id = "cd_default", text = "Masons, the talk goes: men who built half of Stormwind and were never paid for it. Builders know good materials, so it's funny where life takes people." },
      },
      choices = {
        { text = "That's not funny.", next = "BACK", fx = { learn = { "defias" }, opinion = { defias = "masons_wronged" } } },
        { text = "Thieves are thieves.", next = "BACK", fx = { learn = { "defias" }, opinion = { defias = "hardline" } } },
      },
    },

    camp = {
      lines = {
        { id = "cp_default", text = "Sawdust and deadlines, mostly. Raelen counts logs, the lads count days to payday, and I count what everyone says on the way past." },
      },
      choices = {
        { text = "Hear anything worth knowing?", next = "camp_gossip" },
        { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },
    camp_gossip = {
      lines = {
        { id = "cg_default", text = "Thomas lost two men up the river. Old Haggard lost his badge to a man in a borrowed tabard. And nobody's seen the Brackwells in weeks." },
      },
      choices = {
        { text = "That's a lot of losing.", next = "BACK", fx = { affinity = 1, learn = { "lost_footmen" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },

    tailor = {
      lines = {
        { id = "t_default", text = "Then here's a secret. Wash it twice in cold water and never press red linen hot. Thieves' dye runs if you rush it." },
      },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Why not? The cloth didn't choose who wore it. Bless it if it bothers you. It'll still be good linen afterwards." },
      },
      choices = {
        { text = "Fair. Cloth can be redeemed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Isn't it? I've always said so, and that's how you can tell the Defias want to be seen." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sew. I sit out front so I can see the road. That's all a person needs to know about me." } },
    advice = { { id = "tp_ad", text = "Mend a tear the day you get it. A small hole is a stitch; a week-old hole is a new coat." } },
    defias = { { id = "tp_defias", text = "Dreadful people with excellent taste in fabric. Life's complicated like that." } },
    eastvale = { { id = "tp_eastvale", text = "Sawdust in everything. My thread, my bread, my hair." } },
    _none = { { id = "tp_none", text = "Can I sew it? If not, I've no opinion on it." } },
  },
}

-- Gerard Tiller: farming is thirsty work. Works the Maclure vines, sees plenty, says little.
P:NPC {
  key = "gerard", id = TODO_NPC("Gerard Tiller"), name = "Gerard Tiller",
  bible = "bibles/gerard.md", role = "farmer", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "honest" },
  notices = { "drink" },

  greetings = {
    { id = "g_thirst", text = "Got any water on you, friend? Farming's thirsty work out here." },
    { id = "g_again", when = { questDone = TODO_QUEST("Give Gerard a Drink") }, text = "My water-bringer! Have you got any more? I've got apples." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Somebody's had something stronger than water, lucky you, and here's me out here with a hoe and a dry throat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gerard, and I work the vines. The sun's hot, the rows are long and the well's a long walk, so a man could die of thirst out here, slowly." },
        { id = "h_trade", tags = { "news" }, when = { questActive = TODO_QUEST("Give Gerard a Drink") },
          text = "Spring water's the good stuff. Bring me a flask and I'll give you an apple for it, and that's the best trade in Elwynn." },
        { id = "h_lovers", when = { topicKnown = "maybell_tommy" },
          text = "Miss Maybell goes down to the river most evenings, says she's counting grapes, though there are no grapes by the river. I don't say anything, since it's not my business." },
        { id = "h_vines", when = { metBefore = true }, text = "The vines are coming on. Another month and we'll have grapes, if the crows don't find them first. The crows always find them first." },
      },
      again = {
        { id = "h_again", text = "What else? Talk slow, it saves water." },
        { id = "h_again2", text = "Go on; the vines aren't going anywhere." },
      },
      choices = {
        { text = "Tell me about the vineyard.", next = "vines" },
        { text = "Why trade apples for water?", next = "water" },
        { text = "What about young Billy?", next = "billy" },
        { text = "Blessings on the harvest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I worked Westfall fields before the Defias came.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Here, have a drink.", next = "BUSINESS" },
        { text = "Keep at it, Gerard.", next = "END" },
      },
    },

    vines = {
      lines = {
        { id = "v_default", text = "Maclure grapes, in long rows under a hot sun, with crows. The family works hard and pays fair, and they never mention the Stonefields if they can shout instead." },
      },
      choices = {
        { text = "Do you mind the feud?", next = "vines_feud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vines_feud = {
      lines = {
        { id = "vf_default", text = "I'm a vine-hand, so I don't have feuds; I have blisters." },
      },
      choices = {
        { text = "Wise.", next = "BACK", fx = { affinity = 1 } },
        { text = "You must have an opinion.", next = "vines_opinion" },
      },
    },
    vines_opinion = {
      lines = {
        { id = "vo_default", text = "I do. I keep it in my mouth with my tongue. A vine-hand who talks about the family doesn't stay a vine-hand." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    water = {
      lines = {
        { id = "w_default", text = "Spring water's clean and the well's a walk, and I've got more apples than I can eat. That's trade." },
      },
      choices = {
        { text = "Isn't that a poor deal for you?", next = "water_deal" },
        { text = "Why not drink from the river?", next = "water_river" },
      },
    },
    water_deal = {
      lines = {
        { id = "wd_default", text = "It's the best deal in Elwynn: you get an apple, and I get to not die. Everybody goes home happy." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    water_river = {
      lines = {
        { id = "wr_default", text = "Folk say there's murlocs up the streams to the east. I don't know what murlocs do in water, and I don't want to drink it to find out." },
      },
      choices = { { text = "Fair.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },

    billy = {
      lines = {
        { id = "b_default", text = "The young Maclure? He's mostly harmless and mostly hungry. If something goes missing round here, ask where Billy was playing." },
        { id = "b_necklace", when = { questActive = TODO_QUEST("Lost Necklace") },
          text = "Auntie Bernice thinks he took her necklace? I couldn't say, or I could, but I won't." },
      },
      choices = {
        { text = "You know something.", next = "billy_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    billy_know = {
      lines = {
        { id = "bk_default", text = "I know the boy goes up toward the mine when he thinks nobody's watching. I'm a vine-hand, so I'm always watching; I'm just not telling." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kobolds" } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "I'll take any blessing going, and bless the crows away if you can. That's the prayer I'd want." },
      },
      choices = {
        { text = "Light keep the vines, and the man who tends them.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The crows have to eat too.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "Then you know what thirsty is, because Westfall dirt's drier than ours. Folk come past on the road looking like they haven't had water in a week." },
      },
      choices = {
        { text = "Most haven't.", next = "BACK", fx = { affinity = 1, learn = { "westfall" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a vine-hand on Maclure vines for Maclure wages, and that's me, top to bottom." } },
    advice = { { id = "tp_ad", text = "Carry water, more than you think you'll need, and then a bit more." } },
    maybell_tommy = { { id = "tp_lovers", text = "I see things from the vines. I don't say things. That's how a vine-hand keeps his job." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Have you got any water?" } },
  },
}
