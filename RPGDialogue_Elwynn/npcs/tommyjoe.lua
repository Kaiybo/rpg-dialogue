-- Tommy Joe Stonefield, on the riverbank by Stonefield Farm. Voice: bibles/tommyjoe.md
-- Heir to the Stonefield farm, in love with a Maclure.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tommyjoe", id = TODO_NPC("Tommy Joe Stonefield"), name = "Tommy Joe Stonefield",
  bible = "bibles/tommyjoe.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "romantic" },
  notices = { "craft", "pet" },
  impression = {
    first = "Nobody watches a river as carefully as Tommy Joe Stonefield, who says he's only looking at the water and says it far too quickly. Every day lately is a fine day to him.",
    third = "{name} met Tommy Joe Stonefield by the river, where he is certainly not waiting for anyone in particular.",
  },

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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The water, honest! Well, and maybe someone across it. But don't tell Ma, or Pa Maclure." } },
      choices = {
        { text = "Tell your family the truth, Tommy Joe. It's the brave way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep it secret. Love's worth a little sneaking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Nobody! Just a friend, who has a friend, on the other side, and their families don't speak. If you could conjure a bridge, or a boat, or a very thick fog, I'd be ever so grateful, and so would my friend." } },
      choices = {
        { text = "Love will find its way, Tommy Joe. Go to her.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your family's feud deserves more respect than that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Tommy Joe.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Better than my family does, because the water doesn't run home and tell Ma everything it sees. I've told it a good few things this spring, and it hasn't once called me a fool." } },
      choices = {
        { text = "Tell your family, Tommy Joe. Hiding only feeds the feud.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Love needs nobody's blessing. Keep meeting her by the river.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because of Maybell, of course, and because half the valley thinks a Stonefield and a Maclure is a crime. I'd fight for her if I had to, but I'm better at mending fences than breaking heads." } },
      choices = {
        { text = "Then fight for her, Tommy Joe. She's worth it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Mend your fences and leave her be.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "To meet Maybell by the river, of course, without the whole family knowing. The murlocs are less trouble than my uncle, and he's less trouble than her pa." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours could keep watch by the river. If it growled, I'd know someone was coming." },
      },
      choices = {
        { text = "I'll not help you hide from your family.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep low and use the reeds. They'll never see you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Stories about folk who made bargains with things in the dark and paid for it after, and she tells them whenever I come home late from the river. I always thought she made them up, but looking at you, I'm not so sure." } },
      choices = {
        { text = "Gramma's stories are worth heeding. I'll be careful.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Gramma's stories are for children. Bargains make power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "One day, I swear it, when I've saved enough to buy a plot of my own and nobody can tell me where to stand. Until then I'm careful, because a Stonefield who loves a Maclure is a Stonefield who sleeps in the barn." } },
      choices = {
        { text = "Waiting is wise. Do it properly, not rashly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Love shouldn't wait on coin. Tell them now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Are you going to tell my family? Please don't, because they'd lock me in the barn till winter." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's something odd about you, odd like Gramma's stories, and I'm not sure I like it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Are you here to beat me up for the Maclures, or for my family? Either way, I'd rather you didn't." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You must know how to wait without being seen, and I've been trying to learn that for months." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, out by the river! I'm only looking at the water, if anybody asks, which they shouldn't." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I don't suppose you'd know a spell for getting across a river without anybody seeing, would you? Asking for a friend." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I'm only looking at the water, nothing else. Your spirits needn't tell anyone otherwise." },
      },
      again = {
        { id = "h_again", text = "What else? The river's not going anywhere, and neither am I, it seems." },
        { id = "h_again2", text = "Go on. I'm only pretending to mend a fence." },
      },
      choices = {
        { text = "Maybell must be quite a girl.", next = "maybell" },
        { text = "What's the feud about?", next = "feud" },
        { text = "Tell me about the farm.", next = "farm" },
        { text = "You seem fond of this stretch of river.", next = "river" },
        { text = "When the day comes, I'll bless the wedding.", next = "priest", when = { class = "PRIEST" } },
        { text = "I worked a Westfall farm. Grudges never fed a pig.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I've a letter from Maybell.", next = "BUSINESS", when = { questActive = TODO_QUEST("Young Lovers") } },
        { text = "I could carry your letters without anyone seeing.", next = "rogue", when = { class = "ROGUE" } },
        { text = "What sort of stories does Gramma tell, Tommy Joe?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why would anyone want to beat you up, Tommy Joe?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do you need to wait without being seen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You'll have to stand up to your family for Maybell someday.", next = "xapala", when = { class = "PALADIN" } },
        { text = "The river must keep secrets better than your family.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Who's this friend who needs to cross the river, Tommy Joe?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You're not really looking at the water, Tommy Joe.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Careful, Tommy Joe.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
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
        { text = "The farm must take a lot of working.", next = "farm_who" },
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
    rogue = {
      lines = { { id = "rogue_l", text = "Could you really? Ma reads everything that comes up the lane, and Maybell's pa watches the river like a hawk. You wouldn't read them, would you?" } },
      choices = {
        { text = "Never. A courier's word is everything.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Only the interesting parts.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
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
