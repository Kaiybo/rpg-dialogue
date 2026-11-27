-- Gerald Crawley, poison supplier in Lakeshire. Voice: bibles/gerald_crawley.md
-- Sells what rogues need and says as little as possible about who buys it.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gerald_crawley", id = TODO_NPC("Gerald Crawley"), name = "Gerald Crawley",
  title = "Poison Supplies",
  bible = "bibles/gerald_crawley.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "smooth" }, values = { "discreet", "practical" },
  notices = { "stealth", "class" },

  impression = {
    first = "He talks about his poisons as if they were spices.",
    third = "{name} met Gerald Crawley, Lakeshire's discreet supplier of poisons and their ingredients.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_shop", text = "Looking for something particular? Speak softly; the walls here are thin." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon. Business must be good, or very bad." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I won't ask where; it's the house rule." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear you've been frightening people. Do it quietly, please; loud customers are bad for my trade." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word is you were caught in a lie. My advice is to tell them better, since you'll clearly never manage fewer." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can hear you breathing, you know. Come out and shop like a civilised person." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ah, a professional. You'll want the good stock, not the jars I keep on the front shelf." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gerald Crawley, supplier of certain powders and tinctures. Most of my custom comes in quietly and leaves the same way." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin in my shop. I sell nothing that's against the King's law, I'll have you know, and I'd thank you to stop looking at the jars like that." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of the trade. Everything you need for your blades is here, and I'll not ask what they're for." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, now." },
        { id = "h_again2", text = "Go on. I'm discreet, not deaf." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who buys poison in a town like this?", next = "who" },
        { text = "This trade seems a little dishonourable to me.", next = "honour" },
        { text = "What do you use against orcs?", next = "orcs", when = { class = "ROGUE" } },
        { text = "Where do your ingredients come from?", next = "stock" },
        { text = "Does the Magistrate know what you sell?", next = "magistrate" },
        { text = "Anything that works on an arrowhead?", next = "arrows", when = { class = "HUNTER" } },
        { text = "Where I come from, we fight with powder, not poison.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Rogues, mostly, and the odd hunter with a gnoll problem. Some of the guards, though they'd never say so, because orcs don't fight fair either." },
      },
      choices = {
        { text = "So the guards buy from you.", next = "who_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_guards = {
      lines = { { id = "wg_default", text = "I never said that, and if anyone asks, you never heard it. Let's say a blade that bites twice saves a life now and then." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "And you sleep well, selling that to them?", next = "who_sleep" },
      },
    },
    who_sleep = {
      lines = { { id = "ws_default", text = "Better than I would if the Blackrock came over the bridge, and they've tried. A guard who comes home is a guard who buys again, so you'll forgive me if I call that a clear conscience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "st_default", text = "The hills give most of it. Tarantulas up past Alther's Mill carry a venom that sets well in a vial, and there's a root along the shore of Lake Everstill that the murlocs avoid, which is as good a recommendation as any." } },
      choices = {
        { text = "Who goes out to gather it?", next = "st_gather" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_gather = {
      lines = { { id = "sg_default", text = "Lads from the town with more nerve than prospects, and I pay them well for it. Fewer of them every season, since the gnolls took to the hills, so prices rise, and I'd rather they didn't." } },
      choices = {
        { text = "You send boys into gnoll country for profit?", next = "st_boys" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_boys = {
      lines = { { id = "sb_default", text = "I send nobody anywhere; I buy what's brought. The lads would go up those hills for the Marshal's bounty anyway, and mine pays better and asks them to come home in one piece." } },
      choices = {
        { text = "That's a merchant's excuse. You should stop paying them.", next = "BACK", fx = { align = { light = 1 } },
          reply = "Then they'd go hungry instead, and nobody thanks you for that either." },
        { text = "They choose their risks. Fair pay for fair work.", next = "BACK", fx = { align = { light = -1 } },
          reply = "Exactly so. You've a head for trade, friend." },
        { text = "Something else.", next = "BACK" },
      },
    },
    magistrate = {
      lines = { { id = "mg_default", text = "Magistrate Solomon knows, in the way a magistrate knows things he'd rather not write down. He's too busy writing letters to Stormwind begging for soldiers to trouble himself with a man who sells spider venom." } },
      choices = {
        { text = "Does Stormwind answer him?", next = "mg_stormwind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mg_stormwind = {
      lines = { { id = "ms_default", text = "Not that anyone's seen, though he keeps writing, bless him. Redridge holds with what it's got, which is a handful of guards, a few heroes passing through and, if you'll forgive me, my shelf." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "magistrate_solomon" } } } },
    },
    arrows = {
      lines = { { id = "ar_default", text = "Not from me, I'm afraid, since my stock is made for a blade and goes thin on a shaft. Your craft wants a steady eye and a good beast, and I hear you've already got the beast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "So I've heard, and very loud it is too. Powder knocks an orc down, master dwarf, and my wares keep him from getting up, so I'd say we're in the same business from different ends." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    honour = {
      big = true,
      lines = { { id = "h2_default", text = "Honour is a fine thing to carry into a fight, and a heavy thing to carry out of one. The Blackrock don't care how you kill them, and neither do the widows of the men they killed." },
      },
      choices = {
        { text = "A fair fight still matters, even against orcs.", next = "BACK", reply = "Then I hope you live long enough to keep believing it, friend. I'll still sell you the vials, of course, and you may decide later what you think of them.", fx = { align = { honor = 1 } } },
        { text = "Win first. Worry about honour afterward.", next = "BACK", reply = "A practical outlook, and one my customers tend to share. The ones who worry about honour first rarely come back to buy a second time.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "Something slow, for the big ones, so they tire before you do. An orc in a rage will fight through anything quick, but nothing fights through tiredness forever." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "Some of my customers speak of a manor in the Alterac foothills where people like them are welcomed, if they can find it. I've never been asked to visit, and I'm in no hurry to be." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate buys from the same kind of seller as I do, but they don't pay, they steal, and they make the trade look bad. I keep my stock locked and my door shut when a man in a black mask asks about it." } },
    si7 = { { id = "tp_si7", text = "SI:7 has never troubled my shop, and I've never troubled them, which is the best sort of friendship. I suspect a few of my regulars draw their wages from that office in Old Town." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The jungle trolls of Stranglethorn brew poisons that would make my stock look like table salt. I'd give a good deal to see their recipes, and a good deal more not to see their altars." } },
    background = { { id = "tp_bg", text = "I sell what I sell, and I've no story worth telling you." } },
    magistrate_solomon = { { id = "tp_solomon", text = "He knows what I sell, in the way a magistrate knows things he'd rather not write down." } },
    gnolls = { { id = "tp_gnolls", text = "They've taken the hills, and my gatherers come home fewer every season." } },
    advice = { { id = "tp_ad", text = "Always wipe your blade before you sheathe it. You'd be surprised how many lose a finger to that." } },
    _none = { { id = "tp_none", text = "I don't know, and if I did I'd charge you for it." } },
  },
}
