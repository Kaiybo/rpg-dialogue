-- Haughty Modiste, fashion procurer at Steamwheedle Port (0.72.0). Voice: bibles/haughty_modiste.md
-- Sells style to kings and warchiefs at a scandalous markup; pirate hats are this season's look.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haughty_modiste", id = TODO_NPC("Haughty Modiste"), name = "Haughty Modiste",
  bible = "bibles/haughty_modiste.md", role = "vendor", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "smooth", "sharp" }, values = { "profit", "proud" },
  notices = { "kit", "craft" },
  impression = {
    first = "The Haughty Modiste dresses the rich of Azeroth in whatever she decides is in style, and charges them through the nose for it. She calls everyone sweetie, and none of them kindly.",
    third = "{name} met the Haughty Modiste, a goblin fashion procurer at Steamwheedle Port with expensive taste in pirate hats.",
  },

  greetings = {
    { id = "o_pir_admire", when = { gossip = { topic = "pirates", stance = "admire" } }, text = "I hear you fancy the pirate life, sweetie. Do try to steal something with a little taste, because the Southsea dress like a bilge on fire." },
    { id = "g_default", text = "Yes? If you're buying, sweetie, come in, and if you're browsing, browse quickly, because my time is billed by the minute and you can't afford many." },
    { id = "g_hats", when = { questActive = TODO_QUEST("Pirate Hats Ahoy!") }, text = "Do you have all twenty hats, sweetie? I don't believe you, so let me see them, and let me count them, twice." },
    { id = "g_hats_done", when = { questDone = TODO_QUEST("Pirate Hats Ahoy!") }, text = "Ah, my hat courier! You look almost presentable today, sweetie. Almost." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and wearing the same thing you left in, I see. We'll talk about that, sweetie, and the talk will cost you." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People are saying nice things about you, sweetie. Imagine what they'd say if you dressed better, and imagine what I'd charge to make it happen." },
  },

  notice = {
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, sweetie, no. Those aren't clothes any more, those are a cry for help." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Then you'll understand that what I do is art, sweetie, and what you do is sewing, and art sells for thirty times as much. Don't take it personally." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am a procurer of fashionable apparel for the elite of Azerothian society. Kings and queens and warchiefs all wear what I decide is in style, and they pay through the nose for it, which is the best part." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Pirate Hats Ahoy!") },
          text = "You're the help the Cartel sent? I suppose you'll do, sweetie, so listen carefully, because this season's look is pirate, I'm short on hats, and every day without them is gold walking out the door." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Pirate Hats Ahoy!") },
          text = "Lost Rigger Cove, down the coast, and a great many pirate hats by whatever means you like. Pristine condition, mind you, because blood doesn't come out of felt and stained felt doesn't sell." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Pirate Hats Ahoy!"), days = 3 } },
          text = "Oh, you're a darling, even if it took longer than I'm used to. Once they're cleaned and personalized, these hats will make me a small fortune. Do spend some of your reward on a bath, sweetie." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf, and with those ears you can carry off a hat most people can't. Don't let it go to your head, there's barely room as it is." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Oh my, the horns. Nothing I sell will fit you, sweetie, but you're welcome to stand there and admire it." },
      },
      again = {
        { id = "h_again", text = "Something else, sweetie? I charge for consultations, normally, and handsomely." },
        { id = "h_again2", text = "Go on, then. You have until I lose interest, and my interest is very expensive." },
      },
      choices = {
        { text = "What's in fashion this season?", next = "hats" },
        { text = "I doubt kings really buy from you.", next = "kings" },
        { text = "Why set up shop at Steamwheedle Port?", next = "port" },
        { text = "What's wrong with how I dress?", next = "dress" },
        { text = "As a tailor, what's your secret?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    hats = {
      lines = { { id = "ht_default", text = "Pirate hats, sweetie, because everyone wears what I've told them to. A pirate hat says danger and adventure and a certain disregard for the law, and the pirates of Lost Rigger Cove won't be needing theirs once the Cartel is done with them." } },
      choices = {
        { text = "You're selling stolen hats to the rich?", next = "hats_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hats_stance = {
      big = true,
      lines = { { id = "hs_default", text = "Stolen is such an ugly word, sweetie. The pirates stole everything they own, I'm simply returning a little of it to polite society, with a markup for my trouble, a generous one." } },
      choices = {
        { text = "Fair. Pirates have no claim on anything.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Profiting from the dead is low, even for you.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kings = {
      lines = { { id = "k_default", text = "Kings, queens, warchiefs and whatever the Horde calls its queens, I've never quite understood. Not personally, of course, but through very discreet buyers who never tell their masters where the hat came from." } },
      choices = {
        { text = "So you've never met one?", next = "kings_met" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kings_met = {
      lines = { { id = "km_default", text = "A good procurer is never seen, sweetie, only her work is. Now stop asking such impertinent questions, or I'll start asking where you got those boots." } },
      choices = { { text = "Point taken.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    port = {
      lines = { { id = "p_default", text = "Ships come in here from Booty Bay and Ratchet and everywhere else that matters, and that's where my buyers send their orders, with deposits. The sand is dreadful for the fabrics, but the shipping rates are divine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dress = {
      lines = { { id = "d_default", text = "Where to begin, sweetie? You dress for fighting things, which is fine for fighting things, but nobody will ever invite you anywhere twice." } },
      choices = {
        { text = "I'm happy as I am, thank you.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I suppose you have a suggestion.", next = "dress_suggest" },
      },
    },
    dress_suggest = {
      lines = { { id = "ds_default", text = "A hat, obviously, and a bath, even more obviously. After that we can talk about colour, though I suspect you'll ignore me." } },
      choices = { { text = "I probably will.", next = "BACK", fx = { affinity = 1 } } },
    },
    tailor = {
      lines = { { id = "ta_default", text = "My secret, sweetie, is that anyone can sew, but very few can convince a duke that a hat is worth what he paid for it. Learn to sell, and the sewing will look after itself." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A goblin of taste in a world that has none, sweetie. It's a lonely calling, but it pays, and it pays very well." } },
    advice = { { id = "tp_ad", text = "Charge what it's worth to them, not what it cost you. That's the only rule in fashion, and in life." } },
    bloodsail = { { id = "tp_bloodsail", text = "Dreadful pirates with dreadful hats, nothing like the Southsea ones. Red is so obvious." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan is a fashion desert, sweetie, in every sense, and I'm the only oasis. Everyone here dresses as though the sand chose their wardrobe." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay has a certain pirate charm, sweetie, but the hats are a disgrace. I've offered to help, and they keep throwing me off the docks." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor is the best-dressed woman in Stormwind, sweetie, and I've heard she has her gowns made specially. I'd give anything to know who her tailor is." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore dresses like a sensible mage, sweetie, all blues and practical sleeves. It's a crime, with a face like that." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has the most dreadful costumes, sweetie, all patches and tassels. I've offered to redesign them, and Silas laughed at me." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that, sweetie. Is it wearable? Is it sellable? No? Then it isn't my problem." } },
  },
}
