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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some of them are, which is why I warn people away from my bottles. Gramma Stonefield calls me slow, but I'm careful, and I'm alive." } },
      choices = {
        { text = "Careful is wise, William. Slow and alive beats quick and dead.", next = "BACK", reply = "Thank you, and I'll tell Gramma Stonefield you said so, though she'll only snort at me. Slow has kept all my fingers on.", fx = { align = { order = 1 } } },
        { text = "A little danger never hurt anyone.", next = "BACK", reply = "Tell that to the last fellow who uncorked one of my bottles to sniff it. He's fine now, mostly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Most of them do, and they buy the black ones, which I make only because they ask. I've wondered more than once what they're for, but a candle's a candle, and better I sell them a decent one than have them making their own from who knows what." } },
      choices = {
        { text = "Better your candles than theirs. You're doing good.", next = "BACK", reply = "I like to think so, and it helps me sleep, a little, so long as I don't ask what they light them for.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You shouldn't wonder, William. It's not your business.", next = "BACK", reply = "You're probably right, and I'll try to stop. It's hard not to wonder, with all that chanting.", fx = { align = { light = -1 } } },
        { text = "Something else, William.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Willow bark and a little peacebloom, steeped strong, though it tastes like a boot. Most warriors would sooner limp than drink it, and that's warriors for you." } },
      choices = {
        { text = "I'll drink it, taste and all.", next = "BACK", reply = "Then you're braver than most warriors I've met. Hold your nose and swallow fast.", fx = { align = { order = 1 } } },
        { text = "I'll limp, thank you.", next = "BACK", reply = "Most do, and I'll not take it personally. The bottle will be here when the limp gets worse.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A salve for paws, made with tallow and a bit of herb, which I first made for Farley's dog. Animals get sore feet just as we do, but they don't complain, so you have to look." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A salve for paws, made with tallow and a bit of herb, which I first made for Farley's dog. Let me see {pet}'s paws, if it'll let me, because those roads are hard on a creature that doesn't wear boots." },
      },
      choices = {
        { text = "I'll look after its paws, then. Thank you.", next = "BACK", reply = "You're welcome, and I'll throw in a little extra for the dog's sake. Look at the pads every evening.", fx = { align = { light = 1 } } },
        { text = "It's a beast. It'll toughen up on its own.", next = "BACK", reply = "It'll toughen up limping, and then you'll wonder why it's slow. The salve's cheap, friend.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tinctures for sleeping and salves for climbing, mostly, which is all I'll admit to with the Guard so thin on the ground. I sell them to anyone who asks, but I'd like to think they're used on Defias rather than farmers." } },
      choices = {
        { text = "They'll only be used on the Defias, Pestle.", next = "BACK", reply = "I'll hold you to that, and I'll sleep better for it. Use them well.", fx = { align = { honor = 1 } } },
        { text = "Use is the buyer's business, not the seller's.", next = "BACK", reply = "That's what the Defias say, I expect, and I'd rather not be in their company. I'll keep asking anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Peacebloom and silverleaf, mostly, though I've heard of a kaldorei herb that only grows under moonlight. I'd give a month's takings for a single leaf." } },
      choices = {
        { text = "The forest gives freely if you ask well.", next = "BACK", reply = "That's what I've always heard, and I'll try asking more nicely. Thank you.", fx = { align = { honor = 1 } } },
        { text = "Pick what you can. The forest won't miss it.", next = "BACK", reply = "It'll miss it in a few years, if everybody thinks that way. I'll pick carefully, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest enough, and kind, which matters more to me than honest. It's for two young people in love whose families are at war, and if a little potion helps one of them cross a river unseen, I'll answer for it to whoever asks." } },
      choices = {
        { text = "Kindness doesn't excuse deceit, William.", next = "BACK", reply = "It doesn't, I know, and I'll answer for that too. But I'd rather be kind and wrong than right and cold.", fx = { align = { honor = 1 } } },
        { text = "Then you've done right. Love deserves the help.", next = "BACK", reply = "Thank you, it's good to hear somebody say so. I'll keep brewing for them.", fx = { align = { honor = -1 } } },
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
          text = "Gramma Stonefield told you about her grandson and the Maclure girl, did she? Then you're in on it, and welcome, because there aren't many of us." },
        { id = "q_kelp", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "The kelp is for a potion, a private potion for a private matter. You understand, I'm sure." },
        { id = "q_escape", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "Maybell drank the potion and reached the river? Oh, good! Only don't tell either family I had a hand in it." },
        { id = "q_shipment", when = { questActive = TODO_QUEST("Shipment to Stormwind") },
          text = "Straight to my brother Morgan at our shop in Stormwind, please, and don't sit on the crate; candles bruise. Well, they dent, which is much the same to a candle." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Now, I'll wager you know the herbs of the wild better than any alchemist, and I'd love to compare notes." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Quick hands and a quiet step. I've a few things on the back shelf that your sort might find useful, if you're asking." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Something for the bruises, perhaps, or a candle to read your letters home by?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I've a salve for scratches, and a candle that keeps the midges off, if you're camping by the lake." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I sell candles and small mercies, and I suspect you'll want more of the first than the second." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Don't drink from that bottle, or that one either; your spirits may protect you, but my potions won't." },
      },
      again = {
        { id = "h_again", text = "Hmm? Sorry, I was counting drops; do go on." },
        { id = "h_again2", text = "Something else? Ask away, and mind the blue one while you do." },
      },
      choices = {
        { text = "Which herbs do you prize most?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Kobold candles seem an odd thing to want.", next = "candles" },
        { text = "Tell me about Maybell and Tommy Joe.", next = "lovers",
          when = { any = { { questActive = TODO_QUEST("Collecting Kelp") }, { questActive = TODO_QUEST("The Escape") }, { topicKnown = "maybell_tommy" } } } },
        { text = "So you know Gramma Stonefield.", next = "gramma",
          when = { any = { { questDone = TODO_QUEST("Note to William") }, { heardLine = "gramma.h_speak" } } } },
        { text = "I'm an alchemist too.", next = "alchemist", when = { profession = "Alchemy" } },
        { text = "Can your tinctures do what prayer can't?", next = "priest", when = { class = "PRIEST" } },
        { text = "Invisibility's usually a mage's trick.", next = "mage", when = { class = "MAGE", any = { { questActive = TODO_QUEST("Collecting Kelp") }, { questActive = TODO_QUEST("The Escape") }, { topicKnown = "maybell_tommy" } } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "What sort of things do you keep on the back shelf?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "There must be a tincture for a warrior's aches, Pestle.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you make anything for a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is your private potion for an honest purpose, Pestle?", next = "xapala", when = { class = "PALADIN", any = { { questActive = TODO_QUEST("Collecting Kelp") }, { questActive = TODO_QUEST("The Escape") }, { topicKnown = "maybell_tommy" } } } },
        { text = "I'd guess Crowe's warlock students buy their candles here, William.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your potions sound dangerous, William.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Nothing for now.", next = "END" },
      },
    },

    candles = {
      lines = {
        { id = "c_default", text = "Not to an apothecary, and my brother Morgan and I keep one in Stormwind. Kobold wax burns long and clean, and the kobolds in Fargodeep and Jasperlode mines have plenty." },
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
        { id = "cw_default", text = "The candles are out here, and so are the herbs, the crickets and an old friend or two. The city is very loud for a man who counts drops." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    candles_where = {
      lines = {
        { id = "cr_default", text = "I've no idea where they get them, and they don't ask why I want them, so it's the most honest trade in Elwynn: nobody pretends to understand anybody." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kobolds" } } } },
    },

    lovers = {
      big = true,
      lines = {
        { id = "l_default", key = true,
          text = "Maybell's a Maclure and Tommy Joe's a Stonefield, and their families haven't shared a fence post in years. Young love doesn't care about fence posts, and a drop of my invisibility liquor helps it over them.",
          fx = { learn = { "maybell_tommy" } } },
      },
      choices = {
        { text = "You seem keen to help them.", next = "lovers_why" },
        { text = "How does an invisibility liquor work?", next = "lovers_potion" },
        { text = "Love will find a way.", next = "BACK", reply = "It always does, and sometimes it needs a little help from a bottle. I'll keep my shelves stocked for them.", fx = { trait = { kind = 1 }, align = { order = -1 }, opinion = { maybell_tommy = "romantic" } } },
        { text = "They should listen to their families.", next = "BACK", reply = "They should, maybe, and I'll not argue with you. But I'll still brew for them if they ask.", fx = { align = { order = 2 }, opinion = { maybell_tommy = "dutiful" } } },
      },
    },
    lovers_why = {
      lines = {
        { id = "lw_default", text = "I remember being young, and in love, and told no, and so does Mildred, that's Gramma Stonefield. Old people ought to be useful for something besides advice." },
      },
      choices = {
        { text = "That's kind of you both.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lovers_potion = {
      lines = {
        { id = "lp_default", text = "Crystal kelp, a steady hand and a pinch of my own. It won't last long, but it's long enough for a walk to the river and back." },
        { id = "lp_kelp", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "Crystal kelp's a sea plant, and how the Crystal Lake murlocs come by it I can't imagine. Ask them for it, firmly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } } },
    },

    gramma = {
      lines = {
        { id = "gr_default", text = "Mildred? I've known her since we were both young enough to run. I hadn't seen her in years before her note came, and her handwriting hasn't improved one bit." },
      },
      choices = {
        { text = "She says you're slow.", next = "gramma_slow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gramma_slow = {
      lines = {
        { id = "gs_default", text = "She means slow and right, and she's said it for fifty years. It's the nicest thing she says to anybody." },
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
        { text = "Some things shouldn't be sold.", next = "BACK", reply = "No, I suppose they shouldn't, and I'm glad the Light can't be bottled. I'd only spill it.", fx = { align = { light = 1 } } },
        { text = "You'd make a fortune.", next = "BACK", reply = "I would, and I'd buy a proper shop in the Trade District. Ah, well, a man can dream.", fx = { align = { light = -1 }, trait = { witty = 1 } } },
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
    scourge = { { id = "tp_scourge", text = "The plague in Lordaeron spread through the grain, and the finest alchemists in the north couldn't stop it once it started. I've read every account I can find, and I still don't understand how it was made." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn writes to every apothecary in the kingdom for remedies against the plague. I've sent what I could, and I've a feeling they'll need more than any of us can make." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells little vials it calls elixirs, and I've tested a few out of curiosity. They're honest enough, mostly honey and a little ginger." } },
  },
}
