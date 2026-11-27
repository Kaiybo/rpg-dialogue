-- Darnassus, folk we had missed, second file: the three auctioneers; the Tradesmen's Terrace arms and
-- armor sellers (Ealyshia Dewwhisper, Merelyssa, Kieran, Turian, Glorandiir, Mythidan, Andrus, Caynrus,
-- Melea, Vinasia, Anadyia); Yldan (bags), Ellandrieth (general goods), Dendrythis (food and drink),
-- Kyrai (poisons) and Cyroen (reagents) in the Cenarion Enclave, and Ellaercia (tabard designs).
-- Classic only; all service. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Auctioneer Tolon
---------------------------------------------------------------------------
P:NPC {
  key = "tolon", id = TODO_NPC("Auctioneer Tolon"), name = "Auctioneer Tolon",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "formal", "unhurried" }, values = { "fairness", "order" },
  notices = { "race", "craft" },

  impression = {
    first = "Auctioneer Tolon conducts the sales of Darnassus with a formal, unhurried courtesy. He treats a bid of two coppers and a bid of two hundred gold with exactly the same gravity.",
    third = "{name} met Auctioneer Tolon at the auction house of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. The auction house is honored by your custom." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Sell or bid. Briefly." },
    { id = "g_hello", text = "Ishnu-alah. The auction house of Darnassus is open to you. Do you come to sell, or to bid?" },
    { id = "g_back", when = { metBefore = true }, text = "You are welcome back. Your earlier business was concluded in good order, as I recall." },
    { id = "g_out", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "Welcome, friend of the Alliance. Our house deals in your coin as readily as our own, and at the same rates." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "You glance about for the hammer and the shouting. We have neither here, for a bid in Darnassus is spoken once, quietly, and written down." },
    { id = "n_craft", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining" } },
      text = "You gather for your living, by the state of your satchel. What you carry will find buyers here, for this city makes little and wants much." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tolon, and with Golothas and Cazarez I keep the auction house. Everything that the terraces cannot use and somebody else might is brought to us. We find it a new owner, and the house keeps a small part for the trouble." },
      },
      again = {
        { id = "h_again", text = "Will there be another lot to post, or are you only watching the bids today?" },
        { id = "h_again2", text = "I am at your service. Ask." },
        { id = "h_again3", text = "Yes? The house is at your service." },
      },
      choices = {
        { text = "A formal auction is a fair auction.", next = "BACK", reply = "It is. Thank you.", fx = { align = { order = 1 } } },
        { text = "Auctions are just games.", next = "BACK", reply = "Then don't play.", fx = { align = { order = -1 } } },
        { text = "I'd like to see the auctions.", next = "BUSINESS" },
        { text = "An auction with no shouting?", next = "quiet" },
        { text = "What sells best in Darnassus?", next = "sells" },
        { text = "How do the three of you share the work?", next = "three" },
        { text = "How do our houses compare with yours?", next = "xout", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Did our people always trade this way?", next = "xnelf", when = { race = "NightElf" } },
        { text = "What happens to lots that never sell?", next = "w_unsold" },
        { text = "Good day, Auctioneer.", next = "END" },
      },
    },
    quiet = {
      lines = {
        { id = "quiet_default", text = "None at all. A bidder writes the sum, or speaks it to one of us, and it stands until it is bettered. I am told that in Ironforge the bidders bellow and bang their mugs. I do not doubt it is lively. I doubt that it is accurate." },
      },
      choices = {
        { text = "A calm house keeps honest books.", next = "BACK", reply = "That is our whole philosophy, and you have put it in six words.", fx = { align = { order = 1 } } },
        { text = "A little noise makes a sale worth watching.", next = "BACK", reply = "Cazarez agrees with you. I have asked him to agree more quietly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sells_default", text = "Metal, first, since we have none of our own. An iron bar from Ironforge will fetch here half again what it does at home. After that come hides, herbs, and of late enchanted arms, bought by those bound for Ashenvale who wish to arrive well prepared." },
      },
      choices = {
        { text = "And what do the elves themselves sell?", next = "sells2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells2 = {
      lines = {
        { id = "sells2_default", text = "Cloth of moonlit weave, leatherwork from the terrace, and draughts from Ainethil's students that she judges good enough to leave her bench. A few of our people also sell old things, from before the tree. I handle those myself, and I ask each seller twice whether they are certain." },
      },
      choices = {
        { text = "Why ask twice?", next = "sells3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells3 = {
      lines = {
        { id = "sells3_default", text = "Because a thing ten thousand years old cannot be bought back once a dwarf has carried it under a mountain. Most of the sellers are certain. One was not, and she took her mother's comb home again. The house lost its fee that day, and I did not mind it." },
      },
      choices = {
        { text = "That was well done, Tolon. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    three = {
      lines = {
        { id = "three_default", text = "Simply enough. Golothas keeps the tallies, for he has the head for it and does not care for talk. Cazarez greets the outlanders, since he enjoys them. I hear disputes, when there are any, and there are fewer than you might suppose." },
      },
      choices = {
        { text = "What do people dispute?", next = "three2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    three2 = {
      lines = {
        { id = "three2_default", text = "A bid mistakenly written, most often, with one nought too many. Our rule is that a bid once made must stand, and I have never set it aside. But I have, on occasion, taken a long time to find my pen, and the bidder has found that long enough to notice the mistake." },
      },
      choices = {
        { text = "A rule kept, and a kindness done besides.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xout = {
      lines = {
        { id = "xout_default", text = "Yours are faster and louder, and they turn over a great deal more coin. Ours has never yet lost a consignment. I should not presume to say which is the better. I shall only say that your merchants come here when the thing they are selling is precious." },
      },
      choices = {
        { text = "That's high praise, coming from them. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "No. In the old forest a thing was given, or lent, or left where it was needed, and nobody kept a tally. Coin came with the city and the Alliance. I think we have gained by it. But I notice that our elders still leave a gift on my counter, now and then, and will not take a receipt." },
      },
      choices = {
        { text = "Some habits deserve to outlast the coin. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    w_unsold = {
      lines = {
        { id = "w_unsold_default", text = "They come back to their owners after the set term, with the house's apology and none of its fee. A few are never collected, and those wait in the back room for a full year before we offer them again." },
      },
      choices = {
        { text = "And after a year?", next = "w_unsold2" },
        { text = "That's generous of the house.", next = "w_unsold2" },
      },
    },
    w_unsold2 = {
      lines = {
        { id = "w_unsold2_default", text = "Then they go to the Temple, to be given where they are needed. There is a cloak in that room now that a Sentinel posted before she went to Ashenvale, and she has not come back for it, and I find I cannot yet bring myself to send it on." },
        { id = "w_unsold2_w1", when = { class = "WARRIOR" }, text = "You fight for a living, so you will understand why I keep it a little longer than the rule allows. I would rather break a rule than her hope." },
      },
      choices = {
        { text = "Keep it a while longer.", next = "BACK", fx = { align = { order = -1 } }, reply = "I think I shall. The rule can be patient with me this once." },
        { text = "A rule kept is a rule trusted.", next = "BACK", fx = { align = { order = 1 } }, reply = "You are right, and that is why it troubles me. I will send it on at the new moon." },
        { text = "I hope she comes for it.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am one of the three auctioneers of Darnassus. I hear the disputes, such as they are." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves bid on every old kaldorei thing that crosses my counter. I ask the sellers twice before I let one go." } },
    warsong = { { id = "tp_warsong", text = "I can tell how the fighting in Ashenvale goes by what is bid on here. Of late it has been bandages and enchanted steel." } },
    advice = { { id = "tp_advice", text = "Read your bid before you hand it to me. One nought too many has ruined more evenings than wine." } },
    _none = { { id = "tp_none", text = "That is not on the house's books. Garryeth at the bank may know, or the innkeeper." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Golothas
---------------------------------------------------------------------------
P:NPC {
  key = "golothas", id = TODO_NPC("Auctioneer Golothas"), name = "Auctioneer Golothas",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "terse", "exact" }, values = { "accuracy", "quiet" },
  notices = { "craft", "class" },

  impression = {
    first = "Auctioneer Golothas keeps the tallies of Darnassus's auction house and plainly prefers figures to conversation. He answered me fully, in as few sentences as courtesy allowed.",
    third = "{name} met Auctioneer Golothas at the auction house of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Your item and price, and I'll handle the rest." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Item and lowest price. Now." },
    { id = "g_hello", text = "Good day. If you are selling, I shall need the item and the lowest price you will bear. If you are buying, the board is there." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your account is in order, for I looked at it this morning." },
    { id = "g_craft", when = { profession = { "Enchanting", "Alchemy", "Tailoring", "Leatherworking" } }, text = "You make things for sale, I think. Then price them by what they cost you and not by what you hope, and we shall get on." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You read my ledger upside down while I was speaking. Very few can do that. I shall turn it over now, if you do not mind." },
    { id = "n_craft", cat = "craft", when = { profession = { "Enchanting", "Alchemy" } },
      text = "You brew or enchant, and you have priced your work by guessing, as they all do. I can tell you what the last ten sold for, which is better than a guess." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Golothas. Tolon speaks for this house and Cazarez smiles for it, and I count for it. Every bid and every sale in Darnassus passes under my pen, and my columns have agreed with one another for a very long time." },
      },
      again = {
        { id = "h_again", text = "What else? I can answer and add a column at once." },
        { id = "h_again2", text = "Ask it, and I shall answer what I can." },
        { id = "h_again3", text = "Yes. Go on." },
      },
      choices = {
        { text = "A clear auction is a fair auction.", next = "BACK", reply = "It is.", fx = { align = { order = 1 } } },
        { text = "Auctions are too complicated.", next = "BACK", reply = "Then don't use them.", fx = { align = { order = -1 } } },
        { text = "I'd like to see the auctions.", next = "BUSINESS" },
        { text = "You'd rather count than talk.", next = "count" },
        { text = "What do the figures tell you?", next = "figures" },
        { text = "Has anyone ever cheated the house?", next = "cheat" },
        { text = "What's my craft's work fetching, of late?", next = "xcraft", when = { profession = { "Enchanting", "Alchemy", "Tailoring", "Leatherworking" } } },
        { text = "I can read a ledger from any side.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How long have you kept the house's columns?", next = "go_long" },
        { text = "Do Tolon and Cazarez ever trouble your counting?", next = "go_others" },
        { text = "What's the oldest entry in your columns?", next = "w_first" },
        { text = "I'll leave you to your columns.", next = "END" },
      },
    },
    go_long = {
      lines = {
        { id = "go_long_1", text = "Since the house opened, which was soon after the tree was raised. The figures have changed a great deal, for now we sell to dwarves and humans, but the method has not." },
      },
      choices = {
        { text = "What has changed in the figures?", next = "go_changed" },
        { text = "A long service. Your columns must be very full.", next = "BACK", reply = "Very full, and very orderly." },
      },
    },
    go_changed = {
      lines = {
        { id = "go_changed_1", text = "Linen and iron, which we never sold before, and far less moonwell water, which we once sold every day. The outlanders want what they carry home, and the kaldorei buy less than they did, for many have gone to Ashenvale and Darkshore." },
      },
      choices = {
        { text = "Fewer elves in Darnassus, then?", next = "BACK", reply = "Fewer, and more outlanders, and the columns show both." },
        { text = "Something else, Golothas.", next = "BACK" },
      },
    },
    go_others = {
      lines = {
        { id = "go_others_1", text = "Tolon troubles no one, for he speaks only when a quarrel requires it. Cazarez troubles everyone, for he talks to every buyer for an hour and then forgets to write down what they paid." },
      },
      choices = {
        { text = "And you correct his columns?", next = "go_correct" },
        { text = "I'm a rogue. I'd guess he forgets on purpose.", next = "go_correct", when = { class = "ROGUE" } },
      },
    },
    go_correct = {
      lines = {
        { id = "go_correct_1", text = "I do, every evening, and he thanks me for it as if I had given him a gift. I do not mind, for his talk brings in buyers and my columns keep them, and the house prospers from both." },
      },
      choices = {
        { text = "A good partnership, then.", next = "BACK" },
        { text = "Something else, Golothas.", next = "BACK" },
      },
    },
    count = {
      lines = {
        { id = "count_default", text = "I had, and I do not take it as a reproach. A figure means one thing and goes on meaning it. A person may say three things in one sentence and intend a fourth. I leave people to Cazarez, who likes puzzles of that sort." },
      },
      choices = {
        { text = "Numbers are the more honest company.", next = "BACK", reply = "You understand me, then, which I did not expect before noon.", fx = { align = { order = 1 } } },
        { text = "People are worth the trouble of the puzzle.", next = "BACK", reply = "Cazarez says the same. He is often late with his tallies.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    figures = {
      lines = {
        { id = "figures_default", text = "They tell me what the city is afraid of. When healing draughts sell at twice their price, something has gone badly in Ashenvale, and I know it a day before the Sentinels announce it. When silk goes dear, Raedon Duskstriker is buying for the war again." },
      },
      choices = {
        { text = "What are they telling you now?", next = "figures2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    figures2 = {
      lines = {
        { id = "figures2_default", text = "That more arms are bought than sold, and by younger buyers than a year ago. That nobody is bidding on anything meant only to be beautiful. A city that stops buying beautiful things is a worried city. I have written as much in the margin, where nobody will read it." },
      },
      choices = {
        { text = "I've read it now. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    cheat = {
      lines = {
        { id = "cheat_default", text = "It has been tried. A seller once bid on his own goods under a cousin's name, to push the price. It worked for four sales. On the fifth I noticed that the cousin always lost by exactly one silver, and that no cousin could be found." },
      },
      choices = {
        { text = "What became of him?", next = "cheat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheat2 = {
      lines = {
        { id = "cheat2_default", text = "Tolon heard the matter, and the man was barred from the house for a hundred years. He has thirty-one of them left. He sends a polite letter each spring asking whether the term might be shortened. Each spring I work the sum again, to be fair to him, and it comes out the same." },
      },
      choices = {
        { text = "A hundred years means a hundred years.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    xcraft = {
      lines = {
        { id = "xcraft_default", text = "Less than you want and more than it cost you, if you made it well. The common work sells slowly, because every apprentice on the terrace makes the same thing. Make what they cannot yet make, and price it one silver under the next seller. That is the whole of the art." },
      },
      choices = {
        { text = "One silver under. I'll remember it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "So I saw. Then you will have read that the house keeps no secrets worth stealing, only sums. If you wish to practise, read Cazarez's ledger, for his hand is worse and it will test you. Do not tell him that I suggested it." },
      },
      choices = {
        { text = "I never heard it from you. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    w_first = {
      lines = {
        { id = "w_first_default", text = "A bundle of eight arrows, sold for four copper on the house's opening night, to a Sentinel named in my column as Shaylara. The buyer paid with a silver piece and refused the change, and I have never quite reconciled that line." },
      },
      choices = {
        { text = "You never found her to give it back?", next = "w_first2" },
        { text = "Four copper's change can't matter much.", next = "w_first2" },
      },
    },
    w_first2 = {
      lines = {
        { id = "w_first2_default", text = "It matters to the column, which is the same thing. I set the change aside in a little purse, and it has waited ever since. If you meet a Shaylara of the Sentinels, tell her the house owes her six copper, and that it would like to be square." },
      },
      choices = {
        { text = "I'll ask after her.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "You're very particular.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I keep the tallies of the Darnassus auction house. My columns agree, and I intend that they shall go on agreeing." } },
    warsong = { { id = "tp_warsong", text = "I know how Ashenvale fares by the price of a healing draught. It has been high for some months." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels buy arms here for their recruits, who are younger each season. The figures say so, and figures do not exaggerate." } },
    advice = { { id = "tp_advice", text = "Price your goods by what they cost you, and never by what you hope for. Hope is not a figure." } },
    _none = { { id = "tp_none", text = "I have no column for that. Ask Tolon, who answers questions for the house." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Cazarez
---------------------------------------------------------------------------
P:NPC {
  key = "cazarez", id = TODO_NPC("Auctioneer Cazarez"), name = "Auctioneer Cazarez",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "affable", "curious" }, values = { "novelty", "company" },
  notices = { "race", "class" },

  impression = {
    first = "Auctioneer Cazarez greets every outlander at the Darnassus auction house as though they had brought him a present. He is affable and endlessly curious about the world below the tree.",
    third = "{name} met Auctioneer Cazarez at the auction house of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome, friend! Buying or selling? Either way, I'm glad you're here!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome. Buying or selling? Quickly." },
    { id = "g_hello", text = "Welcome, welcome! Come in under the boughs. Are you buying or selling, and, more to the point, where have you come from?" },
    { id = "g_back", when = { metBefore = true }, text = "My friend, you are back! Tell me where you have been since, before Golothas makes me do sums." },
    { id = "g_out", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "An outlander! Splendid. Come and stand where I can ask you things. How was the crossing, and did you see the big fish?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf of Ironforge! Is it true that your city is inside a mountain, and that there is a river of molten rock in the middle of it? I have been told so, and I am determined to believe it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. The older folk here will look at you sidelong, and I ask you to forgive them. I should like very much to see a small trick, when Tolon is not watching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Cazarez, the third auctioneer of this house, and the one who enjoys it. Tolon hears the quarrels and Golothas does the counting. I talk to the people who come in, and from them I am slowly collecting the whole world." },
      },
      again = {
        { id = "h_again", text = "What else? I have all the time in the world for you." },
        { id = "h_again2", text = "Ask, ask! Golothas is not looking." },
        { id = "h_again3", text = "Something more, my friend?" },
      },
      choices = {
        { text = "Curiosity makes a good auctioneer.", next = "BACK", reply = "It does! Ask enough questions about a lot and you learn who will bid on it before they know it themselves.", fx = { align = { light = 1 } } },
        { text = "An auctioneer should just sell.", next = "BACK", reply = "Then talk to Golothas.", fx = { align = { light = -1 } } },
        { text = "I'd like to see the auctions.", next = "BUSINESS" },
        { text = "Collecting the whole world?", next = "collect" },
        { text = "What's the strangest thing sold here?", next = "strange" },
        { text = "You're not like the other two.", next = "other" },
        { text = "Ironforge does have a river of fire.", next = "xdwarf", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Have you ever left the tree?", next = "left" },
        { text = "What have you learned about the dwarves?", next = "cz_dwarves" },
        { text = "Do the Sentinels ever sell through the house?", next = "cz_sentinels" },
        { text = "What would you buy, if you could bid yourself?", next = "w_bid" },
        { text = "Until next time, Cazarez.", next = "END" },
      },
    },
    cz_dwarves = {
      lines = {
        { id = "cz_dwarves_1", text = "That they love stone and ale and argument, and that they will argue about the price of a gem for an hour and then buy it gladly. I like them very much, though Golothas finds them exhausting." },
      },
      choices = {
        { text = "And the humans?", next = "cz_humans" },
        { text = "I'm a dwarf. We argue because we care.", next = "cz_humans", when = { race = "Dwarf" } },
      },
    },
    cz_humans = {
      lines = {
        { id = "cz_humans_1", text = "The humans are quicker and less patient, and they always want to know what a thing is worth in Stormwind. I have begun to keep a list of Stormwind prices, so that I can tell them, and they are always surprised." },
      },
      choices = {
        { text = "Clever of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Cazarez.", next = "BACK" },
      },
    },
    cz_sentinels = {
      lines = {
        { id = "cz_sentinels_1", text = "Rarely, for they are too busy guarding the forests, but now and then a huntress sells a pelt or a fang she has no use for. The pelts from Ashenvale fetch the most, for the outlanders like to say they own something from the war." },
      },
      choices = {
        { text = "What war?", next = "cz_war" },
        { text = "Ashenvale pelts sound like fine goods.", next = "BACK" },
      },
    },
    cz_war = {
      lines = {
        { id = "cz_war_1", text = "The orcs in Ashenvale, cutting the forest for their camps and their machines. The Sentinels fight them every day, and the pelts they bring home have often been taken from the wolves the orcs ride." },
      },
      choices = {
        { text = "That's a grim trophy.", next = "BACK", fx = { learn = { "warsong" } } },
        { text = "Something else, Cazarez.", next = "BACK" },
      },
    },
    collect = {
      lines = {
        { id = "collect_default", text = "In here, in my head. I have never been further than Auberdine. But a human tells me about Stormwind's canals, and a gnome tells me about a city that was lost to poison, and I put each in its place. I have a very good map by now, and none of it is on paper." },
      },
      choices = {
        { text = "Why not go and see it all yourself?", next = "collect2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    collect2 = {
      lines = {
        { id = "collect2_default", text = "I ask myself that every time a ship leaves. I think I am afraid it will be smaller than it is in the telling. Stormwind, as I have built it, has towers of white stone a mile high, and I do not want to stand in front of the real one and count the storeys." },
      },
      choices = {
        { text = "Go. The real thing is always worth it.", next = "BACK", reply = "You may be right. Ask me again after the next ship, and the one after.", fx = { align = { order = -1 } } },
        { text = "Stay. Duty and a good map are no small things.", next = "BACK", reply = "Golothas will be relieved. He could not bear to train another.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = {
        { id = "strange_default", text = "A box that ticked. A gnome consigned it and would not say what it did. It sold to a dwarf, who also would not say. I held it for one night in the strongroom and did not sleep at all. Tolon has since made a rule about ticking." },
      },
      choices = {
        { text = "And the finest thing?", next = "strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange2 = {
      lines = {
        { id = "strange2_default", text = "A glaive, very old, from before the Sundering, with a Sentinel's name cut into the grip. It was sold by her daughter, to buy passage and arms for Ashenvale. A young Sentinel bought it with every coin she had. I thought that a proper sort of sale, and I waived my own part of the fee." },
      },
      choices = {
        { text = "So it went back to the war it was made for.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    other = {
      lines = {
        { id = "other_default", text = "No, and they are very patient about it. Tolon believes that an auction house should be like a temple, and Golothas believes that it should be like an abacus. I think it ought to be a little like an inn. We have settled on a temple with one talkative corner." },
      },
      choices = {
        { text = "Every house needs one such corner. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "It does! I knew it. And you live beside it, and forge on it, and think nothing of it? Wonderful. Tell me, is it true as well that there is a tram that runs under the sea to Stormwind? No, do not tell me, I shall save it for tomorrow." },
      },
      choices = {
        { text = "Come and see the Great Forge yourself one day.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    left = {
      lines = {
        { id = "left_default", text = "To Auberdine, twice, and I was seasick both times on a crossing of no distance at all. The second time I met a human fisherman on the dock who had sailed from Menethil, and I questioned him for so long that I missed the boat home." },
      },
      choices = {
        { text = "A dock is as good a classroom as any. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    w_bid = {
      lines = {
        { id = "w_bid_default", text = "A map, and a good one, of anywhere I have not been, which is everywhere. Last spring a human sold a sea chart of the coast of Stranglethorn, and I watched it go to a dwarf for nine silver and I have not stopped thinking about it." },
      },
      choices = {
        { text = "Why not bid on it?", next = "w_bid2" },
        { text = "You'd never use a sea chart.", next = "w_bid2" },
      },
    },
    w_bid2 = {
      lines = {
        { id = "w_bid2_default", text = "The house's rule, and a good one: no auctioneer bids on what passes through our hands. Tolon would forgive me and Golothas would not, and it is Golothas who keeps the columns, so I keep my hands folded and my curiosity behind my teeth." },
        { id = "w_bid2_w1", when = { race = "Human" }, text = "Unless you have such a chart yourself and would like to describe it to me, at very great length? I promise to listen to every word." },
      },
      choices = {
        { text = "Some rules keep a house honest.", next = "BACK" },
        { text = "You could always just go and see it.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am the third auctioneer of Darnassus. I greet the outlanders, and I ask them a great many questions." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves of the League have promised to show me a map of the whole world. I have promised to pretend I have not already made one." } },
    teldrassil = { { id = "tp_teldrassil", text = "I have hardly left this tree, and I know that it shows. I am mending that, one traveller at a time." } },
    advice = { { id = "tp_advice", text = "Ask every stranger where they are from. It costs nothing, and you will own a little of the place afterward." } },
    _none = { { id = "tp_none", text = "I have not collected that one yet! If you find out, come and tell me first." } },
  },
}

---------------------------------------------------------------------------
-- Ealyshia Dewwhisper
---------------------------------------------------------------------------
P:NPC {
  key = "ealyshia", id = TODO_NPC("Ealyshia Dewwhisper"), name = "Ealyshia Dewwhisper", title = "Two Handed Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "composed", "forthright" }, values = { "strength", "discipline" },
  notices = { "class", "race" },

  impression = {
    first = "Ealyshia Dewwhisper sells great blades and staves on the Tradesmen's Terrace and handles them as if they weighed nothing. She asked what I meant to do with one before she would name a price.",
    third = "{name} met Ealyshia Dewwhisper, who sells two-handed weapons in Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend. You have the hands for a great weapon. Look." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met. Both hands, all your attention. Which do you lack?" },
    { id = "g_hello", text = "Well met. I sell arms that want both of your hands and all of your attention. Which do you favour, the sword, the staff or the polearm?" },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you are carrying it properly now, across the back and not dragging. I am glad to see that." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior. Take the greatsword from the wall and show me a single cut. I shall know from that what to sell you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You carry a staff as a druid does, like a walking companion. It is also a weapon, and there is no shame in remembering that when the bear is too slow to come." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human. Your people favour two-handed swords with a long crossguard, I have noticed. Ours have none, for we were taught not to let a blade come so near." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ealyshia Dewwhisper. Merelyssa beside me sells the lighter blades, and Glorandiir the axes. Mine are the long arms, the ones that end a fight in one stroke or leave you open if they do not." },
      },
      again = {
        { id = "h_again", text = "Ask on. A greatsword buyer should have all her questions answered before she swings." },
        { id = "h_again2", text = "Ask. I have the time." },
        { id = "h_again3", text = "Yes? Step back a little; I am swinging this one." },
      },
      choices = {
        { text = "A two-handed weapon demands discipline.", next = "BACK", reply = "It does. A two-handed blade punishes every lazy step, and it punishes them at once.", fx = { align = { order = 1 } } },
        { text = "A big weapon just needs a strong arm.", next = "BACK", reply = "Then hit yourself with it.", fx = { align = { order = -1 } } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why would you ask what I'll do with it?", next = "why" },
        { text = "Do night elves use great blades much?", next = "use" },
        { text = "Who buys from you, these days?", next = "buys" },
        { text = "Watch my cut, then, and judge.", next = "xwar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Which staff for a druid who fights?", next = "xdruid", when = { class = "DRUID" } },
        { text = "You said you fought beside humans and orcs.", next = "w_hyjal" },
        { text = "Elune guide your arm, Ealyshia.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "Because a great blade is a promise to stand in one place and be struck at. If you mean to dart and harry, it will get you killed, and I should have helped. I have turned buyers away to Merelyssa before now, and she has sent a few to me." },
      },
      choices = {
        { text = "A merchant should care who she arms.", next = "BACK", reply = "I was a Sentinel before I was a merchant. I have not learned to stop.", fx = { align = { order = 1 } } },
        { text = "My coin, my choice. Just name the price.", next = "BACK", reply = "As you wish. I shall name it, and I shall tell you what I think as well.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    use = {
      lines = {
        { id = "use_default", text = "Less than the Sentinels' glaive or the bow, I grant you. We are a people of the ambush. But there were always a few who held the line while the archers worked, and I was one of them, on the slopes of Hyjal. That is where I learned what a long blade is for." },
      },
      choices = {
        { text = "You fought at Hyjal?", next = "use2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use2 = {
      lines = {
        { id = "use2_default", text = "I did, beside humans and orcs both, which I did not expect to live to say. An orc with an axe as tall as I am held the ground on my left for half a night. I never learned his name. I think of him when I am told what his people are doing now in Ashenvale." },
      },
      choices = {
        { text = "Does it change how you see the Horde?", next = "use3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use3 = {
      lines = {
        { id = "use3_default", text = "It makes it harder, and I think it ought to be hard. They are felling our forest and I shall sell blades to anyone who goes to stop them. But I do not say, as some here do, that they are beasts. I have stood beside one of them, and he did not run." },
      },
      choices = {
        { text = "That's a soldier's honesty. Something else.", next = "BACK", fx = { learn = { "warsong" }, trait = { honest = 1 } } },
      },
    },
    buys = {
      lines = {
        { id = "buys_default", text = "Outlanders, mostly. Human warriors, and dwarves, who choose the heaviest thing on the wall and then complain that it is too light. And young kaldorei who have seen the humans fight and want to try it. Sildanair sends those to me when she thinks they are ready." },
      },
      choices = {
        { text = "Are they ready?", next = "buys2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys2 = {
      lines = {
        { id = "buys2_default", text = "About half are. The other half I send back to her with a practice blade of wood, weighted to match, and I tell them to swing it a thousand times. Those who return after the thousand, I sell to. It is a simple test, and it has never yet been wrong." },
      },
      choices = {
        { text = "A thousand swings. Fair enough. Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "Again, and this time do not look at the blade. That is better. Your shoulders are sound and your back foot drifts, which will cost you on wet ground. The second sword from the left will suit you, for it is a hand shorter than the one you wanted." },
      },
      choices = {
        { text = "A hand shorter. I'll trust your eye.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Ash, shod at both ends, and no carving on it to catch a blade. The pretty ones with the moonstone are for standing in the Enclave. Mathrengyl Bearwalker carries a plain one, and I notice nobody has ever asked him why." },
      },
      choices = {
        { text = "Plain ash, shod at both ends. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    w_hyjal = {
      lines = {
        { id = "w_hyjal_default", text = "At Mount Hyjal, against the Legion, when Archimonde climbed for the World Tree. I held a greatsword on the slopes below Nordrassil, and the orc beside me held an axe, and neither of us had a word of the other's tongue." },
      },
      choices = {
        { text = "What was it like, fighting with an orc?", next = "w_hyjal2" },
        { text = "I didn't expect you to speak of Hyjal.", next = "w_hyjal2" },
      },
    },
    w_hyjal2 = {
      lines = {
        { id = "w_hyjal2_default", text = "Loud. He shouted at every stroke and I thought it foolish, until I saw that it made the demons look at him and not at me. When it was done he nodded to me once and walked away, and I never learned his name, and I have never felt the same about the Horde since, in either direction." },
        { id = "w_hyjal2_w1", when = { race = "Orc" }, text = "You are one of his people, so perhaps you will understand me when I say that I hate what your Warsong do in Ashenvale and I would still stand beside that one again." },
      },
      choices = {
        { text = "Old allies can still be enemies.", next = "BACK" },
        { text = "Something else, Ealyshia.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell two-handed weapons on the Tradesmen's Terrace. Before that I was a Sentinel, and I held a line at Hyjal." } },
    burning_legion = { { id = "tp_burning_legion", text = "I stood against them at Hyjal with a blade as long as I am. I sell such blades now, so that others can do the same." } },
    warsong = { { id = "tp_warsong", text = "I shall arm anyone who goes to stop the felling. I will not call the orcs beasts, for I have fought beside one." } },
    sentinels = { { id = "tp_sentinels", text = "I served, and I left when the tree was grown. Sildanair still sends me her pupils, and I count it an honour." } },
    advice = { { id = "tp_advice", text = "Swing it a thousand times before you trust it. A great blade forgives nothing you have not practised." } },
    _none = { { id = "tp_none", text = "That is beyond my wall. Ask Ilyenia Moonfire, on the Warrior's Terrace, or the Sentinels." } },
  },
}

---------------------------------------------------------------------------
-- Merelyssa
---------------------------------------------------------------------------
P:NPC {
  key = "merelyssa", id = TODO_NPC("Merelyssa"), name = "Merelyssa", title = "Blade Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "quick", "sardonic" }, values = { "skill", "speed" },
  notices = { "class", "kit" },

  impression = {
    first = "Merelyssa sells swords and daggers on the Tradesmen's Terrace with a quick, sardonic tongue. She tested the edge of my own blade with her thumb before I could object.",
    third = "{name} met Merelyssa, the blade merchant of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Your blade is well kept. Let me find you a better one." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Let me see what you carry. Hm. Poorly kept." },
    { id = "g_hello", text = "Good day. Swords for one hand and daggers for the other. Let me see what you carry now, so that I know how low to set my hopes." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and still using that? I thought I had talked you out of it. Very well, show me the edge." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You have a pair of daggers and you came in by the side stair. I shall not ask why. I shall only say that mine are sharper." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Your left blade is a finger shorter than your right, and you have worn the sheath to match. So that was done on purpose. Good, since most people simply buy two and hope." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You grip a sword as if it might escape. Ease your hand, for a blade held so tightly turns in the cut, and then you blame the smith." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Merelyssa. I sell the blades a person can actually move with, which sets me apart from Ealyshia and her great slabs, and from Glorandiir, who thinks an axe is a subtle instrument. We three share the terrace in perfect contempt." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, before Ealyshia comes over to interrupt." },
        { id = "h_again2", text = "Ask, and be quick, as a blade should be." },
        { id = "h_again3", text = "Go on. I am only sharpening." },
      },
      choices = {
        { text = "A blade should be kept sharp and clean.", next = "BACK", reply = "It should. A dull edge in a sheath is a lie you tell yourself until the day you need it.", fx = { align = { order = 1 } } },
        { text = "A blade is a blade.", next = "BACK", reply = "Then buy one elsewhere.", fx = { align = { order = -1 } } },
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "Perfect contempt, all three of you?", next = "contempt" },
        { text = "Where is your steel forged?", next = "steel" },
        { text = "You judge everyone by their sword.", next = "judge" },
        { text = "Who taught you about paired daggers?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How should I grip it, then?", next = "xwar", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "You said you were more dangerous once.", next = "w_once" },
        { text = "Stay sharp, Merelyssa.", next = "END" },
      },
    },
    contempt = {
      lines = {
        { id = "contempt_default", text = "Affectionate contempt, then. We have argued the same argument since the terrace was grown. Ealyshia holds that one great stroke ends a fight. I hold that three quick ones end it sooner. Glorandiir holds that we are both overthinking it." },
      },
      choices = {
        { text = "Who has the right of it?", next = "contempt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    contempt2 = {
      lines = {
        { id = "contempt2_default", text = "I do, naturally. But I shall admit this to a stranger. When the Sentinels came to buy for Ashenvale, they bought from all three of us and in nearly equal measure. So perhaps a war needs every kind of fool. What do you favour?" },
      },
      choices = {
        { text = "Speed. A quick blade decides the fight.", next = "BACK", reply = "A person of sense! Stand there where Ealyshia can hear you say it.", fx = { affinity = 1 } },
        { text = "One heavy stroke, well placed.", next = "BACK", reply = "Then your stall is the next one along. I shall try not to hold it against you." },
        { text = "Whatever's nearest to hand.", next = "BACK", reply = "That is Glorandiir's answer. Go and make him happy.", fx = { trait = { practical = 1 } } },
      },
    },
    steel = {
      lines = {
        { id = "steel_default", text = "Not here, as you will have guessed. The blades are forged in Auberdine and in the dwarves' mountain, to our patterns, and I finish and edge them myself. I was doubtful about dwarven steel at first, and I was wrong, since it holds an edge better than anything we ever made." },
      },
      choices = {
        { text = "You'd say so to a dwarf's face?", next = "steel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steel2 = {
      lines = {
        { id = "steel2_default", text = "I have said it to one, and he became unbearable for the rest of the afternoon. But I told him his hilts were clumsy, which is also true, and so we parted even. I fit our own grips to his steel now, and the result is the best blade I have ever sold." },
      },
      choices = {
        { text = "The best of both peoples. Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    judge = {
      lines = {
        { id = "judge_default", text = "I do, and I am seldom wrong. A notched edge that has never been honed tells me that its owner is lazy. One honed to a razor that has never met a bone tells me they are vain. Yours has been used and cared for in fair proportion. I have no complaint to make." },
      },
      choices = {
        { text = "And what does your own blade say?", next = "judge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    judge2 = {
      lines = {
        { id = "judge2_default", text = "That I was a good deal more dangerous once than a shopkeeper ought to be, and that I have kept it up out of pride. I practise each dawn behind the stall. Ilyenia Moonfire watched me once and said nothing at all, which from her is very high praise." },
      },
      choices = {
        { text = "From her, I'd take it as a medal.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Nobody taught me. I learned it by losing, to a woman who fought so. The shorter blade turns inside a guard where the longer cannot follow. If Syurna has not shown you that yet, ask her, and tell her I said she was holding out on her pupils." },
      },
      choices = {
        { text = "I'll ask her, and duck. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "Hold it as you would hold a bird, firmly enough that it cannot fly and gently enough that it lives. Every swordmaster since the Sundering has said so, and it has gone on being true. Your knuckles should not be white until the moment you strike." },
      },
      choices = {
        { text = "Like a bird. I'll practise it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    w_once = {
      lines = {
        { id = "w_once_default", text = "I was a Sentinel for a long age, and a quick one, and I liked it rather too much. A captain told me that I fought like someone trying to win an argument, and she was right, and she sent me home before it got me killed." },
      },
      choices = {
        { text = "Do you resent her for it?", next = "w_once2" },
        { text = "You still sound like you're arguing.", next = "w_once2" },
      },
    },
    w_once2 = {
      lines = {
        { id = "w_once2_default", text = "I did, for a century, and then I saw what happened to the others who fought as I did. So now I sell blades instead, and I argue with Ealyshia and Glorandiir, and nobody bleeds for it but my pride." },
        { id = "w_once2_w1", when = { class = "ROGUE" }, text = "You fight from the shadows, so I suspect you argue the same way I did, only more quietly. Be careful with it." },
      },
      choices = {
        { text = "Your captain did you a kindness.", next = "BACK", fx = { align = { order = 1 } }, reply = "She did, and I have told her so, though not graciously. I am working on graciously." },
        { text = "A fighter should fight her own way.", next = "BACK", fx = { align = { order = -1 } }, reply = "She should, until her way buries her. I was lucky enough to be told before it did." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell swords and daggers on the Tradesmen's Terrace. I finish and edge every one of them myself." } },
    explorers_league = { { id = "tp_explorers_league", text = "Dwarven steel holds the best edge I know. Their hilts are another matter, and I have told them so." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels bought from all three of us for Ashenvale. I pretend to be offended, since I wanted the whole order." } },
    warsong = { { id = "tp_warsong", text = "An orc's axe is a crude thing, and it has cut down a great deal of forest. I do not underrate crude things any longer." } },
    advice = { { id = "tp_advice", text = "Hone your edge after every fight, and loosen your grip before the next. Most blades fail at one end or the other." } },
    _none = { { id = "tp_none", text = "I have not the least idea. Ask someone with a duller trade and more time for gossip." } },
  },
}

---------------------------------------------------------------------------
-- Kieran
---------------------------------------------------------------------------
P:NPC {
  key = "kieran", id = TODO_NPC("Kieran"), name = "Kieran", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "easygoing", "practical" }, values = { "usefulness", "plain dealing" },
  notices = { "class", "level" },

  impression = {
    first = "Kieran sells plain, serviceable weapons on the Tradesmen's Terrace and makes no great claims for them. He is easygoing, and he sent me to a rival's stall without a second thought.",
    third = "{name} met Kieran, a weapon merchant on the Tradesmen's Terrace.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Plain and sound, and a good price for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Plain and sound. Buy." },
    { id = "g_hello", text = "Good day to you. Maces, short swords, staves and daggers, all plain and all sound. If you want something with a history, the others have those." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. It held up, did it? They generally do, for there is not much on them to go wrong." },
    { id = "g_young", when = { maxLevel = 15 }, text = "New to the road? Then you have come to the right stall. Buy something plain, learn on it, and break it without grieving." },
  },

  notice = {
    { id = "n_young", cat = "level", when = { maxLevel = 15 },
      text = "You have looked at Ealyshia's wall and then at your purse, and then you came to me. That was the right order to do it in." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "DRUID" } },
      text = "You are no fighter by trade, I think, but the road does not ask. A plain mace wants no skill beyond lifting it, and I have several." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kieran. The others on this terrace each sell one sort of weapon and know everything about it. I sell a little of every sort and know enough. Most people, I find, only need enough." },
      },
      again = {
        { id = "h_again", text = "Anything more from the racks? I have plain steel and nothing fancy, which is how I like it." },
        { id = "h_again2", text = "Ask away. I'll give you plain answers, as I give plain steel." },
        { id = "h_again3", text = "Yes, friend? Nothing fancy here, but ask." },
      },
      choices = {
        { text = "Plain weapons are honest weapons.", next = "BACK", reply = "They are. A plain blade does not pretend to be more than it is, and neither should the one who carries it.", fx = { align = { honor = 1 } } },
        { text = "Fancy weapons are better.", next = "BACK", reply = "Then go see Ealyshia.", fx = { align = { honor = -1 } } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "You send customers to your rivals?", next = "rivals" },
        { text = "Is plain truly better?", next = "plain" },
        { text = "Who made these, if not you?", next = "made" },
        { text = "What should a beginner carry?", next = "xyoung", when = { maxLevel = 20 } },
        { text = "What's simplest for someone who isn't a fighter?", next = "xpriest", when = { class = { "PRIEST", "DRUID", "MAGE", "WARLOCK" } } },
        { text = "Who on the terrace sells the finest blades?", next = "ki_finest" },
        { text = "Do outlanders buy differently than kaldorei?", next = "ki_outlanders" },
        { text = "Which weapon do you carry yourself?", next = "w_own" },
        { text = "Good day, Kieran.", next = "END" },
      },
    },
    ki_finest = {
      lines = {
        { id = "ki_finest_1", text = "Merelyssa, for blades, and she'll tell you so herself, and Glorandiir for axes, though he sells few of them here. Ealyshia's two-handed swords are the grandest, but they take a strong arm, and most of my customers prefer something lighter." },
      },
      choices = {
        { text = "Glorandiir sells few axes?", next = "ki_axes" },
        { text = "You know your rivals well.", next = "BACK", reply = "They're my neighbours, and I like them, so I should." },
      },
    },
    ki_axes = {
      lines = {
        { id = "ki_axes_1", text = "The kaldorei have never been fond of axes, for they remember the woodcutters and what they did to the forest. Glorandiir sells mostly to dwarves and to the Sentinels, who use them only on what has to be cut." },
      },
      choices = {
        { text = "A weapon with a bad history.", next = "BACK" },
        { text = "Something else, Kieran.", next = "BACK" },
      },
    },
    ki_outlanders = {
      lines = {
        { id = "ki_outlanders_1", text = "They buy heavier, for they're used to fighting things that hit hard, and they always ask if a blade has been blessed. The kaldorei buy lighter and never ask, for they assume the blessing comes with the elf who wields it." },
      },
      choices = {
        { text = "Do you bless your blades?", next = "ki_bless" },
        { text = "I'm a paladin. A blessing helps.", next = "ki_bless", when = { class = "PALADIN" } },
      },
    },
    ki_bless = {
      lines = {
        { id = "ki_bless_1", text = "I do not, but the priestesses of the Temple will, if you ask them kindly and bring an offering. I tell the outlanders that, and they go off to the Temple happier than if I had blessed the blade myself." },
      },
      choices = {
        { text = "Send them to the Temple. Sensible.", next = "BACK" },
        { text = "Something else, Kieran.", next = "BACK" },
      },
    },
    rivals = {
      lines = {
        { id = "rivals_default", text = "Gladly. If a person wants an axe that will be handed on to their children, Glorandiir has it, and I should be lying if I said I did. They remember who sent them. Half my trade is people Merelyssa was too sharp with, coming back for something they can afford." },
      },
      choices = {
        { text = "Honest dealing. It's rarer than it should be.", next = "BACK", reply = "It is only good sense, friend. A customer who was lied to does not come twice.", fx = { align = { honor = 1 } } },
        { text = "You'll never grow rich giving trade away.", next = "BACK", reply = "No, and I had not planned to. I planned to sleep well, and I do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      lines = {
        { id = "plain_default", text = "For most, yes. A fine blade wants a fine hand, and it sulks in a poor one. A plain blade does the same plain thing every time it is asked. I have seen people walk out of here with the dearest sword on the terrace and come to grief with it within the month." },
      },
      choices = {
        { text = "And the ones who buy plain?", next = "plain2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain2 = {
      lines = {
        { id = "plain2_default", text = "They come back, a year on, a good deal harder about the eyes, and ask me to point them to Ealyshia. And I do, and I am glad of it. I think of my stall as the first step of the stair. Nobody lives on the first step, but everybody uses it." },
      },
      choices = {
        { text = "A modest way to see your trade. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    made = {
      lines = {
        { id = "made_default", text = "Apprentices, mostly, in Auberdine and Ironforge. They are the pieces a young smith makes while learning, sound enough to sell and not fine enough to boast of. I buy them by the crate. It keeps the apprentices fed, and it keeps my prices where a new recruit can reach them." },
      },
      choices = {
        { text = "So beginners arm beginners.", next = "made2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made2 = {
      lines = {
        { id = "made2_default", text = "Just so, and I like the fitness of it. Somewhere a dwarf lad made that mace on his fortieth try, and somewhere a young elf will swing it on her first. Neither of them will ever know the other. I think about that more than a shopkeeper probably should." },
      },
      choices = {
        { text = "It's a good thought to keep a shop on.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    xyoung = {
      lines = {
        { id = "xyoung_default", text = "Whatever your trainer has taught you to use, and nothing longer than your arm. Buy one, and not two. Spend what is left on bandages from Dannelor, because in your first season you will need those more often than you will need a second blade." },
      },
      choices = {
        { text = "One weapon, and bandages. Sound advice.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xpriest = {
      lines = {
        { id = "xpriest_default", text = "A mace or a staff. There is no edge to keep and no art to learn, and it works as well on the third day without sleep as on the first. Astarii's novices buy the short mace from me, and I am told that it has surprised a few furbolgs." },
      },
      choices = {
        { text = "A short mace, then. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    w_own = {
      lines = {
        { id = "w_own_default", text = "A short sword from the second barrel by the post, the cheapest blade I sell. It is the one I trust, because I have watched a hundred like it go out and come back, and I know exactly how it will fail when it fails." },
      },
      choices = {
        { text = "Doesn't a merchant want the best?", next = "w_own2" },
        { text = "You know your stock better than anyone.", next = "w_own2" },
      },
    },
    w_own2 = {
      lines = {
        { id = "w_own2_default", text = "A merchant wants to know what he is selling. If I carried Merelyssa's finest, I would start believing that everyone ought to, and then I should be a worse merchant and a poorer friend to the young ones who come in with a few copper." },
      },
      choices = {
        { text = "That's honest sense.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else, Kieran.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell plain weapons on the Tradesmen's Terrace. I think of my stall as the first step of the stair." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels' recruits buy their first arms from me before the Temple issues them better. I see them all, and they are very young." } },
    warsong = { { id = "tp_warsong", text = "The recruits who buy from me go to Ashenvale within the season. I sell them the soundest thing I have, and I say nothing." } },
    advice = { { id = "tp_advice", text = "Buy plain and learn on it. A weapon you are afraid to break is a weapon you will be afraid to use." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend. Try the innkeeper, for Saelienne hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Turian
---------------------------------------------------------------------------
P:NPC {
  key = "turian", id = TODO_NPC("Turian"), name = "Turian", title = "Thrown Weapons Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "playful", "exacting" }, values = { "precision", "sport" },
  notices = { "class", "race" },

  impression = {
    first = "Turian sells throwing knives and axes on the Tradesmen's Terrace and can put one into a knothole across the room without looking. He is playful about it, and deadly serious about balance.",
    third = "{name} met Turian, who sells thrown weapons in Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend! A dart for you, perfectly balanced." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Knives, darts, axes. Throw well, or don't buy." },
    { id = "g_hello", text = "Good day! Knives, darts and light axes, every one of them made to leave your hand. Do you see the knot in that post? Watch it for a moment." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it is you. Have you been practising, or have you only been losing knives in the undergrowth?" },
    { id = "g_rogue", when = { class = { "ROGUE", "WARRIOR" } }, text = "A fighter who knows that a blade need not stay in the hand. Good. Come and tell me what you throw, and at what." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You have a knife in your boot and another at the small of your back, and neither is balanced for throwing. They will go end over end and land flat, and then you will have to explain yourself." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Your people throw axes, I am told, and hammers too, and sometimes one another. I stock the first of those and should like to hear about the rest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Turian, and I sell what flies. The Sentinels' glaive is the grandest of thrown weapons, but they make their own and will not let me near them. I have everything smaller than that, and I can show you how to use it." },
      },
      again = {
        { id = "h_again", text = "What else? I can throw and talk." },
        { id = "h_again2", text = "Ask! And mind your head." },
        { id = "h_again3", text = "Something more? I can hit that knot while you think." },
      },
      choices = {
        { text = "Throwing weapons take great skill.", next = "BACK", reply = "They do! Anyone can stab, but a glaive that comes back to your hand takes years to learn.", fx = { align = { honor = 1 } } },
        { text = "Throwing weapons are toys.", next = "BACK", reply = "Then don't throw them.", fx = { align = { honor = -1 } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Can you hit that knot every time?", next = "knot" },
        { text = "Why won't the Sentinels let you near a glaive?", next = "glaive" },
        { text = "Is throwing a serious art, or a sport?", next = "sport" },
        { text = "How do I balance my own knives?", next = "xrogue", when = { class = { "ROGUE", "WARRIOR", "HUNTER" } } },
        { text = "Dwarves throw hammers. It's true.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Who are your best customers?", next = "tu_customers" },
        { text = "Do the Sentinels ever practise with you?", next = "tu_sentinels" },
        { text = "Teach me one throwing trick.", next = "w_trick" },
        { text = "Throw true, Turian.", next = "END" },
      },
    },
    tu_customers = {
      lines = {
        { id = "tu_customers_1", text = "The young rogues from Anishar's training, and the hunters who want a quick weapon for close quarters. And now and then a dwarf, who always asks if I have hammers, and then buys a throwing axe instead." },
      },
      choices = {
        { text = "Anishar sends you students?", next = "tu_anishar" },
        { text = "Dwarves and throwing axes. That fits.", next = "BACK" },
      },
    },
    tu_anishar = {
      lines = {
        { id = "tu_anishar_1", text = "He does, for he says a rogue who can throw a knife is a rogue who can get away. I teach them to hit the knot on the far wall, and the ones who can are welcome back, and the ones who can't buy more knives." },
      },
      choices = {
        { text = "A good business model.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Turian.", next = "BACK" },
      },
    },
    tu_sentinels = {
      lines = {
        { id = "tu_sentinels_1", text = "Sometimes, at the end of the day, when the terrace is quiet, and they throw their glaives and I throw my knives. They always win, for a glaive is a terrible weapon, but they let me try, and I learn something every time." },
      },
      choices = {
        { text = "What have you learned from them?", next = "tu_learn" },
        { text = "I'm a night elf. I've seen the glaive at work.", next = "tu_learn", when = { race = "NightElf" } },
      },
    },
    tu_learn = {
      lines = {
        { id = "tu_learn_1", text = "That balance is everything, and that the throw begins in the hip and not the arm. Sentinel Dalia Sunblade showed me that, and I have been a better thrower since, though I will never be as good as she is." },
      },
      choices = {
        { text = "Balance and the hip. I'll remember.", next = "BACK" },
        { text = "Something else, Turian.", next = "BACK" },
      },
    },
    knot = {
      lines = {
        { id = "knot_default", text = "Nine times in ten, and I do not speak of the tenth. Landria, the bowyer along the terrace, says an arrow would do it ten in ten and from further off. I tell her that an arrow needs a bow, two hands and a moment, and my knife needs none of the three." },
      },
      choices = {
        { text = "Have the two of you ever settled it?", next = "knot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knot2 = {
      lines = {
        { id = "knot2_default", text = "We tried, on a festival night, with an apple at forty paces. She split it. I had already hit it, a breath before, and her arrow went through my knife's handle. We are both still claiming the apple. Jaeana, who had supplied it, declared the meat stall the winner." },
      },
      choices = {
        { text = "I'd call it yours. First strike counts.", next = "BACK", reply = "Thank you! Say it loudly as you pass Landria's stall, would you?", fx = { affinity = 1 } },
        { text = "Hers. She hit both the apple and your knife.", next = "BACK", reply = "You wound me, friend, and with some justice.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glaive = {
      lines = {
        { id = "glaive_default", text = "Because I asked to change it. The moonglaive has three blades, and I said two would fly truer. I was right, and I still am. But it has had three blades for ten thousand years, and I was told that it would have three for ten thousand more, and that I should stay with my knives." },
      },
      choices = {
        { text = "If two blades fly truer, they should hear it.", next = "BACK", reply = "So I said, and I was younger then. I have a two-bladed one under the counter, all the same.", fx = { align = { order = -1 } } },
        { text = "Some things aren't ours to improve.", next = "BACK", reply = "That is what the Sentinel captain told me, a little less gently.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sport = {
      lines = {
        { id = "sport_default", text = "It is both, and people who say it is only one have not been in a fight with their sword arm pinned. A thrown knife will not win a battle. It will end a spell before it is finished, or stop a runner, or buy you the single breath you need. I have done all three." },
      },
      choices = {
        { text = "Where did you do all three?", next = "sport2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sport2 = {
      lines = {
        { id = "sport2_default", text = "In Felwood, when it was still called Ashenvale's northern wood, against satyrs. They cast, and a satyr with a knife in its throat cannot. I do not think of those years as sport. But the terrace is peaceful and the young need something to laugh at, and so I hit knotholes." },
      },
      choices = {
        { text = "There's wisdom in keeping it light. Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Lay it across one finger. Where it rests level is its heart, and you must hold it one thumb behind that. If the heart is in the handle, the knife was never meant to fly, and you should keep it for cutting cheese. Syurna knows this, and she should have told you." },
      },
      choices = {
        { text = "A thumb behind the heart. I'll test every one.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "Hammers! With the head forward, or does it spin? It spins, of course. And it comes back to you? No? Then you must go and fetch it in the middle of a battle. Your people are braver than mine, friend, or else they are in much less of a hurry." },
      },
      choices = {
        { text = "We just carry a second hammer.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    w_trick = {
      lines = {
        { id = "w_trick_default", text = "Very well, one trick, and the simplest: look where you want it to land, not at the knife. Everyone watches the blade leave their hand, as though it might change its mind, and it goes wherever their eyes went, which is usually the floor." },
        { id = "w_trick_w1", when = { class = "HUNTER" }, text = "You will know this already from the bow, I think. The eye leads and the hand follows, and the arrow only obeys the pair of them." },
      },
      choices = {
        { text = "And if I miss anyway?", next = "w_trick2" },
        { text = "That's simpler than I expected.", next = "w_trick2" },
      },
    },
    w_trick2 = {
      lines = {
        { id = "w_trick2_default", text = "Then you pick it up and you try again, and you do not tell Landria about it. She keeps a tally of my misses on a board by her stall, and she would be delighted to add yours." },
      },
      choices = {
        { text = "I'll practise where she can't see.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Turian.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell thrown weapons on the Tradesmen's Terrace. I hit knotholes for the young, and I used to hit satyrs." } },
    satyrs = { { id = "tp_satyrs", text = "A satyr with a knife in its throat casts nothing. I learned that in the north wood, before it was called Felwood." } },
    sentinels = { { id = "tp_sentinels", text = "I told the Sentinels that a two-bladed glaive flies truer. They told me to mind my knives." } },
    advice = { { id = "tp_advice", text = "Find the heart of the knife on one finger before you throw it. Half the knives ever made were never meant to fly." } },
    _none = { { id = "tp_none", text = "That one is out of my range. Ask Landria, and tell her the apple was mine." } },
  },
}

---------------------------------------------------------------------------
-- Glorandiir
---------------------------------------------------------------------------
P:NPC {
  key = "glorandiir", id = TODO_NPC("Glorandiir"), name = "Glorandiir", title = "Axe Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "bluff", "good-humoured" }, values = { "plainness", "endurance" },
  notices = { "race", "class" },

  impression = {
    first = "Glorandiir sells axes on the Tradesmen's Terrace and is cheerfully aware of what a strange trade that is for a night elf. He is bluff and good-humoured, and more thoughtful than he lets on.",
    third = "{name} met Glorandiir, the axe merchant of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend! An axe, for you, and no jokes about elves with axes!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met. Axes. Yes, in Darnassus. Buy or go." },
    { id = "g_hello", text = "Well met! Axes, for one hand or for two. Yes, in Darnassus, and yes, I have heard every remark there is to make about it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The edge held, I trust. An axe is a forgiving thing, and you have not managed to offend it yet." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf at my stall! Now I shall be judged by someone who knows. Go on, pick one up, and tell me the worst." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You hefted that as a dwarf does, by the throat of the haft and not the end. I have been trying to teach my own people that for years, and they hold it like a broom." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You need not look at me so. Not one of these has ever touched a living tree, and I say so to every one of your order, daily." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Glorandiir. I sell axes in a city grown inside a tree, among a people who have never forgiven the axe for anything. Ealyshia and Merelyssa think I do it to be contrary. They are partly right about that." },
      },
      again = {
        { id = "h_again", text = "Something more? Mind your fingers near the rack; the bearded ones are newly honed." },
        { id = "h_again2", text = "Ask! I am not proud." },
        { id = "h_again3", text = "Go on, friend. My axes are patient listeners." },
      },
      choices = {
        { text = "An axe is a fine weapon for anyone.", next = "BACK", reply = "It is! You understand.", fx = { align = { honor = 1 } } },
        { text = "Axes are for orcs and dwarves.", next = "BACK", reply = "I've heard that one before.", fx = { align = { honor = -1 } } },
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "An axe merchant, among night elves?", next = "why" },
        { text = "And what's the other part?", next = "part" },
        { text = "Who buys an axe in Darnassus?", next = "buys" },
        { text = "The balance is fair. The beard's a touch thin.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Do the druids trouble you over this?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Have you ever used one of your axes in earnest?", next = "w_used" },
        { text = "Good day, Glorandiir.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "Somebody had to. When the Alliance came, half its warriors wanted axes, and there was not one to be had on Teldrassil. They were going to Ashenvale to fight for our forest with whatever they had brought. I thought the least we could do was to sell them a good one." },
      },
      choices = {
        { text = "Did your neighbours object?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = {
        { id = "why2_default", text = "A matron of the Temple told me that the axe was the Horde's weapon and had no place here. I told her that it was the dwarves' weapon as well, and that the dwarves were dying for her trees. She has not spoken to me since. She did send her nephew to buy one." },
      },
      choices = {
        { text = "You were right. A tool is no sin by itself.", next = "BACK", reply = "So I think. It is the hand and the tree that make the difference.", fx = { align = { order = -1 } } },
        { text = "She had a point. Symbols matter to a people.", next = "BACK", reply = "They do, and so I keep a quiet stall and hang no axe above the door.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    part = {
      lines = {
        { id = "part_default", text = "The other part is that I was at Hyjal, and I watched orcs fight. I hated them, and I could not look away from them. An axe in the right hands is the most honest weapon there is. It does not feint, and it does not pretend to be anything else. I wanted to understand it." },
      },
      choices = {
        { text = "And do you, now?", next = "part2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    part2 = {
      lines = {
        { id = "part2_default", text = "Better than I did. I understand why a people who had lost everything would choose it, since it asks for nothing but strength and nerve. I also understand what it does to a forest, and I have seen the stumps in Ashenvale. I carry both of those, and I sell axes to the Alliance." },
      },
      choices = {
        { text = "That's a heavy pair of things to carry.", next = "BACK", fx = { learn = { "warsong" }, trait = { curious = 1 } } },
      },
    },
    buys = {
      lines = {
        { id = "buys_default", text = "Dwarves, who are polite about my work and then go home and make their own. Humans, who are not particular. And a few young kaldorei warriors of Sildanair's, who want it because their elders dislike it. I sell to them last and I warn them first." },
      },
      choices = {
        { text = "What's the warning?", next = "buys2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys2 = {
      lines = {
        { id = "buys2_default", text = "That they are never to carry it into the Enclave, nor raise it near an ancient, nor so much as lean it against a living trunk. An ancient of war remembers axes, friend, and it will not stop to ask whose side you are on. One lad forgot. He was thrown a fair distance, and he lived." },
      },
      choices = {
        { text = "I'll keep mine well away from the ancients.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "Thin in the beard! I knew it. I said so to the smith in Auberdine, and he told me that I was imagining it. Would you put that in writing, with your clan's name under it? He will believe a dwarf." },
      },
      choices = {
        { text = "Gladly. Tell him a dwarf said to thicken it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Less than you would think. One of the Enclave comes round each season, looks at every edge for sap, finds none, and thanks me. I give him tea. We have never agreed about the axes, and we have never quarrelled about them either, which I think is the kaldorei way." },
      },
      choices = {
        { text = "It is. Thank you for the plain answer.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    w_used = {
      lines = {
        { id = "w_used_default", text = "Once, in Ashenvale, when a satyr came out of the trees at a caravan I was guarding. I had a glaive and dropped it, and the nearest weapon was an orc axe some Sentinel had taken as a trophy, so I used that." },
      },
      choices = {
        { text = "And did it serve?", next = "w_used2" },
        { text = "A strange way to come to your trade.", next = "w_used2" },
      },
    },
    w_used2 = {
      lines = {
        { id = "w_used2_default", text = "Better than I wanted it to. That is half of why I sell them, if I am honest: an axe is a good, plain tool for a terrible moment, and it is not the axe's fault who first carried it. The Temple does not quite agree, but the Temple was not on that road." },
        { id = "w_used2_w1", when = { race = "Dwarf" }, text = "Your people never had to make peace with the axe, I know. You will think the whole question very strange." },
      },
      choices = {
        { text = "A tool is only as good as its wielder.", next = "BACK", fx = { align = { order = -1 } }, reply = "Just so. I say it to every matron who glares at my stall, and they never agree." },
        { text = "Some weapons carry their history with them.", next = "BACK", fx = { align = { order = 1 } }, reply = "They do, and I remember it every time I hang one up. I simply sell them anyway." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell axes on the Tradesmen's Terrace. I know how that sounds, here, and I do it all the same." } },
    warsong = { { id = "tp_warsong", text = "I have seen the stumps in Ashenvale, and I have seen orcs fight at Hyjal. I sell axes to those who go to stop them." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "A druid inspects my edges for sap each season and finds none. We drink tea, and we do not discuss it." } },
    burning_legion = { { id = "tp_burning_legion", text = "At Hyjal the axe held the line as well as the glaive did. I remember that when the matrons frown at my stall." } },
    advice = { { id = "tp_advice", text = "Hold the haft by its throat until you mean to swing. And never lean an axe on a living tree, least of all in Darnassus." } },
    _none = { { id = "tp_none", text = "I know axes and old grudges. For anything else, try the innkeeper." } },
  },
}

---------------------------------------------------------------------------
-- Mythidan
---------------------------------------------------------------------------
P:NPC {
  key = "mythidan", id = TODO_NPC("Mythidan"), name = "Mythidan", title = "Mace & Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "thoughtful", "courteous" }, values = { "restraint", "tradition" },
  notices = { "class", "race" },

  impression = {
    first = "Mythidan sells maces and staves on the Tradesmen's Terrace and talks of them as instruments of restraint. He is thoughtful and courteous, and he seems to know every priestess by her staff.",
    third = "{name} met Mythidan, who sells maces and staves in Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Elune-adore, friend. A staff for you, made to heal and not harm." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Elune-adore. Maces and staves. Buy, please." },
    { id = "g_hello", text = "Elune-adore. I sell maces and staves, the arms of those who would rather not draw blood and know that they sometimes must." },
    { id = "g_back", when = { metBefore = true }, text = "You are welcome back. I trust it has served you, and that you have needed it seldom." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest. Then you already know what I sell and why. Come and choose, and take your time over it." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "The grip of your mace is worn smooth and the head is nearly new. You carry it far more often than you use it, and that is as it should be." },
    { id = "n_pala", cat = "race", when = { race = { "Human", "Dwarf" } },
      text = "You come from the lands of the Light, where I am told the mace is a holy weapon. It is something near to that here, for it is the Temple's." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mythidan. Andrus, beside me, sells the staves of the scholars and the druids. I sell the working staff and the mace, to the priestesses of the Temple above all. A Sister of Elune may fight, and many have, but she does it without an edge." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of an old mace-seller?" },
        { id = "h_again2", text = "Please, go on, and take your time with it." },
        { id = "h_again3", text = "Yes? A question is a fine thing to carry." },
      },
      choices = {
        { text = "A weapon that doesn't draw blood is still a weapon.", next = "BACK", reply = "It is. A mace does its work through the armor, and the armor never notices until too late.", fx = { align = { light = 1 } } },
        { text = "Only blades matter in battle.", next = "BACK", reply = "Then go to Merelyssa.", fx = { align = { light = -1 } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why do the priestesses fight without an edge?", next = "edge" },
        { text = "You know them by their staves?", next = "know" },
        { text = "How do you and Andrus divide the trade?", next = "andrus" },
        { text = "Which mace would the Temple choose for me?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Our paladins carry the hammer as holy.", next = "xpala", when = { class = "PALADIN" } },
        { text = "Do the druids buy your staves?", next = "my_druids" },
        { text = "What do the priestesses fight, with a mace?", next = "my_fight" },
        { text = "Have you ever seen a priestess fight?", next = "w_saw" },
        { text = "Elune light your way, Mythidan.", next = "END" },
      },
    },
    my_druids = {
      lines = {
        { id = "my_druids_1", text = "Some do, though most go to Andrus, who sells staves carved from fallen branches of the great tree. I sell the working staff, the kind a druid leans on when he walks, and a druid walks a great deal." },
      },
      choices = {
        { text = "Fallen branches of Teldrassil?", next = "my_branches" },
        { text = "A walking staff is a quiet weapon.", next = "BACK" },
      },
    },
    my_branches = {
      lines = {
        { id = "my_branches_1", text = "Only those the tree lets fall, for it is forbidden to cut from it. Andrus gathers them after the storms and carves them slowly, and he says each one remembers where it grew, though I have never heard one speak." },
      },
      choices = {
        { text = "That's a beautiful custom.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Mythidan.", next = "BACK" },
      },
    },
    my_fight = {
      lines = {
        { id = "my_fight_1", text = "Satyrs in Ashenvale, and the corrupted creatures of Darkshore, and anything else that threatens the Temple's work. A mace does not cut, so it does not spill blood on holy ground, which matters to the Sisters of Elune." },
      },
      choices = {
        { text = "Holy ground matters to you too?", next = "my_holy" },
        { text = "I'm a priest. The Temple's way is wise.", next = "my_holy", when = { class = "PRIEST" } },
      },
    },
    my_holy = {
      lines = {
        { id = "my_holy_1", text = "Everything in Darnassus is holy ground, in its way, for the tree is a gift from the Dream. I sell my maces to those who understand that, and I ask the others to take their swords outside the city." },
      },
      choices = {
        { text = "A gentle rule.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    edge = {
      lines = {
        { id = "edge_default", text = "It is custom more than law. A Sister's first calling is to mend, and it was thought unfitting that the hand which closes a wound should carry the thing that opens one. A mace breaks, and what is broken can be set. I do not claim that the reasoning is perfect." },
      },
      choices = {
        { text = "Tyrande herself carries a bow and a glaive.", next = "edge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    edge2 = {
      lines = {
        { id = "edge2_default", text = "She does, and she led the Sentinels for ten thousand years, so nobody has ever cared to raise it with her. The custom is for the novices and those who serve in the Temple. Those who go out with the army take what the army needs. I sell to the first kind, and I pray for the second." },
      },
      choices = {
        { text = "A custom that bends is the wiser for it.", next = "BACK", reply = "So the High Priestess has shown us, by her own example.", fx = { align = { order = -1 } } },
        { text = "A custom ought to hold for everyone.", next = "BACK", reply = "Some of the older Sisters think so too. They do not say it in her hearing.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = {
        { id = "know_default", text = "Each of them chose hers here, and I remember the choosing. Astarii Starseeker took the plainest staff in the stall and has carried it since. Priestess Alathea's has been rebound four times, and she will not hear of a new one. Lariia has broken three, and I have never asked how." },
      },
      choices = {
        { text = "What does a staff tell you about its bearer?", next = "know2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know2 = {
      lines = {
        { id = "know2_default", text = "It tells me how they bear weight. Some lean upon it and some carry it, and a very few forget that it is there at all. Those last are the ones to follow in a bad hour. Astarii is one of them. I shall not tell you who leans, for that would be unkind." },
      },
      choices = {
        { text = "And I shan't ask. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    andrus = {
      lines = {
        { id = "andrus_default", text = "Peaceably. His staves are for thinking with, and they are long, carved and full of meaning. Mine are for walking and, at need, for striking. A druid buys from him for the Enclave and from me for the road. We have never once competed for a customer in all our years here." },
      },
      choices = {
        { text = "That's a rare peace between merchants. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xpriest_default", text = "The flanged one, of moderate weight, with the leather grip. It is neither handsome nor heavy. But a Sister on the road must carry it all day and still have a steady hand to heal with at dusk. I have sold that pattern to every novice Jandria has sent me." },
      },
      choices = {
        { text = "Moderate weight, leather grip. I'll take your word.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xpala = {
      lines = {
        { id = "xpala_default", text = "So I have heard, and I have spoken with one of your order about it. He said that the hammer does not shed blood by its nature and so does not stain the bearer's oath. I told him that we had come to the same door by another path, and he seemed pleased." },
      },
      choices = {
        { text = "The Light and Elune agree on that much.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    w_saw = {
      lines = {
        { id = "w_saw_default", text = "Once, in Darkshore, near the ruins of Ameth'Aran, when the dead elves of that place rose against a party of pilgrims. A young Sister I had sold a mace to only a month before stood in front of them all and did not give a step." },
      },
      choices = {
        { text = "Did she bring them through?", next = "w_saw2" },
        { text = "Ameth'Aran is a sad place.", next = "w_saw2" },
      },
    },
    w_saw2 = {
      lines = {
        { id = "w_saw2_default", text = "Every one, and she was weeping the whole while, because the dead she fought had once been her own people. She came back to my stall a year later to have the grip rewrapped, and she would not speak of it, and she did not need to." },
        { id = "w_saw2_w1", when = { class = "PRIEST" }, text = "You are a healer yourself, so you may know what it costs to strike when every part of you was made to mend. I think of her when I sell to your kind." },
      },
      choices = {
        { text = "Courage often comes with tears.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Mythidan.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell maces and staves on the Tradesmen's Terrace, to the Sisters of the Temple above all." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "Every Sister in the Temple chose her staff at my stall. I remember each choosing, and I keep what I learned from it." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess carries a bow and a glaive, and nobody has ever spoken to her of custom. Nor should they." } },
    elune = { { id = "tp_elune", text = "I set each new staff in moonlight for one night before I sell it. I cannot say that it matters, only that I do it." } },
    holy_light = { { id = "tp_holy_light", text = "A paladin told me that his hammer keeps his oath unstained. We had reached the same door by another path." } },
    advice = { { id = "tp_advice", text = "Choose the weight you can carry all day, and never the one you can lift once. A weapon is carried a thousand hours for each hour it is used." } },
    _none = { { id = "tp_none", text = "I do not know. Ask at the Temple, where they keep longer memories than mine." } },
  },
}

---------------------------------------------------------------------------
-- Andrus
---------------------------------------------------------------------------
P:NPC {
  key = "andrus", id = TODO_NPC("Andrus"), name = "Andrus", title = "Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "scholarly", "particular" }, values = { "meaning", "craft" },
  notices = { "class", "race" },

  impression = {
    first = "Andrus sells carved staves on the Tradesmen's Terrace and will explain the meaning of every mark on them, at length. He is scholarly and particular, and he will not sell a staff he thinks ill-matched.",
    third = "{name} met Andrus, the staff merchant of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. This staff speaks of you. Come and see." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Each staff says something. Yours says little." },
    { id = "g_hello", text = "Good day to you. Every staff here was carved by hand, and each one says something. Tell me a little of yourself and I shall find the one that says it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you have come back. Has the staff grown used to you? It takes a season, sometimes two." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid. Welcome. You will want to feel the wood before you look at the carving, and so you should." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "The staff you carry is capped in metal and jewelled at the head. It is a tool for gathering power, and a fine one. Mine are made for something rather different." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You hold your staff below the middle, as Mathrengyl teaches, so that it may become a foreleg without your thinking. I leave that part uncarved, for claws." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Andrus, and I carve staves for the druids and the learned of Darnassus. Mythidan, at the next stall, sells the kind one walks and fights with. Mine are for standing with, and for remembering who one is." },
      },
      again = {
        { id = "h_again", text = "Ask on. Every staff on this wall would tell you something, if staves could talk." },
        { id = "h_again2", text = "Ask. I am happy to explain." },
        { id = "h_again3", text = "Yes? Go on; I was only polishing." },
      },
      choices = {
        { text = "Every staff carries a story.", next = "BACK", reply = "It does. This one walked from Ashenvale in an old druid's hand, and it still leans a little to the south.", fx = { align = { order = 1 } } },
        { text = "A staff is just a stick.", next = "BACK", reply = "Then use a stick.", fx = { align = { order = -1 } } },
        { text = "Show me your staves.", next = "BUSINESS" },
        { text = "What do the carvings say?", next = "carve" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "Have you ever refused a buyer?", next = "refuse" },
        { text = "What would you carve for a druid of the claw?", next = "xdruid", when = { class = "DRUID" } },
        { text = "And what is my staff for, to your eye?", next = "xmage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "What staff are you carving now?", next = "w_now" },
        { text = "Good day, Andrus.", next = "END" },
      },
    },
    carve = {
      lines = {
        { id = "carve_default", text = "Lineage, first, in the lower third, where the mother's line is set. Then the calling, be it leaf, moon or claw. And at the head is whatever the bearer most wishes to be reminded of. Most ask for a crescent. One asked for a single raindrop, and would not tell me why." },
      },
      choices = {
        { text = "Did you carve the raindrop?", next = "carve2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carve2 = {
      lines = {
        { id = "carve2_default", text = "I did, and it is the best thing I have made. I have thought about that drop for two hundred years. It might have been a grief, or a birth, or the day the Well was lost. A staff is permitted to keep a secret from its maker, I have decided." },
      },
      choices = {
        { text = "What would you guess, if pressed?", next = "carve3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carve3 = {
      lines = {
        { id = "carve3_default", text = "A child. She touched it with her thumb as people touch a sleeping infant's brow. But I may be only a sentimental carver who has been too long at his bench. What should you have carved at the head of your own?" },
      },
      choices = {
        { text = "A blade. I am what I fight for.", next = "BACK", reply = "Then I should set it point downward, at rest. A staff should hope for peace.", fx = { trait = { brave = 1 } } },
        { text = "A road. I haven't arrived anywhere yet.", next = "BACK", reply = "That is a fine thought. I should leave the far end of it unfinished.", fx = { trait = { curious = 1 } } },
        { text = "Nothing. Let it stay plain.", next = "BACK", reply = "Astarii Starseeker chose the same. You are in good company.", fx = { trait = { reserved = 1 } } },
      },
    },
    wood = {
      lines = {
        { id = "wood_default", text = "From fallen boughs of Teldrassil, and, for those who ask it, from old wood brought out of Ashenvale. I pay more for the Ashenvale wood than I can charge. It is slow-grown and it carves like bone, and there is less of it each year, for reasons you will know." },
      },
      choices = {
        { text = "The Warsong are cutting it.", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      lines = {
        { id = "wood2_default", text = "By the league. I am told they burn what they do not build with. A stave of that wood holds four thousand years of rings, and they warm their hands at it. I try to remember that they do not know what it is. I do not always succeed." },
      },
      choices = {
        { text = "Not knowing is no excuse. They should be stopped.", next = "BACK", reply = "I think so too, in my worse hours, and I have a good many of those lately.", fx = { align = { light = -1 } } },
        { text = "Ignorance can be taught. There's hope in that.", next = "BACK", reply = "You are more generous than I am this year. I shall try to borrow some of it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuse = {
      lines = {
        { id = "refuse_default", text = "Twice. One was a young lord who wanted his whole lineage carved back to Azshara's court, and I told him that the wood would not take it. The other was a man who wanted a staff for striking a servant. I broke that one across my knee in front of him." },
      },
      choices = {
        { text = "Well done. Something else.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "I should leave the lower half bare and smooth, for the change, and above it I should cut the track of a paw, pressed deep, as if in wet earth. Denatharion carries one very like it. He told me it helps him remember which shape he started the day in." },
      },
      choices = {
        { text = "A paw in wet earth. I like that. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "It is for drawing in and sending out. I have no quarrel with it. But our people carved no channels into their staves after the Sundering, and I carve none now. Mine are made to hold a memory, and they will not hold a spell. You would find one of them very quiet." },
      },
      choices = {
        { text = "Quiet has its uses. Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    w_now = {
      lines = {
        { id = "w_now_default", text = "One for a druid of the Enclave who lost her mentor in Ashenvale this winter. She asked me to carve his name into it, and I have been three weeks on the first letter, because I keep asking her questions about him and she keeps answering." },
      },
      choices = {
        { text = "What have you learned of him?", next = "w_now2" },
        { text = "Three weeks for one letter seems slow.", next = "w_now2" },
      },
    },
    w_now2 = {
      lines = {
        { id = "w_now2_default", text = "That he laughed at his own jokes before he finished telling them, and that he planted an oak at every camp he slept in. I mean to carve a small acorn under his name, and I have not told her yet, and I hope it will be right." },
        { id = "w_now2_w1", when = { class = "DRUID" }, text = "You are of the Circle, so perhaps you knew him, or knew someone like him. There are fewer of them every year." },
      },
      choices = {
        { text = "She'll treasure it.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Andrus.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I carve and sell staves on the Tradesmen's Terrace, for the druids and the learned." } },
    warsong = { { id = "tp_warsong", text = "They burn Ashenvale wood that holds four thousand years of rings. I try to remember that they do not know what it is." } },
    highborne = { { id = "tp_highborne", text = "A young lord asked me to carve his line back to Azshara's court. I told him that the wood would not take it." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "I leave the lower half of a druid's staff smooth, for the change. Denatharion taught me to do that." } },
    advice = { { id = "tp_advice", text = "Let a staff grow used to you before you judge it. It takes a season, and sometimes two." } },
    _none = { { id = "tp_none", text = "I have carved nothing about that. Ask Mythidan, who gets out more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Caynrus
---------------------------------------------------------------------------
P:NPC {
  key = "caynrus", id = TODO_NPC("Caynrus"), name = "Caynrus", title = "Shield Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "stolid", "protective" }, values = { "protection", "steadiness" },
  notices = { "class", "kit" },

  impression = {
    first = "Caynrus sells shields on the Tradesmen's Terrace and thinks of them as the only honest weapon. He is stolid and protective, and he rapped on my armor to hear how it rang.",
    third = "{name} met Caynrus, the shield merchant of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend. A shield for you, the sturdiest I have." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met. Carry a shield. Buy one." },
    { id = "g_hello", text = "Well met. Bucklers, round shields and the tall kind. Whatever else you carry, carry one of these, and you will carry the rest for longer." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and the shield has new marks on it. Good. I had rather see them there than on you." },
    { id = "g_war", when = { class = { "WARRIOR", "PALADIN" } }, text = "A shield-bearer. Turn it round and let me see the back, for that is where I learn how you use it." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "The dents on your shield are all high and to the left. You raise it late, and you raise it against the same stroke each time. Somebody will notice that besides me." },
    { id = "n_noshield", cat = "kit", when = { class = { "ROGUE", "HUNTER", "MAGE" } },
      text = "You carry no shield and never have, by the set of your shoulders. I shall not try to change you. I only ask that you stand behind someone who does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Caynrus, and I sell shields. The three along the terrace sell the means of ending a fight, and I sell the means of living through one. They have the more exciting stalls. Mine has the more grateful customers." },
      },
      again = {
        { id = "h_again", text = "What else? I have nothing to guard here but shields, and they guard themselves." },
        { id = "h_again2", text = "Take your time. A shield buyer who hurries is usually back within the week." },
        { id = "h_again3", text = "Yes? I am standing ready, as a shield should." },
      },
      choices = {
        { text = "A shield protects more than its bearer.", next = "BACK", reply = "It does. Raise it for the one behind you and you have done more good than any sword.", fx = { align = { honor = 1 } } },
        { text = "Shields slow you down.", next = "BACK", reply = "Then you'll be quick, and dead.", fx = { align = { honor = -1 } } },
        { text = "Show me your shields.", next = "BUSINESS" },
        { text = "The only honest weapon, you say?", next = "honest" },
        { text = "Who made these?", next = "made" },
        { text = "What's the worst mark you've seen on a shield?", next = "mark" },
        { text = "How do I stop raising it late?", next = "xwar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Would you ever sell me one?", next = "xnone", when = { class = { "ROGUE", "HUNTER", "MAGE", "WARLOCK", "PRIEST", "DRUID" } } },
        { text = "Who taught you to make shields?", next = "w_teach" },
        { text = "Stand fast, Caynrus.", next = "END" },
      },
    },
    honest = {
      lines = {
        { id = "honest_default", text = "A shield never pretends. A sword may be for defence or for murder, and it looks the same either way. A shield is for standing between harm and somebody else, and it cannot be used for much besides. I find that restful, in a world with so much in it that is two things at once." },
      },
      choices = {
        { text = "Protecting others is the highest use of arms.", next = "BACK", reply = "Then you and I shall get on. I shall find you a good one.", fx = { align = { light = 1 } } },
        { text = "A shield only delays. The blade is what decides.", next = "BACK", reply = "Merelyssa says so, daily. I notice that she stands behind the Sentinels' shields like the rest of us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    made = {
      lines = {
        { id = "made_default", text = "The wooden ones are mine, of fallen Teldrassil oak faced with hide from Lotherias's bench. The metal ones come from Auberdine and from the dwarves. I rim every one of them myself, whoever made it, because the rim is the part that fails." },
      },
      choices = {
        { text = "Why the rim?", next = "made2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made2 = {
      lines = {
        { id = "made2_default", text = "Because the face spreads a blow and the rim must take it whole. A blade that catches an unbound rim will split the shield from edge to boss, and then you are holding firewood. Andiss in Aldrassil taught me to bind them in rawhide while it is wet. It shrinks as it dries, and it grips like a hand." },
      },
      choices = {
        { text = "Andiss fits the young in Shadowglen.", next = "made3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made3 = {
      lines = {
        { id = "made3_default", text = "He does, and I learned my trade at his bench before I came up to the city. He makes the shield a child can afford to break. I make the one they buy when they have stopped breaking them. I send him a rim-strip each spring, and he sends it back with corrections." },
      },
      choices = {
        { text = "Still his apprentice, then. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    mark = {
      lines = {
        { id = "mark_default", text = "Teeth. A Sentinel brought me a tall shield out of Felwood with a bite through the oak, and each tooth had left a hole I could put my thumb in. She would not say what had done it. She wanted it mended and not replaced, and I understood that." },
      },
      choices = {
        { text = "Did you mend it?", next = "mark2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mark2 = {
      lines = {
        { id = "mark2_default", text = "I plugged each hole with a peg of the same oak, and I left them showing. She carries it still, at Maestra's Post. A shield that has saved you once ought to be kept, I think. It has learned something about your luck that a new one would not know." },
      },
      choices = {
        { text = "Soldiers have always thought so. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "Raise it when their shoulder moves and not when their blade does. The blade comes after, and by then you are already late. Have a friend swing at you slowly a hundred times, and watch only the shoulder. Darnath Bladesinger drills it so, on the Warrior's Terrace." },
      },
      choices = {
        { text = "Watch the shoulder. I'll drill it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnone = {
      lines = {
        { id = "xnone_default", text = "I should sell you a buckler gladly, and I should expect to buy it back within the month. Some hands are not made for it. Do what you do well, and stay close to someone with a tall shield and a patient temper. There are more of them about than you would think." },
      },
      choices = {
        { text = "Close to the tall shield. I'll remember.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    w_teach = {
      lines = {
        { id = "w_teach_default", text = "An old Sentinel at Auberdine who made them for the women of her company, and who said she had never once made a shield for herself. I asked her why, and she said that the one who makes them ought to be standing behind the line, not in it." },
      },
      choices = {
        { text = "Do you believe that?", next = "w_teach2" },
        { text = "She sounds like a wise woman.", next = "w_teach2" },
      },
    },
    w_teach2 = {
      lines = {
        { id = "w_teach2_default", text = "I did, and then I did not, and now I am not sure. I have stood behind a counter for a long time and sold my shields to people going where I am not. Some days that feels like wisdom, and some days it feels like hiding." },
        { id = "w_teach2_w1", when = { class = "WARRIOR" }, text = "You stand in the line, warrior. Tell me honestly, would you rather your shieldmaker were beside you, or safe at home making the next one?" },
      },
      choices = {
        { text = "Safe at home, making the next one.", next = "BACK", fx = { align = { order = 1 } }, reply = "Then I shall keep my bench, and think of you when I sand the rims." },
        { text = "Beside us, where shields are needed.", next = "BACK", fx = { align = { order = -1 } }, reply = "That is what the young part of me hoped you would say. I shall think about it." },
        { text = "That's not for me to say.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell shields on the Tradesmen's Terrace, and I rim each of them myself. I learned the trade from Andiss in Aldrassil." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels carry my tall shields at Maestra's Post. One of them has a bite through the oak that I mended and left showing." } },
    warsong = { { id = "tp_warsong", text = "An orc's axe is made to split a shield at the rim. So I bind every rim in rawhide, wet, and I let it shrink." } },
    advice = { { id = "tp_advice", text = "Watch the shoulder, and never the blade. And keep a shield that has saved you, for it knows your luck." } },
    _none = { { id = "tp_none", text = "I cannot shield you from that question. Ask the Sentinels on the Warrior's Terrace." } },
  },
}

---------------------------------------------------------------------------
-- Melea
---------------------------------------------------------------------------
P:NPC {
  key = "melea", id = TODO_NPC("Melea"), name = "Melea", title = "Mail Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "brisk", "capable" }, values = { "readiness", "duty" },
  notices = { "class", "race" },

  impression = {
    first = "Melea sells mail on the Tradesmen's Terrace and fits it with a quartermaster's speed. She is brisk and capable, and she asked where I was bound before she asked my size.",
    third = "{name} met Melea, who sells mail armor in Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Where are you bound? I'll fit you perfectly." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Where are you bound? How soon? Quickly." },
    { id = "g_hello", text = "Good day. Mail shirts, coifs and leggings. Where are you bound, and how soon? Those two things decide everything else." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Turn about. Yes, it has stretched at the shoulder, as I said that it would. Let me take a link out." },
    { id = "g_hunter", when = { class = { "HUNTER", "WARRIOR" } }, text = "You will want mail, and you will want it to be quiet. I have both, though not always in the same shirt." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter in mail. You have laced leather under the rings so that they will not chime, which is a Sentinel's trick, and you have done it well." },
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Human" } },
      text = "Your people make heavier mail than ours, with riveted rings. Ours is butted and lighter. Do not try to mend the one with links from the other, as a human did last month." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Melea. I sold mail to the Sentinels for a long age, from the quartermaster's side of the table. Now I sell it from this side, to them and to anyone else who is going where the arrows are." },
      },
      again = {
        { id = "h_again", text = "Anything further? Mail is heavy talk, but I do not mind the weight of it." },
        { id = "h_again2", text = "Ask it. I can fit and talk at once." },
        { id = "h_again3", text = "Yes? Quickly, now." },
      },
      choices = {
        { text = "Good mail serves the Sentinels well.", next = "BACK", reply = "It does. I sold to many.", fx = { align = { order = 1 } } },
        { text = "Mail is too heavy for elves.", next = "BACK", reply = "Then wear cloth.", fx = { align = { order = -1 } } },
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "You were a quartermaster?", next = "quarter" },
        { text = "Why does it matter where I'm bound?", next = "bound" },
        { text = "Who else sells armor on this terrace?", next = "others" },
        { text = "How do I keep mail quiet?", next = "xhunter", when = { class = { "HUNTER", "WARRIOR", "ROGUE" } } },
        { text = "What's wrong with mixing links?", next = "xdwarf", when = { race = { "Dwarf", "Human", "Gnome" } } },
        { text = "What is it like, selling to people you once outfitted?", next = "w_sell" },
        { text = "Good day, Melea.", next = "END" },
      },
    },
    quarter = {
      lines = {
        { id = "quarter_default", text = "For the Sentinels, through the Third War and for a good while before it. I counted shirts into wagons and I counted them home again, and the second number was always the smaller. After Hyjal I asked leave to sell to the living, face to face. It is the same work, and I sleep better for it." },
      },
      choices = {
        { text = "That's a hard count to keep.", next = "quarter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter2 = {
      lines = {
        { id = "quarter2_default", text = "It was. I can still tell you how many went out to the last battle and how many came back in. I shall not, for you have somewhere to be. But it is why I ask every buyer where they are bound. I like to know who is wearing my rings, and where." },
      },
      choices = {
        { text = "I'm glad someone keeps count of us.", next = "BACK", reply = "Somebody ought to. Come back, and I shall take your name off the list.", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bound = {
      lines = {
        { id = "bound_default", text = "Because Darkshore is wet and Ashenvale is war, and they want different shirts. In the wet you need rings that are oiled and will not rust, and a shirt that you can swim in. For Ashenvale you need coverage at the neck, since the Warsong aim high. I have fitted both, and I have seen what comes back from each." },
      },
      choices = {
        { text = "The Warsong aim high?", next = "bound2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bound2 = {
      lines = {
        { id = "bound2_default", text = "Their axes come down from the shoulder, at the join of the neck. A night elf is taller than an orc, and so the blow lands on the collar. I have added a doubled row of rings there on every shirt bound south. The Sentinels did not ask for it. I saw the shirts that came home, and I did it." },
      },
      choices = {
        { text = "That will have saved lives. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Vinasia has the cloth, for those who will not be hit, and Anadyia the robes. Caynrus sells shields and gives his opinion with them. For leather you must go down to the Craftsmen's Terrace and Lotherias. And Cylania, on the Warrior's Terrace, sells the finest mail in the city." },
      },
      choices = {
        { text = "Finer than yours?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = {
        { id = "others2_default", text = "Finer, yes, and I say so freely. Hers is for officers, and it is beautiful. Mine is for those who will be in the front of the line by the end of the week. I have never lost a customer to her, and she has never lost one to me. We sell to different mornings of the same war." },
      },
      choices = {
        { text = "Different mornings. Well put. Something else.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "Wear a quilted shirt under it, and lace a thong through the hem and the cuffs, drawn snug. Then oil it lightly, for dry rings sing. Before you leave my stall, jump. If I can hear you from the counter, a nightsaber can hear you from the next ridge." },
      },
      choices = {
        { text = "I'll jump before I leave. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "A riveted link is thicker than a butted one. Put one of yours in a shirt of ours and it will not flex with its neighbours, so that it works at them until they open. The man who tried it came back with a hole the size of my hand where he had mended a hole the size of my thumb." },
      },
      choices = {
        { text = "Like to like, then. I'll mind it. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    w_sell = {
      lines = {
        { id = "w_sell_default", text = "Strange, and better than I expected. As a quartermaster I handed out what I had, and some of it did not fit, and some of them did not come back. Now I can take the time to see that it fits, and that is a small kind of making amends." },
      },
      choices = {
        { text = "Amends for what?", next = "w_sell2" },
        { text = "You couldn't help what you had to give.", next = "w_sell2" },
      },
    },
    w_sell2 = {
      lines = {
        { id = "w_sell2_default", text = "For the shirts that were too short at the hip, in the Third War, because we had no more mail and no time. I have no reason to think any of them died of it, and I still count them, because a quartermaster always counts." },
      },
      choices = {
        { text = "You did what you could.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Melea.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell mail on the Tradesmen's Terrace. Before that I was a quartermaster to the Sentinels." } },
    sentinels = { { id = "tp_sentinels", text = "I counted their shirts out and home again for a long age. I still double the collar on every one bound for Ashenvale." } },
    warsong = { { id = "tp_warsong", text = "The Warsong aim at the join of the neck. I learned it from the shirts that came back, and I changed mine." } },
    burning_legion = { { id = "tp_burning_legion", text = "I kept the count at Hyjal, and I can recite it still. I do not, unless I am asked by someone who was there." } },
    advice = { { id = "tp_advice", text = "Jump before you leave the armorer. If your mail rings in the shop, it will ring in the forest." } },
    _none = { { id = "tp_none", text = "That is not in my stores. Ask at the Warrior's Terrace, where the Sentinels report." } },
  },
}

---------------------------------------------------------------------------
-- Vinasia
---------------------------------------------------------------------------
P:NPC {
  key = "vinasia", id = TODO_NPC("Vinasia"), name = "Vinasia", title = "Cloth Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "graceful", "observant" }, values = { "elegance", "tact" },
  notices = { "class", "race", "lock_armor" },

  impression = {
    first = "Vinasia sells cloth armor on the Tradesmen's Terrace with a graceful tact. She seems able to tell at a glance what a person hopes to be taken for, and she dresses them toward it.",
    third = "{name} met Vinasia, who sells cloth armor in Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. This mantle would suit you beautifully." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Cloth that breathes. Buy." },
    { id = "g_hello", text = "Good day, and welcome. I have mantles, gloves, sandals and belts, in cloth that breathes. May I ask what sort of company you keep?" },
    { id = "g_back", when = { metBefore = true }, text = "How pleasant to see you. The mantle sits well on you now, for you have grown into it." },
    { id = "g_caster", when = { class = { "PRIEST", "MAGE", "WARLOCK" } }, text = "One who works by word and gesture. Then nothing I sell will bind your arms, and I can promise you that." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You dress as a servant of the Temple should, plainly. But your gloves are thin at the palm, from the laying on of hands. Let me show you a pair with a doubled weave just there." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You wear dark cloth and stand a little apart. I shall not ask your trade, and you need not tell me. I sell to everyone the Sentinels admit through the gate." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That hide you've wrapped over your robes is no cloth I would sell, and it crawls a little at the seams. Grey wool would serve you better, and it would not frighten my other customers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Vinasia. Anadyia beside me sells the robe, and I sell everything that goes with one, at the shoulder, the hand, the waist and the foot. A robe by itself is only a statement. What goes with it is how one makes the argument." },
      },
      again = {
        { id = "h_again", text = "What else may I show you?" },
        { id = "h_again2", text = "Please, ask. I see you are wondering about the gloves." },
        { id = "h_again3", text = "Yes? Tell me who you mean to be seen by." },
      },
      choices = {
        { text = "Cloth armor is graceful and practical.", next = "BACK", reply = "It is, and the priestesses have known it for ten thousand years. Steel is not the only way to be protected.", fx = { align = { order = 1 } } },
        { text = "Cloth is no protection at all.", next = "BACK", reply = "Then wear mail.", fx = { align = { order = -1 } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why ask what company I keep?", next = "company" },
        { text = "Is cloth truly armor at all?", next = "armor" },
        { text = "What do outlanders make of our dress?", next = "outl" },
        { text = "Show me those gloves with the doubled weave.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "You'd sell to me without a single question?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How do you choose your colours?", next = "vi_colours" },
        { text = "Who buys from you, most often?", next = "vi_buys" },
        { text = "What would you put me in, if I let you?", next = "w_dress" },
        { text = "Good day, Vinasia.", next = "END" },
      },
    },
    vi_colours = {
      lines = {
        { id = "vi_colours_1", text = "From the moon and the forest, mostly, silver and violet and deep green. The outlanders want brighter colours, red and gold, and I sell them those too, but I keep the kaldorei colours on the top shelf." },
      },
      choices = {
        { text = "Why the top shelf?", next = "vi_shelf" },
        { text = "I prefer the kaldorei colours myself.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    vi_shelf = {
      lines = {
        { id = "vi_shelf_1", text = "Because they are the first thing a customer sees, and I want them to see what is truly ours. The red and gold are fine for a feast in Stormwind, but they would look strange in the Temple of the Moon." },
      },
      choices = {
        { text = "Colours for the place you wear them. Wise.", next = "BACK" },
        { text = "Something else, Vinasia.", next = "BACK" },
      },
    },
    vi_buys = {
      lines = {
        { id = "vi_buys_1", text = "The young priestesses, who need gloves and slippers for their duties, and the mages from Elissa Dumas's portal, who want to look learned. And the outlanders, who want to look like kaldorei, which is a compliment I take gladly." },
      },
      choices = {
        { text = "Mages from the portal trainer?", next = "vi_mages" },
        { text = "I'm a mage. What would you suggest?", next = "vi_mages", when = { class = "MAGE" } },
      },
    },
    vi_mages = {
      lines = {
        { id = "vi_mages_1", text = "A mantle with a high collar and gloves that do not catch the light, for a mage must be seen and not distracted. Elissa herself buys from me, and she has very particular taste, so I take her opinion seriously." },
      },
      choices = {
        { text = "High collar, no shine. Noted.", next = "BACK" },
        { text = "Something else, Vinasia.", next = "BACK" },
      },
    },
    company = {
      lines = {
        { id = "company_default", text = "Because we dress for those who will be looking at us. A novice dresses for her Sisters, a scholar for his rivals, and a traveller for strangers who must decide quickly whether to trust her. Tell me who must trust you, and I shall know what to put at your shoulders." },
      },
      choices = {
        { text = "I dress for no one but myself.", next = "BACK", reply = "Then you are freer than most, or you have not yet noticed who is watching.", fx = { align = { order = -1 } } },
        { text = "Fair. One should dress to suit one's place.", next = "BACK", reply = "Just so. It is a courtesy to the people who must look at us.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    armor = {
      lines = {
        { id = "armor_default", text = "It is, of its own kind. It will not turn a blade, and I should never say that it would. But a close weave turns the wind and the damp, and a few of mine carry a small working from Taladan's bench besides. For one who fights from behind the line, to be able to move is to be safe." },
      },
      choices = {
        { text = "Taladan enchants for you?", next = "armor2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    armor2 = {
      lines = {
        { id = "armor2_default", text = "His journeymen do, as their practice pieces, and Lalina Summermoon passes on those that are sound. It suits us both. Her students have honest work, and my gloves hold a little warmth or a little clarity. Vaean writes down every one, naturally. I am in that ledger more often than anyone on this terrace." },
      },
      choices = {
        { text = "A well-ordered arrangement. Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    outl = {
      lines = {
        { id = "outl_default", text = "The humans think us underdressed, and they blush. The dwarves do not notice clothing at all. The gnomes ask where the pockets are. I have learned something from each of them. I now make a mantle with a hidden pocket in it, and it sells better than anything I have." },
      },
      choices = {
        { text = "And what do you make of their dress?", next = "outl2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outl2 = {
      lines = {
        { id = "outl2_default", text = "The humans wear a great deal, and they are stiff in it, as if their clothing were holding them upright. But their priests wear white and gold with real dignity. I saw one bless a wounded Sentinel at the gate, and I did not think about his collar once." },
      },
      choices = {
        { text = "We're not so different under the cloth.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xpriest_default", text = "Here they are. It is the same linen, but the palm is woven twice and quilted to itself, so that it will not wear through where the hand rests on a wound. Priestess Alathea asked me to make them, after her third pair that year. Half the Temple wears them now." },
      },
      choices = {
        { text = "A small thing that does a great deal. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xlock = {
      lines = {
        { id = "xlock_default", text = "I should sell to you with a civil word, as I do to anyone. What you do is between you and those who answer for this city. I shall say only that dark cloth shows the dust of the road, and that people look harder at a figure who seems to be hiding. A little grey would serve you better." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I should sell to you with a civil word, as I do to anyone, and I shall, though your servant is standing very near my good silks. What you do is between you and those who answer for this city, but people look harder at a figure with that at its heel, and no grey cloth of mine will hide it." },
      },
      choices = {
        { text = "Grey, to be overlooked. That's shrewd.", next = "BACK", fx = { trait = { cunning = 1 } } },
      },
    },
    w_dress = {
      lines = {
        { id = "w_dress_default", text = "That depends on who you want to be mistaken for, and it is not always who you are. A young priestess I dressed last spring wanted to look older, and I put her in grey, and the matrons at the Temple began asking her opinion." },
        { id = "w_dress_w1", when = { class = "MAGE" }, text = "You carry the arcane about you, and in Darnassus you will want something that does not announce it. Deep violet, and no silver thread at all." },
      },
      choices = {
        { text = "Is that not a kind of deceit?", next = "w_dress2" },
        { text = "You dress people for their hopes.", next = "w_dress2" },
      },
    },
    w_dress2 = {
      lines = {
        { id = "w_dress2_default", text = "Everyone dresses for someone, and I only make it deliberate. The priestess had good opinions all along; she simply needed the matrons to look up long enough to hear them. Cloth cannot make anyone wise, but it can make the wise harder to ignore." },
      },
      choices = {
        { text = "Appearances do matter.", next = "BACK", fx = { align = { order = 1 } }, reply = "They do, for good or ill. I would rather they matter for good." },
        { text = "People should be judged on deeds alone.", next = "BACK", fx = { align = { order = -1 } }, reply = "They should. Until they are, I shall keep selling grey." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell cloth armor on the Tradesmen's Terrace, which is to say everything that goes with a robe." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "Half the Temple wears my quilted gloves. Priestess Alathea asked for them after wearing through three pairs in a year." } },
    highborne = { { id = "tp_highborne", text = "Some of my pieces carry a small working from Taladan's journeymen. Vaean writes down every one, and I am glad that he does." } },
    advice = { { id = "tp_advice", text = "Dress for whoever must decide quickly whether to trust you. On the road, that is everybody." } },
    _none = { { id = "tp_none", text = "I could not say. Ask at the bank, where the talk is better informed than it is here." } },
  },
}

---------------------------------------------------------------------------
-- Anadyia
---------------------------------------------------------------------------
P:NPC {
  key = "anadyia", id = TODO_NPC("Anadyia"), name = "Anadyia", title = "Robe Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "serene", "opinionated" }, values = { "tradition", "beauty" },
  notices = { "class", "race" },

  impression = {
    first = "Anadyia sells robes on the Tradesmen's Terrace with great serenity and very firm views. She regards the kaldorei robe as a finished art, and she is not shy of saying so.",
    third = "{name} met Anadyia, the robe vendor of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. This robe was cut for one like you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Robes, in the kaldorei manner. Buy." },
    { id = "g_hello", text = "Ishnu-alah. These are robes in the kaldorei manner, as they have been cut since before the Sundering. Stand straight, please, and let me look at you." },
    { id = "g_back", when = { metBefore = true }, text = "You return. You wear it well, but you have belted it too high. Allow me." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "A daughter or son of the forest. Good. I need not explain the drape to you, though I may need to remind you of it." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = { "Human", "Gnome" } },
      text = "You wear your robe closed to the throat, as your people do. Ours fall open at the collar, to the moon. I can close one for you, though I shall sigh while I do it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Your order wears a robe as though it had been found on a branch. I have a few in the Enclave's greens, and I ask only that you do not sleep in them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Anadyia, and I sell the robe as it ought to be. Vinasia beside me attends to mantles and gloves, and Trianna on the terrace below is busy improving what needs no improvement. I keep to the old patterns, and I am never short of buyers." },
      },
      again = {
        { id = "h_again", text = "Is there something else you wish to see? The violet ones are new." },
        { id = "h_again2", text = "Speak freely. I can listen and pin a hem at once." },
        { id = "h_again3", text = "Yes? Do not touch the silver hems." },
      },
      choices = {
        { text = "The old ways of cutting robes are best.", next = "BACK", reply = "They are. A robe cut the old way falls like moonlight, and the new ways only imitate it.", fx = { align = { order = 1 } } },
        { text = "New styles are better than old.", next = "BACK", reply = "Then you will look foolish.", fx = { align = { order = -1 } } },
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "What makes the old pattern right?", next = "pattern" },
        { text = "Trianna's new cuts displease you.", next = "trianna" },
        { text = "Who buys the old robes now?", next = "buys" },
        { text = "Could you close the collar for me?", next = "xhuman", when = { race = { "Human", "Gnome", "Dwarf" } } },
        { text = "Remind me of the drape, then.", next = "xnelf", when = { race = "NightElf" } },
        { text = "How long does a robe take to make?", next = "an_long" },
        { text = "What do the priestesses wear for ceremony?", next = "an_ceremony" },
        { text = "Who taught you the old pattern?", next = "w_teach" },
        { text = "Elune-adore, Anadyia.", next = "END" },
      },
    },
    an_long = {
      lines = {
        { id = "an_long_1", text = "A season, if it is made properly, for the weave must be fine and the drape must be true. Trianna makes hers in a week, and they look it, though she would say they are lighter and easier to wear." },
      },
      choices = {
        { text = "Is she wrong?", next = "an_wrong" },
        { text = "A season for one robe. That's devotion.", next = "BACK", reply = "It is the only way I know." },
      },
    },
    an_wrong = {
      lines = {
        { id = "an_wrong_1", text = "Not wrong, only hasty, which is the outlanders' fault for wanting everything at once. I will not change my patterns, but I will admit, quietly, that her robes sell faster than mine." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Anadyia.", next = "BACK" },
      },
    },
    an_ceremony = {
      lines = {
        { id = "an_ceremony_1", text = "White and silver, with a hood drawn low, for the moon sees the face and not the robe. Priestess A'moora has worn one of mine for longer than the city has stood, and she says it has never once lost its drape." },
      },
      choices = {
        { text = "A'moora is one of your customers?", next = "an_amoora" },
        { text = "I'm a priest. I'd like such a robe.", next = "an_amoora", when = { class = "PRIEST" } },
      },
    },
    an_amoora = {
      lines = {
        { id = "an_amoora_1", text = "My oldest and dearest, and she comes every spring to have the hem mended. She tells me the stories of the Temple while I sew, and I have learned more of Elune from her than from any priestess in the city." },
      },
      choices = {
        { text = "That's a fine friendship.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    pattern = {
      lines = {
        { id = "pattern_default", text = "It has been worn through ten thousand years of walking in forest, and everything that did not serve has fallen away. The sleeve is the length at which it does not catch on a branch. The hem clears wet grass. A new cut may be clever. This one has been tested, and by a great many people." },
      },
      choices = {
        { text = "Tested things deserve our trust.", next = "BACK", reply = "They do. I am glad that somebody young still thinks so.", fx = { align = { order = 1 } } },
        { text = "Even a good pattern can be bettered.", next = "BACK", reply = "So Trianna tells me. I am waiting to be shown.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trianna = {
      lines = {
        { id = "trianna_default", text = "They do not displease me. They puzzle me. She has put a human shoulder on a kaldorei robe, and it sits very neatly, and it catches on every branch between here and Dolanaar. She made it for a city. Our robe was made for a forest. Perhaps she has understood something that I have not wished to." },
      },
      choices = {
        { text = "What might she have understood?", next = "trianna2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trianna2 = {
      lines = {
        { id = "trianna2_default", text = "That we live in a city now. We no longer walk the forest by night, most of us. We walk on terraces and we stand in the bank. If that is how we are to live from now on, her sleeve is the right one. I keep to mine because I hope that it is not." },
      },
      choices = {
        { text = "Then your robes are a kind of faith.", next = "BACK", reply = "You have seen further into my stall than most. Thank you.", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = {
        { id = "buys_default", text = "The Temple, always. The older families. And, which surprised me, the outlanders. Human mages buy them to take home. I am told a kaldorei robe is much admired in Stormwind, where it is worn belted, over trousers. I have chosen not to picture it." },
      },
      choices = {
        { text = "Does it trouble you, selling them abroad?", next = "buys2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys2 = {
      lines = {
        { id = "buys2_default", text = "It did. I thought of it as sending a prayer to be used as a tablecloth. Then a human woman told me that she wore hers on the night her child was named, because it was the most beautiful thing she owned. I have sold to her people gladly ever since." },
      },
      choices = {
        { text = "That's a fine use for it. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xhuman = {
      lines = {
        { id = "xhuman_default", text = "I can, and I shall. There, a loop and a toggle of horn, hidden under the fold. Nobody need know that it has been done. I shall ask one thing in return. Open it once, on a clear night, and stand under the moon as we do. You may find that you understand the collar." },
      },
      choices = {
        { text = "I'll try it, on a clear night. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "The left side lies over the right, toward the heart. The belt sits at the hip and never at the waist. And the hem is lifted with the left hand on a stair, so that the right is free. Your grandmother knew this without being told, and you have been too long among dwarves." },
      },
      choices = {
        { text = "Left over right. Forgive me, Anadyia.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    w_teach = {
      lines = {
        { id = "w_teach_default", text = "My grandmother, in the forest of Ashenvale, before there were cities. She cut by moonlight with a bone knife on a flat stone by a stream, and she never measured anything, because her hands had done it ten thousand times." },
      },
      choices = {
        { text = "Do you measure?", next = "w_teach2" },
        { text = "That's a long line of tailors.", next = "w_teach2" },
      },
    },
    w_teach2 = {
      lines = {
        { id = "w_teach2_default", text = "I do, and she would have laughed at me for it. My hands have done it only a few thousand times, which is not enough to stop checking. Trianna does not measure at all, which is why her robes are so interesting and mine are so correct." },
        { id = "w_teach2_w1", when = { profession = "Tailoring" }, text = "You sew yourself, so you will know the difference between a hand that is certain and a hand that only hopes. Measure until you stop hoping." },
      },
      choices = {
        { text = "There's comfort in a careful hand.", next = "BACK" },
        { text = "Something else, Anadyia.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell robes on the Tradesmen's Terrace, cut to the old patterns. I see no cause to change them." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Temple has bought its robes from my stall since the tree was grown. They have never asked for a new cut." } },
    teldrassil = { { id = "tp_teldrassil", text = "We made a robe for the forest and now we live in a city. I sell the old cut in the hope that we shall go back." } },
    elune = { { id = "tp_elune", text = "The collar falls open to the moon. That part of the robe is a prayer, and I will not close it lightly." } },
    advice = { { id = "tp_advice", text = "Belt it at the hip, and lift the hem with your left hand on a stair. Everything else about a robe is patience." } },
    _none = { { id = "tp_none", text = "That is not a matter of cloth. Ask at the Temple, where they answer such things." } },
  },
}

---------------------------------------------------------------------------
-- Yldan
---------------------------------------------------------------------------
P:NPC {
  key = "yldan", id = TODO_NPC("Yldan"), name = "Yldan", title = "Bag Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "dry", "methodical" }, values = { "usefulness", "thrift" },
  notices = { "kit", "craft" },

  impression = {
    first = "Yldan sells bags on the Tradesmen's Terrace and holds that a person's pack is their whole character turned inside out. He is dry and methodical, and he was right about mine.",
    third = "{name} met Yldan, the bag merchant of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. A pack for you, with room for everything." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "How often have you run out of room? Often, I think." },
    { id = "g_hello", text = "Good day. Pouches, satchels and packs. Before you choose, tell me how often you have had to leave something behind for want of room." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You have filled it already, have you? Everyone does. I have a larger one." },
    { id = "g_craft", when = { profession = { "Herbalism", "Mining", "Skinning" } }, text = "A gatherer. You will be carrying three times what an ordinary traveller does, and you will be folding hides in on top of herbs. Let us mend that." },
  },

  notice = {
    { id = "n_full", cat = "kit", when = { profession = { "Herbalism", "Mining", "Skinning" } },
      text = "Your satchel is straining at the lower seam, and something in it is leaking green. I should say peacebloom, crushed under ore, a day old." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, and you have made your own bag, with the strap set on the bias. It is clever work. It will stretch, but it is clever." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Yldan, and I sell bags. It is not a trade that anybody sings about. But everything else on this terrace must be carried home in something, and when that something splits on the road to Dolanaar, I am the one they remember." },
      },
      again = {
        { id = "h_again", text = "What more do you need carried? I have a bag for nearly everything." },
        { id = "h_again2", text = "Ask. I shall be here." },
        { id = "h_again3", text = "Yes? I will judge your pack later." },
      },
      choices = {
        { text = "A good bag saves much trouble.", next = "BACK", reply = "It does. Half the adventurers who come back hurt lost something because they had nowhere to put it.", fx = { align = { order = 1 } } },
        { text = "Any bag will do.", next = "BACK", reply = "Then lose your things.", fx = { align = { order = -1 } } },
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "A pack is a person's character?", next = "character" },
        { text = "What do people carry that they shouldn't?", next = "carry" },
        { text = "Who makes your bags?", next = "makes" },
        { text = "How should a gatherer pack?", next = "xgather", when = { profession = { "Herbalism", "Mining", "Skinning" } } },
        { text = "What's wrong with a strap on the bias?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "What makes a good bag?", next = "yl_good" },
        { text = "What's the strangest thing someone carried in your bag?", next = "yl_strange" },
        { text = "What's in your own pack?", next = "w_pack" },
        { text = "Good day, Yldan.", next = "END" },
      },
    },
    yl_good = {
      lines = {
        { id = "yl_good_1", text = "A strong seam, a good strap, and a closure that does not open when you are hanging upside down from a tree. Most bags have the first two, and few have the third, which is why I make my own." },
      },
      choices = {
        { text = "Why would someone hang upside down?", next = "yl_upside" },
        { text = "A strong seam is the heart of it.", next = "BACK", reply = "It is, and few understand that." },
      },
    },
    yl_upside = {
      lines = {
        { id = "yl_upside_1", text = "The Sentinels do it often, when they are watching from the boughs, and the young druids do it by accident. I have seen more coins fall from a careless bag than I could ever count, and most of them in Rut'theran." },
      },
      choices = {
        { text = "Rut'theran must be full of lost coins.", next = "BACK" },
        { text = "Something else, Yldan.", next = "BACK" },
      },
    },
    yl_strange = {
      lines = {
        { id = "yl_strange_1", text = "A live owl, once, which a druid insisted was only resting, and a bag of furbolg teeth that a huntress sold me back with the bag. The owl was fine, and the teeth I gave to the Enclave, for they said the furbolgs had gone wrong somehow." },
      },
      choices = {
        { text = "The furbolgs have gone wrong?", next = "yl_furbolg" },
        { text = "I'm a druid. I'd not carry an owl in a bag.", next = "yl_furbolg", when = { class = "DRUID" } },
      },
    },
    yl_furbolg = {
      lines = {
        { id = "yl_furbolg_1", text = "So the Enclave says, the Gnarlpine near Dolanaar most of all. They were a gentle people, once, and now they attack travellers, and the druids are trying to learn why." },
      },
      choices = {
        { text = "I'll keep my bags shut near Dolanaar.", next = "BACK", fx = { learn = { "furbolgs" } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    character = {
      lines = {
        { id = "character_default", text = "Entirely. Empty a person's pack on my counter and I shall tell you whether they plan, whether they hoard, and whether they have ever been truly cold. The careless ones carry four of one thing. The frightened ones carry one of everything. Yours, I should guess, has something at the bottom that you have forgotten." },
      },
      choices = {
        { text = "It has. I found it there last week.", next = "character2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    character2 = {
      lines = {
        { id = "character2_default", text = "They always do. It is generally a letter, or food, or a gift for someone who was never given it. I once found a child's shoe at the bottom of a Sentinel's kit bag. She had carried it for sixty years without knowing. I gave it back to her and asked no questions." },
      },
      choices = {
        { text = "You were right not to ask.", next = "BACK", reply = "A bag merchant learns that very early. People do not come to me to be unpacked.", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "carry_default", text = "Stones. I do not mean ore, but pretty stones, from every place that they have been. Gnomes are the worst for it and night elves the next. I have weighed a satchel that was one third pebbles. Its owner would part with none of them, and so she bought a second bag." },
      },
      choices = {
        { text = "Let them keep their stones. Memories weigh little.", next = "BACK", reply = "They weighed eleven pounds, as it happens. But I take your meaning.", fx = { align = { order = -1 } } },
        { text = "A traveller should carry only what's useful.", next = "BACK", reply = "So I told her. She said that they were useful, and would not say for what.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    makes = {
      lines = {
        { id = "makes_default", text = "Me'lynn's students make the linen ones, as their second-year work, and I buy the ones that pass. The leather satchels come from Lotherias when she has an hour, which is seldom. The large packs I stitch myself, at night, with the heavy thread that Saenorion keeps aside for me." },
      },
      choices = {
        { text = "Do the students' bags hold up?", next = "makes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makes2 = {
      lines = {
        { id = "makes2_default", text = "The ones I buy do. I fill each with river stones and hang it from the bough outside for a week. If the seams have not moved, it goes on my wall. Me'lynn does not tell them about the bough. She lets them think that I simply have a discerning eye." },
      },
      choices = {
        { text = "A week on the bough. That's a fair trial.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    xgather = {
      lines = {
        { id = "xgather_default", text = "Put the hard below the soft, and the wet apart from the dry. Ore goes at the bottom, in its own pouch. Hides are rolled with the fur inward and tied at the side. Herbs go on the top, in a bag that breathes. And take a spare pouch for the thing you did not expect to find." },
      },
      choices = {
        { text = "Hard below soft, wet apart from dry. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xtailor = {
      lines = {
        { id = "xtailor_default", text = "Cloth that is cut on the bias gives, and that is why it sits so well on your shoulder. But in a strap that carries weight, it gives a little more each day. Within a season your bag will be hanging at your knee. Set a straight-grain tape inside it and you may keep the comfort." },
      },
      choices = {
        { text = "A straight tape inside. I'll do that. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    w_pack = {
      lines = {
        { id = "w_pack_default", text = "A spare strap, a needle with waxed thread, two days' bread and one river stone from Lake Al'Ameth. The stone is the only thing in there that has no use at all, and so it is the only thing I would grieve to lose." },
      },
      choices = {
        { text = "Why that stone?", next = "w_pack2" },
        { text = "I would have guessed more straps.", next = "w_pack2" },
      },
    },
    w_pack2 = {
      lines = {
        { id = "w_pack2_default", text = "My sister gave it to me before she went to Ashenvale with the Sentinels. She said a pack with nothing useless in it belonged to someone with nobody to miss, and she wanted me to have something useless." },
      },
      choices = {
        { text = "She sounds like she knew you well.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Yldan.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell bags on the Tradesmen's Terrace. Nobody sings of it, and everybody needs one." } },
    sentinels = { { id = "tp_sentinels", text = "I once found a child's shoe at the bottom of a Sentinel's kit bag. I gave it back and asked nothing." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves of the League want packs that will hold rock. I double the base for them, and they fill it by noon." } },
    advice = { { id = "tp_advice", text = "Pack the hard below the soft and the wet apart from the dry. And look at the bottom of your bag once a season." } },
    _none = { { id = "tp_none", text = "I carry bags and no news. Try Ellandrieth, who talks to everyone who passes." } },
  },
}

---------------------------------------------------------------------------
-- Ellandrieth
---------------------------------------------------------------------------
P:NPC {
  key = "ellandrieth", id = TODO_NPC("Ellandrieth"), name = "Ellandrieth", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "chatty", "warm" }, values = { "community", "helpfulness" },
  notices = { "race", "level" },

  impression = {
    first = "Ellandrieth sells general goods on the Tradesmen's Terrace and seems to know the business of everyone who passes her stall. She is chatty and warm, and she gave me directions I had not asked for.",
    third = "{name} met Ellandrieth, who sells general goods on the Tradesmen's Terrace.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, good day, friend! I saved you the best of everything!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Food, water, torches. Buy." },
    { id = "g_hello", text = "Good day, good day! Food for the road, water, torches and a little of everything else. Are you lost? You have the look of it. Most people are, the first time." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Did you find the bank? It is the great tree shaped like a bear, and I did tell you so." },
    { id = "g_out", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "A visitor! Welcome to Darnassus. You will want to know where things are. Everybody does, and nobody likes to ask a Sentinel." },
  },

  notice = {
    { id = "n_out", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You keep looking up, and then down at the water, and then up again. Yes, it is all one tree, and no, it will not fall. They ask me that before they ask the price of bread." },
    { id = "n_young", cat = "level", when = { maxLevel = 12 },
      text = "You are new to the city, and to a good deal else, I think. Have you an inn? Saelienne's is across the bridge, and she is kind to those just starting out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ellandrieth. I sell the plain things that everybody needs and nobody remembers to bring. And since everyone must pass my stall to reach the auction house, I see the whole of Darnassus go by in a day." },
      },
      again = {
        { id = "h_again", text = "What else for the road? Flint, rope and bread are the three I would never leave without." },
        { id = "h_again2", text = "Ask me anything. I shall very likely know." },
        { id = "h_again3", text = "Yes, dear?" },
      },
      choices = {
        { text = "Being prepared keeps travelers safe.", next = "BACK", reply = "It does! A traveler with dry tinder and a full waterskin has already won half her battles.", fx = { align = { order = 1 } } },
        { text = "I'll manage without supplies.", next = "BACK", reply = "Then you'll go hungry.", fx = { align = { order = -1 } } },
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Where is everything in this city?", next = "where" },
        { text = "You see all of Darnassus pass by.", next = "pass" },
        { text = "What's the talk of the terrace, lately?", next = "talk" },
        { text = "Truly, will the tree not fall?", next = "xout", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Is it true we were happier in the forest?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Who's the strangest person to pass your stall?", next = "w_strange" },
        { text = "Thank you, Ellandrieth. Farewell.", next = "END" },
      },
    },
    where = {
      lines = {
        { id = "where_default", text = "The Temple of the Moon lies south across the water, and you cannot miss it. The bank is the bear tree in the middle. The Cenarion Enclave is to the north, over the bridge, and you should lower your voice there. The Craftsmen's Terrace is across from us, and the Warrior's Terrace stands by the gate." },
      },
      choices = {
        { text = "Why lower my voice in the Enclave?", next = "where2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where2 = {
      lines = {
        { id = "where2_default", text = "Because the Arch Druid does not care for noise, and of late he does not care for much. People come back over that bridge looking as if they had been scolded, and they usually have been. I send them to Dendrythis for something sweet, and then I ask them what he said." },
      },
      choices = {
        { text = "And what does he say?", next = "where3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where3 = {
      lines = {
        { id = "where3_default", text = "That the tree is well, that the Temple worries too much, and that nobody has asked their opinion. He says it to everyone, so he must mean it. I am only a seller of torches, and I do not know who has the right of it. But I notice that the Temple has stopped sending him honey cakes at the festival." },
      },
      choices = {
        { text = "That tells its own tale. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    pass = {
      lines = {
        { id = "pass_default", text = "I do. The priestesses go by at dawn to the gardens, and the Sentinels at the change of watch. The outlanders come at all hours, lost. I have got so that I can tell a dwarf's step from a human's with my back turned, and a gnome's because there seem to be so many more of them." },
      },
      choices = {
        { text = "Who passes that worries you?", next = "pass2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass2 = {
      lines = {
        { id = "pass2_default", text = "The young ones in new mail, going down to the boats. They buy bread for three days and tell me that they will be back in a week. Some of them are. I have started putting an extra loaf in and not saying so, for I can think of nothing else to do about it." },
      },
      choices = {
        { text = "That's a kindness they'll remember.", next = "BACK", reply = "I hope they do not notice it, to be honest. It would only embarrass us both.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk = {
      lines = {
        { id = "talk_default", text = "That Voloren has very nearly carved a working reel, and will be unbearable. That Treshala, upstairs, has had no word of her husband, and she watches the gate. And that the auctioneers are quarrelling about a box that ticked. I do not know the whole of that one yet." },
      },
      choices = {
        { text = "What became of Treshala's husband?", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      lines = {
        { id = "talk2_default", text = "Heralath went south into the Barrens, to a place called Razorfen, and he has not written. She will tell you more herself, if you go up, and she would be glad of anyone who is headed that way. I take her bread in the evenings. She does not always eat it." },
      },
      choices = {
        { text = "I may go up and speak with her.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xout = {
      lines = {
        { id = "xout_default", text = "Truly. It has stood through storms that would have flattened your Stormwind. The druids grew it to be a home, and it knows that it is one. I shall admit to you that I did not look over the edge for my first ten years here. So we have that much in common." },
      },
      choices = {
        { text = "Ten years! I'll try to manage sooner.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "The old ones say so. I think we were quieter then, and I do not think that is the same thing. In the forest I knew forty people. Here I know four hundred, and a hundred of those are dwarves. I should not go back, though I should not say so to Anadyia." },
      },
      choices = {
        { text = "Let each choose her own home, old or new.", next = "BACK", reply = "That is all I ask. And she may keep her sleeves.", fx = { align = { order = -1 } } },
        { text = "The elders may be right. We've lost something.", next = "BACK", reply = "Perhaps we have. I think we have found a few things as well.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_strange = {
      lines = {
        { id = "w_strange_default", text = "A gnome, last month, who walked up from the portal backwards so that he could map the route as he went. He asked me for a pencil, and then for directions, and then whether the tree had ever been measured, and he was gone before I could answer any of it." },
      },
      choices = {
        { text = "Had the tree been measured?", next = "w_strange2" },
        { text = "Gnomes are like that, I hear.", next = "w_strange2" },
      },
    },
    w_strange2 = {
      lines = {
        { id = "w_strange2_default", text = "Not that anyone would admit to. The Enclave would think it impertinent and the Temple would think it unnecessary, which means he is probably measuring it now. I hope he comes back and tells me, though I shall never tell Fandral I asked." },
        { id = "w_strange2_w1", when = { race = "Gnome" }, text = "You are one of his people, so perhaps you can tell me why he walked backwards. I have thought about it all week." },
      },
      choices = {
        { text = "Some questions are worth asking.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else, Ellandrieth.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell general goods on the Tradesmen's Terrace. I also give directions, whether they are wanted or not." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "People come back over the Enclave bridge looking scolded. The Temple no longer sends the Arch Druid honey cakes." } },
    warsong = { { id = "tp_warsong", text = "The young ones buy three days of bread and go down to the boats. I put an extra loaf in, and I say nothing." } },
    teldrassil = { { id = "tp_teldrassil", text = "It is one tree, and it will not fall. I say that ten times a day, and I believe it nine of them." } },
    advice = { { id = "tp_advice", text = "Ask the way before you are lost. And never ask it of a Sentinel on watch, for she will only point." } },
    _none = { { id = "tp_none", text = "Now that I do not know, which vexes me. Come back tomorrow, and I shall have found out." } },
  },
}

---------------------------------------------------------------------------
-- Dendrythis
---------------------------------------------------------------------------
P:NPC {
  key = "dendrythis", id = TODO_NPC("Dendrythis"), name = "Dendrythis", title = "Food & Drink Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "soothing", "wry" }, values = { "comfort", "hospitality" },
  notices = { "race", "class" },

  impression = {
    first = "Dendrythis sells food and drink near the Temple Gardens and has a soothing manner with rattled customers. She hears a good deal from people who have just left the Temple or the Enclave.",
    third = "{name} met Dendrythis, who sells food and drink in Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Sit; I've moonberry juice just for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Juice and bread. Buy, please." },
    { id = "g_hello", text = "Good day. Moonberry juice, honey bread and spiced fruit. Sit a moment, if you like. You look as though someone has just told you something." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The usual? I remember it. And you look better than you did, so it must agree with you." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A servant of the Goddess. The honey bread is baked for the Temple, and there is always a little over. Please, have some." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. I shall tell you before you ask that there is no ale. There is moonberry wine, which is not the same thing, and I have seen your people grow thoughtful over it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and you have come over from the Enclave bridge with your jaw set. Sit down. I keep a spiced fruit that is very good for those who have just been spoken to by the Arch Druid." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dendrythis. I keep the food stall between the Temple and the bridges, and so I see everyone on their way to be advised and on their way back from it. The second lot are hungrier. I think that being told what to do must give one an appetite." },
      },
      again = {
        { id = "h_again", text = "What else can I bring you?" },
        { id = "h_again2", text = "Ask. I have nowhere to be." },
        { id = "h_again3", text = "Yes, friend? Sit, if you like; the bench is warm." },
      },
      choices = {
        { text = "A moment's rest is good for the soul.", next = "BACK", reply = "It is. Sit, then.", fx = { align = { light = 1 } } },
        { text = "Rest is for the weak.", next = "BACK", reply = "Then don't sit.", fx = { align = { light = -1 } } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You feed people after they've been advised?", next = "advised" },
        { text = "Where does your food come from?", next = "food" },
        { text = "What do you overhear, standing here?", next = "hear" },
        { text = "Is the moonberry wine strong?", next = "xdwarf", when = { race = { "Dwarf", "Human", "Gnome" } } },
        { text = "How did you know where I'd been?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do you give someone who's had bad news?", next = "w_bad" },
        { text = "Thank you, Dendrythis.", next = "END" },
      },
    },
    advised = {
      lines = {
        { id = "advised_default", text = "After, and sometimes before. A petitioner going up to the High Priestess wants something to steady her. A young druid coming down from Staghelm wants something to take the taste away. I know which bread goes with which errand, by now." },
      },
      choices = {
        { text = "And which errand is the harder?", next = "advised2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advised2 = {
      lines = {
        { id = "advised2_default", text = "The Enclave, these days. Those who come from the Temple are tired, but they are comforted. Those who come from the Enclave are angry, or else they are very quiet. I do not know what is said up there. I only see what it does to an appetite." },
      },
      choices = {
        { text = "Someone should tell the Temple what you see.", next = "BACK", reply = "The Temple has eyes of its own, friend. But I shall think about it.", fx = { align = { order = -1 } } },
        { text = "It's not a vendor's place to judge the Arch Druid.", next = "BACK", reply = "No, and I do not judge him. I only sell a great deal of spiced fruit.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    food = {
      lines = {
        { id = "food_default", text = "The bread is baked at the Temple ovens, and the moonberries grow in the gardens behind me. The fruit comes up from Dolanaar, and the honey from hives on the high boughs, which the off-duty Sentinels rob for me, at some cost in stings. It is all from the tree, except for the spice." },
      },
      choices = {
        { text = "Is the tree's fruit as good as Ashenvale's was?", next = "food2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food2 = {
      lines = {
        { id = "food2_default", text = "It is larger, and it is sweeter, and it keeps half as long. Alegorn on the Craftsmen's Terrace says that it is like cooking with a child's drawing of a pear. I sell it, and it is good. But I dry my own from a tree in Ashenvale that my sister tends, for the days when I want the real thing." },
      },
      choices = {
        { text = "Is your sister still there, with the fighting?", next = "food3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food3 = {
      lines = {
        { id = "food3_default", text = "Near Astranaar, and she will not leave. She says that somebody must stay with the trees. I send her spice and she sends me pears, by the hippogryph post. Each time the pears come I know that she was well four days ago. It is not much, and it is something." },
      },
      choices = {
        { text = "May the pears keep coming. Something else.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "warsong" } } },
      },
    },
    hear = {
      lines = {
        { id = "hear_default", text = "Less than you would think, and more than I ought to. People do not talk at a food stall. They sigh. I have become very good at sighs. There is one for a prayer that has gone unanswered and another for a lesson that went badly, and a third that means only that someone's feet hurt." },
      },
      choices = {
        { text = "And what do you do with what you learn?", next = "hear2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hear2 = {
      lines = {
        { id = "hear2_default", text = "I cut the bread a little thicker. That is all. I am no priestess, and I should make a poor one, for I should want to answer back. But a person who is fed is a little less alone with whatever it is. Ellandrieth collects the news. I only collect the sighs." },
      },
      choices = {
        { text = "There are worse callings. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "It is gentle for the first cup and the second. With the third you will find that you are telling me about your mother. Your people take it for juice, and I have learned to warn them. The last dwarf I failed to warn sang to the moonwell until the Sentinels came." },
      },
      choices = {
        { text = "Two cups, then, and no singing. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "You walked as they all do, quickly, and you were looking at nothing. And you came from the north bridge. Do not take it to heart. Mathrengyl Bearwalker comes by when he can, and he tells the young ones that the Arch Druid's temper is no measure of their worth. I think that he is right." },
      },
      choices = {
        { text = "I'm glad Mathrengyl says so. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    w_bad = {
      lines = {
        { id = "w_bad_default", text = "Warm milk with honey, and no questions. People who have just been told something hard at the Temple do not want to talk; they want something in their hands that is warm and asks nothing of them." },
      },
      choices = {
        { text = "Do they ever talk anyway?", next = "w_bad2" },
        { text = "That's a kindness.", next = "w_bad2" },
      },
    },
    w_bad2 = {
      lines = {
        { id = "w_bad2_default", text = "Sometimes, after the cup is half gone. A young Sentinel sat on that bench for an hour last week and told me her mother had not come back from Ashenvale. Then she stood up, thanked me for the milk and walked back to the boats, and I have thought about her every day since." },
        { id = "w_bad2_w1", when = { race = "NightElf" }, text = "You are kaldorei, and you will know how quietly we grieve. I think the milk gives people somewhere to put their hands while they do it." },
      },
      choices = {
        { text = "Grief needs a quiet place.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Dendrythis.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell food and drink between the Temple and the bridges. I feed people before and after they are advised." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The young druids come down from the Enclave angry, or else very quiet. I keep a spiced fruit for them." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Temple bakes the honey bread, and there is always a little over. I think that they bake it over on purpose." } },
    warsong = { { id = "tp_warsong", text = "My sister tends a pear tree near Astranaar and will not leave it. I count the days by her parcels." } },
    advice = { { id = "tp_advice", text = "Eat before you ask for counsel, and again after. Nobody ever heard good advice on an empty stomach." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Ellandrieth on the Tradesmen's Terrace, for she collects such things." } },
  },
}

---------------------------------------------------------------------------
-- Kyrai
---------------------------------------------------------------------------
P:NPC {
  key = "kyrai", id = TODO_NPC("Kyrai"), name = "Kyrai", title = "Poison Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "cool", "matter-of-fact" }, values = { "precision", "discretion" },
  notices = { "class", "craft" },

  impression = {
    first = "Kyrai sells poisons from the rogues' den beneath the Cenarion Enclave, and she speaks of them as a herbalist speaks of teas. She is cool and matter-of-fact, and she asks no questions she does not need answered.",
    third = "{name} met Kyrai, who sells poisons in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Speak plainly, and I'll give you the best." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Speak plainly. What do you need?" },
    { id = "g_hello", text = "Good day. Vials, flash powder and the usual preparations. Speak plainly about what you need. Nobody is listening down here who would mind." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. The last vial did what was asked of it, I take it, since here you stand." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of Syurna's, or one of Erion's. It makes no difference to me. I supply both of them, and I tell neither what the other bought." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "There is a green line along the flat of your blade, where the last coat dried. You did not wipe it between coatings. It will flake, and then it will be in your sheath and on your fingers." },
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You know plants, by your hands. Then you know that most of what I sell is only a medicine given in the wrong measure. I began as a healer's apprentice, like many in this trade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kyrai. I sell poisons to those whom this city has trained to use them, and to nobody else. Syurna, Erion and Anishar teach in these rooms, and the druids overhead have agreed not to ask what is kept in the cellar." },
      },
      again = {
        { id = "h_again", text = "What else? Speak low; the vials do not like a loud voice." },
        { id = "h_again2", text = "Ask it plainly." },
        { id = "h_again3", text = "Yes? Keep your hands where I can see them, please." },
      },
      choices = {
        { text = "Plain speech serves everyone.", next = "BACK", reply = "It does, and I will speak plainly: these vials are not toys, and I do not sell them to the careless.", fx = { align = { honor = 1 } } },
        { text = "Poison is a coward's weapon.", next = "BACK", reply = "Then don't buy it.", fx = { align = { honor = -1 } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "How does a night elf come to sell poison?", next = "come" },
        { text = "The druids permit this, under their feet?", next = "druids" },
        { text = "Where do your ingredients come from?", next = "source" },
        { text = "How should I clean a coated blade?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A healer's apprentice, you said?", next = "xalch", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "What's the most dangerous thing on your shelves?", next = "w_danger" },
        { text = "I'll leave you to your vials.", next = "END" },
      },
    },
    come = {
      lines = {
        { id = "come_default", text = "By way of the Sentinels. An army that fights from ambush has always used venom on its arrows, and somebody must prepare it. I did that for a long age. When the rogues were given these rooms, I came down with my shelves. It is the same work, with smaller blades." },
      },
      choices = {
        { text = "Does the work ever trouble you?", next = "come2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    come2 = {
      lines = {
        { id = "come2_default", text = "No. A poisoned blade ends a fight sooner, and a fight that ends sooner leaves fewer dead on both sides. I have seen the long way done, with swords, at Hyjal. I do not think that it was cleaner. Does it trouble you, to buy from me?" },
      },
      choices = {
        { text = "No. War isn't a duel, and I mean to win.", next = "BACK", reply = "Then we understand one another. I shall measure carefully for you.", fx = { align = { honor = -1 } } },
        { text = "Yes. It's an ugly way to kill.", next = "BACK", reply = "It is ugly. I have never met a way that was not. But I respect that you asked yourself.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids = {
      lines = {
        { id = "druids_default", text = "They permit it by not looking. The Arch Druid would deny that these rooms exist. The Temple knows very well that they do, and it pays for them. Darnassus needs eyes in Stormwind and knives in Ashenvale, and it had rather not see them trained in the gardens." },
      },
      choices = {
        { text = "Do you resent being hidden?", next = "druids2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids2 = {
      lines = {
        { id = "druids2_default", text = "I prefer it. My shelves are cool and dark, as they should be, and nobody comes down to ask whether nightshade is safe for children. Anishar jokes that we are the roots, and that roots do their work in the dark. He is more pleased with the saying than I am, but it is not wrong." },
      },
      choices = {
        { text = "Roots hold the whole tree up. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    source = {
      lines = {
        { id = "source_default", text = "The leaves and berries grow on Teldrassil and in Darkshore, and I gather them myself, at night. Ulthir the alchemists' supplier sells me vials, and he does not ask what they are for. The venoms come from the webwood spiders, which Gilshalan Windwalker's students milk for me in Shadowglen." },
      },
      choices = {
        { text = "The children milk spiders for you?", next = "source2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source2 = {
      lines = {
        { id = "source2_default", text = "The older students do, and carefully, and they are well paid. Gilshalan believes that it teaches them respect for the creature. One was bitten last spring, and Dirania Silvershine had her on her feet in a week. I sent the antidote down myself. I make that as well, and it is by far my best seller." },
      },
      choices = {
        { text = "Poison and its cure, from one shelf.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Use oil first, and then a dry cloth, and always wipe from the spine to the edge so that you do not cut yourself with what you are removing. Burn the cloth afterward. Do not put it in your pocket. I have lost two customers to their own pockets, and neither of them was a fool." },
      },
      choices = {
        { text = "Spine to edge, and burn the cloth. Understood.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xalch = {
      lines = {
        { id = "xalch_default", text = "At the Temple, a very long time ago. I learned what each leaf mends, and in what measure. One day a Sister showed me what three times that measure would do, so that I should never give it by mistake. I found that I was more interested in that lesson than in all the others together." },
      },
      choices = {
        { text = "The dose makes the poison, as they say.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } },
      },
    },
    w_danger = {
      lines = {
        { id = "w_danger_default", text = "Not what you would think. The deadly ones are clearly marked and kept high. The dangerous one is a mild sleeping draught, because people think it harmless and use too much of it, on themselves and on others." },
      },
      choices = {
        { text = "Have you seen that happen?", next = "w_danger2" },
        { text = "That's an odd thing to fear.", next = "w_danger2" },
      },
    },
    w_danger2 = {
      lines = {
        { id = "w_danger2_default", text = "Once, a student who wanted to sleep through a hard week and did not wake for three days. Since then I sell it only to those Syurna sends me, and only with a word of warning that the students find tiresome. I would rather be tiresome." },
        { id = "w_danger2_w1", when = { class = "ROGUE" }, text = "You are of this trade, so hear it from me: the poison you respect will never hurt you. It is the one you stop thinking about." },
      },
      choices = {
        { text = "Caution saves lives.", next = "BACK", fx = { align = { order = 1 } }, reply = "It does, though it never earns any thanks. I have made my peace with that." },
        { text = "Students should learn from their own mistakes.", next = "BACK", fx = { align = { order = -1 } }, reply = "They do. I would only like them to survive the lesson." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell poisons beneath the Cenarion Enclave, to those the city has trained. I prepared arrow venom for the Sentinels before that." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids overhead have agreed not to look down. I have agreed not to look up, and it works very well." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels have always put venom on their arrows. I made it for them for a long age, and nobody thought it strange." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Temple taught me what each leaf mends. It also pays for these rooms, though it would rather I did not say so." } },
    advice = { { id = "tp_advice", text = "Wipe a coated blade from the spine to the edge, and burn the cloth. Most of this trade's dead were only careless." } },
    _none = { { id = "tp_none", text = "I have no vial for that. Ask Anishar, who knows more than he sells." } },
  },
}

---------------------------------------------------------------------------
-- Cyroen
---------------------------------------------------------------------------
P:NPC {
  key = "cyroen", id = TODO_NPC("Cyroen"), name = "Cyroen", title = "Reagent Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "patient", "kindly" }, values = { "service", "balance" },
  notices = { "class", "race" },

  impression = {
    first = "Cyroen sells reagents in the Cenarion Enclave and counts out seeds and powders with a patient, kindly care. He seems to think of each one as a small promise on the buyer's part.",
    third = "{name} met Cyroen, who sells reagents in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome to the Enclave, friend. I saved some fresh seeds for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome. Seeds, powders, candles. Buy, please." },
    { id = "g_hello", text = "Welcome to the Enclave, friend. I have seeds, powders, candles and the other small things that a working asks for. What is it you practise?" },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and so the last of them were spent. I hope that it was on something worth the spending." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Ishnu-alah, friend. You will be wanting seeds for the calling back of the fallen. I keep them at the front, for those who come in a hurry." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Your seed pouch is empty, and you have a tired look. You have been raising the fallen more often than you have been resting. Take these, and take a moment as well." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, here in the Enclave. You are welcome at my stall, whatever looks you had on the bridge. I keep your powders and feathers on the lower shelf, out of the Arch Druid's line of sight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Cyroen. I supply the druids of the Enclave with what their workings consume, and I supply anyone else who comes, for a reagent does not ask who holds it. Denatharion and Fylerian Nightwing send their students down to me before each lesson." },
      },
      again = {
        { id = "h_again", text = "What else may I find for you?" },
        { id = "h_again2", text = "Ask, friend. A question asked kindly is half answered." },
        { id = "h_again3", text = "Yes? Each question is a seed, so plant it carefully." },
      },
      choices = {
        { text = "The druids' work is important.", next = "BACK", reply = "It is. I supply them gladly.", fx = { align = { light = 1 } } },
        { text = "Druids are slow and dreamy.", next = "BACK", reply = "They dream for us all.", fx = { align = { light = -1 } } },
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Why call a reagent a promise?", next = "promise" },
        { text = "What do the druids use most?", next = "most" },
        { text = "How is the Enclave, these days?", next = "enclave" },
        { text = "I have been raising the fallen often.", next = "xdruid", when = { class = { "DRUID", "PRIEST", "PALADIN" } } },
        { text = "The lower shelf, out of his sight?", next = "xmage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Which reagent is hardest to come by?", next = "cy_hard" },
        { text = "Do the students make many mistakes?", next = "cy_students" },
        { text = "What reagent do you keep for yourself?", next = "w_self" },
        { text = "Walk with the forest, Cyroen.", next = "END" },
      },
    },
    cy_hard = {
      lines = {
        { id = "cy_hard_1", text = "Wild thornroot, for it grows only in the oldest groves and must be gathered at the right moon. The druids of the Enclave send students to Teldrassil's edges for it, and they come back muddy and pleased with themselves." },
      },
      choices = {
        { text = "Do they find enough?", next = "cy_enough" },
        { text = "The right moon? That's a tall order.", next = "BACK" },
      },
    },
    cy_enough = {
      lines = {
        { id = "cy_enough_1", text = "Rarely, for the groves are shrinking, or so the druids say. Something troubles the tree's roots, and the thornroot does not grow as it once did, which worries me more than I let my customers see." },
      },
      choices = {
        { text = "I'll gather some if I can.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something troubles the tree. Something else.", next = "BACK" },
      },
    },
    cy_students = {
      lines = {
        { id = "cy_students_1", text = "Many, and I forgive them all, for a mistake with a reagent is only a small promise broken. Denatharion's students come to me in tears when they have wasted a seed, and I give them another and tell them to be more careful." },
      },
      choices = {
        { text = "You're a kind teacher.", next = "cy_kind" },
        { text = "I'm a druid. I've wasted seeds myself.", next = "cy_kind", when = { class = "DRUID" } },
      },
    },
    cy_kind = {
      lines = {
        { id = "cy_kind_1", text = "I am only a supplier, but a supplier can be kind. Fylerian Nightwing scolds them, and I comfort them, and between us they become druids, which is all either of us wants." },
      },
      choices = {
        { text = "A good balance.", next = "BACK" },
        { text = "Something else, Cyroen.", next = "BACK" },
      },
    },
    promise = {
      lines = {
        { id = "promise_default", text = "Because a working that needs one is asking you to give something up. A seed that might have been a tree is spent to call a friend back to life. I think that the old druids arranged it so on purpose, so that we should not do great things lightly." },
      },
      choices = {
        { text = "A wise design. Power should cost something.", next = "BACK", reply = "So I believe. I count them out slowly, so that the buyer may think it over.", fx = { align = { order = 1 } } },
        { text = "It's only a toll. I'd do without it if I could.", next = "BACK", reply = "Many would. I have noticed that those who say so run out the soonest.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    most = {
      lines = {
        { id = "most_default", text = "Seeds, for the rebirth, and by the hundred, since Ashenvale. Then the thornroot and the wild berries, for the blessings that they lay on a company before a fight. I used to sell a pouch in a month. I now sell one in a day, to druids younger than any I had ever served." },
      },
      choices = {
        { text = "The war is spending your seeds.", next = "most2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    most2 = {
      lines = {
        { id = "most2_default", text = "It is, and each one is somebody who fell and was called back. So I cannot grudge them. But I gather the seeds myself, from the ironwoods at the foot of the Enclave, and those trees give only what they give. I have begun asking the students to bring back what they do not use, and a few of them do." },
      },
      choices = {
        { text = "I'll return any I don't need.", next = "BACK", reply = "Thank you. The trees will not know of it, but I shall.", fx = { affinity = 1, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enclave = {
      lines = {
        { id = "enclave_default", text = "It is quieter than it ought to be. The druids come and go with their eyes down. The Arch Druid is short with everyone, and those who would speak for patience, like Mathrengyl Bearwalker, choose their words with care. I only sell seeds, but I can hear a silence as well as anyone." },
      },
      choices = {
        { text = "What is everyone silent about?", next = "enclave2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enclave2 = {
      lines = {
        { id = "enclave2_default", text = "The tree, friend. It was grown without the blessing of the Aspects, and some say that it is not well. Others say that to speak so is disloyal. I do not know. I know that my ironwoods bear fewer seeds than they did, and that I have told nobody but you and Denatharion." },
      },
      choices = {
        { text = "I'll hold that carefully. Something else.", next = "BACK", fx = { learn = { "teldrassil" }, trait = { discreet = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Then you have been where it is bad. Sit down. There is no shame in a pouch that empties quickly, for it means that you were needed. But the working takes something from the one who does it, and no seed pays that part. Rest, before you go back." },
      },
      choices = {
        { text = "I will rest. Thank you, Cyroen.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "Fandral Staghelm does not care to see the tools of the arcane in the Enclave, and he has said so. But the Alliance's mages fight for Ashenvale beside our druids, and they need their powders. So I keep them, and I keep them low. I do not think of it as defiance. It is only shelving." },
      },
      choices = {
        { text = "Well shelved. Thank you for it.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "cenarion_circle" } } },
      },
    },
    w_self = {
      lines = {
        { id = "w_self_default", text = "A single seed of the old forest, from a tree that stood in Ashenvale before the Sundering. It will never be planted, because there is no soil left that it remembers, and I keep it in a small wooden box behind the counter." },
      },
      choices = {
        { text = "Why keep a seed you'll never plant?", next = "w_self2" },
        { text = "That seed must be very old.", next = "w_self2" },
      },
    },
    w_self2 = {
      lines = {
        { id = "w_self2_default", text = "Because it is a promise that was never kept, and I think somebody ought to hold one of those, so that we remember how many there were. The druids would call it sentiment. I call it bookkeeping of a gentler kind." },
        { id = "w_self2_w1", when = { class = "DRUID" }, text = "You may feel it if you hold the box; most druids say it is very faint and very far away, like a voice at the bottom of a well." },
      },
      choices = {
        { text = "Some things should be remembered.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Cyroen.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell reagents in the Cenarion Enclave. I gather the seeds myself, from the ironwoods at its foot." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The Enclave is quieter than it should be. I sell seeds to druids who keep their eyes down." } },
    teldrassil = { { id = "tp_teldrassil", text = "My ironwoods bear fewer seeds each year. I have told Denatharion, and now I have told you." } },
    warsong = { { id = "tp_warsong", text = "I once sold a pouch of seeds in a month and now I sell one in a day. Each seed is somebody who fell in Ashenvale." } },
    advice = { { id = "tp_advice", text = "Count your reagents before the fight and not during it. And bring back what you did not need." } },
    _none = { { id = "tp_none", text = "I do not know, friend. Mathrengyl Bearwalker may, and he is gentle with questions." } },
  },
}

---------------------------------------------------------------------------
-- Ellaercia
---------------------------------------------------------------------------
P:NPC {
  key = "ellaercia", id = TODO_NPC("Ellaercia"), name = "Ellaercia", title = "Guild Tabard Designer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "decisive", "artistic" }, values = { "meaning", "loyalty" },
  notices = { "race", "class" },

  impression = {
    first = "Ellaercia designs guild tabards in Darnassus with a decisive, artistic eye. She will not begin a design until she has been told what a company is for, and she listens hard to the answer.",
    third = "{name} met Ellaercia, the guild tabard designer of Darnassus.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Good day, friend. Tell me your company's name, and I'll design something splendid." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Good day. Tell me what your company stands for. Quickly." },
    { id = "g_hello", text = "Good day. I design the tabards that companies wear. Before we speak of colours, tell me what your company has sworn to do." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Does the emblem still fit what your company has become? They change, and the cloth ought to follow." },
    { id = "g_out", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "A guest of the Alliance. Your peoples love their heraldry, I know. I shall do my best not to put a lion on it." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You will ask me for a lion, or a sword, or a lion holding a sword. Nearly every human does. I shall draw it, and then I shall draw something better, and you may choose." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You will be wearing this over armor, and in the front rank. Then the emblem must be read at a hundred paces by a frightened friend. That rules out most of what people ask me for." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ellaercia. Lysheana registers the guilds of Darnassus, Shalumon sells the cloth, and I design what is to be put on it. A tabard is a promise worn on the outside, and I try to see that the promise can be read." },
      },
      again = {
        { id = "h_again", text = "What else would you have on your banner?" },
        { id = "h_again2", text = "Tell me more. A good tabard begins with listening to the ones who will wear it." },
        { id = "h_again3", text = "Yes? Tell me what your company stands for." },
      },
      choices = {
        { text = "A tabard should show what a company stands for.", next = "BACK", reply = "It should. A company that cannot say in colour what it believes will not say it in battle either.", fx = { align = { honor = 1 } } },
        { text = "A tabard is just colours.", next = "BACK", reply = "Then pick any colours.", fx = { align = { honor = -1 } } },
        { text = "I'd like a tabard designed.", next = "BUSINESS" },
        { text = "Why ask what a company has sworn?", next = "sworn" },
        { text = "What makes an emblem good?", next = "good" },
        { text = "How do you three share the work?", next = "three" },
        { text = "Draw me the something better.", next = "xhuman", when = { race = "Human" } },
        { text = "What reads at a hundred paces?", next = "xwar", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "What's the worst design you ever refused?", next = "w_worst" },
        { text = "Thank you, Ellaercia. Farewell.", next = "END" },
      },
    },
    sworn = {
      lines = {
        { id = "sworn_default", text = "Because the emblem must say it. A company that is sworn to defend Ashenvale should not wear a purse. A company of merchants should not wear a glaive. People come to me wanting what looks fierce, and I ask them what they are, and quite often they do not know." },
      },
      choices = {
        { text = "What do you do when they don't know?", next = "sworn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sworn2 = {
      lines = {
        { id = "sworn2_default", text = "I send them away to decide. Some are offended by that. But I have seen companies break apart within a season because half of them thought that they had joined for glory and the other half for coin. If my question makes them have that quarrel a little early, I have done them a service." },
      },
      choices = {
        { text = "You have. A banner should mean something.", next = "BACK", reply = "Lysheana says the same, across the room, and rather more sternly.", fx = { align = { order = 1 } } },
        { text = "It's only cloth. Let them wear what they like.", next = "BACK", reply = "They may. I shall draw it, and take their coin, and think my own thoughts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = {
        { id = "good_default", text = "A good one has one shape, and two colours, and nothing that needs to be explained. The Sentinels' crescent is perfect, and a child can draw it in the dirt. The worst that I was ever asked for had a dragon, a tower, a rose and a motto. I told them that they had described a wall hanging." },
      },
      choices = {
        { text = "And did you make it?", next = "good2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good2 = {
      lines = {
        { id = "good2_default", text = "I made the rose. Only the rose, in white on dark green. They came back a year later to thank me. People had begun to call them the White Rose, and they had not had a name before that which anyone could remember. An emblem that becomes a name has done all that it can do." },
      },
      choices = {
        { text = "One shape, well chosen. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    three = {
      lines = {
        { id = "three_default", text = "Lysheana asks them their purpose, and writes it down, and frightens them a little. Shalumon talks to them about colour until they are tired. By the time they reach me they are ready to be told what they want. I think that we arranged it so by accident, a long time ago." },
      },
      choices = {
        { text = "Is Shalumon as particular as they say?", next = "three2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    three2 = {
      lines = {
        { id = "three2_default", text = "He is worse. He once kept a guild master for an hour over the difference between two blues. But he was right, since one of them goes grey in the rain. He is hurt when people hurry him, and so I tell my customers to allow a morning. They do not believe me, and then they lose a morning." },
      },
      choices = {
        { text = "I'll allow the morning. Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    xhuman = {
      lines = {
        { id = "xhuman_default", text = "Very well. Here is your lion. It is a good lion. And here is a single paw print, in gold. It is the same beast, but the eye takes it in at once, and no other company in Stormwind will be wearing it. Look at each of them from the far side of the room, and then tell me." },
      },
      choices = {
        { text = "The paw. You were right. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "Light on dark, or dark on light, and nothing between. A plain shape, with no fine lines. And it should be set high on the chest, where it shows above a shield. I look at every design through a piece of smoked glass before I pass it, for that is very nearly how it will look in battle." },
      },
      choices = {
        { text = "Smoked glass. That's a clever test.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    w_worst = {
      lines = {
        { id = "w_worst_default", text = "A company that wanted a dragon breathing fire over a burning forest, in Darnassus, in red and gold. I asked them what they were sworn to, and they said glory, and I told them that I could not draw glory, only what they did to get it." },
      },
      choices = {
        { text = "Did they find someone else?", next = "w_worst2" },
        { text = "That's harsh for a tabard maker.", next = "w_worst2" },
      },
    },
    w_worst2 = {
      lines = {
        { id = "w_worst2_default", text = "A human in Stormwind made it for them, and they wore it to Ashenvale, and the Sentinels at Astranaar would not let them past the bridge. They came back to me a season later and asked for an oak leaf on green, and I made it gladly." },
        { id = "w_worst2_w1", when = { race = "Human" }, text = "No offence to your city's craftsmen, of course. I am told they will draw anything at all, which is a kind of courage." },
      },
      choices = {
        { text = "An emblem should tell the truth.", next = "BACK", fx = { align = { order = 1 } }, reply = "It should, and it should tell it to strangers at a distance, which is harder." },
        { text = "A company's emblem is its own business.", next = "BACK", fx = { align = { order = -1 } }, reply = "It is, until they wear it where others must look at it." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I design guild tabards in Darnassus. Lysheana registers the guilds and Shalumon sells the cloth." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels' crescent is the best emblem I know. A child can draw it in the dirt, and an enemy knows it at a league." } },
    warsong = { { id = "tp_warsong", text = "I have designed for more companies in this past year than in the hundred before it. Nearly all of them were bound for Ashenvale." } },
    advice = { { id = "tp_advice", text = "Decide what your company is for before you decide what it wears. The second is easy, once the first is done." } },
    _none = { { id = "tp_none", text = "That is no matter for a tabard. Ask Lysheana, who asks better questions than I do." } },
  },
}
