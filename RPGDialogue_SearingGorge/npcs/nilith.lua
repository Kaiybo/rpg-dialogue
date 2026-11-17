-- Nilith Lokrav: a human warlock and tailor camped near Blackrock Mountain, guarding the gorge's shadow silk spiders and hunting the Undermarket. Voice: bibles/nilith.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nilith", id = TODO_NPC("Nilith Lokrav"), name = "Nilith Lokrav",
  bible = "bibles/nilith.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "cool", "precise" }, values = { "craft", "ruthless" },
  notices = { "profession", "class" },

  impression = {
    first = "Nilith Lokrav keeps an infernal named Raze beside her tent and talks about spiders the way other tailors talk about bolts of silk. She is calm, exact, and quite willing to have people killed over a thread.",
    third = "{name} met Nilith Lokrav, a warlock tailor camped near Blackrock Mountain who guards the Searing Gorge's shadow silk.",
  },

  greetings = {
    { id = "g_default", text = "Mind Raze; he's harmless unless I say otherwise, and I rarely say otherwise to people who are useful." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still in one piece. Good, I prefer my helpers that way." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the spiders have spun a great deal in that time. Someone always comes to take it, so I'm glad you're back." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word is you've annoyed someone in the Gorge. That's fine, so long as it wasn't one of my spiders." },
  },

  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "You're a tailor; I can see it in how you look at my bolts before you look at me. Good, then you'll understand why I'm so protective of them." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A fellow warlock, and you've brought your own companion. Keep it away from Raze, because he doesn't like to share his fire." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nilith Lokrav. I work shadow silk, the finest cloth a tailor can put a needle to, and the spiders of the Searing Gorge are the only reason I'd live in this furnace." },
        { id = "h_poach_active", tags = { "news" }, when = { questActive = TODO_QUEST("Shadoweaver") },
          text = "Five poachers, by my count, wandering the gorge and slaughtering spiders by the dozen without a thought for next season. Start north, and take Raze if you need him." },
        { id = "h_poach_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Shadoweaver"), days = 3 } },
          text = "The poachers are gone, and the spiders have already started spinning again in the north. You've done the craft a service, whether or not you sew." },
        { id = "h_market_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Undermarket") },
          text = "Trade Master Kovic and his brute Clunk, down at the Cauldron with their Dark Iron friends. Kill them both and bring me Kovic's satchel, and the Undermarket will think twice about sending more." },
        { id = "h_market_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Undermarket") },
          text = "Kovic is dead, and his satchel held nothing worth my time, which is a pity. Has Vizzklick in Gadgetzan had his good news yet?" },
        { id = "h_tailor", when = { profession = "Tailoring" },
          text = "Another tailor, and one who's come a long way to find me, by the look of your boots. Shadow silk is worth the walk, though the gorge will tell you otherwise." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief; the light is good for close work just now." },
        { id = "h_again2", text = "Something more? Raze is listening too, so choose your words." },
      },
      choices = {
        { text = "What is shadow silk?", next = "silk" },
        { text = "Who are the Undermarket?", next = "market" },
        { text = "Tell me about Raze.", next = "raze" },
        { text = "Why live here, so near Blackrock Mountain?", next = "camp" },
        { text = "How do you weave shadow silk?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "How did you bind an infernal?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your silk.", next = "END" },
      },
    },

    silk = {
      lines = {
        { id = "si_default", text = "The thread the gorge spiders spin, dark as a moonless night and stronger than it has any right to be, and every serious artisan in our trade wants it. It holds an enchantment better than any cloth I know of." },
      },
      choices = {
        { text = "Why protect the spiders, then? Just take it.", next = "silk_poach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silk_poach = {
      lines = {
        { id = "sp_default", text = "Because dead spiders spin nothing, and the poachers kill whole nests for one season's thread. I harvest carefully so there's silk next year, and I'm not sentimental about it, I simply prefer to have a supply." },
      },
      choices = {
        { text = "So you had the poachers killed for profit.", next = "silk_judge" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    silk_judge = {
      lines = {
        { id = "sj_default", text = "For the craft, and for the spiders, and yes, for profit, in no particular order. I asked you to end them, not to like it, and you're free to think what you please about me." },
      },
      choices = {
        { text = "Poachers knew the risk. Their deaths are on them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Killing men over thread is too much.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    market = {
      lines = {
        { id = "ma_default", text = "Cutthroat traders who'll sell, move or trade anything for the right price, and they've set up a base here with close ties to the Dark Iron. Trade Master Kovic runs it, with a great lump named Clunk to do his lifting." },
      },
      choices = {
        { text = "Why do you care about traders?", next = "market_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    market_why = {
      lines = {
        { id = "mw_default", text = "Because they undercut every honest merchant from here to Gadgetzan, and because they buy from the poachers, and because anyone who does business with the Dark Iron is helping them arm. Vizzklick in Gadgetzan has hated Kovic for years, and he'll be glad to hear he's dead." },
        { id = "mw_done", when = { questDone = TODO_QUEST("The Undermarket") },
          text = "They undercut honest merchants, they bought from my poachers, and they armed the Dark Iron. You struck them a decisive blow, and their leaders will think twice before sending more cronies to this gorge." },
      },
      choices = {
        { text = "An honest trade deserves protecting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Honest? You're just clearing out rivals.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    raze = {
      lines = {
        { id = "ra_default", text = "An infernal, bound to me some years ago, and the best guard I've ever had, since he doesn't sleep, drink or ask for wages. He's helped more than one of my errand-runners when the poachers turned out to be more than they could manage." },
      },
      choices = {
        { text = "Isn't a demon dangerous to keep?", next = "raze_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raze_danger = {
      lines = {
        { id = "rd_default", text = "Everything worth keeping is dangerous, including shadow silk, which will cut your fingers to ribbons if you hurry. Raze knows who holds his leash, and I never forget it, which is the whole of the trick." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "ca_default", text = "Because the best spiders nest in the hottest rock, and the hottest rock is here, near the mountain's door. The Dark Iron leave me alone, mostly, because Raze is bigger than they are and they've learned to count." },
      },
      choices = {
        { text = "Don't you fear what's inside the mountain?", next = "camp_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_fear = {
      lines = {
        { id = "cf_default", text = "Fear is wasted effort when you can't change a thing. The Dark Iron called something out of the fire in there long ago, and if it ever cared about my tent, Raze and I would be ash before we noticed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xtailor = {
      big = true,
      lines = {
        { id = "xt_default", text = "Slowly, with a cold needle and a colder temper, and you must spin it while it's still a little warm from the rock, or it frays. I'll not tell you more than that for free, since a tailor's secrets are her living." },
      },
      choices = {
        { text = "Then I'll earn them, a stitch at a time.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Craft should be shared, not hoarded.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "The same way you bound yours, only with more patience and a much bigger circle. Infernals respect strength and nothing else, so the binding is the easy part, and convincing him he's still bound every morning is the work." },
      },
      choices = {
        { text = "Power is for using. I'd bind one too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some powers are best left uncalled.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A tailor first and a warlock second, though the second has been very useful to the first." } },
    advice = { { id = "tp_ad", text = "Never buy silk from someone who can't tell you which nest it came from." } },
    _none = { { id = "tp_none", text = "I know thread and spiders and the people who steal both, and that's the end of my expertise." } },
  },
}
