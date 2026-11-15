-- Marshal's Refuge: the Marshal Expedition's last camp at the crater's northern rim. Voice: bibles/ungoro.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "williden", id = TODO_NPC("Williden Marshal"), name = "Williden Marshal",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "warm" }, values = { "curious", "responsible" },
  notices = { "level", "kit" },

  greetings = {
    { id = "g_refuge", text = "Welcome, welcome! You made it up the rim in one piece. That puts you ahead of most of my expedition." },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Williden Marshal, leader of the Marshal Expedition. My sister and I brought scholars and explorers down into Un'Goro for crystals and rare plants, but the crater had other plans, and we lost our base camps and fell back up here." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("Williden's Journal") },
          text = "My journal! It's somewhere back in the old camp, and everything we learned before we ran is in those pages." },
        { id = "h_salvation", when = { questActive = TODO_QUEST("Expedition Salvation") },
          text = "Our supplies are scattered across the crater, and every crate you bring back is another week we can stay, another week of discovery." },
        { id = "h_journal_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Williden's Journal"), days = 3 } },
          text = "My journal, back on my desk! Half the pages are muddy and one's been chewed, and it's still the best thing anyone's given me in a year." },
      },
      again = { { id = "h_again", text = "What else? Ask away, I've nothing but time and dinosaurs." } },
      choices = {
        { text = "What's dangerous down there?", next = "danger" },
        { text = "What were you looking for?", next = "purpose" },
        { text = "Your sister?", next = "sister" },
        { text = "Am I ready for the crater?", next = "ready", when = { maxLevel = 50 } },
        { text = "What do the beasts here eat?", next = "beasts", when = { class = { "HUNTER", "DRUID" } } },
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
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
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
  },

  topics = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me Linken, and I think it's my name. I came to this crater on a mission from somewhere far away, and then my raft broke up in the marsh, something hit my head, and the rest went with the raft." },
        { id = "h_secret", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("It's a Secret to Everybody") }, { questActive = TODO_QUEST("Linken's Sword") } } },
          text = "You found my things, and my sword! I'd know it anywhere... well, I'd know it here, anyway." },
        { id = "h_adventure", when = { any = { { questActive = TODO_QUEST("Linken's Adventure") }, { questActive = TODO_QUEST("It's Dangerous to Go Alone") } } },
          text = "It's coming back to me: a fire elemental called Blazerunner, and a flame, a golden one, that I was meant to bring home. I think you'd better be the one to finish it, just in case I forget again." },
      },
      again = { { id = "h_again", text = "Ask! Quickly, before I forget you asked." } },
      choices = {
        { text = "What do you remember?", next = "memory" },
        { text = "Tell me about your sword.", next = "sword" },
        { text = "Who looks after you here?", next = "friends" },
        { text = "Do you remember Gnomeregan?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "Want to spar?", next = "spar", when = { class = "WARRIOR" } },
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

  greetings = {
    { id = "g_cave", text = "Welcome to my cave! Mind the crystals, because some of them hum. The humming is fine; it's when they stop humming that you should worry." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "SHAMAN" } },
      text = "Can you feel them, the crystals? Something in them answers to people like you, and I've been trying to work out what for months." },
  },

  start = "hello",
  nodes = {
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
      },
      again = { { id = "h_again", text = "Another question? Lovely. Questions are my favourite thing after crystals." } },
      choices = {
        { text = "What do the crystals do?", next = "crystals" },
        { text = "Why live in a cave?", next = "cave" },
        { text = "Can you really help Linken?", next = "linken" },
        { text = "I can feel them. The crystals.", next = "resonate", when = { class = { "MAGE", "PRIEST", "SHAMAN" } } },
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

  greetings = {
    { id = "g_hello", text = "Oh, hi, hello, welcome to the Refuge! Did you come up from the south, and did you see a goblin on the way, skinny and loud, name of Ringo?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Oh no, you got hurt down there too? Sit down and drink something; everybody keeps getting hurt down there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Spraggle Frock, Marshal Expedition! I run supplies, or I did before the camps fell, and now I mostly worry, mostly about Ringo. He went off toward the volcano and he hasn't come back." },
        { id = "h_lost", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Lost!") }, { questActive = TODO_QUEST("A Little Help From My Friends") } } },
          text = "You found him, and he's alright? He's dried out like a husk? Oh, that's so Ringo, so please, bring him home." },
        { id = "h_pterrordax", when = { questActive = TODO_QUEST("Beware of Pterrordax") },
          text = "The pterrordax keep swooping on the supply runs, big angry lizards with wings. Thin them out, please, and the runners can breathe again." },
        { id = "h_ringo", when = { questDone = TODO_QUEST("A Little Help From My Friends") }, text = "Ringo's back and he won't stop talking about how thirsty he was. I've given him eleven canteens, and he's still talking." },
      },
      again = { { id = "h_again", text = "Anything else? Sorry, I'm a bit distracted, but I always am." } },
      choices = {
        { text = "Who's Ringo?", next = "ringo" },
        { text = "How do supplies even get here?", next = "supplies" },
        { text = "Why did you leave Gadgetzan?", next = "gadgetzan" },
        { text = "How's Ringo now?", next = "ringo_after", when = { questDone = TODO_QUEST("A Little Help From My Friends") } },
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
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a Gadgetzan girl, a supply runner and a worrier, in that order, and sometimes all at once." } },
    advice = { { id = "tp_ad", text = "Pack twice the water you think you'll need. Ringo didn't, and look how that went." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "I came out from Gadgetzan because they said it was steady work, and now I sleep on a ledge above dinosaurs." } },
    _none = { { id = "tp_none", text = "Sorry, I don't know! Maybe ask Williden; he knows things." } },
  },
}
