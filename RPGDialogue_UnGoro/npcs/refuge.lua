-- Marshal's Refuge: the Marshal Expedition's last camp at the crater's northern rim. Voice: bibles/ungoro.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "williden", id = TODO_NPC("Williden Marshal"), name = "Williden Marshal",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "warm" }, values = { "curious", "responsible" },
  notices = { "level", "kit" },

  impression = {
    first = "Williden Marshal lost his base camps to the crater and still talks about Un'Goro like a man in love with it. He welcomed me warmly, and then he warned me twice about the dinosaurs.",
    third = "{name} met Williden Marshal, leader of the Marshal Expedition, at Marshal's Refuge in Un'Goro Crater.",
  },

  greetings = {
    { id = "g_refuge", text = "Welcome, welcome! You made it up the rim in one piece, which puts you ahead of most of my expedition." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece! The crater must like you, and it doesn't like many." },
  },

  notice = {
    { id = "n_young", cat = "level", when = { maxLevel = 50 },
      text = "You're braver than you are seasoned, friend. Stay near the rim until you've grown into the crater." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Was it raptors, or the plants? Don't laugh; the plants bite here too." },
  },

  start = "hello",
  nodes = {
    xpt_williden = {
      big = true,
      lines = { { id = "xpt_williden_default", text = "The crater happened, mostly; the raptors took the base camps and the devilsaurs took whatever the raptors left. A company is the only sensible way to cross Un'Goro, but even a company has to remember that this place was here long before us, and it doesn't care whose map it's on." } },
      choices = {
        { text = "Then we'll tame it bit by bit. That's how frontiers are won.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We'll respect it and take only what we need.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "We welcome anyone who'll help, and we've learned not to be picky. I'll only ask you to keep your demon away from the scholars, because J.D. Collie gets twitchy around anything that glows that isn't one of his crystals, and he's twitchy enough already." } },
      choices = {
        { text = "I'll keep my demon clear of the scholars.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Collie will have to get used to it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The crater happened, mostly, raptors and devilsaurs and the Gorishi silithid in their hives, and we fell back up here to the Refuge. I still love this place, Light help me, but I've learned to respect it, and I'd ask you to do the same before you go charging into it." } },
      choices = {
        { text = "I'll respect the crater, and help you take back your camps.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Respect won't save anyone. Strength will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I would, though I'm not sure which words fit, because the crater never left us anything to bury. The raptors and the oozes and the things in the tar don't keep graves, so say them over the camps, if you would, and I'll know they've been said." } },
      choices = {
        { text = "I'll say them at each camp, so your people are remembered.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The crater keeps its dead. Words won't call them back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Like a living thing, I'll be honest with you, one that breathes heat and eats anything foolish enough to stand still. The crystals glow, the springs boil and the mountain smokes, and every scholar I've brought down here has a different theory why, which is half the reason I keep coming back." } },
      choices = {
        { text = "Treat the crater as a host, not a prize.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Claim it, Williden. Knowledge belongs to whoever's brave enough.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Power, plainly, and old power, set in the crater by hands far older than ours. The pylons out in the green weren't put there by nature, so I'd like to know who built them before somebody clever tries to use them." } },
      choices = {
        { text = "Knowledge like that should be studied openly.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some things should be left alone until we understand them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The camps we lost still have our maps and journals in them, and the beasts have no use for paper. If someone could slip in and out without waking what's nesting there, I'd sleep better knowing our work wasn't wasted." } },
      choices = {
        { text = "Your scholars' work is worth the risk.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the crater keep it. No journal's worth a life.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_williden", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five of you, and you all made it through the crater's mouth in one piece! That's a better record than my last expedition had, so I'm very glad to see you." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Gorishi", min = 40 } },
          text = "The Gorishi are fewer around the old camp sites, and I'd swear the hives sound quieter at night. Keep that up, and I might even get my camps back someday." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, here at the Refuge! Well, the expedition takes all sorts, and the crater's dangerous enough that I'm glad of anyone who can call up a little help." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, here at the Refuge! The crater's taken three of my camps and a few good people with them, and I'd be glad of someone with a steady hand and a steadier faith." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here at the Refuge! Then perhaps you can tell me what the crater wants, because it's certainly made clear that it doesn't want my base camps." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here at the Refuge! The crater's taken three of my camps and a few good people with them, and I'd be glad of someone who knows the proper words for that." },
        { id = "h_default", key = true,
          text = "Williden Marshal, leader of the Marshal Expedition. My sister and I brought scholars and explorers down into Un'Goro for crystals and rare plants, but the crater had other plans, and we lost our base camps and fell back up here." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and I can see you sizing up the crater already. If it's a devilsaur you've got your eye on, I watched one take a supply wagon in its jaws, mule and all, so pick your ground before it picks you." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("Williden's Journal") },
          text = "My journal! It's somewhere back in the old camp, and everything we learned before we ran is in those pages." },
        { id = "h_salvation", when = { questActive = TODO_QUEST("Expedition Salvation") },
          text = "Our supplies are scattered across the crater, and every crate you bring back is another week we can stay, another week of discovery." },
        { id = "h_journal_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Williden's Journal"), days = 3 } },
          text = "My journal, back on my desk! Half the pages are muddy and one's been chewed, and it's still the best thing anyone's given me in a year." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There you are! Half the Refuge asks after you when you're down in the crater, and I tell them you're too stubborn to be eaten, which I hope is true." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage at the Refuge! J.D. will want to show you his crystals, and I'd be glad of a learned eye on them myself, because they hum in a way that I can't explain and don't entirely trust." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You move like someone who's been paid to go unnoticed, friend. Down in the crater that's a fine skill, and I won't ask who taught it to you." },
      },
      again = { { id = "h_again", text = "What else? Ask away, I've nothing but time and dinosaurs." } },
      choices = {
        { text = "What does this crater feel like to someone who knows it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's dangerous down there?", next = "danger" },
        { text = "What were you looking for?", next = "purpose" },
        { text = "Your sister?", next = "sister" },
        { text = "Am I ready for the crater?", next = "ready", when = { maxLevel = 50 } },
        { text = "What do the beasts here eat?", next = "beasts", when = { class = { "HUNTER", "DRUID" } } },
        { text = "My people tell of a world like this, long ago.", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Your guards couldn't hold the camps?", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "What do you think the crystals are, Williden?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you have work for someone who goes unnoticed?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you like words said for the people you lost, Williden?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What happened to your base camps, Williden?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the expedition welcome warlocks, Williden?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What happened to your last expedition, Williden?", next = "xpt_williden", when = { party = { size = 4 } } },
        { text = "I'll help the expedition.", next = "END", fx = { affinity = 2, standing = { marshals_refuge = 1 } } },
      },
    },
    danger = {
      big = true,
      lines = {
        { id = "d_default", text = "Everything down there is dangerous: raptors that hunt in packs, stegodons that charge anything that moves, pterrordax overhead, and the devilsaurs. There's one the size of a house we call King Mosh, and if the ground shakes, don't stop to look, just run." },
      },
      choices = {
        { text = "King Mosh?", next = "danger_mosh" },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    danger_mosh = {
      lines = { { id = "dm_default", text = "We named him after the noise he makes eating a tent, and I'm not joking; he ate two of ours with people standing nearby. We weren't in them, thank the Light." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    purpose = {
      lines = { { id = "p_default", text = "Crystals, rare plants, a few answers, and honestly a bit of money, because expeditions don't pay for themselves. Discovery's the best part, but funding's the necessary part." } },
      choices = {
        { text = "Was it worth it?", next = "purpose_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purpose_worth = {
      lines = { { id = "pw_default", text = "Ask me when everyone's home. Right now I'd say yes, and then I'd look at the empty tents and not be so sure." } },
      choices = {
        { text = "You can tell me how it really went down there.", tag = "Persuade", next = "purpose_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Williden's Journal") }, { class = "PRIEST" } } } },
          fail = { next = "purpose_cheer", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    sister = {
      lines = { { id = "s_default", text = "Hol'anyee, my co-leader, braver than me and a better shot than me, as she'll tell you herself. She's out past the rim most days, and I worry, though she'd laugh at that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ready = {
      lines = { { id = "r_default", text = "Honestly? Not yet, friend. Stay near the rim, take the small jobs and grow into it; the crater isn't going anywhere, and you should try not to either." } },
      choices = { { text = "Good advice.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    beasts = {
      lines = { { id = "b_default", text = "Each other, mostly, and anything that falls in from the rim. Keep your companion close, because the raptors have learned to go for the small ones first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    purpose_truth = {
      lines = {
        { id = "pt_default", text = "Honestly? We came down too fast and too sure of ourselves, and I signed off on every camp we lost. I put a cheerful face on it for the others, because a frightened expedition leader is the last thing anyone in this Refuge needs, but I lie awake counting tents too." },
      },
      choices = {
        { text = "You brought most of them back. That counts.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then slow down this time.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    purpose_cheer = {
      lines = {
        { id = "pc_default", text = "It went the way expeditions go, friend, which is sideways with dinosaurs! We're all still here, mostly, and that's the important part." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "I've heard tauren say this crater looks like the world when it was young, and after a year down here I'm inclined to believe them. Those great beasts walk about as though nobody ever told them the world moved on." },
      },
      choices = {
        { text = "Then leave it wild. Some places should stay as they were.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Study it carefully, and the crater will teach you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Williden.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "We had guards, good ones, and the crater ate them anyway, because there's no holding a line against something that weighs as much as a house. If you go down, fight from the rocks, and don't ever try to stand your ground against King Mosh." },
      },
      choices = {
        { text = "Some ground you hold anyway.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'll keep to the rocks, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Running an expedition means everybody's news ends up on my desk, muddy or not. Ask me about any of these, friend." },
    },
    background = { { id = "tp_ba", text = "I'm expedition leader by the accident of being the one who signed the papers. My sister did the hard part and I did the paperwork, and I still do." } },
    advice = { { id = "tp_ad", text = "If the ground shakes, run first and wonder later, because wondering is how we lost the tents." } },
    _none = { { id = "tp_none", text = "Not sure! But if it lives in the crater, it probably bites." } },
  },
}

P:NPC {
  key = "linken", id = TODO_NPC("Linken"), name = "Linken",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "earnest" }, values = { "brave", "honorable" },
  notices = { "race", "class" },

  impression = {
    first = "Linken can't remember where he came from or why, and he is cheerful about it in a way that hurts to watch. He is quite sure he's a warrior, because it feels right.",
    third = "{name} met Linken, a gnome at Marshal's Refuge who lost his memory somewhere in Un'Goro Crater.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, traveler! I'm sure I know something important, only I can't remember what. Have we met?" },
    { id = "g_back", when = { metBefore = true }, text = "You! I remember you, and that's a good sign, isn't it? I'm remembering things!" },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Do you happen to know me, by any chance? No, that's a pity. I'm not much for gadgets, I think; I think I'm a warrior, because it feels right." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, like me! I'm almost sure I'm a warrior, anyway, since the sword feels right in my hand." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not much, only that I think I'm a warrior, because it feels right, and I think I came from somewhere far away, because nothing here feels like home. Your demon's looking at me as though it knows something I don't, and I'd rather it didn't tell me, if it's all the same to you." } },
      choices = {
        { text = "Your past will come back in time. Be patient.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe some memories are better left forgotten.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I remember throwing something that came back to my hand, which feels like a hunter's sort of memory, doesn't it? The rest went with the raft, but my feet still know how to follow a raptor through the ferns, and that has to count for something." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} looks at me like it's met me before, which is more than I can say for most people, so I'll take that as a good sign." },
      },
      choices = {
        { text = "Rebuild who you were, Linken. Your past still matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the past. Be whoever you want to be now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I think I would, friend, though I'm not sure, which I suppose is the whole trouble. Something bad happened before I woke in the marsh, I can feel that much, but the not knowing feels worse than any memory could." } },
      choices = {
        { text = "Then I'll pray the truth comes back to you gently.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Forgetting is a mercy. Leave the past buried where it fell.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Everything feels strange to me, friend, but the crater feels strange in a friendly sort of way. The plants grow too big and the beasts are too old, as if this place forgot to keep up with the rest of the world, the way I've forgotten everything." } },
      choices = {
        { text = "The crater should be studied and understood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The crater should be left just as it is.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Now there's a thought, because somebody ought to remember it! All I know is I woke in the marsh with my head ringing, and the water there felt friendly, as if it had carried me somewhere on purpose and was waiting to see what I'd do next." } },
      choices = {
        { text = "Your memories are yours. Find them, whatever it takes.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe the past is best left drowned. Start fresh.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, I don't think so, because I've never wanted to take anything that wasn't mine, except perhaps my memory back. Still, if I was a thief, I'd hope I was a good one, and that I only stole from people who deserved it." } },
      choices = {
        { text = "Stealing from the wicked is still stealing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some people do deserve to be robbed.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's try a different question.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what Williden says too, and he says it kindly, which almost makes it worse. I suppose I'll have to find it the hard way, one piece at a time, the way you'd search a marsh for a dropped coin." } },
      choices = {
        { text = "You'll find it. Don't give up on yourself.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things are better left forgotten.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Would you? I don't know if it'll help, but I've a feeling I left something important undone somewhere far away, and that's the worst part of forgetting. Even if the Light can't give it all back, I'd like to know it tried." } },
      choices = {
        { text = "Your past will come back in its own time. Be patient.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the past go, Linken. Make yourself someone new.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sometimes I think so, because when I see something small in danger, I'm already running before I've decided to. A knight would do that, wouldn't he, or a fool, and I'd like to think there's a little of the first in me." } },
      choices = {
        { text = "Knighthood needs discipline, Linken, not just a brave heart.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Never mind titles. A brave heart is enough.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You know, I have the oddest feeling I've met warlocks before, but I can't remember where, and I'm not sure whether that's a good thing or a bad thing." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I feel like I've met people who talk to the wind before, though I can't for the life of me remember where, which I suppose is the trouble with everything lately." },
        { id = "h_default", key = true,
          text = "They call me Linken, and I think it's my name. I came to this crater on a mission from somewhere far away, and then my raft broke up in the marsh, something hit my head, and the rest went with the raft." },
        { id = "h_secret", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("It's a Secret to Everybody") }, { questActive = TODO_QUEST("Linken's Sword") } } },
          text = "You found my things, and my sword! I'd know it anywhere... well, I'd know it here, anyway." },
        { id = "h_adventure", when = { any = { { questActive = TODO_QUEST("Linken's Adventure") }, { questActive = TODO_QUEST("It's Dangerous to Go Alone") } } },
          text = "It's coming back to me: a fire elemental called Blazerunner, and a flame, a golden one, that I was meant to bring home. I think you'd better be the one to finish it, just in case I forget again." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You know, I have the oddest feeling I've met someone who could turn into a beast before, though of course I can't remember a thing about it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You've got quiet feet! I think I had quiet feet once, or I knew someone who did; it's hard to tell which memories are mine and which ones the raft took." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can mages find lost things? I've lost quite a lot, you see, and most of it was inside my own head." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Do your prayers ever help a fellow remember things, because I've tried shouting at the sky and the sky hasn't been at all forthcoming." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "You're a priest? Can priests mend a head that's been hit, do you think, because mine was, and the rest of me is fine, but there are holes in it where things ought to be." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, with a shield like mine! I can't remember who taught me to use it, but my arm knows how, and I'm told that's a good sign." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I think I used to know one, or maybe I was one, before the raft. No, I'm fairly sure it was a sword I carried, though I'm also fairly sure about a boomerang." },
      },
      again = { { id = "h_again", text = "Ask! Quickly, before I forget you asked." } },
      choices = {
        { text = "Do the spirits here remember what you've forgotten, Linken?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the crater feel strange to you, Linken?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do you remember?", next = "memory" },
        { text = "Tell me about your sword.", next = "sword" },
        { text = "Who looks after you here?", next = "friends" },
        { text = "Do you remember Gnomeregan?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "Want to spar?", next = "spar", when = { class = "WARRIOR" } },
        { text = "Do you recognize my people, Linken?", next = "x_skyborne", when = { race = "Skyborne" } },
        { text = "Maybe you were a thief, not a warrior.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Magic can't mend a lost memory, Linken.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you like me to pray over your memory, Linken?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you want to remember, Linken, even if it hurt?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you think you were a knight, once?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you remember anything about hunting, Linken?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you remember anything of who you were, Linken?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll help you remember.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
    memory = {
      lines = {
        { id = "m_default", text = "Only bits: green fields, a sword, and someone telling me never to set off alone, though I can't see their face. I wandered for days after the raft, and that one piece of advice walked me here." },
      },
      choices = {
        { text = "Then you're not alone now.", next = "BACK", fx = { affinity = 3 } },
        { text = "What else did they say?", next = "memory_more" },
      },
    },
    memory_more = {
      lines = { { id = "mm_default", text = "A name, maybe, or a song; it's been on the tip of my tongue for weeks. I'm told that's where most of me lives now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sword = {
      lines = { { id = "s_default", text = "It feels right in my hand, the way a word feels right in your mouth before you remember what it means. It's not a gadget, and I don't like gadgets... I think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    friends = {
      lines = { { id = "f_default", text = "J.D., who's sure crystals will fix my head, and Williden, who feeds me, and people who come to the Refuge and listen, like you! I'm lucky, for someone who can't remember being unlucky." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnomeregan = {
      lines = { { id = "g_default", text = "Gnome-re-gan, is that a place? It sounds busy, and loud, and home was green, I'm almost sure, green and quiet." } },
      choices = {
        { text = "It was a city. It's gone now.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spar = {
      lines = { { id = "sp_default", text = "Yes! Or no, maybe? My arm remembers more than my head does, but let's not, because if my head gets hit again I might forget you, and I've only just learned you." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_skyborne = {
      lines = {
        { id = "xs_default", text = "I keep thinking I ought to, and then the thought wanders off, the way they all do! You've got the look of someone who's come a very long way to get home, though, and I suppose that makes two of us." },
      },
      choices = {
        { text = "We have come a long way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Maybe you'll remember us yet.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I... don't know, isn't that funny? Ask me again tomorrow, and maybe I'll have one.", next = "memory" } },
    advice = { { id = "tp_ad", text = "Never set off alone; somebody told me that, and it's the only thing I'm sure of." } },
    _none = { { id = "tp_none", text = "I might have known that once! Ask me again later." } },
  },
}

P:NPC {
  key = "jdcollie", id = TODO_NPC("J.D. Collie"), name = "J.D. Collie",
  bible = "bibles/ungoro.md", role = "scholar", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "eager" }, values = { "curious", "persistent" },
  notices = { "class" },

  impression = {
    first = "J.D. Collie lost an eyebrow to his crystals this morning and seemed to think it a fair trade. His cave hums, and so does he, with theories.",
    third = "{name} met J.D. Collie, the Marshal Expedition's eager student of Un'Goro's crystals.",
  },

  greetings = {
    { id = "g_cave", text = "Welcome to my cave! Mind the crystals, because some of them hum. The humming is fine; it's when they stop humming that you should worry." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "SHAMAN" } },
      text = "Can you feel them, the crystals? Something in them answers to people like you, and I've been trying to work out what for months." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Crystals, every colour, from all over the crater, and quietly, because the beasts get territorial about them. Put the right ones together and you get something wonderful, put the wrong ones together and you get singed, and I'd love to know which is which before the next eyebrow goes." } },
      choices = {
        { text = "I'll fetch your crystals, but you'll pay me fairly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll gather them for the expedition's sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They respond to everything, which is what makes them so marvellous! Red ones warm, blue ones hum, green ones do something I'm still working out, and if you'd stand near the yellow ones for a moment, I could find out whether they're fond of you or about to explode." } },
      choices = {
        { text = "I'll stand near them, for science. Be careful, though.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Explode? Find someone else for your experiments.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the right crystal makes a body stronger and the wrong one gives you a very short nap, and I've got notes on both! I watched a guard hold one and lift a crate he couldn't budge the day before, though he couldn't feel his thumbs for a while after." } },
      choices = {
        { text = "Strength should be trained, not borrowed from a stone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a crystal makes me stronger, hand it over.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I think they feel the hum in their feet, the same hum I feel in my teeth whenever I chip a sample, and they've the sense to steer clear. I haven't any sense, of course, so I keep walking right up to them with a notebook." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Has {pet} ever growled at a crystal? Tell me if it does, because a beast's nose might be the best instrument I could ask for, and it's certainly cheaper than a gnome's." },
      },
      choices = {
        { text = "Trust the beasts' caution. Some things shouldn't be disturbed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Curiosity moves us forward. Keep walking right up to them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They answer to something, because the red ones hum higher when someone prays over them, though that might just be the heat. I've a theory that something old grew them down here on purpose, and if so, a priest's touch might wake whatever they were meant for." } },
      choices = {
        { text = "I'll only touch them with the Light. Let's see what wakes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let me try shadow on them. I want to hear them sing.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Some of them hum, some of them heal, and some make every plant around them grow twice as big. I honestly don't know whether they're good for the crater or just very, very strange." } },
      choices = {
        { text = "Take only what you need and leave the rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dig them all up. The knowledge is worth it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Store power, carry it, and let it out on purpose instead of all at once, which is what took my eyebrow. Put a mage's training together with these stones, and the Refuge could have light and warmth without burning a single fern." } },
      choices = {
        { text = "That kind of power should stay with scholars.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anyone who finds the crystals should be free to use them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Enough crystals for now.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little, if I'm honest, and I'd rather be honest than singed. The crystals take in whatever's near them, and I don't know what they'd take in from you, so I'd ask you not to stand quite so close to the green ones." } },
      choices = {
        { text = "That's fair. I'll keep my distance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear won't get your research far, Collie.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You've got quick hands, and that's exactly what I need, because the crystals out in the crater are guarded by things that bite, and I'd rather lose your patience than my other eyebrow." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, splendid! The crystals hum a little louder when the Light comes into the cave, and I've been dying to know whether they like it or whether they're complaining." },
        { id = "h_default", key = true,
          text = "J.D. Collie, of the Marshal Expedition! I study the crystals, every color, all over the crater, all doing different things. Put the right ones together and you get something wonderful; put the wrong ones together and you get singed." },
        { id = "h_sense", tags = { "news" }, when = { questActive = TODO_QUEST("Making Sense of It") },
          text = "I've got notes, I've got samples, I've got theories. What I need is someone to help me make sense of all of it. That's you, if you're willing." },
        { id = "h_linken", when = { any = { { questActive = TODO_QUEST("A Gnome's Assistance") }, { questActive = TODO_QUEST("Linken's Memory") } } },
          text = "Linken! Poor fellow. I think the crystals might help him, or at least they probably won't make it worse." },
        { id = "h_aquementas", when = { questActive = TODO_QUEST("Aquementas") },
          text = "There's a water spirit called Aquementas that may be able to help with what Linken needs. Be polite to it, though, because spirits that old take offense easily." },
        { id = "h_singed", when = { metBefore = true }, text = "I lost an eyebrow this morning, putting a red crystal and a blue one too close together. Worth it, I think, and it'll grow back, I think." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Tell me, can you feel the crystals out there? I've always wondered whether the land itself knows they're doing something odd." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Finally, someone who won't look at me funny when I say the red crystals are warmer than the blue ones, because you'll have felt it too, won't you?" },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "The crystals don't like you, friend. I mean no offence, but the pylon readings went sour the moment you walked in, the same way they do near the fire elementals up on the ridge." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, splendid! The crystals hum a little louder when spellcasters come into the cave, and I'm dying to know whether they prefer the Light or the shadow." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Perfect timing, because I need someone who can carry a crystal without dropping it, and who won't mind too much if it gives them a little jolt." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Have you noticed how the beasts down there go quiet around the big crystal clusters? I swear they know something we don't." },
      },
      again = { { id = "h_again", text = "Another question? Lovely, because questions are my favourite thing after crystals." } },
      choices = {
        { text = "What do the crystals do to the land, J.D.?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do the crystals do?", next = "crystals" },
        { text = "Why live in a cave?", next = "cave" },
        { text = "Can you really help Linken?", next = "linken" },
        { text = "I can feel them. The crystals.", next = "resonate", when = { class = { "MAGE", "PRIEST", "SHAMAN" } } },
        { text = "A gnome scholar out here? I'd have studied with you.", next = "x_gnome", when = { race = "Gnome" } },
        { text = "What do you hope the crystals will do?", next = "xmage", when = { class = "MAGE" } },
        { text = "Are you afraid of what I might do with them?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do your crystals really answer to a priest's power, J.D.?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a warrior want to carry your crystals, Collie?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do the crater's beasts avoid the crystals, Collie?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do the crystals really respond to the Light, J.D.?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you have a rogue fetch for you, J.D.?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll gather crystals.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    crystals = {
      lines = { { id = "c_default", text = "Different things! Some help, some hurt, and some just glow at you smugly, and nobody knows who put them here or why, which is the exciting part." } },
      choices = {
        { text = "And the dangerous part?", next = "crystals_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystals_danger = {
      lines = { { id = "cd_default", text = "That's also nobody knowing who put them here or why! Science is like that: the exciting part and the dangerous part are usually the same part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cave = {
      lines = { { id = "cv_default", text = "It's quiet, it's chilly, and devilsaurs can't fit through the door; I've measured, twice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    linken = {
      lines = { { id = "l_default", text = "I don't know! But nothing else has, and the crystals do strange things to minds, and strange is better than stuck. That's my whole method." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    resonate = {
      lines = { { id = "r_default", text = "You can? Then hold this one, and don't drop it! What do you hear? No, don't tell me yet; write it down first and then tell me, because I want it in your own words." } },
      choices = { { text = "It hums.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    x_gnome = {
      lines = {
        { id = "xg_default", text = "Oh, would you? Then you know how it feels to start an experiment over for the eleventh time and still be delighted when it fails in a brand-new way! I came out here with a pack full of notebooks and no plan, and the crystals have been more patient with me than any teacher ever was." },
        { id = "xg_student", when = { origin = "gnome_last_student" }, text = "You were a student too, weren't you, before everything went wrong at home? You'll like it here, then, because nobody grades you and the crystals never get tired of questions." },
      },
      choices = {
        { text = "Show me what you've learned about them.", next = "crystals" },
        { text = "A failure's only a failure if you stop.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A gnome with a hammer, a notebook and no eyebrows. That's the short version and the long one." } },
    advice = { { id = "tp_ad", text = "Never put two glowing things next to each other unless you want to find out what happens. I always want to." } },
    _none = { { id = "tp_none", text = "No idea! But give me a week and a crystal, and I'll have a theory." } },
  },
}

P:NPC {
  key = "spraggle", id = TODO_NPC("Spraggle Frock"), name = "Spraggle Frock",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "anxious" }, values = { "loyal", "kind" },
  notices = { "weary" },

  impression = {
    first = "Spraggle Frock asked after her friend Ringo before she'd even said her own name. She worries for a living and seems to be very good at it.",
    third = "{name} met Spraggle Frock, the anxious supply runner of the Marshal Expedition who frets over her missing friend Ringo.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, hi, hello, welcome to the Refuge! Did you come up from the south, and did you see a goblin on the way, skinny and loud, name of Ringo?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Oh no, you got hurt down there too? Sit down and drink something; everybody keeps getting hurt down there." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, I don't know anything about demons, but I'd ask the devilsaurs themselves if I thought they'd tell me where he is! Ringo's my dearest friend and he gets lost in his own tent, so out in the crater he must be terrified, and I'm running out of ideas." } },
      choices = {
        { text = "I'll look for him myself. My demon stays leashed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon will find him, whatever it takes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He's my dearest friend, and he wandered off into the crater after a crystal, and nobody's seen him since. Ringo's always been a wanderer, but he's never been gone this long, and I keep imagining him lost and thirsty somewhere in the ferns." } },
      choices = {
        { text = "I'll find him, Spraggle, and bring him home safe.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He chose to wander. You shouldn't worry so much.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "We did, a little, but Williden can't spare the guards, and the ones we have are needed on the ridge to keep the raptors out of the Refuge. I keep telling myself that's sensible, and I keep not believing it." } },
      choices = {
        { text = "Holding the ridge is the right call, however hard it is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules be hanged. Someone should have gone after him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every night, though I'm not sure anyone's listening, because the crater is very loud and my prayers are very small. If yours are bigger, then please aim them south of the Refuge, because that's where he was heading." } },
      choices = {
        { text = "I'll pray for him, and then I'll go and look.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't find him. Only luck and a sharp eye will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Probably, and I've told Williden so, but he says we've come too far to turn back now. Every time I hear a devilsaur stomping through the jungle, I think he's wrong." } },
      choices = {
        { text = "You came to finish the work. Stay the course.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Turn back. No crystal is worth your lives.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because it moves, or the ground round it does, and the fire walks about at night where you can see it from the ledge. Ringo went that way, and I've watched those lights every night since, wondering which one is him with a torch." } },
      choices = {
        { text = "Fear keeps you alive down there. Trust it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear keeps you in this cave. Go and look for him.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quietly, please, because the raptors come running at any noise, and Ringo makes a great deal of noise when he's frightened. But don't be too long about it, because he never carries enough water, and I've told him and told him." } },
      choices = {
        { text = "Quiet is safest. I'll take my time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Speed matters more. I'll cut straight through.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Water and somebody sensible, because he isn't, and I mean that kindly. The spring water from the crater brings him round when he faints, but conjured water would do in a pinch, and you'd be my favourite person in the whole Refuge." } },
      choices = {
        { text = "I'd help anyone lost out there.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He should learn to look after himself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I have to think so, because if I stop thinking so, I'll just sit down and never get up again. He's clever, Ringo is, cleverer than he looks, and if anyone can find water in that crater it's him, but I'd feel better with the Light watching over him too." } },
      choices = {
        { text = "Hold onto hope. The Light hasn't given up on him.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't find him. Boots and a waterskin will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Pterrordax", min = 20 } },
          text = "The pterrordax don't circle the Refuge half so much since you started shooting them down, and I can finally sleep without hearing them screech. Thank you, truly." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Oh, could your demon find Ringo, do you think, because it can see things in the dark, can't it, and he's been missing for days." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Would you say a prayer for Ringo, please, any prayer at all, because he's been gone for days and I've run clean out of my own." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you ask the spirits where Ringo is? I know that's probably not how it works, but I'm asking everybody, and you'd be the first who might actually know." },
        { id = "h_default", key = true,
          text = "Spraggle Frock, Marshal Expedition! I run supplies, or I did before the camps fell, and now I mostly worry, mostly about Ringo. He went off toward the volcano and he hasn't come back." },
        { id = "h_lost", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Lost!") }, { questActive = TODO_QUEST("A Little Help From My Friends") } } },
          text = "You found him, and he's alright? He's dried out like a husk? Oh, that's so Ringo, so please, bring him home." },
        { id = "h_pterrordax", when = { questActive = TODO_QUEST("Beware of Pterrordax") },
          text = "The pterrordax keep swooping on the supply runs, big angry lizards with wings. Thin them out, please, and the runners can breathe again." },
        { id = "h_ringo", when = { questDone = TODO_QUEST("A Little Help From My Friends") }, text = "Ringo's back and he won't stop talking about how thirsty he was. I've given him eleven canteens, and he's still talking." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Could you, I don't know, ask a bird whether it's seen Ringo? I'm only half joking, because I've tried everything else." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You're the sort who could slip through the ferns without the raptors noticing, aren't you? Oh, I wish Ringo had your feet instead of his own, because he trips over everything." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you conjure water? Ringo never carries enough, and if you find him before I do, he'll be so thirsty that he won't make it back without some." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Would you say a prayer for Ringo, please, any prayer at all, because he's been gone for days and I've run clean out of my own." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "You're a priest! Could you, I mean, would you say a prayer for Ringo, because he went off toward the volcano days ago and I keep thinking of him out there, all alone and thirsty and maybe hurt?" },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior? Oh, please, if you're going down toward the volcano, look for Ringo, and if anything's chasing him, hit it very hard." },
      },
      again = { { id = "h_again", text = "Anything else? Sorry, I'm a bit distracted, but I always am." } },
      choices = {
        { text = "Why does everyone here fear the volcano so much?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is Un'Goro too dangerous for the expedition?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who's Ringo?", next = "ringo" },
        { text = "How do supplies even get here?", next = "supplies" },
        { text = "Why did you leave Gadgetzan?", next = "gadgetzan" },
        { text = "How's Ringo now?", next = "ringo_after", when = { questDone = TODO_QUEST("A Little Help From My Friends") } },
        { text = "Could a pterrordax be tamed, do you think?", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Should I find Ringo quietly, or quickly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I can conjure water. Is that all he needs?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you think Ringo is still alive, Spraggle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have you prayed for Ringo yourself, Spraggle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why didn't anyone go after Ringo, Spraggle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who is Ringo, and why do you worry for him?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think a demon could find Ringo, Spraggle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll look for Ringo.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
    ringo = {
      lines = { { id = "r_default", text = "He's my friend, loud and skinny and convinced he knows the way to everywhere. He went toward the volcano to look at something shiny, because he always goes to look at something shiny." } },
      choices = {
        { text = "Where exactly did he go?", next = "ringo_where" },
        { text = "He'll turn up.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    ringo_where = {
      lines = { { id = "rw_default", text = "Towards Fire Plume Ridge, the smoking mountain in the middle, which is hot and dry and full of things made of fire. And he took one canteen, just one!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies = {
      lines = { { id = "s_default", text = "Down the rim path, past the raptors, round the pterrordax, and up again with whatever's left. It used to be easy. It was never easy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gadgetzan = {
      lines = { { id = "g_default", text = "Steady work, they said, and good pay, they said, but nobody said 'dinosaurs'. I'd have asked more questions if they'd said 'dinosaurs'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    ringo_after = {
      lines = { { id = "ra_default", text = "He's thirsty, loud and alive, all three at once, all day long, and I've never been happier to be annoyed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Tamed? You want one of those on a leash? They drop out of the sky like falling rocks, and I've lost more supply bags to them than I can count, so if you try it, please do it somewhere far away from my tent." },
      },
      choices = {
        { text = "Anything can be tamed, with patience.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'd rather thin their numbers for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear things on the supply runs, when I'm not worrying, which isn't often! Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "I'm a Gadgetzan girl, a supply runner and a worrier, in that order, and sometimes all at once." } },
    advice = { { id = "tp_ad", text = "Pack twice the water you think you'll need. Ringo didn't, and look how that went." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "I came out from Gadgetzan because they said it was steady work, and now I sleep on a ledge above dinosaurs." } },
    _none = { { id = "tp_none", text = "Sorry, I don't know! Maybe ask Williden; he knows things." } },
  },
}
