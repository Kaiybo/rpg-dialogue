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
    first = "He seems to enjoy the haggling more than the money.",
    third = "{name} met Brammold Deepmine, a dwarf who deals in antiques in Dalaran.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's yerself again! Come in, {g:lad|lass}, there's somethin' on the humming shelf I've been savin' to show ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. I'll sell ye what's on the shelves, but don't expect a story to go with it." },
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
    dd_atrexis = {
      lines = { { id = "dd_atrexis_default", text = "Some of it, I reckon, the old bones an' grave-goods especially. A necromancer raisin' an army under the Kirin Tor's noses will stir up anything that remembers bein' dead, an' I've a crate of burial urns from the old cemeteries that rattled every night for a month." } },
      choices = {
        { text = "Old things should go to those who'll respect their history.", next = "BACK", reply = "Aye, that's how I see it too, an' it's why I ask where they're goin' before I sell.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "An antique's only worth what some fool will pay.", next = "BACK", reply = "Ha! There's truth in that, {g:lad|lass}, but I'll not have ye callin' my customers fools.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then perhaps you shouldn't sell grave-goods, Brammold.", next = "BACK", reply = "Perhaps I shouldn't, an' perhaps I'll think on it, though the margins are awful temptin'. Ye've a conscience on ye, friend.", fx = { align = { light = 1 } } },
        { text = "Quiet urns fetch a better price. You owe me a cut.", next = "BACK", reply = "Ha! A cut, says the hero. I'll stand ye a drink, an' that's the most ye'll get from a Deepmine.", fx = { align = { light = -1 } } },
        { text = "Something else, Brammold.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brammold Deepmine, dealer in antiques. Dalaran's full of old things, friend, and half of them hum, so I sell the quiet half and keep a wary eye on the rest." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus, eh? Then don't go pokin' the humming ones. Last fellow who did lost an eyebrow, and I lost a customer." },
        { id = "h_dd_atrexis", tags = { "news" }, when = { killed = { name = "Atrexis", min = 1 } },
          text = "They say ye went down under the streets an' put that Grave Knight in the ground for good, friend. Half my stock's stopped hummin' at night since, an' I don't think that's a coincidence." },
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
        { text = "Your stock hummed because of Atrexis, Brammold?", next = "dd_atrexis", when = { killed = { name = "Atrexis", min = 1 } } },
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
    first = "She would rather trust a gear than a spell.",
    third = "{name} met Lizi Silverstone, a gnome of the Kirin Tor at Eclipse with Shears in Dalaran.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are! Beepo's been sulking since you left, at roughly ninety percent confidence, so do say hello." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd ask you to hold a spring, but I've run the numbers and I'd rather not." },
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
        { id = "h_dd_gilded", when = { questDone = TODO_QUEST("Opportunistic Education") },
          text = "Delv Fortuz has been storming about the archives because someone sold Rexxie a history book and she painted it gold! I think it's rather funny, but please never tell him I said so, because he'd never lend me another manual." },
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
        { text = "Leave the old wards be. Tinkering invites disaster.", next = "BACK", reply = "Oh, you sound exactly like the council, and they'll love you for it, right up until the roof caves in on someone because nobody dared touch the old runes.", fx = { align = { order = 1 } } },
        { text = "Then the Kirin Tor should learn from gnomes.", next = "BACK", reply = "Ha, I've said that to their faces at three separate council meetings, and they gave me a commendation each time and then ignored every word of it.", fx = { affinity = 1, align = { order = -1 } } },
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
    first = "A cat named Zara keeps him company, on her own terms.",
    third = "{name} met Pollero Rene, a magus of the Kirin Tor who watches over Dalaran's Path of Renewal.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you again. Zara's been watching the door all week, and I suspect she was waiting for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep off the fresh paving, say what you need, and then be on your way." },
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
        { id = "h_dd_shrewd", when = { questDone = TODO_QUEST("Shrewd Negotiations") },
          text = "So you're the one who carried the Horde's end of the bargain up to Archmage Celindra. I can't say I like the Horde on our streets, but I've watched more of this city burn than I'd like, and I'll take allies over ashes." },
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
        { text = "Leave them crooked. A living street needn't be perfect.", next = "BACK", reply = "That's what I've started to think too, and Zara agrees, though she agrees with anything that lets her sleep on the warm stones.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep reporting them. Rebuild it properly or not at all.", next = "BACK", reply = "You'd get along with the masons, then, though I'm not sure they'd get along with you, because properly is a word they've grown tired of hearing.", fx = { align = { order = 1 } } },
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

---------------------------------------------------------------------------
-- The cats (and one corgi) of Forever's Dalaran. Animals don't speak, so every line is what the
-- animal does, written as narration in asterisks (as the bound felhunter pool does). Each one
-- takes its character from the place it keeps. Owners aren't named on the wiki, so none are named here.
---------------------------------------------------------------------------
local function Critter(t)
  t.role = t.role or "citizen"
  t.tier = t.tier or "service"
  t.start = "hello"
  P:NPC(t)
end

-- Butterscotch: walks the whole town and stops at the greenhouse in the Magus Commerce Exchange.
Critter {
  key = "dal_cat_butterscotch", id = TODO_NPC("Butterscotch"), name = "Butterscotch", gender = "female",
  temper = { "easygoing" }, values = { "curious" },
  impression = {
    first = "A ginger cat who treats the whole city as one long walk, with a rest stop among the greenhouse ferns.",
    third = "{name} met Butterscotch, a ginger house cat who strolls the length of Dalaran.",
  },
  greetings = {
    { id = "g_default", text = "*A ginger cat trots past at a purposeful pace, stops, and looks back over her shoulder as if you might be worth the detour.*" },
    { id = "g_back", when = { metBefore = true }, text = "*Butterscotch changes course without breaking stride and loops once around your ankles, then carries on as if she meant to all along.*" },
  },
  nodes = {
    but_gh1 = {
      lines = {
        { id = "but_gh1_1", text = "*Butterscotch leads you into the warm, green air of the Magus Commerce Exchange greenhouse, threading between the clay pots without touching a single leaf.*" },
      },
      choices = {
        { text = "Kneel down beside her among the ferns.", next = "but_gh2" },
        { text = "Leave her to her garden.", next = "BACK" },
      },
    },
    but_gh2 = {
      lines = {
        { id = "but_gh2_1", text = "*She settles into a patch of soft earth under the ferns as if it has her shape pressed into it, which it plainly does. A gardener's glove lies nearby with ginger hairs all over it.*" },
      },
      choices = {
        { text = "So this is your spot.", next = "BACK" },
      },
    },
    but_st1 = {
      lines = {
        { id = "but_st1_1", text = "*Butterscotch pauses at three doorsteps in a row, sniffing each one carefully, and only at the third does she sit and wait.*" },
      },
      choices = {
        { text = "Knock on the third door for her.", next = "but_st2" },
        { text = "Wait beside her on the step.", next = "but_st2" },
        { text = "Let her get on with her rounds.", next = "BACK" },
      },
    },
    but_st2 = {
      lines = {
        { id = "but_st2_1", text = "*The door opens a crack, a hand sets down a saucer of cream, and the door closes again. Butterscotch drinks it with the calm of a cat who knew exactly which door it would be.*" },
      },
      choices = {
        { text = "You have the whole street trained.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Butterscotch sits in the middle of the path and washes one paw, while the people of Dalaran step politely around her.*" },
        { id = "h_rain", when = { timeOfDay = "night" }, text = "*Butterscotch is curled under a fern in the greenhouse, with damp earth on her whiskers and one eye open on you.*" },
      },
      again = { { id = "a_again", text = "*Butterscotch is still here, though her tail says she has somewhere to be.*" } },
      choices = {
        { text = "Hello, Butterscotch. Where are you off to today?", next = "BACK", reply = "*She answers with a short chirp and pointedly looks toward the Magus Commerce Exchange, where the greenhouse is warm and full of things to sniff.*" },
        { text = "Crouch down and offer her a hand to sniff.", next = "BACK", reply = "*She sniffs your knuckles thoroughly, reads every road you've walked today, and bumps her head into your palm to say the report is acceptable.*" },
        { text = "Follow her to the greenhouse.", next = "but_gh1" },
        { text = "Watch where she stops along the street.", next = "but_st1" },
        { text = "Walk alongside her for a little while.", next = "END", reply = "*She allows it for exactly one street, then slips under a merchant's cart and leaves you to find your own way.*" },
      },
    },
  },
}

-- Frankie: keeps the shop at Wands and Wonder.
Critter {
  key = "dal_cat_frankie", id = TODO_NPC("Frankie"), name = "Frankie", gender = "male",
  temper = { "wry" }, values = { "proud" },
  impression = {
    first = "A shop cat at Wands and Wonder who watches every wand on the shelf as if it might be a mouse.",
    third = "{name} met Frankie, the cat who keeps an eye on the stock at Wands and Wonder.",
  },
  greetings = {
    { id = "g_default", text = "*A tabby tom lies stretched along a shelf of wands, with his tail hanging down and swaying like a pendulum.*" },
    { id = "g_mage", when = { class = "MAGE" }, text = "*Frankie flattens his ears at the faint crackle of arcane on your fingers, then decides you're only another customer and closes his eyes.*" },
  },
  nodes = {
    fra_shelf1 = {
      lines = {
        { id = "fra_shelf1_1", text = "*Frankie pads along the shelf of Wands and Wonder from end to end, nose down, inspecting each wand in turn like a sergeant inspecting a line of recruits.*" },
      },
      choices = {
        { text = "Does one of them worry him?", next = "fra_shelf2" },
        { text = "Leave him to his inspection.", next = "BACK" },
      },
    },
    fra_shelf2 = {
      lines = {
        { id = "fra_shelf2_1", text = "*At the last wand his fur stands up along his back, and he gives it one sharp swat that sends a spray of blue sparks over the floor. Then he sits down beside it and keeps watch, as if it might try something.*" },
      },
      choices = {
        { text = "Good work, sergeant.", next = "BACK" },
      },
    },
    fra_wand1 = {
      lines = {
        { id = "fra_wand1_1", text = "*Frankie's eyes go wide and black as you draw your wand, and his rear end begins to wiggle on the shelf.*" },
      },
      choices = {
        { text = "Twitch the tip of the wand.", next = "fra_wand2" },
        { text = "Put it away before he pounces.", next = "BACK" },
      },
    },
    fra_wand2 = {
      lines = {
        { id = "fra_wand2_1", text = "*He pounces, misses by a hand's breadth, lands among a row of crystal vials, and freezes. Not one of them falls, and Frankie climbs back out with enormous care and a look that says this never happened.*" },
      },
      choices = {
        { text = "I saw nothing.", next = "BACK" },
      },
    },
    fra_singe1 = {
      lines = {
        { id = "fra_singe1_1", text = "*Frankie follows your gaze to the scorched tuft at the end of his tail, and he turns his back on you at once, which is all the answer you are going to get.*" },
      },
      choices = {
        { text = "Ask the shopkeeper what happened.", next = "fra_singe2" },
        { text = "Some things are best not mentioned.", next = "BACK" },
      },
    },
    fra_singe2 = {
      lines = {
        { id = "fra_singe2_1", text = "*The shopkeeper of Wands and Wonder only laughs and points at a single wand on the top shelf, kept well out of a cat's reach behind a little brass gate.*" },
      },
      choices = {
        { text = "So that's the one that bit back.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Frankie bats lazily at the tassel of a wand on the shelf below him, and it rolls an inch and lets off a tiny violet spark.*" },
      },
      again = { { id = "a_again", text = "*Frankie's tail keeps swaying, slow as a clock.*" } },
      choices = {
        { text = "Careful with that. Those wands aren't toys.", next = "BACK", reply = "*Frankie holds your eye, reaches out one paw, and nudges the wand another inch toward the edge, very deliberately.*" },
        { text = "Scratch him behind the ears.", next = "BACK", reply = "*He leans into your fingers and purrs, a low rumble that makes the glass cases hum along with him.*" },
        { text = "Watch him guard the shelves.", next = "fra_shelf1" },
        { text = "Show him a wand from your own pack.", next = "fra_wand1", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Notice the singed patch on his tail.", next = "fra_singe1" },
        { text = "Pick up a wand and wave it for him.", next = "END", reply = "*Frankie lunges at the tip with both front paws, misses, and then pretends very hard that he was only stretching.*" },
      },
    },
  },
}

-- Haido: lies on the counter at A Hero's Welcome.
Critter {
  key = "dal_cat_haido", id = TODO_NPC("Haido"), name = "Haido",
  temper = { "formal" }, values = { "dutiful" },
  impression = {
    first = "A cat who lies on the counter at A Hero's Welcome like the innkeeper's own clerk.",
    third = "{name} met Haido, the cat on the counter at A Hero's Welcome.",
  },
  greetings = {
    { id = "g_default", text = "*A sleek black-and-white cat lies square across the counter of A Hero's Welcome, paws tucked in, watching the door like a doorman.*" },
    { id = "g_back", when = { metBefore = true }, text = "*Haido lifts his chin a fraction as you come in, which is as much of a welcome as anyone gets.*" },
  },
  nodes = {
    hai_door1 = {
      lines = {
        { id = "hai_door1_1", text = "*A traveller steps into A Hero's Welcome, and Haido lifts his head to look them over from boots to hat before lowering it again. The innkeeper glances at the cat, nods, and reaches for a key.*" },
      },
      choices = {
        { text = "Does the innkeeper always wait for him?", next = "hai_door2" },
        { text = "Let him get back to his post.", next = "BACK" },
      },
    },
    hai_door2 = {
      lines = {
        { id = "hai_door2_1", text = "*The next arrival is a loud fellow tracking mud across the floor, and Haido stares at him until he wipes his boots. Only then does the cat look away, satisfied that the house rules are kept.*" },
      },
      choices = {
        { text = "So you're the real innkeeper here.", next = "BACK" },
      },
    },
    hai_led1 = {
      lines = {
        { id = "hai_led1_1", text = "*You lean over for a look, and Haido shifts his weight to cover the page completely, all four paws spread across the ink.*" },
      },
      choices = {
        { text = "Try to slide the ledger out from under him.", next = "hai_led2" },
        { text = "Very well, it's private.", next = "BACK" },
      },
    },
    hai_led2 = {
      lines = {
        { id = "hai_led2_1", text = "*The ledger comes an inch, and so does Haido, without opening his eyes. When you stop, he resettles with a long sigh, and you notice his own pawprint already dried on half the signatures.*" },
      },
      choices = {
        { text = "He's been signing guests in himself.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Haido does not move from the counter. He simply looks at you, then at the ledger beneath his elbow, then back at you, waiting.*" },
      },
      again = { { id = "a_again", text = "*Haido has not shifted an inch from the ledger.*" } },
      choices = {
        { text = "I'd like a room, if you're taking bookings.", next = "BACK", reply = "*Haido slowly lays one paw on the open ledger, exactly over the line where you'd sign, and leaves it there.*" },
        { text = "Stroke him from head to tail.", next = "BACK", reply = "*He accepts one stroke, flicks his tail once to say that's quite enough, and goes back to watching the door.*" },
        { text = "Wait to see who comes through the door.", next = "hai_door1" },
        { text = "Peek at the ledger under his elbow.", next = "hai_led1" },
        { text = "Set a coin on the counter beside him.", next = "END", reply = "*Haido sniffs the coin, finds it is not fish, and pushes it off the counter onto the floor.*" },
      },
    },
  },
}

-- Kocha: lives in the basement of A Hero's Welcome.
Critter {
  key = "dal_cat_kocha", id = TODO_NPC("Kocha"), name = "Kocha",
  temper = { "nervous" }, values = { "cautious" },
  impression = {
    first = "A shy cat who keeps to the cellar of A Hero's Welcome among the barrels and the dark.",
    third = "{name} met Kocha, the shy cellar cat of A Hero's Welcome.",
  },
  greetings = {
    { id = "g_default", text = "*Two round eyes catch the lamplight from behind a stack of barrels in the cellar, and they do not blink.*" },
    { id = "g_back", when = { metBefore = true }, text = "*Kocha remembers you. She edges halfway out from behind the barrels before she loses her nerve.*" },
  },
  nodes = {
    koc_lis1 = {
      lines = {
        { id = "koc_lis1_1", text = "*Kocha's ears are fixed on the far corner of the cellar, where something small is scratching inside the walls of A Hero's Welcome.*" },
      },
      choices = {
        { text = "Creep toward the corner yourself.", next = "koc_lis2" },
        { text = "Leave her to the hunt.", next = "BACK" },
      },
    },
    koc_lis2 = {
      lines = {
        { id = "koc_lis2_1", text = "*At your first step Kocha shoots past you like a grey shadow and into the gap between the stones. There is a squeak, a scuffle, and a long silence, and then she backs out with something in her mouth and a very different look in her eyes.*" },
      },
      choices = {
        { text = "Not so shy after all.", next = "BACK" },
      },
    },
    koc_dish1 = {
      lines = {
        { id = "koc_dish1_1", text = "*You set the dish down and step back. Kocha watches it for a long, long time, as though it might be a trap laid by the barrels themselves.*" },
      },
      choices = {
        { text = "Step further back and sit down.", next = "koc_dish2" },
        { text = "Leave it there for later.", next = "BACK" },
      },
    },
    koc_dish2 = {
      lines = {
        { id = "koc_dish2_1", text = "*Inch by inch she comes out, drinks with quick little laps, and looks up at you with water on her chin. She doesn't run when she's done, only sits between you and the casks and washes her face.*" },
      },
      choices = {
        { text = "That's a start, little one.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Kocha stays pressed into the shadow between two casks, with only the tip of her nose and her whiskers showing.*" },
      },
      again = { { id = "a_again", text = "*Kocha is still behind the barrels, still watching.*" } },
      choices = {
        { text = "Sit down on the cellar floor and wait quietly.", next = "BACK", reply = "*After a long while, Kocha creeps out, touches her nose to the toe of your boot, and dashes back to safety.*" },
        { text = "Hold out a scrap of cheese from the kitchen.", next = "BACK", reply = "*She stretches her neck as far as it will go without moving her feet, and steals the cheese with great delicacy.*" },
        { text = "Listen for what she's listening to.", next = "koc_lis1" },
        { text = "Set out a little dish of water near the casks.", next = "koc_dish1" },
        { text = "It's all right. Nobody's going to hurt you down here.", next = "END", reply = "*Kocha's ears turn toward your voice, and for the first time she lets you see her whole face before she slips away.*" },
      },
    },
  },
}

-- Lulu and Pancakes: sit together in the Dalaran Charter.
Critter {
  key = "dal_cat_lulu", id = TODO_NPC("Lulu"), name = "Lulu", gender = "female",
  temper = { "cheerful" }, values = { "loyal" },
  impression = {
    first = "One of a pair of cats in the Dalaran Charter, and plainly the one in charge of the pair.",
    third = "{name} met Lulu, who sits with Pancakes in the Dalaran Charter.",
  },
  greetings = {
    { id = "g_default", text = "*A small grey cat sits beside a plump orange one in the Dalaran Charter, and she gets up to greet you first.*" },
  },
  nodes = {
    lul_pan1 = {
      lines = {
        { id = "lul_pan1_1", text = "*Lulu finishes Pancakes's ear and moves on to the top of his head, while he slumps lower with every lick, until he is lying flat on the floor of the Dalaran Charter.*" },
      },
      choices = {
        { text = "Does she do this all day?", next = "lul_pan2" },
        { text = "Leave them to it.", next = "BACK" },
      },
    },
    lul_pan2 = {
      lines = {
        { id = "lul_pan2_1", text = "*When a passer-by steps too near Pancakes's tail, Lulu lifts her head and stares until the person changes course. Then she goes back to grooming as if nothing happened, and Pancakes never wakes at all.*" },
      },
      choices = {
        { text = "She's his guard as well as his nurse.", next = "BACK" },
      },
    },
    lul_self1 = {
      lines = {
        { id = "lul_self1_1", text = "*You hold out a ribbon from your pack, and Lulu looks at it, then back at Pancakes, as though asking whether she is allowed.*" },
      },
      choices = {
        { text = "Drag it slowly across the floor.", next = "lul_self2" },
        { text = "Put it away; she's busy.", next = "BACK" },
      },
    },
    lul_self2 = {
      lines = {
        { id = "lul_self2_1", text = "*She chases it three times around the room in a burst of pure kitten, then stops dead, remembers herself, and trots back to Pancakes to finish his other ear.*" },
      },
      choices = {
        { text = "Duty calls, I suppose.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Lulu winds once around your legs, trots back to Pancakes, and washes his ear for him whether he likes it or not.*" },
      },
      again = { { id = "a_again", text = "*Lulu is back at Pancakes's side, keeping him tidy.*" } },
      choices = {
        { text = "Are you two always together?", next = "BACK", reply = "*Lulu sits down so close to Pancakes that they become one shape, which seems to be the answer.*" },
        { text = "Pet Lulu, then Pancakes, so nobody's left out.", next = "BACK", reply = "*Lulu purrs for both of them, since Pancakes has fallen asleep halfway through his turn.*" },
        { text = "Watch her look after Pancakes.", next = "lul_pan1" },
        { text = "Offer her something for herself, for once.", next = "lul_self1" },
        { text = "Leave the two of them in peace.", next = "END", reply = "*Lulu blinks slowly at you, the polite way a cat says goodbye.*" },
      },
    },
  },
}

Critter {
  key = "dal_cat_pancakes", id = TODO_NPC("Pancakes"), name = "Pancakes", gender = "male",
  temper = { "easygoing" }, values = { "comfort" },
  impression = {
    first = "A round, sleepy orange cat in the Dalaran Charter, who lets Lulu do the worrying.",
    third = "{name} met Pancakes, who sits with Lulu in the Dalaran Charter.",
  },
  greetings = {
    { id = "g_default", text = "*A very round orange cat lies beside Lulu in the Dalaran Charter, flattened out like his name.*" },
  },
  nodes = {
    pan_wake1 = {
      lines = {
        { id = "pan_wake1_1", text = "*Pancakes sleeps through a wagon going past, two children arguing, and a mage casting a spell that sets the air humming. Then someone, somewhere, opens a tin, and he is wide awake.*" },
      },
      choices = {
        { text = "That's selective deafness.", next = "pan_wake2" },
        { text = "Let him go back to sleep.", next = "BACK" },
      },
    },
    pan_wake2 = {
      lines = {
        { id = "pan_wake2_1", text = "*Pancakes follows the sound to its source, sits squarely in front of the person holding the tin, and simply waits, round and patient. He is given something, as he plainly always is.*" },
      },
      choices = {
        { text = "Well played, Pancakes.", next = "BACK" },
      },
    },
    pan_cook1 = {
      lines = {
        { id = "pan_cook1_1", text = "*At the smell from your pack, Pancakes rolls to his feet with a grunt and plants himself at your boots, looking up with eyes like two copper coins.*" },
      },
      choices = {
        { text = "Share a small piece of cooked meat.", next = "pan_cook2" },
        { text = "Not this time, round one.", next = "BACK" },
      },
    },
    pan_cook2 = {
      lines = {
        { id = "pan_cook2_1", text = "*It vanishes, and Pancakes purrs so loudly that Lulu comes over to see what is happening. He moves over and lets her have the crumbs, which seems to be a great sacrifice.*" },
      },
      choices = {
        { text = "That was generous of him.", next = "BACK" },
      },
    },
    pan_lulu1 = {
      lines = {
        { id = "pan_lulu1_1", text = "*You glance at Lulu, who is sitting nearby, and she looks at Pancakes, then at you, then gives one long, put-upon blink.*" },
      },
      choices = {
        { text = "She thinks he's hopeless.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Pancakes opens one eye, sees that you are not carrying a plate, and closes it again.*" },
        { id = "h_food", when = { profession = "Cooking" }, text = "*Pancakes smells the kitchen on your hands, and both of his eyes come open at once.*" },
      },
      again = { { id = "a_again", text = "*Pancakes has gone back to sleep.*" } },
      choices = {
        { text = "Rub his round belly.", next = "BACK", reply = "*He allows it, rolls over to offer more belly, and Lulu gives you a look as if you are spoiling him.*" },
        { text = "Offer him a corner of sweet roll.", next = "BACK", reply = "*Pancakes eats it in one gulp, licks your fingers for crumbs, and lies back down looking pleased with the world.*" },
        { text = "Wait to see if he wakes for anything.", next = "pan_wake1" },
        { text = "Take out something from the cooking pot.", next = "pan_cook1", when = { profession = "Cooking" } },
        { text = "Ask Lulu's opinion of him.", next = "pan_lulu1" },
        { text = "You're well named, aren't you?", next = "END", reply = "*Pancakes spreads himself out even flatter, as though to prove the point.*" },
      },
    },
  },
}

-- Misifus: the other cat in the Dalaran Charter, an aloof one.
Critter {
  key = "dal_cat_misifus", id = TODO_NPC("Misifus"), name = "Misifus", gender = "male",
  temper = { "sly" }, values = { "independent" },
  impression = {
    first = "A lean alley-wise tom in the Dalaran Charter who keeps clear of Lulu and Pancakes.",
    third = "{name} met Misifus, a lean tom of the Dalaran Charter.",
  },
  greetings = {
    { id = "g_default", text = "*A lean tom with a notched ear sits on a high ledge of the Charter, well apart from the other cats, and watches you climb toward him.*" },
  },
  nodes = {
    mis_ledge1 = {
      lines = {
        { id = "mis_ledge1_1", text = "*From his ledge in the Dalaran Charter, Misifus keeps his eyes on the door and on every person who comes through it, and his tail twitches only for dogs.*" },
      },
      choices = {
        { text = "Has he had trouble with dogs?", next = "mis_ledge2" },
        { text = "Let him keep his watch.", next = "BACK" },
      },
    },
    mis_ledge2 = {
      lines = {
        { id = "mis_ledge2_1", text = "*When a small dog trots past outside, Misifus rises, arches, and grows to twice his size, and the dog remembers somewhere else it has to be. Misifus sits back down with an air of paperwork completed.*" },
      },
      choices = {
        { text = "So that's how you lost the ear.", next = "BACK" },
      },
    },
    mis_scar1 = {
      lines = {
        { id = "mis_scar1_1", text = "*You hold out your scarred knuckles, and for the first time Misifus leans in. He sniffs each old cut with great care, the way a veteran reads another veteran's medals.*" },
      },
      choices = {
        { text = "One old soldier to another.", next = "mis_scar2" },
        { text = "Pull your hand back.", next = "BACK" },
      },
    },
    mis_scar2 = {
      lines = {
        { id = "mis_scar2_1", text = "*He rubs the side of his notched head against your knuckles, once and firmly, and then turns away as though embarrassed by the display.*" },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK" },
      },
    },
    mis_ign1 = {
      lines = {
        { id = "mis_ign1_1", text = "*You sit nearby and pay him no attention at all. After a while Misifus comes down from the ledge and sits just out of reach, also paying you no attention at all.*" },
      },
      choices = {
        { text = "Two can play that game.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Misifus looks you up and down with yellow eyes, judges you, and leaves the verdict unspoken.*" },
      },
      again = { { id = "a_again", text = "*Misifus is still on his ledge, still judging.*" } },
      choices = {
        { text = "What happened to your ear, old soldier?", next = "BACK", reply = "*Misifus turns his head so the notched ear faces you, quite proudly, and says nothing about the other fellow.*" },
        { text = "Reach up slowly to pet him.", next = "BACK", reply = "*He lets your fingers come within an inch, then leans away by exactly that inch, and keeps it there.*" },
        { text = "Watch what he watches from his ledge.", next = "mis_ledge1" },
        { text = "Show him the scars on your own hands.", next = "mis_scar1", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Sit down nearby and ignore him.", next = "mis_ign1" },
        { text = "Toss him a bit of jerky.", next = "END", reply = "*He catches it out of the air, turns his back on you, and eats it facing the wall.*" },
      },
    },
  },
}

-- Miss Mojo: the grande dame of A Hero's Welcome.
Critter {
  key = "dal_cat_miss_mojo", id = TODO_NPC("Miss Mojo"), name = "Miss Mojo", gender = "female",
  temper = { "haughty" }, values = { "proud" },
  impression = {
    first = "A long-haired cat at A Hero's Welcome who sits by the hearth like visiting royalty.",
    third = "{name} met Miss Mojo, the grand long-haired cat of A Hero's Welcome.",
  },
  greetings = {
    { id = "g_default", text = "*A long-haired white cat occupies the best chair by the hearth in A Hero's Welcome, and nobody has dared ask her to move.*" },
  },
  nodes = {
    moj_cats1 = {
      lines = {
        { id = "moj_cats1_1", text = "*When Haido strolls in from the counter, he gives Miss Mojo's chair a wide berth, and even sleepy Tailypo is said to wake up for her. Nobody at A Hero's Welcome sits in the chair by the fire but her.*" },
      },
      choices = {
        { text = "Has anyone ever tried?", next = "moj_cats2" },
        { text = "So she's the queen of the inn.", next = "moj_cats2" },
        { text = "Leave the court in peace.", next = "BACK" },
      },
    },
    moj_cats2 = {
      lines = {
        { id = "moj_cats2_1", text = "*A young mage once sat there by mistake, or so the serving girl tells you in a whisper, and found Miss Mojo sitting on his lap with her claws in his knee until he stood. He has taken his tea standing ever since.*" },
      },
      choices = {
        { text = "I'll keep to my feet, then.", next = "BACK" },
      },
    },
    moj_bow1 = {
      lines = {
        { id = "moj_bow1_1", text = "*You sweep a deep bow before the chair, and Miss Mojo watches it all the way down and all the way up again, unmoved.*" },
      },
      choices = {
        { text = "Stay down a little longer.", next = "moj_bow2" },
        { text = "That will have to do.", next = "BACK" },
      },
    },
    moj_bow2 = {
      lines = {
        { id = "moj_bow2_1", text = "*At last she extends one white paw from under her tail and holds it there in the air, exactly as a lady offers her hand to be kissed.*" },
      },
      choices = {
        { text = "Touch the paw, very gently.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Miss Mojo arranges her plume of a tail over her paws and regards you as a duchess regards a delivery boy.*" },
      },
      again = { { id = "a_again", text = "*Miss Mojo has not looked at you again, which is its own kind of attention.*" } },
      choices = {
        { text = "Good evening, Miss Mojo. Lovely chair you have.", next = "BACK", reply = "*She inclines her head by the smallest degree, as if the compliment were overdue but acceptable.*" },
        { text = "Brush the dust off her fur with your hand.", next = "BACK", reply = "*She permits two strokes, then turns and washes the place you touched, very thoroughly.*" },
        { text = "Notice how the inn's other cats behave around her.", next = "moj_cats1" },
        { text = "Bow to her, properly.", next = "moj_bow1" },
        { text = "Mind if I share the fire?", next = "END", reply = "*Miss Mojo spreads herself across the whole chair and closes her eyes, which means you may have the floor.*" },
      },
    },
  },
}

-- Munchies: chases a prairie dog in front of the Violet Citadel.
Critter {
  key = "dal_cat_munchies", id = TODO_NPC("Munchies"), name = "Munchies",
  temper = { "excitable" }, values = { "hunt" },
  impression = {
    first = "A young cat forever chasing a prairie dog across the lawn before the Violet Citadel, and never catching it.",
    third = "{name} met Munchies, the cat who chases a prairie dog outside the Violet Citadel.",
  },
  greetings = {
    { id = "g_default", text = "*A gangly young cat tears past your boots after a prairie dog, skids on the flagstones, and goes sprawling.*" },
    { id = "g_back", when = { metBefore = true }, text = "*Munchies is mid-pounce again, and the prairie dog is, once again, somewhere else.*" },
  },
  nodes = {
    mun_pd1 = {
      lines = {
        { id = "mun_pd1_1", text = "*The prairie dog sits up on its hind legs and chews, entirely unbothered, while Munchies creeps a little closer through the grass before the Violet Citadel.*" },
      },
      choices = {
        { text = "Has he ever actually caught it?", next = "mun_pd2" },
        { text = "Leave the two of them to their feud.", next = "BACK" },
      },
    },
    mun_pd2 = {
      lines = {
        { id = "mun_pd2_1", text = "*Munchies gets within a whisker, and the prairie dog bops him on the nose with one small paw and goes back to chewing. Munchies retreats three steps and sits with his back to it, plotting.*" },
      },
      choices = {
        { text = "I don't think it's afraid of you.", next = "BACK" },
      },
    },
    mun_gd1 = {
      lines = {
        { id = "mun_gd1_1", text = "*Two of the Citadel's guards stand at their posts as straight as pikes, but both of them have turned their heads just enough to follow the hunt.*" },
      },
      choices = {
        { text = "Are they placing bets?", next = "mun_gd2" },
        { text = "Let them have their fun.", next = "BACK" },
      },
    },
    mun_gd2 = {
      lines = {
        { id = "mun_gd2_1", text = "*When Munchies pounces and misses again, one guard sighs and passes a copper coin to the other without a word, and neither of them takes his eyes off the grass.*" },
      },
      choices = {
        { text = "My money's on the prairie dog.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Munchies crouches low in the grass before the Citadel, rear end wiggling, eyes locked on a prairie dog that is plainly not afraid of him.*" },
      },
      again = { { id = "a_again", text = "*Munchies is still wiggling, still not pouncing.*" } },
      choices = {
        { text = "Go on, then. You'll catch it this time.", next = "BACK", reply = "*Munchies leaps, the prairie dog steps aside, and the cat sails into a flowerbed. He emerges covered in petals and dignity.*" },
        { text = "Scoop him up before the guards see.", next = "BACK", reply = "*He goes limp as a sack in your arms, purring hard, with his eyes still fixed on the prairie dog.*" },
        { text = "Ask the prairie dog what it's done to deserve this.", next = "mun_pd1" },
        { text = "Notice the guards watching the chase.", next = "mun_gd1" },
        { text = "Leave the poor prairie dog alone, Munchies.", next = "END", reply = "*Munchies looks at you, then at the prairie dog, and the prairie dog looks back at you both, chewing.*" },
      },
    },
  },
}

-- Princess Nana: upstairs in the bedroom of A Hero's Welcome.
Critter {
  key = "dal_cat_princess_nana", id = TODO_NPC("Princess Nana"), name = "Princess Nana", gender = "female",
  temper = { "fussy" }, values = { "comfort" },
  impression = {
    first = "A fluffy cat who has claimed the softest bed upstairs at A Hero's Welcome for her own.",
    third = "{name} met Princess Nana, who rules the upstairs bedroom of A Hero's Welcome.",
  },
  greetings = {
    { id = "g_default", text = "*A fluffy calico lies in the exact centre of the bed upstairs, on the good pillow, as if the room were let in her name.*" },
  },
  nodes = {
    nan_room1 = {
      lines = {
        { id = "nan_room1_1", text = "*There are cat hairs on every pillow, a ribbon under the dresser, and a small, careful pile of stolen hairpins on the windowsill of the bedroom at A Hero's Welcome.*" },
      },
      choices = {
        { text = "Those hairpins are somebody's.", next = "nan_room2" },
        { text = "Leave her treasures be.", next = "BACK" },
      },
    },
    nan_room2 = {
      lines = {
        { id = "nan_room2_1", text = "*Princess Nana leaps down at once and sits in front of the pile, her tail wrapped around it, daring you to make a claim. Clearly every guest who has ever slept here has paid the princess a tax.*" },
      },
      choices = {
        { text = "Keep your crown jewels, Your Highness.", next = "BACK" },
      },
    },
    nan_bed1 = {
      lines = {
        { id = "nan_bed1_1", text = "*You lower yourself onto the very edge of the mattress, and Princess Nana stops kneading and stares at you in total disbelief.*" },
      },
      choices = {
        { text = "Stay put and see what happens.", next = "nan_bed2" },
        { text = "Get up again quickly.", next = "BACK" },
      },
    },
    nan_bed2 = {
      lines = {
        { id = "nan_bed2_1", text = "*She stalks across the blanket, climbs into your lap without asking, turns around three times, and settles there with her full weight, which is far more than such a small cat should be.*" },
      },
      choices = {
        { text = "I suppose I'm the pillow now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Princess Nana kneads the pillow slowly, claws in and out, and gives you a look that asks what you're doing in her room.*" },
      },
      again = { { id = "a_again", text = "*Princess Nana is still kneading the pillow, now with clear resentment.*" } },
      choices = {
        { text = "I think this was supposed to be my room.", next = "BACK", reply = "*Princess Nana yawns enormously and does not move a single whisker.*" },
        { text = "Scratch under her chin.", next = "BACK", reply = "*She tilts her head up, half-closes her eyes, and purrs like a little kettle, so long as you keep scratching.*" },
        { text = "Look around the room she's claimed.", next = "nan_room1" },
        { text = "Try sitting on the very edge of the bed.", next = "nan_bed1" },
        { text = "Fine, Your Highness. I'll sleep on the floor.", next = "END", reply = "*She curls up tighter on the pillow, satisfied that the matter of the bed is settled.*" },
      },
    },
  },
}

-- Solus: the cat in the Agronomical Apothecary.
Critter {
  key = "dal_cat_solus", id = TODO_NPC("Solus"), name = "Solus",
  temper = { "calm" }, values = { "comfort" },
  impression = {
    first = "A golden cat who lives among the herbs of the Agronomical Apothecary and smells faintly of mint.",
    third = "{name} met Solus, the cat of the Agronomical Apothecary.",
  },
  greetings = {
    { id = "g_default", text = "*A golden cat dozes in a patch of sunlight between the pots of the Agronomical Apothecary, smelling of crushed mint.*" },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "*Solus lifts his head and sniffs at your herb pouch with a connoisseur's interest.*" },
  },
  nodes = {
    sol_pot1 = {
      lines = {
        { id = "sol_pot1_1", text = "*The pots of the Agronomical Apothecary are full of peacebloom and silverleaf, and one of them has a cat-shaped dent pressed into the soil where something has clearly napped.*" },
      },
      choices = {
        { text = "Is that one his favourite?", next = "sol_pot2" },
        { text = "Let him keep his garden.", next = "BACK" },
      },
    },
    sol_pot2 = {
      lines = {
        { id = "sol_pot2_1", text = "*Solus strolls over and climbs into the dented pot, which fits him so well that only his ears and tail stick out over the rim. He blinks at you from among the leaves, entirely content.*" },
      },
      choices = {
        { text = "That's a very expensive bed.", next = "BACK" },
      },
    },
    sol_apo1 = {
      lines = {
        { id = "sol_apo1_1", text = "*She sweeps a scatter of soil and chewed leaves from the floor, then stops to scratch Solus behind the ears before carrying on.*" },
      },
      choices = {
        { text = "She doesn't really mind him.", next = "sol_apo2" },
        { text = "Leave them both to their work.", next = "BACK" },
      },
    },
    sol_apo2 = {
      lines = {
        { id = "sol_apo2_1", text = "*When she reaches the corner with the broom, Solus rolls over to show her his belly, and she laughs and gives up the sweeping for a minute to rub it.*" },
      },
      choices = {
        { text = "He knows exactly how to get away with it.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Solus rolls onto his back in the sunlight among the herb pots and stretches until his whole body trembles.*" },
      },
      again = { { id = "a_again", text = "*Solus has moved six inches to follow the sun.*" } },
      choices = {
        { text = "Have you been chewing the peacebloom again?", next = "BACK", reply = "*Solus licks his lips, which are faintly green, and looks innocent.*" },
        { text = "Rub his warm, sunny belly.", next = "BACK", reply = "*He grabs your wrist with all four paws, kicks it twice, and then licks it to show there were no hard feelings.*" },
        { text = "Look at the herb pots he's been sleeping among.", next = "sol_pot1" },
        { text = "Notice the apothecary's sigh as she sweeps up.", next = "sol_apo1" },
        { text = "Share the sunbeam with him a while.", next = "END", reply = "*Solus shifts over just enough to make room, and you both sit there doing nothing in particular.*" },
      },
    },
  },
}

-- Syrah: upstairs at One More Glass.
Critter {
  key = "dal_cat_syrah", id = TODO_NPC("Syrah"), name = "Syrah", gender = "female",
  temper = { "warm" }, values = { "comfort" },
  impression = {
    first = "A dark red-brown cat named like a wine, who lives upstairs above the bar at One More Glass.",
    third = "{name} met Syrah, the cat upstairs at One More Glass.",
  },
  greetings = {
    { id = "g_default", text = "*A cat the colour of dark wine lies along the upstairs rail of One More Glass, listening to the clink of glasses below.*" },
    { id = "g_drunk", when = { drunk = true }, text = "*Syrah sniffs the air as you come up the stairs, sneezes, and gives you the long look of a cat who has seen many customers in your state.*" },
  },
  nodes = {
    syr_rail1 = {
      lines = {
        { id = "syr_rail1_1", text = "*From the upper floor of One More Glass you can see the whole bar below, glasses and candles and the tops of a dozen heads, and Syrah watches all of them.*" },
      },
      choices = {
        { text = "Who is she watching most closely?", next = "syr_rail2" },
        { text = "Leave her to her post.", next = "BACK" },
      },
    },
    syr_rail2 = {
      lines = {
        { id = "syr_rail2_1", text = "*Her eyes follow a quiet patron in the corner who keeps refilling his own glass when the barkeep isn't looking. When he finally leaves, Syrah's tail gives one sharp flick, like a note in a ledger.*" },
      },
      choices = {
        { text = "You should be working for the house.", next = "BACK" },
      },
    },
    syr_mus1 = {
      lines = {
        { id = "syr_mus1_1", text = "*Below, someone begins on a slow tune, and Syrah's ears turn toward it. She lays her chin on her paws and her tail beats softly on the rail in time.*" },
      },
      choices = {
        { text = "Hum along under your breath.", next = "syr_mus2" },
        { text = "Let her enjoy it alone.", next = "BACK" },
      },
    },
    syr_mus2 = {
      lines = {
        { id = "syr_mus2_1", text = "*Syrah opens one eye at your humming, decides you are not as good as the musician, and closes it again. Still, she shifts closer along the rail until her fur brushes your arm.*" },
      },
      choices = {
        { text = "I'll take that as a compliment.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Syrah blinks at you slowly, the drowsy, contented look of someone who keeps late hours above a wine bar.*" },
      },
      again = { { id = "a_again", text = "*Syrah's tail drapes over the rail and ticks lazily in time with the music below.*" } },
      choices = {
        { text = "Do you know all the regulars by now?", next = "BACK", reply = "*Syrah looks down over the rail at the room, then back at you, as though she could tell you stories but won't.*" },
        { text = "Stroke her soft, dark fur.", next = "BACK", reply = "*She stretches into your hand and rolls over on the rail, with a carelessness that makes you grab for her.*" },
        { text = "Look down at the room from the rail beside her.", next = "syr_rail1" },
        { text = "Listen to the music with her.", next = "syr_mus1" },
        { text = "Let's not tell the barkeep I came up here.", next = "END", reply = "*Syrah closes her eyes. Whatever she sees up here stays up here.*" },
      },
    },
  },
}

-- Tailypo: asleep in the back yard of A Hero's Welcome.
Critter {
  key = "dal_cat_tailypo", id = TODO_NPC("Tailypo"), name = "Tailypo",
  temper = { "easygoing" }, values = { "comfort" },
  impression = {
    first = "A cat with an enormous bushy tail who sleeps in the back yard of A Hero's Welcome and has never been seen awake.",
    third = "{name} met Tailypo, the sleeping cat in the yard behind A Hero's Welcome.",
  },
  greetings = {
    { id = "g_default", text = "*In the yard behind A Hero's Welcome, a cat lies asleep in a heap, wrapped twice round in the largest tail you have ever seen on a cat.*" },
  },
  nodes = {
    tai_dream1 = {
      lines = {
        { id = "tai_dream1_1", text = "*Tailypo's whiskers twitch and his paws paddle softly against the warm stones of the back yard of A Hero's Welcome, as though he were running somewhere a long way off.*" },
      },
      choices = {
        { text = "Say something about mice.", next = "tai_dream2" },
        { text = "Let him run in his dreams.", next = "BACK" },
      },
    },
    tai_dream2 = {
      lines = {
        { id = "tai_dream2_1", text = "*At the word his ears swivel straight toward you and both front paws clench, but his eyes stay closed. Somewhere in the dream, it seems, a mouse has just had a very narrow escape.*" },
      },
      choices = {
        { text = "Sleep well, hunter.", next = "BACK" },
      },
    },
    tai_tail1 = {
      lines = {
        { id = "tai_tail1_1", text = "*Laid out straight, the tail is very nearly as long as the rest of Tailypo put together, and it ends in a tuft that looks like a feather duster.*" },
      },
      choices = {
        { text = "Is that natural for a cat?", next = "tai_tail2" },
        { text = "Leave the tail be.", next = "BACK" },
      },
    },
    tai_tail2 = {
      lines = {
        { id = "tai_tail2_1", text = "*A passing kitchen boy tells you the cook swears it grows a little longer every year, and that one day it will reach the front door on its own. Tailypo snores through the whole explanation.*" },
      },
      choices = {
        { text = "I don't doubt it.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Tailypo is asleep. One paw twitches, perhaps at a dream of mice, and the great tail curls a little tighter.*" },
        { id = "h_night", when = { timeOfDay = "night" }, text = "*Even at night Tailypo is asleep, though his ears swivel toward the sounds of the street like two little lanterns.*" },
      },
      again = { { id = "a_again", text = "*Tailypo is still asleep. Of course he is.*" } },
      choices = {
        { text = "Whisper his name.", next = "BACK", reply = "*The tip of the great tail rises, waves once at you, and settles again. The rest of the cat does not wake up.*" },
        { text = "Pet that enormous tail.", next = "BACK", reply = "*It is soft as a fox's brush. Tailypo sighs in his sleep and wraps it over his nose.*" },
        { text = "Look for whatever he's dreaming of.", next = "tai_dream1" },
        { text = "See how far the tail reaches.", next = "tai_tail1" },
        { text = "Tiptoe away and let him sleep.", next = "END", reply = "*Tailypo snores, very faintly, and does not notice you were ever there.*" },
      },
    },
  },
}

-- Milo: a corgi in the Dalaran Exchange.
Critter {
  key = "dal_dog_milo", id = TODO_NPC("Milo"), name = "Milo", gender = "male",
  temper = { "eager", "cheerful" }, values = { "loyal" },
  impression = {
    first = "A corgi in the Dalaran Exchange, short of leg and long of enthusiasm, the only dog among the city's cats.",
    third = "{name} met Milo, the corgi of the Dalaran Exchange.",
  },
  greetings = {
    { id = "g_default", text = "*A corgi comes bounding across the Exchange on stubby legs, ears up, his whole back half wagging along with his tail.*" },
    { id = "g_back", when = { metBefore = true }, text = "*Milo spots you from across the Exchange and yips, then runs at you so fast his back legs try to overtake his front ones.*" },
  },
  nodes = {
    mil_mer1 = {
      lines = {
        { id = "mil_mer1_1", text = "*Milo makes his rounds of the Dalaran Exchange stall by stall, sitting politely before each merchant in turn until he receives either a pat or a crust.*" },
      },
      choices = {
        { text = "Does anyone ever turn him away?", next = "mil_mer2" },
        { text = "Let him finish his rounds.", next = "BACK" },
      },
    },
    mil_mer2 = {
      lines = {
        { id = "mil_mer2_1", text = "*One sour-faced fellow ignores him completely, and Milo simply lies down across the front of the stall until customers have to step over him. The merchant gives in within a minute and pays the toll.*" },
      },
      choices = {
        { text = "He's better at trade than the traders.", next = "BACK" },
      },
    },
    mil_trick1 = {
      lines = {
        { id = "mil_trick1_1", text = "*You hold up a hand and say \"down\", and Milo drops instantly, then rolls over, then sits, then offers a paw, all in one eager rush.*" },
      },
      choices = {
        { text = "That's four tricks. I asked for one.", next = "mil_trick2" },
        { text = "Good boy. That's enough.", next = "BACK" },
      },
    },
    mil_trick2 = {
      lines = {
        { id = "mil_trick2_1", text = "*Milo looks at you with his tongue out, plainly certain that four tricks are worth four rewards, and his short tail sweeps the floor of the Exchange in hope.*" },
      },
      choices = {
        { text = "You drive a hard bargain, Milo.", next = "BACK" },
      },
    },
    mil_pet1 = {
      lines = {
        { id = "mil_pet1_1", text = "*Your companion steps forward and Milo bounds to meet it, nose to nose and tail going, then rolls onto his back to show that he is no threat and would like to be friends.*" },
      },
      choices = {
        { text = "Looks like they've settled it.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Milo sits at your feet, very nearly still, quivering with the effort of being a good boy.*" },
      },
      again = { { id = "a_again", text = "*Milo is still sitting, still quivering, still good.*" } },
      choices = {
        { text = "Who's a good boy? Is it you?", next = "BACK", reply = "*It is him. Milo spins around twice to make sure you know, then sits again.*" },
        { text = "Give him a scratch along his back.", next = "BACK", reply = "*One hind leg starts thumping on the floor of the Exchange, and the merchants nearby pretend not to smile.*" },
        { text = "Watch him greet the merchants of the Exchange.", next = "mil_mer1" },
        { text = "Teach him a trick.", next = "mil_trick1" },
        { text = "Let your own pet say hello.", next = "mil_pet1", when = { class = "HUNTER" } },
        { text = "Toss him a bit of bread.", next = "END", reply = "*Milo catches it, swallows it without chewing, and looks up at you as if you are the finest person in Dalaran.*" },
      },
    },
  },
}
