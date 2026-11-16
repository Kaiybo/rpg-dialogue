-- Kargath's goblin smith-supplier, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "jazzrik", id = TODO_NPC("Jazzrik"), name = "Jazzrik",
  title = "Blacksmithing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "kargath" }, temper = { "jittery", "chatty" }, values = { "greedy", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Jazzrik sells coal and iron to the orcs of Kargath and never stops talking about how much it costs to haul anything into the Badlands. The goblin seemed both afraid of the Horde and delighted by its money.",
    third = "{name} met Jazzrik, the goblin who sells blacksmithing supplies in Kargath.",
  },

  greetings = {
    { id = "g_shop", text = "Coal, flux, iron bars and grinding stones, all at Badlands prices, which means expensive. Step right up!" },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, a customer who's paid before! You're my favorite kind." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "A smith! Or a miner! Either way you'll want to know the Badlands is full of ore, friend, and also full of things that want to eat you while you dig it out." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, good, good. Please tell Goretooth I'm a very helpful goblin and not at all the sort he needs to shout at, friend." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jazzrik, blacksmithing supplies! I keep the warlord's smiths fed with coal and iron, and in return the warlord doesn't feed me to anything, which I think is a very good arrangement for both of us." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Talk fast; I'm paid by the sale, not the chat." },
        { id = "h_again2", text = "Anything else? Ask away!" },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Why is everything so expensive here?", next = "price" },
        { text = "What's out in the Badlands worth mining?", next = "ore" },
        { text = "Is Goretooth a hard master?", next = "goretooth" },
        { text = "Do the dwarves trouble Kargath?", next = "darkiron" },
        { text = "How do the orcs here treat my people?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    price = {
      lines = {
        { id = "p_default", text = "Because everything comes in from Orgrimmar by zeppelin and wind rider, and then on the backs of tired kodos through ogre country. I add a bit for the danger, a bit for the trouble, and a bit for me, which is only fair." },
      },
      choices = {
        { text = "That's a lot of bits.", next = "price_bits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price_bits = {
      lines = {
        { id = "pb_default", text = "It is! But you can buy from me or you can walk to Orgrimmar, and I promise the walk costs more. I've done the sums, friend, and believe me, the sums like me better." },
      },
      choices = {
        { text = "Fair is fair. You earned it.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "That's gouging, and you know it.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Iron in the hills, and mithril if you're lucky and brave, but the Badlands are crawling with ogres, troggs and Dark Iron dwarves. Every good seam in this place is guarded by something with a club or a hammer or both." },
      },
      choices = {
        { text = "Troggs?", next = "ore_troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_troggs = {
      lines = {
        { id = "ot_default", text = "Ugly little rock-eaters that come up out of the caves near Uldaman. They'll eat your ore, your pick and probably your boots, so if you go mining near the ruins, keep a sharp eye out." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    goretooth = {
      lines = {
        { id = "g_default", text = "Hard? He's a rock with a grudge, friend, but he pays on time and he's never once broken a contract, which is more than I can say for some goblins I know. I just make very sure he's never got a reason to look at me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = {
        { id = "fs_default", text = "Politely, friend, mostly because the Shadowmage at the warlord's fire is one of yours and nobody wants to annoy her. The grunts mutter a bit when your lot walk by, but they mutter at me too, and I'm still here." },
      },
      choices = {
        { text = "Muttering I can live with.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = {
        { id = "d_default", text = "Every day! The Dark Irons hold Angor Fortress to the east and dig in the hills, and they hate the orcs worse than they hate the Alliance. If it weren't for the walls and the warlord's grunts, I'd have been out of business and out of a head a long time ago." },
      },
      choices = {
        { text = "Then the grunts earn their keep.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came out here to make my fortune, and I'm still making it, very slowly and very nervously." } },
    advice = { { id = "tp_ad", text = "Don't mine alone in the Badlands, friend. Something will always find you." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask someone who isn't busy counting coal." } },
  },
}
