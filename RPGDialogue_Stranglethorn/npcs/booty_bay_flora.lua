-- Flora Silverwind: Booty Bay's herbalism trainer, a Stormwind woman who keeps All Things Flora on the top floor and still watches the harbour for a sailor who never came home. Voice: bibles/booty_bay_flora.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "flora", id = 908, name = "Flora Silverwind", title = "Herbalism Trainer",
  bible = "bibles/booty_bay_flora.md", role = "trainer", tier = "service",
  communities = { "booty_bay" }, temper = { "gentle", "steady" }, values = { "patient", "craft" },
  notices = { "craft", "class", "race" },

  impression = {
    first = "Flora Silverwind keeps a shop full of drying herbs at the top of Booty Bay and talks about the jungle like a garden she loves and fears. Her eyes kept drifting to the harbour while we spoke.",
    third = "{name} met Flora Silverwind, the human herbalism trainer who keeps All Things Flora on Booty Bay's top floor and still watches the harbour for someone.",
  },

  greetings = {
    { id = "g_default", text = "Come in out of the sun, and mind the bundles hanging from the beams, because some of them sting." },
    { id = "g_back", when = { metBefore = true }, text = "You found the stairs again! Most folk give up halfway and buy their herbs from the docks instead." },
    { id = "g_away", when = { away = 14 }, text = "It's been {away}, and I'd begun to count you among the jungle's losses. I'm glad to be wrong, friend." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Welcome, friend. Leaves and roots don't care whose banner you carry, and up here neither do I." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism", min = 150 } },
      text = "There's Liferoot sap under your nails and Kingsblood dust on your sleeve, so you've been working this jungle properly. Sit a moment, and tell me where the good patches are this season." },
    { id = "n_herb_new", cat = "craft", when = { profession = "Herbalism", ["not"] = { profession = { name = "Herbalism", min = 150 } } },
      text = "You've a herbalist's satchel but a beginner's gloves, I see. Stranglethorn will teach you quickly, though I'd rather you learned some of it from me first." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You move through a room as though it were a clearing, carefully and without disturbing anything. Druids always do, and I've never stopped admiring it." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, place = "before",
      text = "A kaldorei, at my counter! Your people know more about growing things than mine ever will, so be kind about the state of my shelves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Flora Silverwind, and this is All Things Flora, the highest shop in Booty Bay and the only one that smells better than the harbour. I teach herbalism to anyone patient enough to learn it, and I buy what the jungle gives up, if it's picked properly." },
        { id = "h_herb", when = { profession = "Herbalism" },
          text = "A fellow herbalist, climbing all those stairs to see me! Come and look at what I've got drying, and then tell me what you've found down south, because the jungle changes faster than I can walk it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid in my little shop! I always feel as though I should apologise to you for the dried things on the beams, but they were picked with care, I promise you that." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman, is it? I've had your kind up here before, and not one of them could leave the window, listening to something I couldn't hear, so you're welcome to do the same." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Mind your horns on the lintel, friend, the goblins built the doorways for goblins. I'm glad to see you, because tauren herbalists always teach me something before they leave." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear, back in the jungle your people came from! I'd wager you know half these plants by names older than any I use, and I'd be grateful to hear a few." },
        { id = "h_window", when = { metBefore = true },
          text = "Forgive me, I was watching the mouth of the bay again. Sit down and talk to me, because it keeps me from counting the sails." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? The Kingsblood won't dry any faster for my watching it." },
        { id = "h_again2", text = "Go on, ask me something else, friend. I don't get many visitors who make it all the way up." },
        { id = "h_again3", text = "Anything else? I've time, and there's tea, if you don't mind that it tastes of Liferoot." },
      },
      choices = {
        { text = "What grows out there in the jungle?", next = "herbs" },
        { text = "Picking herbs in Stranglethorn must be dangerous work.", next = "danger" },
        { text = "Why does a human herbalist live in a goblin port?", next = "why" },
        { text = "Tell me about your neighbours.", next = "neighbours" },
        { text = "You keep looking at the harbour. Waiting for someone?", next = "harbour" },
        { text = "I've worked with herbs myself. Any tips for this jungle?", next = "k_herb", when = { profession = "Herbalism" } },
        { text = "This jungle is sick in places. Have you felt it?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The spirits of this land are restless, Flora.", next = "xsham", when = { class = "SHAMAN" } },
        { text = "My people tend groves too. How do you work?", next = "k_nelf", when = { race = "NightElf" } },
        { text = "The Earth Mother gives these herbs. Do you thank her?", next = "k_tauren", when = { race = "Tauren" } },
        { text = "My people lived in this jungle once, mon.", next = "k_troll", when = { race = "Troll" } },
        { text = "Good day, Flora.", next = "END" },
      },
    },

    -- The herbs
    herbs = {
      lines = {
        { id = "hb_default", text = "Everything, friend, which is the trouble with it. Liferoot along the riverbanks, Kingsblood and Fadeleaf under the canopy, Goldthorn and Wild Steelbloom on the rocky hills, and Khadgar's Whisker wherever it likes, because it has never once grown where the books say it should." },
      },
      choices = {
        { text = "Which of them is the most valuable?", next = "herbs_lotus" },
        { text = "You must have picked some strange ones out here.", next = "herbs_kelp" },
        { text = "Something else, Flora.", next = "BACK" },
      },
    },
    herbs_lotus = {
      lines = { { id = "hl_default", text = "Purple Lotus, if you can find it, and you'll find it in the old troll ruins, growing out of the stones where the Skullsplitters and Bloodscalps still keep their fires. I've known three herbalists to go after a lotus by the ruins and only two to come back, and the one who didn't was the best of us." } },
      choices = {
        { text = "Then I'll leave the lotus to braver folk.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Who was the one who didn't come back?", next = "herbs_lost" },
      },
    },
    herbs_lost = {
      lines = { { id = "hls_default", text = "A dwarf named Brannoc, who used to sell me Goldthorn by the sack and sing the whole way up the stairs. He went into the Zul'Mamwe ruins for a lotus he'd spotted from the ridge, and all we ever found was his satchel, so now I tell every new student about him, and I'll thank you to remember him too." } },
      choices = { { text = "I'll remember him. Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    herbs_kelp = {
      lines = { { id = "hk_default", text = "Stranglekelp, without a doubt, because you have to dive for it in the bay and the murlocs think it belongs to them. It feels like wet leather and smells like low tide, but the alchemists pay well for it, and Glyx down the stairs will take every strand I bring him once I've rinsed it to his liking." } },
      choices = { { text = "Something else, Flora.", next = "BACK" } },
    },

    -- The dangers, and the one stance node
    danger = {
      lines = {
        { id = "dg_default", text = "Every patch of Kingsblood in Stranglethorn has something sitting next to it, friend, whether it's a panther in the branches, a basilisk in the rocks or a troll with a spear. The herbs grow best where nobody's picked them, and nobody's picked them because of what lives there." },
      },
      choices = {
        { text = "What advice would you give someone going out there?", next = "danger_advice" },
        { text = "Do other gatherers make it worse?", next = "danger_greed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_advice = {
      lines = { { id = "da_default", text = "Look up before you kneel, because the panthers hunt from the trees, and keep your back to open ground when you dig. Wear thick gloves for the Goldthorn, cut the Liferoot above the root so it grows back, and never kneel anywhere you can't see a way out." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
    danger_greed = {
      big = true,
      lines = { { id = "dgr_default", text = "The Venture Company's crews tear up whole hillsides and leave the dirt bare behind them, and some of the gatherers who sell on the docks are no better. In a few seasons the Steelbloom near their camps won't come back at all, and then they'll move on and do the same to the next valley." } },
      choices = {
        { text = "Take only what grows back. The jungle's no one's to strip.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "If I don't pick it, someone else will. That's the jungle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Has anyone tried to stop the Venture Company?", next = "danger_venture" },
      },
    },
    danger_venture = {
      lines = { { id = "dv_default", text = "Nesingwary's people grumble about them, and the Rebel camp in the north fights them when it can, but the goblins in this port won't say a word against another goblin's profit. I've written to the Baron twice, and both times I was thanked very politely for my letter." } },
      choices = { { text = "Something else, Flora.", next = "BACK" } },
    },

    -- Why she's here
    why = {
      lines = {
        { id = "wy_default", text = "Because Stranglethorn is the richest garden south of Redridge, friend, and Booty Bay is the only door into it with a roof. I came down from Stormwind with someone who wanted to go to sea, and when he sailed I stayed, and the goblins turned out to be honest customers so long as you read what you sign." },
      },
      choices = {
        { text = "How do you get on with the goblins?", next = "why_goblins" },
        { text = "You came here with someone?", next = "harbour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_goblins = {
      big = true,
      lines = { { id = "wg_default", text = "Better than I feared, because a goblin will tell you exactly what he wants from you, and my old neighbours in the Trade District never once managed that. They pay on time and haggle like it's a sport, and when I was ill last winter, three of them climbed all these stairs to ask after me, though I suspect they were checking on their orders." } },
      choices = {
        { text = "Honest dealing's honest dealing, whoever does it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A goblin's honesty only lasts until the price changes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Three goblins, worried about you? That's almost touching.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- Neighbours
    neighbours = {
      hub = true,
      lines = { { id = "nb_default", text = "Living at the top of the stairs means everyone walks past my door sooner or later, so I know most of the cove by the sound of their boots. Who would you like to hear about?" } },
      again = {
        { id = "nb_again", text = "Who else? I've opinions on most of the port, though I keep the worst of them to myself." },
        { id = "nb_again2", text = "Anyone else, friend? There's a whole cove of them." },
      },
      choices = {
        { text = "Glyx Brewright, the alchemist.", next = "nb_glyx" },
        { text = "The Goodstitches.", next = "nb_goodstitch" },
        { text = "Old Man Heming, down on the docks.", next = "nb_heming" },
        { text = "That's enough about the neighbours.", next = "hello" },
      },
    },
    nb_glyx = {
      lines = { { id = "ng_default", text = "Glyx buys more from me than anyone, and complains about every bundle, because he wants his roots washed twice and wrapped in clean linen like newborns. I've learned to rinse everything before he sees it, and in return he sells me the good vials at a price he swears is ruining him." } },
      choices = { { text = "There must be other neighbours worth knowing.", next = "neighbours" } },
    },
    nb_goodstitch = {
      lines = { { id = "ngs_default", text = "Grarnik Goodstitch once offered to make me a proper dress for the Baron's parties, and I told him I'd sooner wear Stranglekelp, which he has never forgiven. Blixrez is kinder, though the smell from the tannery climbs these stairs every afternoon, and I've had to hang mint over the door to fight it." } },
      choices = { { text = "Who else?", next = "neighbours" } },
    },
    nb_heming = {
      lines = { { id = "nh_default", text = "Heming knows every ship that has left this harbour since before I was born, and he never once told me to stop hoping. On bad evenings I take him a pot of tea, and we sit at the end of the pier and watch the sails come in without saying very much at all." } },
      choices = {
        { text = "Watching for which sail?", next = "harbour" },
        { text = "Who else?", next = "neighbours" },
      },
    },

    -- The missing sailor
    harbour = {
      lines = {
        { id = "hr_default", text = "I suppose I am, though I'd stopped noticing until you said it. He signed on with a merchantman bound around the Cape of Stranglethorn, a fine long voyage, he said, and he'd be home before the rains, and that was six rains ago." },
      },
      choices = {
        { text = "What happened to his ship?", next = "harbour_ship" },
        { text = "I'm sorry, Flora. That must be hard.", next = "harbour_ship", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    harbour_ship = {
      lines = {
        { id = "hs_default", text = "Nobody knows, and that's the worst of it. No wreck was ever reported, no Bloodsail ever bragged of taking her, and every captain I've asked just looks at me kindly and buys a bundle of Liferoot he doesn't need." },
        { id = "hs_warm", when = { disposition = { min = 65 } }, text = "Nobody knows, and that's the worst of it. I've never told anyone this, but I still don't say his name aloud, because as long as I don't, it feels as though he's only late, and I can keep the shop open and the window clean for him." },
      },
      choices = {
        { text = "Have you asked the Blackwater Raiders?", next = "harbour_raiders" },
        { text = "You must wonder if he's still alive.", next = "harbour_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbour_raiders = {
      lines = { { id = "hrr_default", text = "Fleet Master Seahorn's sailors promised to keep an eye out for her name, and they meant it, I think, but the sea is very wide and they've the Bloodsail to worry about. Every so often one of them stops at my door to say they've heard nothing, which is kind, and which I dread." } },
      choices = { { text = "Something else, Flora.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    harbour_hope = {
      big = true,
      lines = { { id = "hh_default", text = "I don't know, and some mornings that's a mercy and some mornings it's a cruelty. The goblins say I should sell the shop and go home, and Heming says the sea gives things back when it's ready, and I've never decided which of them is right." } },
      choices = {
        { text = "Keep watching. Hope costs nothing, whatever the goblins say.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Six years is long enough, Flora. Let the sea keep him.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    -- Who the player is
    k_herb = {
      lines = { { id = "kh_default", text = "Pick at midday, when the panthers sleep and the Kingsblood's sap runs thickest, and never pull Fadeleaf by the stem, because it turns to slime in your hand. And bring me whatever you can't name, friend, because I've been learning this jungle for six years and it still surprises me." } },
      choices = { { text = "Something else, Flora.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "I've felt it near the troll ruins, where nothing grows quite right and the flowers come up the wrong colour. I put it down to old blood in the soil, but I'd sooner hear what a druid makes of it, because I only know plants, and you know what's beneath them." } },
      choices = { { text = "Something else, Flora.", next = "BACK" } },
    },
    xsham = {
      lines = { { id = "xs_default", text = "I believe you, though I can't hear them myself. When the storms come in off the sea, the whole jungle goes quiet in a way I don't like, and the herbs I pick on those days never keep, as though something in them took fright." } },
      choices = { { text = "Something else, Flora.", next = "BACK" } },
    },
    k_nelf = {
      lines = { { id = "kn_default", text = "Clumsily, by your standards, I'm sure, with a knife and a satchel and a lot of apologising. A kaldorei woman came through two summers ago and showed me how to take Wild Steelbloom without killing the plant, and I've taught it that way ever since." } },
      choices = { { text = "Something else, Flora.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_tauren = {
      lines = { { id = "kt_default", text = "I was raised to thank the Light, friend, but I've taken to saying a word over the plants as I cut them, and I learned that from a tauren who stood where you're standing. I can't say whom I'm thanking, exactly, but it seems wrong to take without saying anything at all." } },
      choices = { { text = "Something else, Flora.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_troll = {
      lines = { { id = "ktr_default", text = "So I've heard, and the tribes who drove your people out are still sitting on the best Purple Lotus in the south. Tell me, did the Darkspear have a use for Fadeleaf? I've a feeling it was meant for more than the alchemists ever found." } },
      choices = { { text = "Something else, Flora.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the jungle's herbs, where they grow and what's sitting beside them, and I know this port from the top of the stairs." } },
    background = { { id = "tp_bg", text = "A Stormwind herbalist who came south with a sailor, and who stayed on at All Things Flora when he didn't come home.", next = "why" } },
    advice = { { id = "tp_ad", text = "Look up before you kneel, friend, because in Stranglethorn the panthers hunt from the branches." } },
    bloodsail = { { id = "tp_blood", text = "I've asked everyone who's fought the Bloodsail whether they ever took his ship, and nobody has heard of it." } },
    _none = { { id = "tp_none", text = "I'm afraid I only know leaves and roots, friend, and that isn't either of them." } },
  },
}
