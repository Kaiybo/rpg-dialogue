-- Tanner Camp: Sarah Tanner, the elemental leatherworker who chose to live in the Searing Gorge. Voice: bibles/tanner_camp.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sg_sarah_tanner", id = TODO_NPC("Sarah Tanner"), name = "Sarah Tanner",
  bible = "bibles/tanner_camp.md", role = "trainer", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "calm", "earnest" }, values = { "craft", "nature", "patient" },
  notices = { "craft", "race", "class" },

  impression = {
    first = "She speaks of fire and stone as if they were difficult colleagues.",
    third = "{name} met Sarah Tanner, an elemental leatherworker camped in the Searing Gorge.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Careful where you step, but come in; there's always room for a friend by the fire." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Careful where you step, and careful how you speak to me." },
    { id = "g_default", text = "Careful where you step, there's a hide curing on that rock and the rock's warm enough to finish the job. I'm Sarah Tanner, and you're a long way from anywhere." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back. Most people who visit once decide the Gorge is not for them." },
    { id = "g_away", when = { away = 14 }, text = "It's been {away}, hasn't it? Out here the days run together, but I remember faces; there are so few of them." },
    { id = "g_elemental", when = { questDone = TODO_QUEST("Elemental Leatherworking") }, text = "There you are. Have the elements been kind to your work, or are they still arguing with you?" },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You've leather-worker's hands, the knife calluses and the stained nails. Let me see your stitching before you say a word." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Then you hear what I only feel, and I'd trade my best hide for a single morning with your ears." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human, out here! Don't look so surprised; I'm not the strangest thing in the Gorge, though I may be the friendliest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I practise elemental leatherworking, and I teach it to anyone willing to give themselves to it. Fire, water, earth and air each leave a mark on a hide, and here in the Gorge, fire and earth are never further than your next step." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Elemental Leatherworking") },
          text = "Two each: a heart of fire, a globe of water, a core of earth and a breath of wind. When you can bring me all four, I'll know the elements have answered you." },
        { id = "h_done", when = { questDone = TODO_QUEST("Elemental Leatherworking") },
          text = "You've cast your lot, and the elements have accepted you. Come and learn whenever you're ready; the work only deepens from here." },
        { id = "h_lw_low", when = { profession = "Leatherworking", ["not"] = { profession = { name = "Leatherworking", min = 225 } } },
          text = "You're a leatherworker, but not ready for this yet, I think. Come back when your hands know the ordinary leather by heart." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "I don't mind your colours, and the Gorge doesn't either. Fire burns orc and human just the same." },
        { id = "dd_elementals", when = { killed = { name = { "Magma Elemental", "Inferno Elemental", "Blazing Elemental" }, min = 20 } },
          text = "You carry the smell of the Gorge's fire spirits on you; you've broken a good many of them. Their heat leaves a mark on a hunter the same way it does on a hide, and yours is plain to me." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I'm only scraping, and scraping can wait." },
        { id = "h_again2", text = "Ask away. Company's rare enough out here that I'm not about to waste it." },
        { id = "h_again3", text = "Go on. Mind the vent behind you; it breathes every few minutes." },
      },
      choices = {
        { text = "What is elemental leatherworking?", next = "craft" },
        { text = "Why live in the Searing Gorge?", next = "gorge" },
        { text = "What must I do to learn it?", next = "path", when = { profession = "Leatherworking" } },
        { text = "Isn't it dangerous out here alone?", next = "alone" },
        { text = "Do you hear the elements, like a shaman?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'd like some training.", next = "BUSINESS", when = { questDone = TODO_QUEST("Elemental Leatherworking") } },
        { text = "Good day, Sarah.", next = "END" },
      },
    },

    craft = {
      lines = {
        { id = "cr_default", text = "Leather made with the elements rather than against them. Ordinary tanning fights the hide until it gives up; we coax it, with fire and stone and water and wind, until it remembers what it was." },
      },
      choices = {
        { text = "How is that different from dragonscale work?", next = "craft_other" },
        { text = "It sounds more like magic than craft.", next = "craft_magic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_other = {
      lines = {
        { id = "co_default", text = "Dragonscale workers want armour that frightens, and the tribal workers want armour that remembers the beast. We want armour that belongs to the world itself, and you can only walk one of those roads." },
      },
      choices = {
        { text = "Only one? Why not learn all three?", next = "path_one" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_magic = {
      lines = {
        { id = "cm_default", text = "There's no spell in it, if that's what you mean, only patience and listening. But I've had hides go supple on a cold rock overnight, and I don't have a better word than magic for that." },
      },
      choices = {
        { text = "Maybe some things don't need explaining.", next = "BACK", reply = "No, they don't, and I've stopped trying to make them. The hides know their business better than I do.", fx = { align = { order = -1 } } },
        { text = "There's an explanation. You just haven't found it yet.", next = "BACK", reply = "Maybe, and you're welcome to sit on that rock overnight and find it. I'll be here with the kettle when you come back puzzled.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    path = {
      lines = {
        { id = "pa_default", text = "Prove the elements know you, by bringing me two each of their essences: a heart of fire, a globe of water, a core of earth and a breath of wind. And know before you start that you'll give up the dragonscale and tribal arts for good." },
      },
      choices = {
        { text = "Why must I give the others up?", next = "path_one" },
        { text = "Where do I find these essences?", next = "path_where" },
        { text = "I'm ready to commit.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    path_one = {
      lines = {
        { id = "po_default", text = "Because your hands learn one way of listening, and the other ways start to sound like shouting. I've seen leatherworkers try to keep a foot in every camp, and their work ends up belonging nowhere." },
      },
      choices = {
        { text = "Good. Mastery means picking one road and walking it.", next = "BACK", reply = "That's how I've always found it, and it's good to hear someone else say so. Pick yours carefully, and then don't look back.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Giving up two crafts for one? I'd rather keep my options open.", next = "BACK", reply = "I knew a tanner in Stormwind who kept all his options open, and his hides cracked in every one of them. Still, you'll find your own way, so come back and tell me how it goes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    path_where = {
      lines = {
        { id = "pw_default", text = "From the elementals themselves, wherever they gather. Fire's easy here, if you can stand the heat, and earth too; water and wind will send you further afield, and I'm sorry for that." },
      },
      choices = {
        { text = "Do you need to fight them for it?", next = "path_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    path_fight = {
      lines = {
        { id = "pf_default", text = "Usually, yes, and it troubles me more than I let on. The elementals here are wild and angry, but they're still the same forces I work with every day." },
      },
      choices = {
        { text = "Wild elementals are a danger. They must be fought.", next = "BACK", reply = "They must, sometimes, and I'll not pretend otherwise. I only wish it didn't feel like fighting family.", fx = { align = { light = -1 } } },
        { text = "Then take only what you need from them, no more.", next = "BACK", reply = "That's all I ask of anyone who comes through here. The Gorge has little enough to spare.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gorge = {
      lines = {
        { id = "go_default", text = "Because nowhere else in the world are fire and earth so close to the surface. In Stormwind I tanned hides in a shed by the canal, and I learned more here in a month than I did there in ten years." },
      },
      choices = {
        { text = "You came from Stormwind?", next = "gorge_home" },
        { text = "What have you learned here?", next = "gorge_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_home = {
      lines = {
        { id = "gh_default", text = "A long time ago, it feels like. My family tanned for the city guard, and I was meant to take over the shed, but I couldn't stop wondering why some hides held and some cracked." },
      },
      choices = {
        { text = "Your family must miss you.", next = "gorge_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_family = {
      lines = {
        { id = "gf_default", text = "My brother runs the shed now and writes twice a year, and both letters say the same thing: come home. I write back that I'm happy, and I am, mostly, though I'd give a lot for a loaf of Stormwind bread." },
      },
      choices = {
        { text = "Family comes first. You should go back someday.", next = "BACK", reply = "Maybe I will, one day, when I've learned what this place has to teach. Don't tell my brother I said so.", fx = { align = { honor = 1 } } },
        { text = "Your craft is your family now.", next = "BACK", reply = "It is, mostly, and the hides don't write letters asking me to come home. Still, I miss the bread.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_learn = {
      lines = {
        { id = "gl_default", text = "That the vents breathe on a rhythm, and a hide laid near one cures evenly if you turn it on the breath. That earth elementals shed dust that sets a dye harder than any mordant. And that I can stand at a lava vent without shaking now, which I couldn't do in spring." },
      },
      choices = {
        { text = "You learned all that out here, alone?", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    alone = {
      lines = {
        { id = "al_default", text = "It is, and I won't tell you otherwise. The Dark Irons leave me be, mostly, because I'm too poor to rob and too odd to bother with, and the Thorium Brotherhood buys my leather, which helps." },
      },
      choices = {
        { text = "You should move closer to Thorium Point.", next = "alone_point" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_point = {
      lines = {
        { id = "ap_default", text = "And listen to their forges all day instead of the ground? No, I'd learn nothing. Overseer Oilfist offered me a corner once, and I thanked him and stayed where I am." },
      },
      choices = {
        { text = "Safety matters more than study.", next = "BACK", reply = "It does, to most folk, and Oilfist would agree with you. I've never been very good at being safe.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Some knowledge is worth the risk.", next = "BACK", reply = "That's my thinking exactly, and it's why I'm still out here. Mind the fire elementals on your way out.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xshaman = {
      lines = {
        { id = "xs_default", text = "No, I only feel them, and I don't think I'd want to hear. From what I've seen of this place, the elements in the Gorge are furious, and whatever they're saying, I doubt it's kind." },
      },
      choices = {
        { text = "They're in pain. Someone should listen.", next = "BACK", reply = "Then you're braver than me, and I hope they listen back. Tell me what they say, if they say anything.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Furious is right. They need taming.", next = "BACK", reply = "Perhaps, but I've never tamed anything I didn't respect first. Go carefully with them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You're a good soul, and the elementals like you, which is saying something in the Gorge." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been careless here, and the Gorge doesn't forgive carelessness." },
    },
    knows = { { id = "tp_knows", text = "I know leather, and I know this corner of the Gorge better than I'd like. Ask away." } },
    background = { { id = "tp_bg", text = "A tanner's daughter from Stormwind who wanted to know why the hides crack. The question brought me here." } },
    advice = { { id = "tp_ad", text = "Lay a hide near a vent some evening and watch it, and you'll learn more than I could teach you in a week." } },
    _none = { { id = "tp_none", text = "I'm afraid I wouldn't know. Out here, news comes on the wind, and the wind doesn't say much." } },
  },
}
