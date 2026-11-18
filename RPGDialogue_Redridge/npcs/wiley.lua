-- Wiley the Black, a corner of the Lakeshire Inn. Voice: bibles/wiley.md
-- Owes Gryan Stoutmantle his life, and pays in information. Blunt about it.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wiley", id = TODO_NPC("Wiley the Black"), name = "Wiley the Black",
  bible = "bibles/wiley.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "cunning", "honest" },
  notices = { "stealth", "watch" },

  impression = {
    first = "Wiley the Black sits in his corner and shares what he knows only with those he decides deserve it. He told me I was in his light, which I gather is how he says hello.",
    third = "{name} found Wiley the Black in his corner of Lakeshire, a man who knows things and does not share them with just anybody.",
  },

  greetings = {
    { id = "g_op_militia", when = { opinion = { topic = "peoples_militia", stance = "doomed" } }, text = "You're the one who thinks Gryan's farmers are finished. Keep saying that, loudly, in every inn you pass; it'll do the Brotherhood's overconfidence a world of good." },
    { id = "g_corner", text = "You're in my light." },
    { id = "g_gryan", when = { questActive = TODO_QUEST("The Defias Brotherhood") }, text = "Stoutmantle sent you; I can smell Westfall on you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit, if you're staying, and stand somewhere else if you're not." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you've come back to stand in my light again. Some things never change." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown teeth since Stoutmantle first sent you to my corner. Sit down, because that's worth a few words." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Heard you pulled the wool over somebody's eyes in town. Not bad, though I'd see it coming a mile off, so don't try it here." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word is somebody in town caught you lying. Sloppy, and sloppy gets people in my line of work killed." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "One of us, then. You walked in like you were checking the exits, and that's a good habit, so keep it." },
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "I heard you at the door, and at the bar, and just now. You want to work on that." },
    { id = "n_watch", cat = "watch", when = { questDone = TODO_QUEST("Red Leather Bandanas") },
      text = "You've been collecting red bandanas for Scout Galiaan at Sentinel Hill, and the men who wear them have started asking who you are. Thought you'd want to know." },
  },

  start = "hello",
  nodes = {
    op_militia = {
      lines = {
        { id = "op_militia_a", text = "My opinion? You don't get that from me for free, but I'll trade. It's farmers with pitchforks holding a hill against men who build things under mountains. I've my view, so let's hear yours first." },
      },
      choices = {
        { text = "They're the bravest men in the kingdom. I'd stand with them.", next = "op_militia_1", fx = { opinion = { peoples_militia = "admire", westfall = "abandoned" }, align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "Farmers playing soldier. The Defias will roll right over them.", next = "op_militia_2", fx = { opinion = { peoples_militia = "doomed" }, align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "Brave enough. What they need is better information.", next = "op_militia_3", fx = { opinion = { peoples_militia = "needs_help" }, trait = { witty = 1 }, affinity = 2 } },
        { text = "I'd rather hear your view first.", next = "BACK" },
      },
    },
    op_militia_1 = {
      lines = { { id = "op_militia_r1", text = "Brave, yes, and I'd add 'outnumbered'. That's my view too, though if you tell Gryan I said it, I'll call you a liar in front of the whole inn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_militia_2 = {
      lines = { { id = "op_militia_r2", text = "That's what the Defias think too, and they've been wrong about Gryan before. I'd not bet against a man who's too stubborn to die, and I owe him my neck to prove it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_militia_3 = {
      lines = { { id = "op_militia_r3", text = "Now you're flattering me, and I'm letting you. That's why I'm sitting in this corner instead of a ditch, and why Gryan pays for the drinks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Honesty, mostly, and patience. A shaman might have both, but I'll be the judge of that." } },
      choices = {
        { text = "Then I'll earn it fair and square, Wiley.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep your secrets. I'll find my own way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They hire anyone who can swing a weapon and keep their mouth shut, and most warriors can do one of those. Stoutmantle would pay you better, but the Brotherhood pays sooner, and some folk prefer that." } },
      choices = {
        { text = "I'll fight for Stoutmantle. The Defias get nothing from me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sooner pay sounds better. I'll hear their offer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the gnolls know them better than the guard does, and the Blackrock know them better than the gnolls. A hunter who can track a gnoll back to its camp could learn who's paying whom, and I'd pay to hear it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has its eye on my drink, {class}, and it can have the rest, because I don't like the look of it either." },
      },
      choices = {
        { text = "I'll take what I learn to the Marshal, not to you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the price is right, I'll tell you everything.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Pillagers, they call them, with more fire than sense and a habit of singeing their own boots. I could tell you which of them matter, but nothing I know comes free." } },
      choices = {
        { text = "Name your price. Information is information.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll not trade favours with the Defias.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What favour do you want?", next = "favor" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Am I? Funny, I didn't think your sort had any light to stand in. Sit down, then, because anyone who frightens the Brotherhood is someone I might want to talk to." } },
      choices = {
        { text = "Talk, then, and I'll keep the dark off you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'm no friend of the Defias or their shadows.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Who leads the Defias?", next = "leader" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Generous, and probably true, but no. I've a few debts to settle before I go anywhere. When I'm ready to vanish, I'll manage it myself, thank you." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Gryan might, though he'd never admit it, and that's about the whole list. I've done things that wouldn't sit well in a sermon, priest, so if you're thinking of starting one, you'll find I've heard better." } },
      choices = {
        { text = "Then I'll pray for you anyway, Wiley. No one's beyond it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some men aren't worth the breath. I'll save mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It shouldn't, and that's why I only tell Gryan, who knows exactly how much to believe. What I know is true, but I don't tell all of it, and the parts I leave out are mine." } },
      choices = {
        { text = "Then tell the Magistrate too. The law deserves the whole truth.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep your secrets, Wiley. Some things the law needn't hear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Wiley.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. Don't turn into anything in my presence; I've seen enough strange things this year." },
        { id = "h_default", text = "They call me Wiley the Black, some of them, and some call me worse. I sit in this corner and I know things, and I don't tell them to just anybody, only to Gryan Stoutmantle, because I owe him a favor." },
        { id = "h_defias", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "Gryan did me a favor once, the kind you don't repay with coin. So I pay him in what I know about the Brotherhood, and you'd best listen close." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "You've been down into the Deadmines under Moonbrook, and back out again. I've heard a lot of stories about that place. Yours is the first one I believe." },
        { id = "h_rude", when = { trait = "witty" },
          text = "Clever mouth. I like a clever mouth, but Gryan doesn't; Gryan likes manners, and that's why he needs me." },
        { id = "h_price", when = { metBefore = true }, text = "You're back, good. I've heard three new things since yesterday, and one of them's even true; guess which." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. I don't sell to people I don't like, and you've been working hard to make the list." },
        { id = "h_canal", when = { origin = "human_canal_pickpocket" },
          text = "Canal rat, aren't you. I can tell by the way you came in, with your back to the wall and one eye on the purses, and I'll thank you to keep your hands where I can see them." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You walked in like you were looking for something to hit, so I'll save you the trouble: it's not me." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. That beast of yours is in my light as well, and it's bigger than you, so I'll let it stay." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you're here to save me, you're standing in my light, and I'm not for saving." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You walked in like the law, and that's twice as bad as walking in like a warrior." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "You're in my light, shaman. I'll share what I know only if you deserve it." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep your voice down, the floor's thin." },
        { id = "h_again2", text = "Go on, quietly. Half this inn is ears, and the other half is Daniels." },
      },
      choices = {
        { text = "I could get you out of here unseen, as a cat.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What do you know about the Defias?", next = "defias" },
        { text = "What favor did Gryan do you?", next = "favor" },
        { text = "You've picked a good corner to sit in.", next = "corner" },
        { text = "I could use a man with your ears.", next = "rogue", when = { class = "ROGUE" } },
        { text = "VanCleef's dead. I was there.", next = "vancleef", when = { deed = "dungeon:The Deadmines" } },
        { text = "The Defias drove my family off our farm.", next = "farm", when = { origin = "human_westfall_farmhand" } },
        { text = "You're not the only one who sits quietly and watches.", next = "nightelf", when = { race = "NightElf" } },
        { text = "The Defias must have a spellcaster or two in their pay.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the Defias hire warriors, Wiley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do you know about the hills of Redridge, Wiley?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You're in my light, Wiley.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does anyone pray for a man like you, Wiley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should the law trust anything you tell it, Wiley?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What makes someone deserve your knowledge, Wiley?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Enjoy your corner.", next = "END" },
      },
    },

    defias = {
      lines = {
        { id = "d_default", text = "More than they'd like and less than I'd like. They're not thieves, because thieves don't drill and thieves don't keep a quartermaster." },
      },
      choices = {
        { text = "And their leader?", next = "leader" },
        { text = "They sound bigger than a few bandits.", next = "network" },
        { text = "Thanks, Wiley.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    leader = {
      lines = {
        { id = "l_default", text = "Ask Gryan. He's paying for that one, and you're not." },
      },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    network = {
      big = true,
      lines = {
        { id = "nw_default", text = "They hold every mine from Westfall to Elwynn, with kobolds and gnolls doing the digging and goblins building their iron golems. And the tunnels run closer to the Keep than anyone likes.",
          fx = { learn = { "defias", "harvest_watchers" } } },
      },
      choices = {
        { text = "What are they building down there?", next = "building" },
        { text = "Something else.", next = "BACK" },
      },
    },
    building = {
      lines = { { id = "bu_default", text = "They were stonemasons, and masons build big. Ask yourself how big, and then stop asking in public." } },
      choices = {
        { text = "You talk like you knew them.", next = "building_more" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    building_more = {
      lines = { { id = "bm_default", text = "I talk like a man who listens. You want to keep guessing at my past, the drinks are on you." } },
      choices = {
        { text = "Keep your secrets.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll find out eventually.", next = "BACK", fx = { affinity = -1, trait = { curious = 1 } } },
      },
    },

    favor = {
      lines = {
        { id = "f_default", text = "The kind that kept me breathing, and he's never let me forget it, or let me thank him properly. He thinks I'm rude, and I am." },
      },
      choices = {
        { text = "What do you really make of Gryan's militia?", next = "op_militia" },
        { text = "Sounds like you respect him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sounds like you owe him.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "You sound like you were in some kind of trouble.", next = "favor_rot" },
      },
    },
    favor_rot = {
      lines = { { id = "fr_default", text = "Ask him. He'll say he should have left me to rot. He means it about half the time, which for Gryan is affection." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    corner = {
      lines = { { id = "c_default", text = "It has sightlines to the door, the stairs and the window, and Daniels doesn't charge extra for it." } },
      choices = {
        { text = "Who's worth watching in here?", next = "watching" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watching = {
      lines = { { id = "wt_default", text = "The deputy who counts gnolls, the marshal who counts guards, the barkeep who counts bottles. Nobody counts the stranger who just came up the stairs, except me." } },
      choices = {
        { text = "And who counts you?", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = { { id = "ro_default", text = "Everyone could. Shaw's people already read what I write, and that's all the admirers I need. Watch the stairs, not the door; amateurs watch the door." } },
      choices = {
        { text = "Stairs. Noted.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vancleef = {
      lines = { { id = "vc_default", text = "Then the masons lost their foreman, but that doesn't mean they've stopped building. Check your exits for a while." } },
      choices = {
        { text = "I always do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm = {
      lines = { { id = "fa_default", text = "Then you know the Brotherhood better than anything I could tell you, and I'm sorry. I don't say that often, so take it while it's offered." } },
      choices = {
        { text = "Thank you, Wiley.", next = "BACK", fx = { affinity = 2 } },
        { text = "I don't want sorry. I want names.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { defias = "hardline" } } },
      },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "No, I'm not, and your lot are better at it than I'll ever be; I didn't hear you cross the room. What does a kaldorei want with Lakeshire's gossip?" } },
      choices = {
        { text = "Anything about the Defias.", next = "defias" },
        { text = "Just listening. Like you.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Deadmines are under Moonbrook, and they're full of Defias, and VanCleef's at the bottom of them. That's all I'll say about that, and that's more than I said to Stoutmantle." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's full of men who wore red with me, and some of them would love to see me in a cell beside them. I sleep with one eye open, and I sleep in this corner for a reason." } },
    stonemasons = { { id = "tp_stonemasons", text = "I was a mason once, before the nobles cheated us, before the red bandanas. Stoutmantle says that's the past now, and I'd like to believe him." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are just the Defias with family crests and better wine. I'd not go near them, and I'd not let you go near them either." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's full of people like me who did something wrong and paid enough not to talk about it. The goblins don't care who you were, as long as your gold's good." } },
    si7 = { { id = "tp_si7", text = "SI:7 has a file on me thicker than a Moonbrook mine cart, I'd wager. I'd like to see it one day, just to know which lies they believed." } },
    knows = {
      { id = "tp_knows", text = "I sit here and people talk, and what they say has a price. These, I might part with." },
    },
    background = { { id = "tp_bg", text = "I sit in a corner and know things. Before that, I sat in other corners." } },
    advice = { { id = "tp_ad", text = "Keep your back to the wall and your eyes on the stairs, and the rest is luck." } },
    defias = { { id = "tp_defias", text = "Organized, paid and patient. Whoever pays them has deeper pockets than any thief." } },
    westfall = { { id = "tp_westfall", text = "That's Gryan's war; I just supply the maps." } },
    blackrock = { { id = "tp_blackrock", text = "Not my business, friend. Orcs don't drink in here." } },
    _none = { { id = "tp_none", text = "If I knew, it'd cost you. I don't, so this one's free; enjoy it." } },
  },
}
