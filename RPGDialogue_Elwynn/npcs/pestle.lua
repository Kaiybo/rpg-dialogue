-- William Pestle, Lion's Pride Inn, Goldshire. Voice: bibles/pestle.md
-- Gathers kobold wax for the family apothecary in Stormwind; brews for young lovers on the side.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pestle", id = TODO_NPC("William Pestle"), name = "William Pestle",
  bible = "bibles/pestle.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_mind", text = "Don't touch the green one. Or the blue one, actually." },
    { id = "g_candles", when = { questActive = TODO_QUEST("Kobold Candles") }, text = "Any candles? The kobold kind, mind." },
    { id = "g_sit", when = { metBefore = true }, text = "Good day, good day! Sit, have a drink. Not that one." },
  },

  notice = {
    { id = "n_alchemist", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! Smell this. No, closer. Isn't that marvelous?" },
    { id = "n_herbalist", cat = "craft", when = { profession = "Herbalism" },
      text = "You've peacebloom on your gloves. You pick it too early, by the way. Everyone does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Candles, tinctures, a few small mercies in bottles. What can I do for you?" },
        { id = "q_candles", when = { questActive = TODO_QUEST("Kobold Candles") },
          text = "Kobold candles burn longer than any wax in Stormwind. Don't ask me why. I've stopped asking." },
        { id = "q_note", tags = { "news" }, when = { questActive = TODO_QUEST("Note to William") },
          text = "A note from Gramma Stonefield? Let me see. Ha! Still the worst handwriting in Elwynn, and still right." },
        { id = "e_gramma", when = { heardLine = "gramma.h_speak" },
          text = "Gramma told you about the boy, did she? Then you're in on it. Welcome. There aren't many of us." },
        { id = "q_kelp", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "The kelp is for a potion. A private potion, for a private matter. You understand." },
        { id = "q_escape", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "She drank it? And reached the river? Oh, good. Don't tell the Stonefields I had a hand in it." },
        { id = "q_shipment", when = { questActive = TODO_QUEST("Shipment to Stormwind") },
          text = "Straight to Morgan at the shop, please, and don't sit on the crate. Candles bruise. Well. They dent." },
      },
      again = {
        { id = "h_again", text = "Hmm? Sorry, counting drops. Go on." },
        { id = "h_again2", text = "Something else? Ask away. Mind the blue one." },
      },
      choices = {
        { text = "Why kobold candles?", next = "candles" },
        { text = "Tell me about Maybell and Tommy Joe.", next = "lovers",
          when = { any = { { questActive = TODO_QUEST("Collecting Kelp") }, { questActive = TODO_QUEST("The Escape") }, { topicKnown = "maybell_tommy" } } } },
        { text = "You know Gramma Stonefield?", next = "gramma",
          when = { any = { { questDone = TODO_QUEST("Note to William") }, { heardLine = "gramma.h_speak" } } } },
        { text = "I'm an alchemist too.", next = "alchemist", when = { profession = "Alchemy" } },
        { text = "Can your tinctures do what prayer can't?", next = "priest", when = { class = "PRIEST" } },
        { text = "Invisibility's usually a mage's trick.", next = "mage", when = { class = "MAGE" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Nothing for now.", next = "END" },
      },
    },

    candles = {
      lines = {
        { id = "c_default", text = "My brother Morgan and I keep an apothecary in Stormwind. Kobold wax burns long and clean. The kobolds in Fargodeep and Jasperlode have plenty." },
      },
      choices = {
        { text = "Your brother?", next = "candles_brother" },
        { text = "Where do kobolds get candles?", next = "candles_where" },
      },
    },
    candles_brother = {
      lines = {
        { id = "cb_default", text = "Morgan. Pestle's Apothecary, Trade District. He minds the shop; I mind the wax. He thinks he has the better half of the bargain. He's right." },
      },
      choices = {
        { text = "Why are you out here, then?", next = "candles_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "kobolds" } } },
      },
    },
    candles_why = {
      lines = {
        { id = "cw_default", text = "The candles are out here. So are the herbs, and the quiet, and an old friend or two. The city is very loud for a man who counts drops." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    candles_where = {
      lines = {
        { id = "cr_default", text = "I've no idea, and they don't ask why I want them. It's the most honest trade in Elwynn. Nobody pretends to understand anybody." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kobolds" } } } },
    },

    lovers = {
      big = true,
      lines = {
        { id = "l_default", key = true,
          text = "A Maclure and a Stonefield. Their families haven't shared a fence post in years. Young love doesn't care about fence posts.",
          fx = { learn = { "maybell_tommy" } } },
      },
      choices = {
        { text = "Why help them?", next = "lovers_why" },
        { text = "How does an invisibility liquor work?", next = "lovers_potion" },
        { text = "Love will find a way.", next = "BACK", fx = { trait = { kind = 1 }, align = { order = -1 }, opinion = { maybell_tommy = "romantic" } } },
        { text = "They should listen to their families.", next = "BACK", fx = { align = { order = 2 }, opinion = { maybell_tommy = "dutiful" } } },
      },
    },
    lovers_why = {
      lines = {
        { id = "lw_default", text = "I remember being young, and in love, and told no. Mildred remembers too. Old people ought to be useful for something besides advice." },
      },
      choices = {
        { text = "That's kind of you both.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lovers_potion = {
      lines = {
        { id = "lp_default", text = "Crystal kelp, a steady hand and a pinch of my own. It won't last long. Long enough for a walk to a river and back." },
        { id = "lp_kelp", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "Crystal kelp's a sea plant. How the Crystal Lake murlocs come by it, I can't imagine. Ask them. Firmly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } } },
    },

    gramma = {
      lines = {
        { id = "gr_default", text = "Mildred? Since we were both young enough to run. I hadn't seen her in years before her note came, and her handwriting hasn't improved one bit." },
      },
      choices = {
        { text = "She says you're slow.", next = "gramma_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gramma_slow = {
      lines = {
        { id = "gs_default", text = "Slow and right, she means. She's said it for fifty years. It's the nicest thing she says to anybody." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    alchemist = {
      lines = {
        { id = "al_default", text = "Wonderful! Then a word of advice: never brew with peacebloom picked before noon. The dew dulls it. I've no proof. I'm quite sure." },
      },
      choices = {
        { text = "I'll try it.", next = "BACK", fx = { affinity = 2 } },
        { text = "That sounds like superstition.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Sometimes. Prayer's quicker; potions keep. The Light's never been sold in a bottle, more's the pity. I'd stock it." },
      },
      choices = {
        { text = "Some things shouldn't be sold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You'd make a fortune.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Is it? Then don't tell Maybell. She thinks I'm terribly clever. I'd like to keep it that way." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An apothecary from Stormwind who likes the country better. My brother keeps the shop. I keep the candles." } },
    advice = { { id = "tp_ad", text = "Label everything. The green one and the blue one look very alike by candlelight." } },
    maybell_tommy = {
      { id = "t_lovers", text = "If anyone asks, I only sell candles." },
      { id = "t_lovers2", text = "Sit down. Quietly. You'll want the whole story, I suppose.", next = "lovers" },
    },
    kobolds = { { id = "t_kobolds", text = "They make the candles. I don't ask how, and they don't ask why I want them." } },
    _none = { { id = "t_none", text = "Hmm? Sorry. I was counting drops. Ask me again later." } },
  },
}
