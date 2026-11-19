-- Deputy Rainer, at the gate of Westbrook Garrison. Voice: bibles/rainer.md
-- Asked for soldiers; got adventurers. Makes the best of it, loudly.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rainer", id = TODO_NPC("Deputy Rainer"), name = "Deputy Rainer",
  bible = "bibles/rainer.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "lawful", "brave" },
  prejudice = { class = "WARLOCK", amount = 12, why = "His brother went through the Dark Portal with the expedition and never came back; blames the warlocks who opened it." },
  notices = { "trophy", "kit" },
  impression = {
    first = "He greeted me like the squad he asked for and never got.",
    third = "{name} met Deputy Rainer at Westbrook Garrison, the last post before Westfall, held with far too few soldiers.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "My brother went through the Dark Portal with the expedition and never came back, and it was warlocks that opened it. Keep away from my lads." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I asked the crown for soldiers and got a warlock. Stand by the gate where I can see you, and keep your creature on the far side of it." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've held this gate with us more than once, and the lads have stopped crossing themselves when you come. I haven't, quite, but I'm getting there." },
    { id = "g_gate", text = "Welcome to Westbrook Garrison, what there is of it." },
    { id = "g_help", when = { questActive = TODO_QUEST("Westbrook Garrison Needs Help!") }, text = "So Marshal Dughan sent you, did he? Good; I asked for a squad, but you'll do." },
    { id = "g_bounty", when = { questActive = TODO_QUEST("Riverpaw Gnoll Bounty") }, text = "Bring me proof off those gnolls, and a good fistful of it." },
  },

  notice = {
    { id = "n_hogger", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("WANTED: \"Hogger\"") },
      text = "Is that- that's Hogger's claw, Hogger's! Dughan's going to have to sit down when he sees that." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Gnolls got their teeth into you, I see. They go for the gaps in the armor, so close the gaps." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "There are murlocs and gnolls and too few men to face them, so I'll take any help, spirits included. You're welcome here." } },
      choices = {
        { text = "I'll hold the line with you, Deputy. Westbrook won't fall.", next = "BACK", reply = "That's the spirit, and I'll hold you to it when the gnolls come up out of the river. We could use a few more like you.", fx = { align = { order = 1 } } },
        { text = "Ask for more men. One shaman won't save you.", next = "BACK", reply = "I've asked, and I've asked again, and the letters come back thanking me for my patience, so I'll take one shaman and be glad of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "By standing with my farmers when the gnolls come up out of the Riverpaw camps, for my farmers fight braver when they see someone throw fire. I've only a few real soldiers, and they're tired, so anything that makes the gnolls think twice keeps them alive another night." } },
      choices = {
        { text = "I'll stand with your farmers, Deputy.", next = "BACK", reply = "Good, that's all I need, and the farmers will stand taller for it. Find me at the gate when the gnolls come.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather strike the gnoll camps than wait here.", next = "BACK", reply = "I'd rather that too, but I can't spare anyone to go with you. Mind yourself out there, because Hogger's camp bites back.", fx = { align = { honor = -1 } } },
        { text = "Something else, Deputy.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hunger at first, I'd say, but they've grown bold under Hogger and take more deer than they can eat. They leave the carcasses by the river, and the wolves follow the smell right up to my fence." } },
      choices = {
        { text = "Then Hogger must be stopped, for the forest's sake as well.", next = "BACK", reply = "Exactly right, and I'd be glad of anyone who'd take it in hand. Hogger's the root of it all.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Let them waste the deer. Fewer deer means fewer wolves.", next = "BACK", reply = "Fewer wolves, maybe, but the gnolls will come for my farmers next. I'll take your point, but I'll not take your advice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "South of the garrison, at the shallows, and their tracks lead toward Hogger's camp every time. If you could follow them back, I'd know how many we're facing, which is more than the Army's told me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "South of the garrison, at the shallows, and their tracks lead toward Hogger's camp every time. That {pet} will have their scent in no time, because gnolls smell worse than they look." },
      },
      choices = {
        { text = "I'll follow them and bring you a true count.", next = "BACK", reply = "That's just what I need, and I'll write it up for Dughan, so for once he'll have a real count.", fx = { align = { order = 1 } } },
        { text = "I'll follow them and kill what I find.", next = "BACK", reply = "Kill what you can, but bring me a count all the same. I need numbers more than bodies.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd hire a gnoll to deal with Hogger if it came to that, because the Army's sent most of its soldiers abroad and I'm short of anyone with a blade. A rogue who can get close to him without being eaten would earn every copper." } },
      choices = {
        { text = "I'll face him fairly, Rainer. No knives in the dark.", next = "BACK", reply = "Fair's a fine thing, and Hogger's never been fair a day in his life. Go carefully.", fx = { align = { honor = 1 } } },
        { text = "I'll get close and finish him quietly. Fair's for fools.", next = "BACK", reply = "I'll not ask how it's done, only that it's done. Westbrook will be grateful.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Welcome isn't the word I'd use, but I'd take it, because Westbrook can't spare men and the gnolls can smell weakness. Just don't let anything you call up eat any of my lads, or Marshal Dughan will have my badge." } },
      choices = {
        { text = "Nothing of mine will touch your lads. They'll be safe.", next = "BACK", reply = "Good, and I'll hold you to it. Dughan's fond of my badge, and so am I.", fx = { align = { light = 1 } } },
        { text = "Your lads should learn to fear me as much as Hogger.", next = "BACK", reply = "My lads already fear plenty, friend, and they don't need more. Keep it on the gnolls.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deputy Rainer. Westbrook's the last post before Westfall, and the kingdom's sent most of its soldiers abroad, so I've got what's left." },
        { id = "h_bounty", tags = { "news" }, when = { questRecent = { TODO_QUEST("Riverpaw Gnoll Bounty"), days = 3 } },
          text = "There are fewer gnolls on the west road this week, and my lads are walking patrols in pairs instead of fives. That's progress." },
        { id = "h_hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Have you seen the notice? That's Hogger, a big gnoll with a bigger appetite. The Army wants him dead, and so does everybody he's ever looked at." },
        { id = "h_gryan", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Westfall's worse off than here, believe it or not, and Gryan Stoutmantle's holding Sentinel Hill with farmers. Go and tell him Westbrook sends what it can, which is you." },
        { id = "h_raelen", key = true, when = { heardLine = "raelen.h_rainer" },
          text = "Supervisor Raelen said that? She sent me word about wild animals near Eastvale, when I'm at the other end of the forest! Somebody tell her where Westbrook is." },
        { id = "h_seasoned", when = { minLevel = 25 },
          text = "Look at you. You came through that gate with a stick and a hopeful face. Now my lads stand up straighter when you pass." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, here at Westbrook. If you've come about the bounty, Hogger's the one on the notice, not me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You're not from around here, and something about you sets my teeth on edge. Keep whatever that is away from my lads, because they're nervous enough with Hogger in the woods." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know a warlock when one walks up to my gate. Westbrook needs help, but not your kind of help, so keep your business short." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. You've earned a place at the gate, I'll give you that, but I still count the lads after you've gone." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at Westbrook. The gnolls cross the river at night, and I could use someone who sees in the dark better than my lads." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and you came in from the trees, not the road. That's a skill I'd sooner have on my side than out there with the gnolls." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I asked Stormwind for a squad and got a handful of farmers, so I'll take a mage gladly, and I'll not ask for anything else." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Riverpaw", min = 30 } }, text = "The farmers say the Riverpaw packs are thinner along the river this week, and the bodies they find have your mark on them. I asked Stormwind for a squad and got you, and I'm starting to think I got the better bargain." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I asked Stormwind for a squad and got you, and I'm not complaining, mind; you'll do." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I watch the road." },
        { id = "h_again2", text = "Go on. The gnolls give us a breather around now." },
      },
      choices = {
        { text = "Why so few soldiers?", next = "soldiers" },
        { text = "Tell me about the gnolls.", next = "gnolls" },
        { text = "What's happening in Westfall?", next = "westfall" },
        { text = "Supervisor Raelen's waiting on you in Eastvale.", next = "raelen", when = { heardLine = "raelen.h_rainer" } },
        { text = "I came over that border myself, from Westfall.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Your men look worn. Let me see to them.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll stand a night on your walls.", next = "watch", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Westbrook looks to be in danger, Deputy.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help hold the road.", next = "END", fx = { affinity = 1, standing = { goldshire = 1 } } },
        { text = "I'd guess you'd hire a rogue to deal with Hogger.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would help of my sort with Hogger be welcome here?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where do the gnolls cross the river, Deputy?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The gnolls seem to hunt this forest for sport.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How could a mage best help Westbrook, Deputy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Good luck, deputy.", next = "END" },
      },
    },

    soldiers = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the court decides where the Army goes, and the court doesn't live in Elwynn. So I write to Marshal Dughan, and the Marshal sends adventurers, and here we are.",
          fx = { hear = "stormwind_abandoned_westfall" } },
      },
      choices = {
        { text = "Where is the army, then?", next = "soldiers_abroad" },
        { text = "The court should come and see.", next = "BACK", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "Adventurers are doing fine.", next = "fine", fx = { trait = { brave = 1 } } },
      },
    },
    soldiers_abroad = {
      lines = {
        { id = "sa_default", text = "Abroad, and nobody tells a deputy where. They tell him to hold, so I hold, and I write letters." },
      },
      choices = {
        { text = "Then hold.", next = "BACK", reply = "I will, as long as there's a gate to hold. Somebody's got to.", fx = { align = { order = 1 } } },
        { text = "That's not right.", next = "BACK", reply = "It isn't, and I've said as much in every letter. Nobody's answered yet.", fx = { align = { order = -1 }, affinity = 1, opinion = { westfall = "abandoned" } } },
      },
    },
    fine = {
      lines = { { id = "f_default", text = "You are, and that's what worries me. If you're good enough, they'll never send soldiers." } },
      choices = { { text = "Ha.", next = "BACK" } },
    },

    gnolls = {
      lines = {
        { id = "g_default", text = "They're Riverpaw gnolls, with a big pack in the woods south of here and another out by Stone Cairn Lake. They raid, they run, and they come back." },
      },
      choices = {
        { text = "Somebody must lead them.", next = "gnolls_hogger" },
        { text = "I'll bring you their armbands for the bounty.", next = "BACK", fx = { affinity = 1, learn = { "riverpaw" } } },
      },
    },
    gnolls_hogger = {
      lines = {
        { id = "gh_default", text = "That's Hogger; read the notice. He's big, cleverer than a gnoll ought to be, and he's beaten every patrol we've sent at him." },
        { id = "gh_dead", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "That was Hogger, their leader, and I'm glad to say 'was', since you saw to him. The pack's still out there, but it's stupider now, and I'll take stupid." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "hogger", "riverpaw" } } } },
    },

    westfall = {
      lines = {
        { id = "w_default", text = "Thieves come over the border, and so do the farmers running from them. I can't always tell which is which until one of them pulls a knife." },
      },
      choices = {
        { text = "And Gryan Stoutmantle?", next = "westfall_gryan" },
        { text = "That's a hard way to live.", next = "BACK", fx = { affinity = 1, learn = { "westfall" } } },
      },
    },
    westfall_gryan = {
      lines = {
        { id = "wg_default", text = "He holds Sentinel Hill with farmers and pitchforks, and he's doing the army's job better than the army would. Don't tell Marshal Dughan I said so." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "westfall", "people_militia" } } } },
    },

    raelen = {
      lines = {
        { id = "r_default", text = "She's in Eastvale and I'm at Westbrook, with a whole forest between us. I'd help her if I had boots to spare, and I haven't." },
      },
      choices = {
        { text = "I'll carry word back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "Then you know how it is. Did anyone stop you at this gate on your way through? No, because there's nobody here to, and that's my whole complaint in one breath." },
      },
      choices = {
        { text = "I'm here now.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
        { text = "Something else.", next = "BACK", fx = { opinion = { westfall = "abandoned" } } },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "They need sleep more than prayers, but a priest at the gate still does wonders, because half of them haven't seen a chapel since they enlisted." },
      },
      choices = {
        { text = "Then I'll bring the Abbey to them.", next = "BACK", reply = "They'd be grateful for it, and so would I. Go on, they're by the fire.", fx = { affinity = 2, align = { light = 1 }, standing = { goldshire = 1 } } },
        { text = "Then let them sleep, since prayers won't help them.", next = "BACK", reply = "You might be right, and I'll not argue. I'll send them to their bunks and let you be.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "wa_default", text = "A night on the walls? The lads on the south side will want stories, so lie well, because they've heard all the true ones." },
      },
      choices = { { text = "I'll think of some.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Deputy of the Stormwind Army, at Westbrook. I hold a road with a handful of lads, and that's me." } },
    advice = { { id = "tp_ad", text = "Gnolls go for the gaps in your armor. Close the gaps." } },
    hogger = {
      { id = "tp_hogger", text = "Hogger keeps to the hills south-west of here. You'll know him when you see him, though he'll know you first." },
      { id = "tp_hogger2", text = "Him again. Sit down; I'll tell you about the pack.", next = "gnolls" },
    },
    riverpaw = { { id = "tp_riverpaw", text = "The Riverpaw wear painted armbands and have bad teeth and worse manners. Bring me the armbands." } },
    defias = { { id = "tp_defias", text = "They're coming up from Westfall like rats from a flood, and we hold the road, mostly." } },
    westfall = { { id = "tp_westfall", text = "Westfall's next door and worse off, and Gryan Stoutmantle's doing the Army's job there with pitchforks." } },
    _none = { { id = "tp_none", text = "If it's not on the west road, it's not my problem, so try Marshal Dughan in Goldshire." } },
    stonemasons = { { id = "tp_stonemasons", text = "Some of the Defias I've caught had masons' calluses on their hands, and that sits wrong with me. They built the city, and now they're on the wrong side of it." } },
    the_stockade = { { id = "tp_the_stockade", text = "I send every Defias I catch to the Stockade under guard, and the guard comes back saying the warden's short of cells. I'm short of men, so we're even." } },
    varian = { { id = "tp_varian", text = "Westbrook asked for soldiers and got adventurers, and I'd wager that's because the army is busy looking for its king instead of watching its roads. I'll say no more than that." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire draws every cutpurse in Elwynn to Goldshire for a week, and it's the only time my road goes quiet. I can't decide whether I like it." } },
  },
}
