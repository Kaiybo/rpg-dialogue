-- Tommy Joe Stonefield, on the riverbank by Stonefield Farm. Voice: bibles/tommyjoe.md
-- Heir to the Stonefield farm, in love with a Maclure.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tommyjoe", id = TODO_NPC("Tommy Joe Stonefield"), name = "Tommy Joe Stonefield",
  bible = "bibles/tommyjoe.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "romantic" },
  notices = { "craft", "pet" },

  greetings = {
    { id = "g_river", text = "I'm just watching the river, that's all, nothing else at all." },
    { id = "g_sent", when = { questActive = TODO_QUEST("Young Lovers") }, text = "You've come from the vineyard; I can tell by the look of you." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Escape") }, text = "Hello again! Isn't it a fine day? Every day's been a fine day lately." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish? This bend's the best on the river. I come here to think, mostly. Sometimes I catch something by accident." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Good-looking animal. We had a dog like that. Gramma says it was the only Stonefield with any sense." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tommy Joe. Stonefield, if you're asking, and folk around here usually are. Family thinks I'm mending the east fence." },
        { id = "h_young", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "Maybell sent you? Is she well, did she say anything... about me, I mean, did she say anything about me?" },
        { id = "h_gramma", when = { questActive = TODO_QUEST("Speak with Gramma") },
          text = "Gramma's up at the farmhouse. She's the only one in the family who doesn't spit when the Maclures come up, mostly." },
        { id = "h_waiting", when = { questDone = TODO_QUEST("Speak with Gramma"), questBefore = TODO_QUEST("The Escape") },
          text = "Gramma's up to something. She's sent word to the inn. She hums when she's scheming, and she's been humming all week." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "She came! She actually came, right down to the river, and nobody saw. Don't tell anyone, except Gramma; you can tell Gramma." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Escape"), days = 7 } },
          text = "We're careful, very careful. One day we'll stop being careful, and I'll stand in that vineyard and say it out loud." },
        { id = "h_princess", when = { questActive = TODO_QUEST("Princess Must Die!") },
          text = "Ma's got you after the Brackwell pig? Good, because that sow ate my supper three nights running, if you count carrots as supper." },
      },
      again = {
        { id = "h_again", text = "What else? The river's not going anywhere, and neither am I, it seems." },
        { id = "h_again2", text = "Go on. I'm only pretending to mend a fence." },
      },
      choices = {
        { text = "What's Maybell like?", next = "maybell" },
        { text = "What's the feud about?", next = "feud" },
        { text = "Tell me about the farm.", next = "farm" },
        { text = "Why this river?", next = "river" },
        { text = "When the day comes, I'll bless the wedding.", next = "priest", when = { class = "PRIEST" } },
        { text = "I worked a Westfall farm. Land's worth more than grudges.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I've a letter from Maybell.", next = "BUSINESS", when = { questActive = TODO_QUEST("Young Lovers") } },
        { text = "Good luck, Tommy Joe.", next = "END", fx = { affinity = 1 } },
      },
    },

    maybell = {
      lines = {
        { id = "m_default", text = "She's clever, cleverer than me and kind about it. She notices things, and she noticed me, which shows you she isn't perfect." },
      },
      choices = {
        { text = "What would you do for her?", next = "maybell_do" },
        { text = "You're not so bad.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    maybell_do = {
      lines = {
        { id = "md_default", text = "Anything that doesn't start a war between the farms. And maybe one or two things that do." },
      },
      choices = {
        { text = "Careful, Tommy Joe.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "That's the spirit.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, learn = { "maybell_tommy" } } },
      },
    },

    feud = {
      lines = {
        { id = "f_default", text = "Ask my father and he'll talk an hour. Ask him again the next day and it's a different reason. That tells you something." },
      },
      choices = {
        { text = "Sounds like it's about nothing.", next = "BACK", fx = { affinity = 1, learn = { "maybell_tommy" } } },
        { text = "Every feud's about something.", next = "feud_something", fx = { trait = { skeptical = 1 } } },
      },
    },
    feud_something = {
      lines = {
        { id = "fs_default", text = "Maybe so. Gramma knows, I reckon, but she won't say; she says knowing would only give us something to be proud of." },
      },
      choices = {
        { text = "Wise woman.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    farm = {
      lines = {
        { id = "fa_default", text = "Stonefield land since before Gramma was born. It'll be mine one day. Which means one day I'll be the Stonefield who decides about the feud." },
      },
      choices = {
        { text = "And what will you decide?", next = "farm_decide" },
        { text = "Who works it now?", next = "farm_who" },
      },
    },
    farm_decide = {
      lines = {
        { id = "fd_default", text = "Ask me when I'm holding the deed. Then ask Maybell, and do whatever she says." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    farm_who = {
      lines = {
        { id = "fw_default", text = "Ma fights the pig, Auntie Bernice bakes and keeps an eye on the vineyard, and Gramma sits by the fire and knows everything. I mend fences, apparently." },
      },
      choices = {
        { text = "The pig?", next = "farm_pig" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_pig = {
      lines = {
        { id = "fp_default", text = "That's Princess, the Brackwells' prize sow. She comes over from their pumpkin patch, eats our crop and goes home fat, and Ma wants her dead." },
      },
      choices = {
        { text = "I'll talk to your Ma.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    river = {
      lines = {
        { id = "r_default", text = "It's the edge of our land and nobody else's. You can think here. And from that bend you can just see the vineyard roofs." },
      },
      choices = {
        { text = "So you watch for her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Any murlocs in it?", next = "river_murlocs" },
      },
    },
    river_murlocs = {
      lines = {
        { id = "rm_default", text = "Not this far down. Folk say they're thick round Crystal Lake and up east. I keep an eye on the water all the same." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "A wedding? Say that again, slowly... no, don't, or I'll start grinning, and Ma will ask why, and I'm a terrible liar." },
      },
      choices = {
        { text = "The offer stands.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, opinion = { maybell_tommy = "romantic" } } },
        { text = "First the families have to agree.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "That's what Gramma says. Westfall folk come down the road with nothing, and here we are fighting over a fence; it makes you think." },
      },
      choices = {
        { text = "It should.", next = "BACK", fx = { affinity = 1, opinion = { maybell_tommy = "romantic" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stonefield born. I'll have the farm one day. That's my whole story, except the part that's across the river." } },
    advice = { { id = "tp_ad", text = "If you want to be somewhere you shouldn't, carry a hammer. Nobody asks a man with a hammer what he's doing." } },
    maybell_tommy = { { id = "tp_us", text = "She's the cleverest person in Elwynn and she likes me. I don't understand it either." } },
    murlocs_east = { { id = "tp_murlocs", text = "Murlocs? Further east, folk say, though I keep an eye on the water all the same." } },
    _none = { { id = "tp_none", text = "Couldn't say. I'm just a farmer who stands by rivers." } },
  },
}
