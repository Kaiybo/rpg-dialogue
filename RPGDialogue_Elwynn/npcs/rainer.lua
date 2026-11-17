-- Deputy Rainer, at the gate of Westbrook Garrison. Voice: bibles/rainer.md
-- Asked for soldiers; got adventurers. Makes the best of it, loudly.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rainer", id = TODO_NPC("Deputy Rainer"), name = "Deputy Rainer",
  bible = "bibles/rainer.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "lawful", "brave" },
  notices = { "trophy", "kit" },
  impression = {
    first = "Deputy Rainer holds Westbrook with whatever the kingdom has left him, and he greeted me like the squad he asked for and never got. There was no bitterness in it, only tiredness.",
    third = "{name} met Deputy Rainer at Westbrook Garrison, the last post before Westfall, held with far too few soldiers.",
  },

  greetings = {
    { id = "g_gate", text = "Welcome to Westbrook Garrison, what there is of it." },
    { id = "g_help", when = { questActive = TODO_QUEST("Westbrook Garrison Needs Help!") }, text = "So Dughan sent you, did he? Good; I asked for a squad, but you'll do." },
    { id = "g_bounty", when = { questActive = TODO_QUEST("Riverpaw Gnoll Bounty") }, text = "Bring me proof off those gnolls, and a good fistful of it." },
  },

  notice = {
    { id = "n_hogger", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("WANTED: \"Hogger\"") },
      text = "Is that- that's Hogger's claw, Hogger's! Dughan's going to have to sit down when he sees that." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Gnolls got their teeth into you, I see. They go for the gaps in the armor. Close the gaps." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "By standing with my farmers when the gnolls come up out of the Riverpaw camps, for they're braver when they see someone throw fire. I've only a few real soldiers, and they're tired, so anything that makes the gnolls think twice keeps them alive another night." } },
      choices = {
        { text = "I'll stand with your farmers, Deputy.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather strike the gnoll camps than wait here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Deputy.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hunger at first, I'd say, but they've grown bold under Hogger and take more deer than they can eat. They leave the carcasses by the river, and the wolves follow the smell right up to my fence." } },
      choices = {
        { text = "Then Hogger must be stopped, for the forest's sake as well.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Let them waste the deer. Fewer deer means fewer wolves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "South of the garrison, at the shallows, and their tracks lead toward Hogger's camp every time. If you could follow them back, I'd know how many we're facing, which is more than the Army's told me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} will have their scent in no time. Gnolls smell worse than they look, and that's saying something." },
      },
      choices = {
        { text = "I'll follow them and bring you a true count.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll follow them and kill what I find.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd hire a gnoll to deal with Hogger if it came to that, because the Army's sent most of its soldiers abroad and I'm short of anyone with a blade. A rogue who can get close to him without being eaten would earn every copper." } },
      choices = {
        { text = "I'll face him fairly, Rainer. No knives in the dark.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll get close and finish him quietly. Fair's for fools.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Welcome isn't the word I'd use, but I'd take it, because Westbrook can't spare men and the gnolls can smell weakness. Just don't let anything you call up eat any of my lads, or Dughan will have my badge." } },
      choices = {
        { text = "I'll keep my demon from your lads. They'll be safe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your lads should learn to fear me as much as Hogger.", next = "BACK", fx = { align = { light = -1 } } },
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
          text = "Raelen said that? She sent word about bears near Eastvale, Eastvale, when I'm at the other end of the forest! Somebody tell her where Westbrook is." },
        { id = "h_seasoned", when = { minLevel = 25 },
          text = "Look at you. You came through that gate with a stick and a hopeful face. Now my lads stand up straighter when you pass." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, here at Westbrook. If you've come about the bounty, Hogger's the one on the notice, not me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and not from around here. Keep whatever that is away from my lads, because they're nervous enough with Hogger in the woods." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at Westbrook. The gnolls cross the river at night, and I could use someone who sees in the dark better than my lads." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, and you came in from the trees, not the road. That's a skill I'd sooner have on my side than out there with the gnolls." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I asked Stormwind for a squad and got a handful of farmers, so I'll take a mage gladly, and I'll not ask for anything else." },
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
        { text = "I'll help hold the road.", next = "END", fx = { affinity = 1, standing = { goldshire = 1 } } },
        { text = "Would you hire a rogue to deal with Hogger?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would a warlock's help with Hogger be welcome here?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where do the gnolls cross the river, Deputy?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the gnolls hunt the forest out of hunger, or for sport?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How could a mage best help Westbrook, Deputy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Good luck, deputy.", next = "END" },
      },
    },

    soldiers = {
      big = true,
      lines = {
        { id = "s_default", text = "Because the court decides where the Army goes, and the court doesn't live in Elwynn. So I write to the Marshal, and the Marshal sends adventurers, and here we are.",
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
        { text = "Then hold.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's not right.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, opinion = { westfall = "abandoned" } } },
      },
    },
    fine = {
      lines = { { id = "f_default", text = "You are, and that's what worries me. If you're good enough, they'll never send soldiers." } },
      choices = { { text = "Ha.", next = "BACK" } },
    },

    gnolls = {
      lines = {
        { id = "g_default", text = "Riverpaw. A big pack in the woods south of the tower, and another out by Stone Cairn Lake. They raid, they run, they come back." },
      },
      choices = {
        { text = "Who leads them?", next = "gnolls_hogger" },
        { text = "I'll bring you armbands.", next = "BACK", fx = { affinity = 1, learn = { "riverpaw" } } },
      },
    },
    gnolls_hogger = {
      lines = {
        { id = "gh_default", text = "That's Hogger; read the notice. He's big, cleverer than a gnoll ought to be, and he's beaten every patrol we've sent at him." },
        { id = "gh_dead", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Led, I should say, since you saw to that. The pack's still out there, but it's stupider now, and I'll take stupid." },
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
        { id = "wg_default", text = "Holds Sentinel Hill with farmers and pitchforks. Doing the army's job, better than the army would. Don't tell Dughan I said so." },
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
        { id = "p_default", text = "They need sleep more than prayers. But a priest at the gate does wonders. Half of them haven't seen the Abbey since they enlisted." },
      },
      choices = {
        { text = "Then I'll bring the Abbey to them.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { goldshire = 1 } } },
        { text = "Then let them sleep, since prayers won't help them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = {
        { id = "wa_default", text = "A night on the walls? The lads on the south side will want stories. Lie well; they've heard the true ones." },
      },
      choices = { { text = "I'll think of some.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Deputy of the Stormwind Army, at Westbrook. I hold a road with a handful of lads, and that's me." } },
    advice = { { id = "tp_ad", text = "Gnolls go for the gaps in your armor. Close the gaps." } },
    hogger = {
      { id = "tp_hogger", text = "South-west, up in the hills. You'll know him when you see him, though he'll know you first." },
      { id = "tp_hogger2", text = "Him again. Sit down; I'll tell you about the pack.", next = "gnolls" },
    },
    riverpaw = { { id = "tp_riverpaw", text = "Painted armbands, bad teeth, worse manners. Bring me the armbands." } },
    defias = { { id = "tp_defias", text = "They're coming up from Westfall like rats from a flood, and we hold the road, mostly." } },
    westfall = { { id = "tp_westfall", text = "Next door, and worse off. Stoutmantle's doing the Army's job with pitchforks." } },
    _none = { { id = "tp_none", text = "If it's not on the west road, it's not my problem, so try Dughan in Goldshire." } },
  },
}
