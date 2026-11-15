-- Remy "Two Times", Goldshire. Voice: bibles/remy.md
-- Agenda: his gold-dust trade. Rumor-monger; some rumors are true (murlocs), some are
-- self-serving (nobody else buys dust).
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "remy", id = TODO_NPC("Remy \"Two Times\""), name = "Remy \"Two Times\"",
  bible = "bibles/remy.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" },
  notices = { "purse", "sneak" },

  barks = {
    { id = "b_buying", text = "Buying gold dust! Buying gold dust!" },
    { id = "b_murlocs", when = { questBefore = TODO_QUEST("A Fishy Peril") }, text = "Murlocs in the east, I tell you! Murlocs!" },
  },

  greetings = {
    { id = "g_dust", text = "Gold dust? Got any gold dust? Any at all?" },
    { id = "g_friend", when = { affinity = { min = 3 } }, text = "My friend! My good friend! What news?" },
    { id = "g_cold", when = { affinity = { max = -3 } }, text = "Oh. You. You again." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That's a heavy purse. Heavy purse! You'll want a man who knows where to spend it." },
    { id = "n_rogue", cat = "sneak", when = { class = "ROGUE" },
      text = "Hands where I can see them, friend. I know your sort. I am your sort, on Tuesdays." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Where'd you go? Where'd you go! Don't do that, it's bad for my heart." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Remy, at your service. At your service! Whatever you need, I know a fellow who knows a fellow." },
        { id = "q_dust_active", when = { questActive = TODO_QUEST("Gold Dust Exchange") },
          text = "Kobolds keep it in little pouches. Little pouches! Bring me what you find and we'll both be happy." },
        { id = "q_dust_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gold Dust Exchange"), days = 2 } },
          text = "Lovely dust. Lovely! I knew you had an honest face. Mostly honest." },
        { id = "q_murlocs_told", when = { questDone = TODO_QUEST("Further Concerns") },
          text = "Told you. Told you! Murlocs. Nobody listens to Remy until somebody gets eaten.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "e_thomas", tags = { "news" }, priority = 5, when = { heardLine = "thomas.h_report" },
          text = "Thomas said that? A drink, for Remy? For Remy! I'll hold him to it. I'll hold him to it twice." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A sky elf! Never sold to a sky elf. Never! What do your people buy? Whatever it is, I've got some. Probably." },
        { id = "q_peril_active", when = { questActive = TODO_QUEST("A Fishy Peril") },
          text = "Did you tell him? Did you tell him? The Marshal, about the murlocs? Tell him twice. He only hears things the second time." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Dwarves know gold. Know gold! You wouldn't have a little dust in that beard, would you? A little dust?" },
      },
      again = {
        { id = "h_again", text = "What else, what else? Time's money. Money's money too." },
        { id = "h_again2", text = "More? More! I like a customer who talks." },
      },
      choices = {
        { text = "What are you buying?", next = "BUSINESS" },
        { text = "Any news, Remy?", next = "news" },
        { text = "Where are you from, Remy?", next = "home" },
        { text = "Who are these associates of yours?", next = "associates", when = { questDone = TODO_QUEST("Gold Dust Exchange") } },
        { text = "I know a fence when I see one.", next = "fence", when = { class = "ROGUE" } },
        { text = "[Intimidate] Who else buys dust around here? Talk.", tag = "Intimidate", next = "talks",
          when = { thread = { id = "elwynn_gold", beat = "b1_dust" } },
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { band = { "Seasoned", "Veteran", "Champion" } } } } },
          fail = { next = "clams", fx = { affinity = -1 } } },
        { text = "Goodbye, Remy.", next = "END" },
      },
    },
    news = {
      lines = {
        { id = "n_default", text = "News? News! The price of eggs is a scandal, and Farley waters nothing, which is also a scandal." },
        { id = "n_murlocs", key = true, when = { questBefore = TODO_QUEST("A Fishy Peril") },
          text = "Murlocs! Up the streams in the east. Murlocs! Nobody believes me, but they will.",
          fx = { hear = "murlocs_in_elwynn", learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "Murlocs? Tell me more.", next = "murlocs" },
        { text = "I believe you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Murlocs, in Elwynn? Sure, Remy.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    murlocs = {
      lines = {
        { id = "mu_default", text = "Swimming up the eastern streams! Scaring off the fish, going for gentle folk! I told the Marshal. He's worried about gnolls and bandits. Gnolls and bandits!",
          fx = { learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "I'll talk to Dughan for you.", next = "murlocs_dughan", fx = { affinity = 2 } },
        { text = "Maybe Dughan's right to worry about gnolls.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    murlocs_dughan = {
      lines = {
        { id = "md_default", text = "You will? You will! Persuade him. Troops to the east. He respects me as a merchant, he says. Respects me! Then he doesn't listen." },
      },
      choices = {
        { text = "Then let's make it official.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "ho_default", text = "Redridge. East, past the mountains. Came west looking for business. Looking for business! Found Goldshire. Goldshire found me." },
      },
      choices = {
        { text = "Why leave Redridge?", next = "home_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_why = {
      lines = {
        { id = "hw_default", text = "Why does anybody leave anywhere? Better prices. Better prices! Don't ask me about Redridge. Ask me about dust. I like dust." },
      },
      choices = {
        { text = "All right. Tell me about the dust.", next = "dust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust = {
      lines = {
        { id = "du_default", text = "Kobolds pick it out of the mines. Fargodeep to the south, Jasperlode to the northeast. They carry it in pouches. I buy it. Simple! Simple.",
          fx = { learn = { "gold_dust" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    associates = {
      lines = {
        { id = "as_default", text = "Associates! Friends. Friends of friends. They send me little tokens for good customers. Good customers! Don't ask what the token's for. I don't." },
      },
      choices = {
        { text = "That's not reassuring, Remy.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fence = {
      lines = {
        { id = "fe_default", text = "Fence? Me? A merchant! A respectable merchant. Respectable! ...What are you selling? Just asking. Just asking." },
      },
      choices = {
        { text = "Nothing. Yet.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Relax, Remy.", next = "BACK" },
      },
    },
    talks = {
      lines = {
        { id = "t_default", key = true,
          text = "All right! All right! Riders. Night riders, out by the pumpkin patch. They pay the kobolds before I can. I never sold to them, I swear it.",
          fx = { expose = "remy_only_buyer", learn = { "the_collector" }, thread = { id = "elwynn_gold", beat = "b_remy_talks" } } },
      },
      choices = { { text = "That wasn't so hard.", next = "END", fx = { trait = { stern = 1 }, affinity = -1 } } },
    },
    clams = {
      lines = { { id = "c_default", text = "Buy? Me? I only sell. Only sell! Is that the time? It's the time." } },
      choices = { { text = "We'll talk again, Remy.", next = "END" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "From Redridge, looking for business. Looking for business! Found plenty. Found plenty.", next = "home" } },
    advice = { { id = "tp_ad", text = "Never sell to a gnoll. Gnolls don't pay. And always count your change twice. Twice!" } },
    gold_dust = { { id = "t_dust", text = "Mine. My trade. Nobody in Elwynn buys dust but Remy. Nobody but Remy!",
      fx = { hear = "remy_only_buyer" } } },
    murlocs_east = { { id = "t_murlocs", text = "Real! Real as rain. Ask the fishermen. Ask the ones that are left." } },
    the_collector = { { id = "t_collector", text = "Never heard of him. Never heard of him. Why do you ask? Why?" } },
    hogger = { { id = "t_hogger", text = "Don't sell to gnolls. Gnolls don't pay. Hogger especially doesn't pay." } },
    _none = { { id = "t_none", text = "Don't know, don't know. Ask Farley, he hears everything twice as fast as me." } },
  },
}
