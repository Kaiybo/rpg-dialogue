-- William Pestle, Lion's Pride Inn, Goldshire. Voice: bibles/pestle.md
-- Gathers kobold wax for the family apothecary in Stormwind; brews for young lovers on the side.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pestle", id = TODO_NPC("William Pestle"), name = "William Pestle",
  bible = "bibles/pestle.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "craft" },
  impression = {
    first = "William Pestle warns people away from his own bottles, which seems a sensible habit for an alchemist. Gramma Stonefield calls him a good friend and a slow one, and both look true.",
    third = "{name} met William Pestle, Goldshire's alchemist, who sells candles and tinctures and keeps Gramma Stonefield's confidences.",
  },

  greetings = {
    { id = "g_mind", text = "Don't touch the green one, or the blue one either, now I think of it." },
    { id = "g_candles", when = { questActive = TODO_QUEST("Kobold Candles") }, text = "Have you any candles for me? The kobold kind, mind." },
    { id = "g_sit", when = { metBefore = true }, text = "Good day, good day! Sit and have a drink, only not that one." },
  },

  notice = {
    { id = "n_alchemist", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! Here, smell this, and closer than that, mind; isn't that marvelous?" },
    { id = "n_herbalist", cat = "craft", when = { profession = "Herbalism" },
      text = "You've peacebloom on your gloves, and you pick it too early, by the way, as everyone does." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Most of them do, and they buy the black ones, which I make only because they ask. I've wondered more than once what they're for, but a candle's a candle, and I'd rather sell them a decent one than have them making their own from who knows what." } },
      choices = {
        { text = "Better your candles than theirs. You're doing good.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You shouldn't wonder, William. It's not your business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, William.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Willow bark and a little peacebloom, steeped strong, though it tastes like a boot. Most warriors would sooner limp than drink it, which tells you something about warriors, I suppose." } },
      choices = {
        { text = "I'll drink it, taste and all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll limp, thank you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A salve for paws, made with tallow and a bit of herb, which I first made for Farley's dog. Animals get sore feet just as we do, but they don't complain, so you have to look." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Let me see {pet}'s paws, if it'll let me. Those roads are hard on a creature that doesn't wear boots." },
      },
      choices = {
        { text = "I'll look after its paws, then. Thank you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a beast. It'll toughen up on its own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tinctures for sleeping and salves for climbing, mostly, which is all I'll admit to with the Guard so thin on the ground. I sell them to anyone who asks, but I'd like to think they're used on Defias rather than farmers." } },
      choices = {
        { text = "They'll only be used on the Defias, Pestle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Use is the buyer's business, not the seller's.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Peacebloom and silverleaf, mostly, though I've heard of a kaldorei herb that only grows under moonlight. I'd give a great deal for a single leaf." } },
      choices = {
        { text = "The forest gives freely if you ask well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pick what you can. The forest won't miss it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest enough, and kind, which matters more to me than honest. Two young people in love and two old families at war, and if a little potion helps one of them cross a river unseen, I'll answer for it to whoever asks." } },
      choices = {
        { text = "Kindness doesn't excuse deceit, William.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then you've done right. Love deserves the help.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want nothing from my shelves, I expect, unless your order's taken up tinctures." },
        { id = "h_default", text = "Candles, tinctures, a few small mercies in bottles. What can I do for you?" },
        { id = "q_candles", when = { questActive = TODO_QUEST("Kobold Candles") },
          text = "Kobold candles burn longer than any wax in Stormwind. Don't ask me why; I stopped asking long ago." },
        { id = "q_note", tags = { "news" }, when = { questActive = TODO_QUEST("Note to William") },
          text = "A note from Gramma Stonefield? Let me see it, then. Ha, still the worst handwriting in Elwynn, and still right about everything!" },
        { id = "e_gramma", when = { heardLine = "gramma.h_speak" },
          text = "Gramma told you about the boy, did she? Then you're in on it, and welcome, because there aren't many of us." },
        { id = "q_kelp", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "The kelp is for a potion, a private potion for a private matter. You understand, I'm sure." },
        { id = "q_escape", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "She drank it, and reached the river? Oh, good! Only don't tell the Stonefields I had a hand in it." },
        { id = "q_shipment", when = { questActive = TODO_QUEST("Shipment to Stormwind") },
          text = "Straight to Morgan at the shop, please, and don't sit on the crate; candles bruise. Well, they dent, which is much the same to a candle." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Now, I'll wager you know the herbs of the wild better than any alchemist, and I'd love to compare notes." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Quick hands and a quiet step. I've a few things on the back shelf that your sort might find useful, if you're asking." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Something for the bruises, perhaps, or a candle to read your letters home by?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I've a salve for scratches, and a candle that keeps the midges off, if you're camping by the lake." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I sell candles and small mercies, and I suspect you'll want more of the first than the second." },
      },
      again = {
        { id = "h_again", text = "Hmm? Sorry, I was counting drops; do go on." },
        { id = "h_again2", text = "Something else? Ask away, and mind the blue one while you do." },
      },
      choices = {
        { text = "Which herbs do you prize most?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why kobold candles?", next = "candles" },
        { text = "Tell me about Maybell and Tommy Joe.", next = "lovers",
          when = { any = { { questActive = TODO_QUEST("Collecting Kelp") }, { questActive = TODO_QUEST("The Escape") }, { topicKnown = "maybell_tommy" } } } },
        { text = "You know Gramma Stonefield?", next = "gramma",
          when = { any = { { questDone = TODO_QUEST("Note to William") }, { heardLine = "gramma.h_speak" } } } },
        { text = "I'm an alchemist too.", next = "alchemist", when = { profession = "Alchemy" } },
        { text = "Can your tinctures do what prayer can't?", next = "priest", when = { class = "PRIEST" } },
        { text = "Invisibility's usually a mage's trick.", next = "mage", when = { class = "MAGE" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "What sort of things do you keep on the back shelf?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there a tincture for a warrior's aches, Pestle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you make anything for a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is your private potion for an honest purpose, Pestle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do Crowe's students buy their candles here, William?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
        { id = "cb_default", text = "Morgan runs Pestle's Apothecary in the Trade District. He minds the shop and I mind the wax, and he thinks he has the better half of the bargain, which he does." },
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
          text = "Crystal kelp's a sea plant, and how the Crystal Lake murlocs come by it I can't imagine. Ask them for it, firmly." },
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
        { id = "al_default", text = "Wonderful! Then a word of advice: never brew with peacebloom picked before noon, because the dew dulls it. I've no proof of that, but I'm quite sure." },
      },
      choices = {
        { text = "I'll try it.", next = "BACK", fx = { affinity = 2 } },
        { text = "That sounds like superstition.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Sometimes. Prayer's quicker, but potions keep, and the Light's never been sold in a bottle, more's the pity, or I'd stock it." },
      },
      choices = {
        { text = "Some things shouldn't be sold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You'd make a fortune.", next = "BACK", fx = { align = { light = -1 }, trait = { witty = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Is it? Then please don't tell Maybell; she thinks I'm terribly clever, and I'd like to keep it that way." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "An apothecary hears a good deal while folk wait for their remedies. Ask me about any of this, and I'll tell you what I can." },
    },
    background = { { id = "tp_bg", text = "I'm an apothecary from Stormwind who likes the country better. My brother keeps the shop, and I keep the candles." } },
    advice = { { id = "tp_ad", text = "Label everything. The green one and the blue one look very alike by candlelight." } },
    maybell_tommy = {
      { id = "t_lovers", text = "If anyone asks, I only sell candles." },
      { id = "t_lovers2", text = "Sit down, then, and quietly. You'll want the whole story, I suppose.", next = "lovers" },
    },
    kobolds = { { id = "t_kobolds", text = "They make the candles. I don't ask how, and they don't ask why I want them." } },
    _none = { { id = "t_none", text = "Hmm? Sorry, I was counting drops. Ask me again later, would you?" } },
  },
}
