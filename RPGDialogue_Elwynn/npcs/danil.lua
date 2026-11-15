-- Brother Danil, general supplies, beside his wagon at Northshire Abbey's door. Voice: bibles/danil.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "danil", id = TODO_NPC("Brother Danil"), name = "Brother Danil",
  bible = "bibles/danil.md", role = "vendor", tier = "service",
  communities = { "northshire" }, temper = { "sharp" },
  notices = { "purse", "kit" },

  greetings = {
    { id = "g_faithful", text = "Supplies for the faithful, and for anyone else with coin." },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Browsing is free. Everything else, regrettably, is not." },
    { id = "g_regular", when = { timesTalked = { min = 6 } }, text = "My best customer! Don't tell the others, they'd be jealous." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "I don't sell trousers. I wish I did, for your sake." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bread, water, a little thread. The Abbey's stores are humble, but honest." },
        { id = "h_rich", when = { money = { min = 100000 } }, text = "Ten gold on you, at least; I can hear it from here. The Abbey roof leaks, you know." },
        { id = "h_roof", when = { metBefore = true }, text = "The roof leaked on the bread again. I told the Brothers, and they told me to pray, so I prayed, and it rained." },
        { id = "h_hunter", when = { class = "HUNTER", maxLevel = 15 },
          text = "A bow. Then you'll want arrows, and you'll want more than you think. Recruits always think a quiver lasts a week." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "One of the Abbey's own, buying from my wagon. I used to give your lot the stale loaves. Now you pay for the fresh ones." },
        { id = "h_veteran", when = { minLevel = 20 },
          text = "You've outgrown my wagon, by the look of that kit. Stormwind's merchants will be glad of you. I'm glad of you too, if you're buying." },
      },
      again = {
        { id = "h_again", text = "Anything else? The wagon's open till the bread runs out." },
        { id = "h_again2", text = "Ask away. Questions are the one thing I don't charge for." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Why sell from a wagon, Brother?", next = "wagon" },
        { text = "Mining picks and skinning knives? From a brother?", next = "tools" },
        { text = "Arrows. As many as I can carry.", next = "arrows", when = { class = "HUNTER" } },
        { text = "I can't afford much, Brother.", next = "poor", when = { money = { max = 500 } } },
        { text = "Just looking.", next = "END" },
      },
    },
    wagon = {
      lines = {
        { id = "w_default", text = "The brothers would rather coin didn't change hands under the Abbey roof, so it changes hands out here, under mine, and mine leaks less." },
      },
      choices = {
        { text = "Who buys the most?", next = "wagon_buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagon_buyers = {
      lines = {
        { id = "wb_default", text = "Recruits. Bread first, then arrows, then bread again, once they've learned what a kobold does to a packed lunch." },
        { id = "wb_kobolds", when = { questActive = TODO_QUEST("Kobold Camp Cleanup") },
          text = "Recruits, mostly ones like you, on their way to the kobold camp. Eat before you go. The Marshal doesn't feed you, and the kobolds certainly won't." },
      },
      choices = {
        { text = "I'll take some bread, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tools = {
      lines = {
        { id = "t_default", text = "Everyone comes back from those woods wanting to keep something, whether it's ore, hides or herbs. I'd rather they did it with a proper knife than a borrowed spoon." },
      },
      choices = {
        { text = "Do the brothers approve?", next = "tools_approve" },
        { text = "Practical of you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tools_approve = {
      lines = {
        { id = "ta_default", text = "Brother Neals says honest trade is a kind of prayer. He says that about wine as well, so I don't lean on it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    arrows = {
      lines = {
        { id = "a_default", text = "Rough arrows, and rough is the word. They fly straight enough for wolves. Fletch your own when you've the time and the feathers." },
      },
      choices = {
        { text = "Then sell me the rough ones.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poor = {
      lines = {
        { id = "p_default", text = "Then buy bread and water and nothing clever. A full stomach wins more fights than a sharp knife. Don't tell the smiths." },
      },
      choices = {
        { text = "Bread and water it is.", next = "BUSINESS", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of Northshire with a head for sums, so they gave me the wagon. Some brothers get visions; I got a ledger." } },
    advice = { { id = "tp_ad", text = "Carry water. Everyone remembers the sword and forgets the water. The kobolds don't forget anything." } },
    northshire_abbey = { { id = "tp_abbey", text = "A lovely building, and it leaks. I've said so in every prayer for a year." } },
    kobolds = { { id = "tp_kobolds", text = "Good for business, kobolds. Every recruit who goes up that hill comes back hungry." } },
    _none = { { id = "t_none", text = "I keep the stores, not the secrets. Ask Brother Neals." } },
  },
}
