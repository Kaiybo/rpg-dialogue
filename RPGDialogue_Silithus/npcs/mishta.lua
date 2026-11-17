-- Mishta, Cenarion Hold's trade supplier, forever waiting on a late shipment (0.72.0). Voice: bibles/mishta.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "mishta", id = TODO_NPC("Mishta"), name = "Mishta", title = "Trade Supplies",
  bible = "bibles/mishta.md", role = "vendor", tier = "service",
  communities = { "cenarion_hold" }, temper = { "fussy", "anxious" }, values = { "careful", "practical" },
  notices = { "craft", "purse" },
  impression = {
    first = "Mishta sells thread, salt and flux at Cenarion Hold and is always about to run out of all three. She blames a goblin supplier she has never once seen arrive on time.",
    third = "{name} met Mishta, the anxious trade-goods seller at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Oh dear, I'm running dangerously low on supplies! By Elune, what is taking that blasted goblin so long?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! You haven't passed a goblin with a cart on the road, by any chance? No, of course not." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the goblin still hasn't come. I've started counting the thread twice a day." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People here like you, which is a relief, because I've no patience left for difficult customers this week." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "A crafter! Please don't buy all my thread at once, I beg you; I won't see more for weeks." },
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "You've a heavy purse, I can hear it. If you've any sense, you'll spend it here before that goblin finally arrives and doubles his prices." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mishta, trade supplies, thread and flux and spices and anything else a craftsman forgets to pack. Or I would have anything else, if my shipment ever came." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A kaldorei! Then you'll understand how strange it is to keep shop in a place where nothing grows and everything stings." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask quickly, before I remember another thing I've run out of." },
        { id = "h_again2", text = "Go on, I'm only counting thread." },
      },
      choices = {
        { text = "Who brings your shipments?", next = "goblin" },
        { text = "Why keep shop in Silithus?", next = "why" },
        { text = "You look to be running low on a few things.", next = "low" },
        { text = "I could bring supplies from Gadgetzan.", next = "help", when = { minLevel = 55 } },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Good luck with the shipment.", next = "END" },
      },
    },
    goblin = {
      lines = { { id = "g_default2", text = "A trader out of Gadgetzan who swore on his mother's ledger he'd be here every fortnight. I've had two deliveries in three months, and one of them was mostly sand." } },
      choices = {
        { text = "Maybe something happened to him on the road.", next = "goblin_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin_road = {
      lines = { { id = "gr_default", text = "That's what I tell myself on the good days, and then I feel terrible for being cross with him. On the bad days I'm sure he's selling my thread to the cult at double the price." } },
      choices = {
        { text = "Give him the benefit of the doubt.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "I'd assume the worst of a goblin.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Circle asked, and because soldiers and druids need needles too, though nobody thinks of it until a cloak tears. Someone has to keep the small things coming." } },
      choices = { { text = "Small things matter.", next = "BACK", fx = { affinity = 1 } } },
    },
    low = {
      lines = { { id = "l_default", text = "Salt, mostly, which is absurd in a desert, and heavy thread, and the good flux the smith likes. Vargus has started looking at me the way the bugs look at the soldiers." } },
      choices = { { text = "I'll tell him to be patient.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    help = {
      lines = { { id = "h2_default", text = "Would you? That's kind, but the Hold can only buy through the Circle's agreements, and I'd only get scolded. Still, if you see a goblin with a cart, kick him toward me." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A trader of Darnassus who said yes to the Circle once and has been waiting on deliveries ever since. Even a kaldorei's patience wears thin after the third season." } },
    advice = { { id = "tp_ad", text = "Pack twice the thread you think you'll need. Silithus eats cloth." } },
    steamwheedle = { { id = "tp_sw", text = "Reliable as the tide, they say. I've never seen the tide out here, so I can't argue." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hunters come back from the hives needing thread for their armor, and I'm always about to run out. It's the bugs' fault, mostly." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "My supplies come from Gadgetzan, on a goblin wagon, when the goblin remembers. He has never once remembered on time." } },
    booty_bay = { { id = "tp_booty_bay", text = "The goblin who supplies me claims he's from Booty Bay, and I believe him, because he lies like a pirate." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know, and I'm too worried about my salt to guess. Ask the Commander, and Elune keep you." } },
  },
}
