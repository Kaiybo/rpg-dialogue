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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here at the Refuge! Then perhaps you can tell me what the crater wants, because it's certainly made clear that it doesn't want my base camps." },
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
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "You're a priest? Can priests mend a head that's been hit, do you think, because mine was, and the rest of me is fine, but there are holes in it where things ought to be." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, with a shield like mine! I can't remember who taught me to use it, but my arm knows how, and I'm told that's a good sign." },
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
        { text = "Do you think you were a knight, once?", next = "xapala", when = { class = "PALADIN" } },
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
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "You're a priest! Could you, I mean, would you say a prayer for Ringo, because he went off toward the volcano days ago and I keep thinking of him out there, all alone and thirsty and maybe hurt?" },
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
