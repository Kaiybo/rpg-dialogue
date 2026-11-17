-- Guard Thomas, the bridge west of Eastvale Logging Camp. Voice: bibles/thomas.md
-- Two of his footmen went up the river and didn't come back.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thomas", id = TODO_NPC("Guard Thomas"), name = "Guard Thomas",
  bible = "bibles/thomas.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "steady" }, values = { "lawful", "brave" },
  notices = { "kit", "death" },
  impression = {
    first = "Guard Thomas holds the bridge with what little he has, and he asked Dughan for soldiers before he got me instead. He hasn't forgotten the two men he sent north along the river.",
    third = "{name} met Guard Thomas, who keeps the eastern bridge and still waits for word of his missing men.",
  },

  greetings = {
    { id = "g_business", text = "State your business with the Stormwind Army." },
    { id = "g_search", when = { questActive = TODO_QUEST("Find the Lost Guards") }, text = "Have you found anything? Look north along the river, citizen; anything at all will help." },
    { id = "g_after", when = { questDone = TODO_QUEST("Report to Thomas") }, text = "Citizen, you have my thanks still, and you always will." },
    { id = "g_frontier", when = { questActive = TODO_QUEST("Protect the Frontier") }, text = "Wolves and bears. The logging camp's counting on you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's not fit for the frontier. I've buried men who thought theirs was. See a smith in Goldshire." },
    { id = "n_died_here", cat = "death", when = { deathsHere = { min = 2 } },
      text = "You've been carried off this road twice already. I'd rather not write a third report with your name in it." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Trust is a strong word, friend, and I asked Dughan for soldiers, not whatever you are. Still, I sent Rolf and Malakai north along the river and they didn't come back, so if your craft can find out what happened to them, I'll not ask how." } },
      choices = {
        { text = "I'll find them, Thomas, and bring you the truth.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll look, but I'll do it my own way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Murlocs along the river and wolves in the thickets, and the two men I sent north along the water never came back. Your kind might find it peaceful, but I've stopped going in without good reason." } },
      choices = {
        { text = "Then I'll look for your men and see what the river knows.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Men who go missing in the woods made their own choice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Webbed ones, broad as a shovel, and they go down to the water and don't come back out. Rolf and Malakai went that way, and I'd give a great deal to know what they followed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} has a nose for water, I'd guess. If it shies at the shore, believe it, and pull back." },
      },
      choices = {
        { text = "I'll follow the tracks and find your men.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll follow them, but I'll not risk my beast.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Murlocs by the lake, bandits in the hills and wolves everywhere else, and I've lost two good men to it already. If you've a quiet step, use it to look for Rolf, because he's still out there somewhere." } },
      choices = {
        { text = "I'll look for Rolf, guard. He deserves to come home.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Rolf's likely dead. I'll look after myself first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, on the road to Redridge, and she cleared a pack of wolves faster than I could draw my sword. I didn't like being shown up, but I liked being alive, so I didn't complain." } },
      choices = {
        { text = "You'd have done the same for me, guard. We fight together.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Next time, stand behind me. I'll handle the wolves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, and more since I sent Rolf and Malakai north along the river, because a man can't sleep easy after a thing like that. Nothing's answered me yet, but I keep asking, which is all a guardsman knows how to do." } },
      choices = {
        { text = "Keep asking. Prayers for the lost are never wasted.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You did your duty, Thomas. Don't carry their fate as well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Find my men, if you can, or find what took them, because there's something in the water east of here that the Army doesn't want to hear about. And if it's murlocs, like Remy says, bring back enough proof that nobody in Goldshire laughs at me again." } },
      choices = {
        { text = "I'll find your men and bring them home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your men are likely gone. I'll look after the living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because I've two men missing, and I've a feeling I'll need someone to say words before this is over." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at my bridge! Dughan said he'd send help, and I'd stopped believing him, so I'm glad to be wrong." },
        { id = "h_default", text = "Guard Thomas, of the Stormwind Army. I hold this bridge, and east of here the forest stops being friendly." },
        { id = "h_concerns", tags = { "news" }, when = { questActive = TODO_QUEST("Further Concerns") },
          text = "So Dughan sent you. I asked him for soldiers and got one adventurer, but I'll take what I'm given." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Find the Lost Guards") },
          text = "Rolf Hartford and Malakai Stone. I sent them north along the river to look into the murloc talk, and they never came back." },
        { id = "h_malakai", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Find the Lost Guards"), days = 2 } },
          text = "Malakai's medallion. I'll see it reaches his family. That's the job no one tells you about when you sign." },
        { id = "h_rolf", tags = { "news" }, when = { questActive = TODO_QUEST("Discover Rolf's Fate") },
          text = "Rolf's still out there somewhere. You said the webbed tracks led toward the lake, so follow them and find him; whatever's left, I want to know." },
        { id = "h_report", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Thomas"), days = 3 } },
          text = "Murlocs, then. Remy at the inn said it first and half of Goldshire called him a liar, so I'll be buying Remy a drink, Light help me.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "h_later", when = { questLater = { TODO_QUEST("Report to Thomas"), days = 7 } },
          text = "Two names on a page to the Marshal. It's never enough page." },
        { id = "h_westfall", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Westfall needs hands more than I do. Gryan Stoutmantle, Sentinel Hill. Tell him the Elwynn bridge sends regards." },
        { id = "h_hero", when = { townStanding = { town = "eastvale", min = 30 } },
          text = "The loggers talk about you, and so do my men, the ones I have left. It's all good talk." },
        { id = "h_seasoned", when = { minLevel = 25, questDone = TODO_QUEST("Report to Thomas") },
          text = "You found my men, once, and now look at you. I still stand on this bridge, because somebody has to." },
        { id = "h_guard", when = { origin = "human_city_guard" },
          text = "You've the look of the Watch about you; I'd know that tired squint anywhere. Well, this bridge is the same work as the Trade District, only wetter and with murlocs." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue at my bridge. If you're heading east, you'll find plenty of trouble without making any." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Stand behind me on the bridge if there's trouble, because I'd rather you burned the wolves than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you can read tracks, I've some by the lake I'd like explained, and none of them are friendly." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf at my bridge. If you've come from the east, you'll know the forest grows less friendly with every mile." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll take what help I can get on this bridge, but I'll ask you to keep your demons on the east side of it." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Prowler", min = 20 } }, text = "Fewer prowlers on the road these past nights, and the loggers say it's your doing. That's one less thing for me to watch from this bridge, and I'm grateful for it." },
      },
      again = {
        { id = "h_again", text = "Anything further, citizen?" },
        { id = "h_again2", text = "Go on, I'm listening, though I'll be watching the treeline while you talk." },
      },
      choices = {
        { text = "What happened to your men?", next = "men", when = { questDone = TODO_QUEST("Find the Lost Guards") } },
        { text = "What's out east?", next = "east" },
        { text = "What do you know about the murlocs?", next = "murlocs" },
        { text = "Why is the bridge so thinly held?", next = "army" },
        { text = "I came from Westfall. Nobody held a bridge for us.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll hold this bridge with you, Guard.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "What sort of trouble is there east of the bridge?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Have you ever fought beside a mage, guard?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What tracks did you find near the lake, Guard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you pray for the men under your command, Thomas?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin do at your bridge, Thomas?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What makes the forest east of here so unfriendly?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you trust a warlock on your bridge, Thomas?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Carry on, guard.", next = "END" },
      },
    },

    men = {
      big = true,
      lines = {
        { id = "m_default", text = "They did their duty. They went where they were sent. That's all the comfort I've got, and some days it's thin." },
      },
      choices = {
        { text = "What were they like?", next = "men_who" },
        { text = "I could say words over their names.", next = "men_priest", when = { class = "PRIEST" } },
        { text = "They'd be proud you remember them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Then make sure it wasn't for nothing.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 }, align = { order = 1 } } },
      },
    },
    men_who = {
      lines = {
        { id = "mw_default", text = "I knew their names and their posts and their watch rota. I'm finding that's not much to know about a man. I should have asked more." },
      },
      choices = {
        { text = "You can't know everyone.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then ask the ones you still have.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "lost_footmen" } } },
      },
    },
    men_priest = {
      lines = {
        { id = "mp_default", text = "There's no grave; the lake has them, or what's left of them. Say the words here at the bridge, then, and I'll stand for it." },
      },
      choices = {
        { text = "Rolf Hartford. Malakai Stone. Light keep them.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { eastvale = 2 }, learn = { "lost_footmen" } },
          journal = { first = "Said the names of Rolf Hartford and Malakai Stone at the Eastvale bridge. Guard Thomas stood at attention the whole time.",
                      third = "{name} prayed over Guard Thomas' lost footmen at the Eastvale bridge." } },
        { text = "Words won't bring them back from the lake, Thomas.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    east = {
      lines = {
        { id = "e_default", text = "The logging camp, Marshal Haggard's place, the tower where the mage lives. Wolves and bears get bolder the further you are from Goldshire." },
      },
      choices = {
        { text = "Why are the animals so bold?", next = "east_bold" },
        { text = "I'll keep that in mind.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },
    east_bold = {
      lines = {
        { id = "eb_default", text = "Something deeper in the forest is pushing them out. I don't know what. Whatever it is, I'd like it to stay there." },
      },
      choices = {
        { text = "I'll thin them out.", next = "BACK", fx = { affinity = 1, standing = { eastvale = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    murlocs = {
      lines = {
        { id = "mu_default", text = "They've settled the streams of eastern Elwynn. Nobody knows why they came. They're aggressive, and cleverer than fish have any right to be." },
        { id = "mu_remy", when = { heardClaim = "murlocs_in_elwynn" },
          text = "You've heard Remy's tale, then. Remy says a great many things. This once, I'm afraid he's right." },
      },
      choices = {
        { text = "Can they be held back?", next = "murlocs_held" },
        { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } },
      },
    },
    murlocs_held = {
      lines = {
        { id = "mh_default", text = "Not with what I've got. I've told Dughan so in writing. A bridge and a handful of guards won't hold a lake." },
      },
      choices = {
        { text = "Then I'll be your handful.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { eastvale = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } },
      },
    },

    army = {
      lines = {
        { id = "a_default", text = "Most of the kingdom's strength is abroad. What's left is spread from Northshire to Westbrook. I hold a bridge with what I'm given." },
      },
      choices = {
        { text = "Doesn't that anger you?", next = "army_anger" },
        { text = "And Westfall gets less.", next = "army_westfall" },
      },
    },
    army_anger = {
      lines = {
        { id = "aa_default", text = "Anger isn't in my orders, but worry is. I write it down and send it to the Marshal, he sends it up, and somewhere along the way it stops." },
      },
      choices = {
        { text = "That's no way to run a kingdom.", next = "BACK", fx = { align = { order = -1 }, opinion = { westfall = "abandoned" } } },
        { text = "Orders are orders.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    army_westfall = {
      lines = {
        { id = "aw_default", text = "Westfall gets nothing. Gryan Stoutmantle holds it with farmers. Anyone heading west has my respect, and my pity." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "westfall", "people_militia" } } } },
    },

    farmhand = {
      lines = {
        { id = "fh_default", text = "I know it. I'd have held one if I'd been sent. That's no comfort to you, and I won't pretend it is." },
      },
      choices = {
        { text = "It's something, coming from a soldier.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Someone should answer for it.", next = "BACK", fx = { align = { order = -1 }, opinion = { westfall = "abandoned" } } },
      },
    },
    warrior = {
      big = true,
      lines = { { id = "warrior_l", text = "Would you? I've had three volunteers this month, and two of them ran when the murlocs came up out of the water singing. It's the singing that does it." } },
      choices = {
        { text = "I'll stand till relief comes.", next = "warrior2", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll go after them instead of waiting here.", next = "warrior2", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    warrior2 = {
      lines = { { id = "warrior2_l", text = "Either one's more than the Keep has sent me. Keep your shield low; they come in at the knees." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Standing at this bridge all day, you hear a fair bit from the folk passing over. Ask me about any of this, and I'll tell you what I know." },
    },
    background = { { id = "tp_bg", text = "I'm Stormwind Army, and I go where I'm posted. I've been posted to this bridge, so this bridge is where you'll find me." } },
    advice = { { id = "tp_ad", text = "Don't follow the river north alone. Two good men did, on my orders." } },
    murlocs_east = {
      { id = "tp_murlocs", text = "They're up the river and around Stone Cairn Lake. Don't go alone; my men did." },
      { id = "tp_murlocs2", text = "Ask me properly, citizen. It's a report, not a rumor.", next = "murlocs" },
    },
    lost_footmen = { { id = "tp_footmen", text = "Rolf Hartford and Malakai Stone. Remember those names, if you remember nothing else I tell you." } },
    eastvale = { { id = "tp_eastvale", text = "Loggers and their quotas. They'd cut through a bear if it stood still long enough." } },
    defias = { { id = "tp_defias", text = "Westfall's problem, mostly. Gryan Stoutmantle's handling it, without much help from the city." } },
    _none = { { id = "tp_none", text = "That's above my post, citizen; you'd do better to ask the Marshal in Goldshire." } },
  },
}
