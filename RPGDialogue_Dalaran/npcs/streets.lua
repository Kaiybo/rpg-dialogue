-- Dalaran's rebuilt streets: Brammold Deepmine, Lizi Silverstone (Eclipse with Shears) and Pollero Rene (Path of Renewal).
-- Documentation on these three is thin: they talk about their work, their street and their neighbours. Voice: bibles/dalaran.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_brammold", id = TODO_NPC("Brammold Deepmine"), name = "Brammold Deepmine",
  bible = "bibles/dalaran.md", role = "vendor", tier = "service",
  communities = { "dalaran" }, temper = { "gruff", "chatty" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "Brammold Deepmine sells old things to wizards and seems to enjoy the haggling more than the money. A dwarf among magi, and not the least bit bothered by it.",
    third = "{name} met Brammold Deepmine, a dwarf who deals in antiques in Dalaran.",
  },

  greetings = {
    { id = "o_kirintor_neutral", tags = { "news" }, when = { gossip = { topic = "kirin_tor", stance = "neutral" } },
      text = "Word up from the Citadel is ye told Modera that knowledge shouldnae wear a tabard. Good! Neither should antiques, an' I'll sell 'em tae anyone who pays." },
    { id = "g_default", text = "Antiques, old an' odd, {g:lad|lass}. Look all ye like, but mind yer beard near the humming shelf." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Well, a beard in Dalaran! Come in, come in, and mind the shelves." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' I've three new old things in since, if ye follow me. Have a look, an' I'll give ye an honest price." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear somebody in the city got taken in by a smooth tongue. I sell honest antiques at honest prices, friend, an' I'd like it tae stay that way in here." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf among the wizards! Ye'll want an ale and a quiet word after a day of this lot, I'll wager." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brammold Deepmine, dealer in antiques. Dalaran's full of old things, friend, and half of them hum, so I sell the quiet half and keep a wary eye on the rest." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus, eh? Then don't go pokin' the humming ones. Last fellow who did lost an eyebrow, and I lost a customer." },
      },
      again = { { id = "h_again", text = "Anything else catch yer eye? Take yer time; good stone an' old silver don't rush, an' neither do I." } },
      choices = {
        { text = "These antiques have come from a good many places, I'd wager.", next = "where" },
        { text = "What's a dwarf doing among wizards?", next = "dwarf" },
        { text = "Do the archivists approve of your trade?", next = "delv" },
        { text = "What's that brass compass behind the counter?", next = "compass" },
        { text = "Do families ever come back for what they sold?", next = "heir" },
        { text = "Which hold do ye hail from, Brammold?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Lizi says your shelf sets off her tuning forks.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Good day.", next = "END" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Here and there, from magi clearing out their cellars and families who'd rather have coin than grandfather's candlesticks. The city's being put back together, and folk find all sorts when they move the stones." },
      },
      choices = {
        { text = "Anything that hums stays on that shelf, then.", next = "where_hum" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_hum = {
      lines = {
        { id = "wu_default", text = "On that shelf, under that cloth, with the Kirin Tor's leave written in my ledger. I'm an honest trader, and I've no wish to explain to an archmage why my stock got up and walked off." },
      },
      choices = { { text = "Wise man.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "Sellin' to them, mostly, and some of them pay in gold that doesn't vanish by morning. Ironforge has its Explorers' League and I've got my table; we both like old things, and I like mine with a price on." },
      },
      choices = {
        { text = "Gold that stays gold. Can't argue with that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    delv = {
      lines = { { id = "de_default", text = "Archivist Fortuz looks at me like I'm sellin' his grandmother's bones by the pound, and he's nae entirely wrong about the candlesticks. Helm Anvilhand, though, he buys from me when the Kirin Tor's back is turned, an' he says a relic in a dwarf's hands beats one in a cellar." } },
      choices = {
        { text = "So the two archivists disagree about you?", next = "delv2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delv2 = {
      lines = { { id = "d2_default", text = "They disagree about everythin', every week, over supper, an' I'm only one course of it. Fortuz wants the past behind glass where it's safe, an' Helm wants it in folk's hands where it's remembered, an' I want it on my shelf with a price on, so we're all of us right in our way." } },
      choices = {
        { text = "And the price is always the winner.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    compass = {
      lines = { { id = "co_default", text = "Ah, that's nae for sale, an' I'll thank ye not to look so hungry at it. Came out of a magus's cellar after the fall, an' it doesnae point north, it points at whatever ye've lost." } },
      choices = {
        { text = "Whatever you've lost? Does it work?", next = "compass2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    compass2 = {
      lines = { { id = "c2_default", text = "Found Lizi Silverstone's spectacles on top of her own head, an' found my second-best hammer in a crate I'd sold tae a mason. It also points at the floor sometimes, an' I've decided not tae dig, because whatever's lost under Dalaran can stay lost." } },
      choices = {
        { text = "Under Dalaran? You think something's down there?", next = "compass3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    compass3 = {
      lines = { { id = "c3_default", text = "I know there is, {g:lad|lass}, same as everyone who's stood by the west wall at night an' heard the shufflin' through the sewer grate. The magi say it's in hand, an' I say that's grand, an' I keep the compass in a drawer after dark." } },
      choices = {
        { text = "Wise man. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    heir = {
      big = true,
      lines = { { id = "he_default", text = "Now and again, aye, a widow wantin' her husband's pipe back once she's had time tae miss it, an' always after I've marked the price up. I've done it both ways in my time, so tell me, what would ye do?" } },
      choices = {
        { text = "Sell it back at what you paid. It's her memory.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A sale's a sale. Charge her what it's worth.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "Ironforge born, Thelsamar raised, an' I swung a pick in Loch Modan till I found I liked what came out the ground more than diggin' it. Ye'll understand, then, why a dwarf might find himself sellin' old things to wizards, since they pay best." } },
      choices = { { text = "Aye, I understand well enough.", next = "BACK", fx = { affinity = 2 } } },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "Every mornin', an' then she comes in here with her forks ringin' like a temple bell an' tells me which crate's tae blame. I've half a mind tae hire her, since she finds the humming ones faster than I do." } },
      choices = { { text = "You'd make a fine pair.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Old things, odd things and the occasional heirloom. The stories come free; the candlesticks don't." } },
    explorers_league = { { id = "tp_league", text = "Good folk, if they'd stop diggin' long enough to sell anything. I do the sellin' for them, in a manner of speaking." } },
    dalaran = { { id = "tp_dalaran", text = "Every stone they move in this city turns up somethin' old, an' half of it finds its way to my table. Best place I ever set up shop, humming shelf an' all." } },
    magni = { { id = "tp_magni", text = "King Magni would love this city, if he could stand the magi. He'd buy every relic in my shop and argue about every price, an' I'd enjoy every minute." } },
    uldaman = { { id = "tp_uldaman", text = "The Explorers' League found titan relics in Uldaman, an' the magi here would pay a fortune fer one. I'd sell, if I could get my hands on any." } },
    wildhammer = { { id = "tp_wildhammer", text = "A Wildhammer came in once, lookin' fer a gryphon saddle from the Second War, an' I found her one. She paid in gold an' a song, an' the song was better." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye. If it isn't old, or dug from under a mountain, I don't know about it." } },
  },
}

P:NPC {
  key = "dal_lizi", id = TODO_NPC("Lizi Silverstone"), name = "Lizi Silverstone",
  bible = "bibles/dalaran.md", role = "scholar", tier = "service",
  communities = { "dalaran", "kirin_tor" }, temper = { "chatty" }, values = { "curious", "learned" },
  notices = { "race" },

  impression = {
    first = "Lizi Silverstone of the Kirin Tor talks quickly and works quicker, with two cats underfoot that she insists aren't hers. She can't walk past a broken thing without counting what's wrong with it, and she'd rather trust a gear than a spell.",
    third = "{name} met Lizi Silverstone, a gnome of the Kirin Tor at Eclipse with Shears in Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Hello! Watch your feet; there's a cat under them, probably, at roughly a seventy percent likelihood." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "Oh, a fellow gnome! Come in, and step over Beepo; he won't move." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, you can hold this spring while I find out why it's sulking." },
    { id = "g_engineer", when = { profession = "Engineering" }, text = "Is that engineering grease on your sleeve? Oh, come in, come in, and tell me you've got a spare screwdriver." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "From Gnomeregan? Me too, once, a long time before it all went wrong. We'll not talk about it, and we'll both feel better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lizi Silverstone, Kirin Tor, late of Gnomeregan's arcane workshops! And yes, those two are Beepo and Niko, and no, they aren't mine; they belong to the shop, or the shop belongs to them, depending on whom you ask." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "Another magus! Don't mind the mess; this street was rubble not long ago, and some of it still thinks it is." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be quick, Niko's eyeing my notes, and I've only got two copies of each, which is one fewer than I'd like." },
        { id = "h_again2", text = "What else? I've three things half-mended and a fourth looking at me funny." },
        { id = "h_again3", text = "Go on, ask away, I can talk and tighten at the same time." },
      },
      choices = {
        { text = "I didn't expect to find a gnome in the Kirin Tor.", next = "gnome" },
        { text = "Why are there so many cats in Dalaran?", next = "cats" },
        { text = "What are you fixing?", next = "fixing" },
        { text = "What do you think of Brammold's antiques?", next = "brammold" },
        { text = "I'm an engineer. Can I take a look?", next = "engineer", when = { profession = "Engineering" } },
        { text = "The Kirin Tor's enchantments seem sound enough to me.", next = "mage_push", when = { class = "MAGE" } },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Plenty of us came to Dalaran to study, long before the dome went up, and the Kirin Tor never minded the height so long as the sums came out. A few more of us came to stay after Gnomeregan." },
      },
      choices = {
        { text = "Do you miss Gnomeregan?", next = "gnome_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_miss = {
      lines = {
        { id = "gm_default", text = "Every day, but fixing this city beats crying over that one. Besides, these stones don't glow green at night, which already puts Dalaran ahead." },
      },
      choices = { { text = "That's a good way to see it.", next = "BACK", fx = { affinity = 1 } } },
    },
    cats = {
      lines = {
        { id = "ca_default", text = "Nobody knows! Since the dome came down, there's one in every doorway that's been rebuilt, as if they'd been waiting for someone to put the roofs back on." },
      },
      choices = {
        { text = "Are Beepo and Niko really not yours?", next = "cats_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cats_mine = {
      lines = {
        { id = "cm_default", text = "Absolutely not, and I'll thank you not to spread rumours. I simply feed them twice a day, brush them every evening and keep a cushion by the stove that nobody else may sit on, which is a very different thing from owning a cat." },
      },
      choices = { { text = "Of course it is, Lizi.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    fixing = {
      lines = {
        { id = "fx_default", text = "Everything the breach touched, which is most of this end of town. The factotums that sweep the street started sweeping in circles, the mirror in the shop shows you whoever stood there last, and I've counted seventeen lamps that hum in the wrong key." },
      },
      choices = {
        { text = "Can't the Kirin Tor fix their own enchantments?", next = "fixing_wizards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fixing_wizards = {
      lines = {
        { id = "fw_default", text = "They could, if they'd stop writing essays about it first. A magus will spend a week on a beautiful ward that a decent spring and a counterweight could manage by teatime, so tell me, which would you trust with your life, a spell or a gear?" },
      },
      choices = {
        { text = "A gear. Gears don't have moods.", next = "fa_gear", fx = { affinity = 1, trait = { practical = 1 } } },
        { text = "A spell. Magic built this city.", next = "fa_spell", fx = { trait = { curious = 1 } } },
        { text = "Neither. I trust my own two hands.", next = "fa_hands", fx = { trait = { independent = 1 } } },
      },
    },
    fa_gear = {
      lines = {
        { id = "fag_default", text = "Ha! I knew I liked you, and Niko likes you too, or at least he's sitting on your foot, which is the same thing. That's one more for the gears, and the tally stands at forty-one to six." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_spell = {
      lines = {
        { id = "fas_default", text = "Magic also knocked this city flat, but I'll put you down for the spells anyway, since I'm a fair-minded sort of gnome. That makes it forty to seven, and the spells are still losing badly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_hands = {
      lines = {
        { id = "fah_default", text = "Well, hands are only gears with feelings, so I'll count that as half a vote for my side. Don't tell the Citadel I said so, or they'll want it in writing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brammold = {
      lines = {
        { id = "br_default", text = "Brammold's a dear and his prices are honest, but half of what he sells hums, and every time he moves a crate my tuning forks go off like a choir. I've asked him to label the loud ones, and he says that would spoil the surprise." },
      },
      choices = {
        { text = "Does any of it actually work?", next = "brammold_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brammold_work = {
      lines = {
        { id = "bw_default", text = "Some of it works far too well, which is the trouble. I bought a little brass compass from him that points at whatever you've lost, and so far it has found two cats, a spoon and a magus who very much did not want to be found." },
      },
      choices = { { text = "Something else, Lizi.", next = "BACK" } },
    },
    engineer = {
      lines = {
        { id = "en_default", text = "An engineer! Oh, you've no idea how lonely it is being the only person on this street who thinks a wrench is a perfectly respectable instrument. Grab the other end of this lamp, and we'll see whether it's the wiring or the enchantment that's sulking." },
      },
      choices = {
        { text = "It's the wiring. It's always the wiring.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_push = {
      big = true,
      lines = {
        { id = "mp_default", text = "Sound enough to keep the roofs up, and not one bit sounder. The Kirin Tor build wards the way poets write sonnets, all elegance, and nobody can repair them afterwards." },
      },
      choices = {
        { text = "Leave the old wards be. Tinkering invites disaster.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then the Kirin Tor should learn from gnomes.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, once. I won't talk about it here, if it's all the same." } },
    kirin_tor = {
      { id = "tp_kirin_tor", text = "The Kirin Tor let me fix things, and they let me keep my cats, which are not mine. I'm happy here, mostly." },
    },
    dalaran = {
      { id = "tp_dalaran", text = "Dalaran's walls were broken, and now they're fixed, and I fixed some of them myself. It's the best work I've ever done, and I'm proud of it." },
    },
    magni = {
      { id = "tp_magni", text = "King Magni took my whole family in after Gnomeregan fell, and I still send him a letter every winter about the cats. He has never answered, but I like to think he reads them." },
    },
    _none = {
      { id = "tp_none", text = "No idea! Ask in the Citadel, they love a question, and they'll give you an answer three times longer than it needs to be." },
    },
  },
}

P:NPC {
  key = "dal_pollero", id = TODO_NPC("Pollero Rene"), name = "Pollero Rene",
  bible = "bibles/dalaran.md", role = "scholar", tier = "service",
  communities = { "dalaran", "kirin_tor" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "Pollero Rene of the Kirin Tor keeps an eye on the Path of Renewal and speaks of it like a gardener speaks of a bed that's only just been planted. He knows every stone on it by heart, and a cat named Zara keeps him company, on her own terms.",
    third = "{name} met Pollero Rene, a magus of the Kirin Tor who watches over Dalaran's Path of Renewal.",
  },

  greetings = {
    { id = "g_default", text = "Good day. Mind the fresh paving." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the street's had two new stretches of paving in that time. Mind them, please, for they're still fresh." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word is you've been kind to someone in the city. These streets are coming back slowly, and a kind word helps them along." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Path, are you? Mind the third stone past the lamp post, for it rocks, and I've reported it twice." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Pollero Rene, of the Kirin Tor. I keep watch on the Path of Renewal, which is a grand name for a street that's still half scaffolding." },
        { id = "h_helped", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") },
          text = "You're the one Modera speaks of. The street's been calmer since you went up the Citadel, and I've slept better for it." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus, so you'll understand why I flinch whenever the masons float another block overhead. I know exactly how many spells are holding it up, and it's fewer than you'd hope." },
      },
      again = {
        { id = "h_again", text = "Anything else? Zara's waiting for her share of my attention." },
        { id = "h_again2", text = "What else, friend? Walk with me, if you like, for I've the north stretch still to look over." },
        { id = "h_again3", text = "Go on. Zara won't mind, so long as you don't stand in her sun." },
      },
      choices = {
        { text = "Why call it the Path of Renewal?", next = "name" },
        { text = "You seem very fond of this street.", next = "stones" },
        { text = "What was here before the fall?", next = "before" },
        { text = "That cat seems very much at home here.", next = "zara" },
        { text = "Lordaeron's people lost everything, too.", next = "human", when = { race = "Human" } },
        { text = "Shall I say a prayer for what you lost?", next = "prayer", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Good day.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "Because every stone on it was laid after the fall, I'd say, and because someone on the council likes grand names. Every one of us who walks it lost something when the city broke." },
      },
      choices = {
        { text = "What did you lose?", next = "name_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_lost = {
      lines = {
        { id = "nl_default", text = "More than I'd tell a stranger, and less than many. That's why I walk it every day; it's a good street for remembering and then getting on with things." },
      },
      choices = { { text = "Then I'll leave you to it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    stones = {
      lines = {
        { id = "st_default", text = "Fond is one word for it, and the masons have another. There are four hundred and twelve stones between the gate and the far corner, and I walk them all each morning, so I know when one's been chipped before the masons do." },
      },
      choices = {
        { text = "Are they all laid properly?", next = "stones_crooked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones_crooked = {
      big = true,
      lines = {
        { id = "sc_default", text = "Nine of them are crooked, and I've reported every one to the council, who sent it to the masons, who sent it back to me. I've started to wonder whether a few crooked stones are simply what a city looks like when it's lived in again." },
      },
      choices = {
        { text = "Leave them crooked. A living street needn't be perfect.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep reporting them. Rebuild it properly or not at all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "Bookbinders, mostly, a whole row of them, and you could smell the glue and the leather from the corner. I used to buy my notebooks from a woman at the third door, and that door is a wall of scaffolding now." },
      },
      choices = {
        { text = "That sounds like a fine street.", next = "before_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_ask = {
      lines = {
        { id = "ba_default", text = "It was, and I'm glad someone asks. Tell me, did you ever see Dalaran before the fall, or is this the first you've known of it?" },
      },
      choices = {
        { text = "Only the dome, from the road outside.", next = "ba_dome", fx = { trait = { curious = 1 } } },
        { text = "Never. This is my first time here.", next = "ba_first", fx = { affinity = 1 } },
        { text = "It's finer than the ruins I'd heard about.", next = "ba_kind", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    ba_dome = {
      lines = {
        { id = "bad_default", text = "Then you saw what most of the world saw, a violet bubble and a cloud of rumour. I'm glad you've come inside it at last, even if the inside is still mostly scaffolding." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ba_first = {
      lines = {
        { id = "baf_default", text = "Then you're seeing it as it will be, rather than as it was, and that's no bad thing. Walk the Path slowly, and you'll be the first person this month who has." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ba_kind = {
      lines = {
        { id = "bak_default", text = "That's kind of you, and the masons would be glad to hear it, though they'd never say so. The ruins were real enough, mind; we've only swept them to one side." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zara = {
      lines = {
        { id = "za_default", text = "That's Zara, and she belongs to nobody, which she'd tell you herself if she cared to. She chose this street before any of us did." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    human = {
      lines = {
        { id = "hu_default", text = "They did, and a good many of them walked this street once, on their way to lessons or the market. I keep a list in my head of the faces I don't see any more, and I'd sooner keep it there than say it aloud." },
      },
      choices = {
        { text = "Then I won't ask you to.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prayer = {
      lines = {
        { id = "pr_default", text = "That's kind, and I'll not say no, though I'm a magus and I've never been sure the Light listens to us. Say it for the street, if you would, and for whoever walks it next." },
      },
      choices = {
        { text = "For the street, then, and everyone on it.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "The Path of Renewal is only just laid, and it'll take years before it feels like a street again. I'll be here for every one of them." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are rebuilding, and I'm one of them, though I'd rather mind a street than cast spells. Zara agrees, though she'd rather I fed her." } },
    scourge = { { id = "tp_scourge", text = "The Scourge burned the old streets of Dalaran, and the bookbinders' row with them. We're laying them again, one stone at a time." } },
    _none = { { id = "tp_none", text = "That's beyond my street, I'm afraid, and I've four hundred and twelve stones to mind already. Try the Citadel." } },
  },
}
