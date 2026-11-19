-- Guard Thomas, the bridge west of Eastvale Logging Camp. Voice: bibles/thomas.md
-- Two of his footmen went up the river and didn't come back.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thomas", id = TODO_NPC("Guard Thomas"), name = "Guard Thomas",
  bible = "bibles/thomas.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "steady" }, values = { "lawful", "brave" },
  prejudice = { class = "WARLOCK", amount = 12, why = "His father died in the Second War under fire the Horde's warlocks called down." },
  notices = { "kit", "death", "lock_shards" },
  impression = {
    first = "He hasn't forgotten the two men he sent north along the river.",
    third = "{name} met Guard Thomas, who keeps the eastern bridge and still waits for word of his missing men.",
  },

  greetings = {
    { id = "hum_g1", when = { race = "Human" }, priority = 5,
      text = "A Stormwind citizen. Keep to the road, and if you see anything east of this bridge, report it to me before you tell the inn." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "My father died in the Second War under fire the Horde's warlocks called down. You'll stay on the east side of this bridge, and that's my last word." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "Two of my footmen went upriver and never came back, and I'll not lose a third to whatever walks behind you. Keep your distance." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've helped on this bridge more than once, and I've not forgotten it. I still don't like what you carry, and I'll still be watching it." },
    { id = "g_business", text = "State your business with the Stormwind Army." },
    { id = "g_search", when = { questActive = TODO_QUEST("Find the Lost Guards") }, text = "Have you found anything? Look north along the river, citizen; anything at all will help." },
    { id = "g_after", when = { questDone = TODO_QUEST("Report to Thomas") }, text = "Citizen, you have my thanks still, and you always will." },
    { id = "g_frontier", when = { questActive = TODO_QUEST("Protect the Frontier") }, text = "Thin out those wolves and bears, citizen; the logging camp's counting on you." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's not fit for the frontier, and I've buried men who thought theirs was, so see a smith in Goldshire." },
    { id = "n_died_here", cat = "death", when = { deathsHere = { min = 2 } },
      text = "You've been carried off this road twice already. I'd rather not write a third report with your name in it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 12 } },
      text = "The guards in Stormwind are told to count the shards on your lot, and I make it a good dozen in that pack. I'll not write it down, seeing as I need your help, but I counted." },
  },

  start = "hello",
  nodes = {
    dd_murloc_t = {
      lines = {
        { id = "dd_murloc_t_a", text = "Thinner, aye, but not gone, and they never are. They took Rolf and his men out there, and every one you put down is one less that'll do it to the next patrol." },
      },
      choices = {
        { text = "Then I'll keep at it until the lake is clean.", next = "dd_murloc_t2", fx = { align = { order = 1 } } },
        { text = "They were there first. We should leave them to their lake.", next = "dd_murloc_t2", fx = { align = { order = -1 } } },
      },
    },
    dd_murloc_t2 = {
      lines = {
        { id = "dd_murloc_t2a", text = "That's a fine thought, but tell it to the farmers whose nets they cut. Either way, the guards at the bridge sleep a little better for what you did, and so do I." },
      },
      choices = { { text = "Glad to hear it. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I sent two of them north along the river, and they never came back, so I'll take any help, even from spirits." } },
      choices = {
        { text = "I'll find them, Thomas. That's a promise.", next = "BACK", reply = "I'll hold you to that, and I'll be waiting at this bridge for whatever news you bring. Go carefully, because whatever took two soldiers won't think twice about you.", fx = { align = { order = 1 } } },
        { text = "They're probably dead. Don't hope too much.", next = "BACK", reply = "I know the odds as well as you do, but a man who stops hoping for his own soldiers has no business giving them orders. I'll keep hoping until somebody proves me wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Trust is a strong word, friend, and I asked Marshal Dughan for soldiers, not whatever you are. Still, I sent Rolf and Malakai north along the river and they didn't come back, so if your craft can find out what happened to them, I'll not ask how." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Trust is a strong word, friend, and I asked Marshal Dughan for soldiers, not whatever that is lurking at your heel. Still, Rolf and Malakai went north along the river and didn't come back, so if your servant can sniff out what happened to them, I'll not ask how." },
      },
      choices = {
        { text = "I'll find them, Thomas, and bring you the truth.", next = "BACK", reply = "The truth's all I'm asking, however hard it is. Go north along the water, and come back and tell me what you find.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll look, but I'll do it my own way.", next = "BACK", reply = "Your way's your business, so long as you look. I've no time to be particular about who does the searching.", fx = { align = { honor = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Murlocs along the river and wolves in the thickets, and the two men I sent north along the water never came back. Your kind might find it peaceful, but I've stopped going in without good reason." } },
      choices = {
        { text = "Then I'll look for your men and see what the river knows.", next = "BACK", reply = "If the river talks to you, then you hear more than I do. Ask it about Rolf and Malakai, and tell me what it says.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Men who go missing in the woods made their own choice.", next = "BACK", reply = "They went because I sent them, so their choice was mine. Don't put it on them, because I'll not let you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Webbed ones, broad as a shovel, and they go down to the water and don't come back out. Rolf and Malakai went that way, and I'd give a season's wages to know what they followed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} has a nose for water, I'd guess. If it shies at the shore, believe it, and pull back." },
      },
      choices = {
        { text = "I'll follow the tracks and find your men.", next = "BACK", reply = "Good, and you'll have better eyes for it than any guard I've got. Follow the prints to the water and see where they lead.", fx = { align = { honor = 1 } } },
        { text = "I'll follow them, but I'll not risk my beast.", next = "BACK", reply = "Your beast, your choice, and I'll not argue with it. Just look as far as you're willing, because every bit helps.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Murlocs by the lake, bandits in the hills and wolves everywhere else, and I've lost two good men to it already. If you've a quiet step, use it to look for Rolf Hartford, one of my men, because he's still out there somewhere." } },
      choices = {
        { text = "I'll look for Rolf, guard. He deserves to come home.", next = "BACK", reply = "Thank you for that, I mean it. He's a good lad with a wife in Goldshire, and she's asked me about him every day since.", fx = { align = { honor = 1 } } },
        { text = "Rolf's likely dead. I'll look after myself first.", next = "BACK", reply = "Then we've nothing more to say, you and I. I'll find someone who still thinks my men are worth a look.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, on the road to Redridge, and she cleared a pack of wolves faster than I could draw my sword. I didn't like being shown up, but I liked being alive, so I didn't complain." } },
      choices = {
        { text = "You'd have done the same for me, guard. We fight together.", next = "BACK", reply = "That's true enough, and I'd not forget it. All the same, it does a guardsman's pride no good to be rescued by a robe.", fx = { align = { honor = 1 } } },
        { text = "Next time, stand behind me. I'll handle the wolves.", next = "BACK", reply = "You've a high opinion of yourself, friend, and I've been on this bridge long enough to know where that ends. Still, I'll not say no to the help.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, and more since I sent Rolf and Malakai north along the river, because a man can't sleep easy after a thing like that. Nothing's answered me yet, but I keep asking, which is all a guardsman knows how to do." } },
      choices = {
        { text = "Keep asking. Prayers for the lost are never wasted.", next = "BACK", reply = "I'll keep at it, then, as long as I've breath for it. Thank you, because it's good to hear that from somebody who knows prayers better than I do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You did your duty, Thomas. Don't carry their fate as well.", next = "BACK", reply = "I gave the order, so their fate's mine to carry whether I like it or not. Kind of you to try and lift it, though.", fx = { align = { light = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Find my men, if you can, or find what took them, because there's something in the water east of here that the Army doesn't want to hear about. And if it's murlocs, like Remy at the inn says, bring back enough proof that nobody in Goldshire laughs at me again." } },
      choices = {
        { text = "I'll find your men and bring them home.", next = "BACK", reply = "That's all I'm asking, and more than the Army's offered. Go north along the river, and may the Light walk with you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your men are likely gone. I'll look after the living.", next = "BACK", reply = "Maybe they are, but I'll not stop hoping on your say-so. If you won't look, then go and look after your living, and I'll keep looking for my dead.", fx = { align = { honor = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    hu_men = {
      lines = {
        { id = "hum_men", key = true,
          text = "They were, the sort who'd stand you a drink at the Lion's Pride and tell you it was nothing. Both of them went into the east because I sent them, and that's the army for you: you send your own neighbours into the dark and wait to see who comes back." },
      },
      choices = {
        { text = "You can't carry that alone, Thomas.", next = "hu_men2" },
        { text = "Something else, guard.", next = "BACK" },
      },
    },
    hu_men2 = {
      big = true,
      lines = {
        { id = "hum_men2",
          text = "Somebody has to, and the Marshal's got all of Elwynn on his back already. When the city stops sending soldiers, the ones left on the line start carrying each other, and that's the only thing the Second War taught us that I'm still glad of." },
      },
      choices = {
        { text = "Then I'll carry some of it. Give me the next patrol.", next = "BACK",
          reply = "I'll hold you to that, citizen. The murlocs at Stone Cairn Lake could use counting, and I could use the report.",
          fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It isn't my weight, guard. I've my own to carry.", next = "BACK",
          reply = "Fair enough, and I'll not ask it of you. Keep to the road, then, and if you see anything in the east, you tell me first.",
          fx = { align = { honor = -1 } } },
        { text = "Carry on, guard.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "hum_h1", when = { race = "Human" },
          text = "You'll have had family in the army, most of us did, so you'll know why I don't leave this bridge. The men I lost were Elwynn men, the same as half the ones still standing." },
        { id = "dd_murlocs", when = { killed = { name = "Murloc", min = 30 } },
          text = "The fishermen at Stone Cairn Lake say the murlocs have pulled back from the shore, and they say a stranger did it. I'd like to buy that stranger a drink, and I think I'm looking at them." },
        { id = "dd_linen", when = { questDone = TODO_QUEST("Red Linen Goods") },
          text = "Sara Timberlain tells me you got her red linen back off the Defias. That's one less thing for her to shout at me about, so I'm grateful twice over." },
        { id = "dd_deaths_t", when = { deaths = { min = 10 } },
          text = "You've been carried off the field more than a few times by the look of you, friend. A soldier learns to pick fights, so pick yours better and I'll not have to write any letters." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because I've two men missing, and I've a feeling I'll need someone to say words before this is over." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at my bridge! Marshal Dughan said he'd send help, and I'd stopped believing him, so I'm glad to be wrong." },
        { id = "h_default", text = "Guard Thomas, of the Stormwind Army. I hold this bridge, and east of here the forest stops being friendly." },
        { id = "h_concerns", tags = { "news" }, when = { questActive = TODO_QUEST("Further Concerns") },
          text = "So Marshal Dughan sent you. I asked him for soldiers and got one adventurer, but I'll take what I'm given." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Find the Lost Guards") },
          text = "Rolf Hartford and Malakai Stone are my missing men. I sent them north along the river to look into the murloc talk, and they never came back." },
        { id = "h_malakai", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Find the Lost Guards"), days = 2 } },
          text = "That's Malakai's medallion, and I'll see it reaches his family. That's the job no one tells you about when you sign up." },
        { id = "h_rolf", tags = { "news" }, when = { questActive = TODO_QUEST("Discover Rolf's Fate") },
          text = "Rolf's still out there somewhere. You said the webbed tracks led toward the lake, so follow them and find him; whatever's left, I want to know." },
        { id = "h_report", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Thomas"), days = 3 } },
          text = "Murlocs, then. Remy at the inn said it first and half of Goldshire called him a liar, so I'll be buying Remy a drink, Light help me.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "h_later", when = { questLater = { TODO_QUEST("Report to Thomas"), days = 7 } },
          text = "I sent Rolf's and Malakai's names to the Marshal on a single page, and a page never seems enough." },
        { id = "h_westfall", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Westfall needs hands more than I do, so go to Gryan Stoutmantle at Sentinel Hill and tell him the Elwynn bridge sends regards." },
        { id = "h_hero", when = { townStanding = { town = "eastvale", min = 30 } },
          text = "The loggers talk about you, and so do my men, the ones I have left. It's all good talk." },
        { id = "h_seasoned", when = { minLevel = 25, questDone = TODO_QUEST("Report to Thomas") },
          text = "You found what became of my men, and now look at you. I still stand on this bridge, because somebody has to." },
        { id = "h_guard", when = { origin = "human_city_guard" },
          text = "You've the look of the Watch about you; I'd know that tired squint anywhere. Well, this bridge is the same work as the Trade District, only wetter and with murlocs." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue at my bridge. If you're heading east, you'll find plenty of trouble without making any." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Stand behind me on the bridge if there's trouble, because I'd rather you burned the wolves than me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you can read tracks, I've some by the lake I'd like explained, and none of them are friendly." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf at my bridge. If you've come from the east, you'll know the forest grows less friendly with every mile." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've a look about you I don't care for, friend. I'll take what help I can get on this bridge, but whatever walks with you stays on the east side of it." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know that smell, and I know what it means. Whatever walks with you stays across the river, and so do you, unless you've good reason." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "It's you again. You've done this bridge some good, so come across, though your friend still waits on the other side." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Prowler", min = 20 } }, text = "Fewer prowlers on the road these past nights, and the loggers say it's your doing. That's one less thing for me to watch from this bridge, and I'm grateful for it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I asked Marshal Dughan for soldiers and got you, and you'll do. Can your spirits find my two missing men?" },
      },
      again = {
        { id = "h_again", text = "Anything further, citizen?" },
        { id = "h_again2", text = "Go on, I'm listening, though I'll be watching the treeline while you talk." },
      },
      choices = {
        { text = "The murlocs at Stone Cairn Lake are thinner now.", next = "dd_murloc_t", when = { killed = { name = "Murloc", min = 30 } } },

        { text = "What happened to your men?", next = "men", when = { questDone = TODO_QUEST("Find the Lost Guards") } },
        { text = "What's out east?", next = "east" },
        { text = "Is anything else troubling this stretch of the forest?", next = "murlocs" },
        { text = "This bridge seems thinly held.", next = "army" },
        { text = "I came from Westfall. Nobody held a bridge for us.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll hold this bridge with you, Guard.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "What sort of trouble is there east of the bridge?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd guess you've fought beside a mage before, guard.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What tracks did you find near the lake, Guard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess you pray for the men under your command, Thomas.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin do at your bridge, Thomas?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What makes the forest east of here so unfriendly?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You wouldn't trust someone like me on your bridge, I'd wager.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What happened to your men, Guard Thomas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Your men were Stormwind folk, weren't they, guard?", next = "hu_men", when = { race = "Human" } },
        { text = "Carry on, guard.", next = "END" },
      },
    },

    men = {
      big = true,
      lines = {
        { id = "m_default", text = "They did their duty and went where they were sent, and that's all the comfort I've got. Some days it's thin." },
      },
      choices = {
        { text = "What were they like?", next = "men_who" },
        { text = "I could say words over their names.", next = "men_priest", when = { class = "PRIEST" } },
        { text = "They'd be proud you remember them.", next = "BACK", reply = "They would, I think, and that helps more than you'd guess. Rolf always said I worried too much over the roster.", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Then make sure it wasn't for nothing.", next = "BACK", reply = "I mean to, and every report I send up the road is for them. If somebody in Stormwind reads one, it'll be worth it.", fx = { affinity = 1, trait = { stern = 1 }, align = { order = 1 } } },
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
        { text = "Rolf Hartford and Malakai Stone. May the Light keep them both.", next = "BACK", reply = "Thank you for saying their names aloud. I've not been able to, not since the lake took them.", fx = { affinity = 3, align = { light = 2 }, standing = { eastvale = 2 }, learn = { "lost_footmen" } },
          journal = { first = "Said the names of Rolf Hartford and Malakai Stone at the Eastvale bridge. Guard Thomas stood at attention the whole time.",
                      third = "{name} prayed over Guard Thomas' lost footmen at the Eastvale bridge." } },
        { text = "Words won't bring them back from the lake, Thomas.", next = "BACK", reply = "No, they won't, and I'd not hoped they would. I only wanted somebody to say the words over them, but I'll not beg you for it.", fx = { align = { light = -1 } } },
      },
    },

    east = {
      lines = {
        { id = "e_default", text = "The Eastvale logging camp, Marshal Haggard's farm and the Tower of Azora, where the mage lives. Wolves and bears get bolder the further you are from Goldshire." },
      },
      choices = {
        { text = "The animals here seem unusually bold.", next = "east_bold" },
        { text = "I'll keep that in mind.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },
    east_bold = {
      lines = {
        { id = "eb_default", text = "Something deeper in the forest is pushing them out, though I don't know what, and whatever it is, I'd like it to stay there." },
      },
      choices = {
        { text = "I'll thin them out.", next = "BACK", fx = { affinity = 1, standing = { eastvale = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    murlocs = {
      lines = {
        { id = "mu_default", text = "Murlocs, if you can believe it, settled along the streams of eastern Elwynn, and nobody knows why they came. They're aggressive, and cleverer than fish have any right to be." },
        { id = "mu_remy", when = { heardClaim = "murlocs_in_elwynn" },
          text = "You've heard Remy's tale about the murlocs, then. Remy says a great many things, but this once, I'm afraid he's right." },
      },
      choices = {
        { text = "Can they be held back?", next = "murlocs_held" },
        { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } },
      },
    },
    murlocs_held = {
      lines = {
        { id = "mh_default", text = "Not with what I've got. I've told Marshal Dughan so in writing. A bridge and a handful of guards won't hold a lake." },
      },
      choices = {
        { text = "Then I'll be your handful.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { eastvale = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } },
      },
    },

    army = {
      lines = {
        { id = "a_default", text = "Most of the kingdom's strength is abroad, and what's left is spread from Northshire to Westbrook, so I hold a bridge with what I'm given." },
      },
      choices = {
        { text = "That must anger you.", next = "army_anger" },
        { text = "And Westfall gets less.", next = "army_westfall" },
      },
    },
    army_anger = {
      lines = {
        { id = "aa_default", text = "Anger isn't in my orders, but worry is. I write it down and send it to the Marshal, he sends it up, and somewhere along the way it stops." },
      },
      choices = {
        { text = "That's no way to run a kingdom.", next = "BACK", reply = "No, it isn't, but I'd lose my post for saying so, and you can say it louder than I can. Tell it to somebody in Stormwind, if they'll listen.", fx = { align = { order = -1 }, opinion = { westfall = "abandoned" } } },
        { text = "Orders are orders.", next = "BACK", reply = "They are, and I follow them, though it gets harder with every report that goes nowhere. Somebody has to hold this bridge, and it's me.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    army_westfall = {
      lines = {
        { id = "aw_default", text = "Westfall gets nothing, and Gryan Stoutmantle holds it with farmers. Anyone heading west has my respect, and my pity." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "westfall", "people_militia" } } } },
    },

    farmhand = {
      lines = {
        { id = "fh_default", text = "I know it, and I'd have held one if I'd been sent. That's no comfort to you, and I'm not offering it as one." },
      },
      choices = {
        { text = "It's something, coming from a soldier.", next = "BACK", reply = "It's all a soldier's got to give, I'm afraid. Westfall deserved better than us, and I'll not pretend otherwise.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Someone should answer for it.", next = "BACK", reply = "Someone should, and I'll not argue the point. Take it up the road to Stormwind, because it's beyond what one guard on a bridge can answer for.", fx = { align = { order = -1 }, opinion = { westfall = "abandoned" } } },
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
      lines = { { id = "warrior2_l", text = "Either one's more than Stormwind has sent me. Keep your shield low, because the murlocs come in at the knees." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Standing at this bridge all day, you hear a fair bit from the folk passing over. Ask me about any of this, and I'll tell you what I know." },
    },
    background = { { id = "tp_bg", text = "I'm Stormwind Army, and I go where I'm posted. I've been posted to this bridge, so this bridge is where you'll find me." } },
    advice = { { id = "tp_ad", text = "Don't follow the river north alone, because two good men did, on my orders." } },
    murlocs_east = {
      { id = "tp_murlocs", text = "They're up the river and around Stone Cairn Lake. Don't go alone; my men did." },
      { id = "tp_murlocs2", text = "Ask me properly, citizen. It's a report, not a rumor.", next = "murlocs" },
    },
    lost_footmen = { { id = "tp_footmen", text = "My lost men were Rolf Hartford and Malakai Stone. Remember those names, if you remember nothing else I tell you." } },
    eastvale = { { id = "tp_eastvale", text = "Eastvale's all loggers and their quotas, and they'd cut through a bear if it stood still long enough." } },
    defias = { { id = "tp_defias", text = "The Defias are Westfall's problem, mostly, and Gryan Stoutmantle's handling them, without much help from the city." } },
    _none = { { id = "tp_none", text = "That's above my post, citizen; you'd do better to ask the Marshal in Goldshire." } },
    scourge = { { id = "tp_scourge", text = "My uncle served in Lordaeron before it fell, and his last letter said the dead were walking in the villages. We never had another, and I stand at this bridge thinking of him more than I should." } },
    varian = { { id = "tp_varian", text = "I'm a soldier, so I'll only say that the Stormwind Army misses its king. We'll serve Highlord Bolvar until His Majesty returns, and we'll do it gladly." } },
    the_stockade = { { id = "tp_the_stockade", text = "I've walked a few thieves from this bridge to the Stockade in my time, and it's a long walk with a man who won't stop talking. I'd rather stand here." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire's at Goldshire the loggers cross my bridge with a week's wages, and most come back with none. I keep count, for the reports." } },
  },
}
