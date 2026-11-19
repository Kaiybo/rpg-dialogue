-- Booty Bay: the Steamwheedle Cartel's port, kept by the Blackwater Raiders. Voice: bibles/stranglethorn.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "revilgaz", id = TODO_NPC("Baron Revilgaz"), name = "Baron Revilgaz",
  bible = "bibles/stranglethorn.md", role = "noble", tier = "major",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "ambitious", "proud" },
  notices = { "purse", "kit" },

  impression = {
    first = "He was perfectly civil, and I felt distinctly priced.",
    third = "{name} was received by Baron Revilgaz, who keeps Booty Bay for the Steamwheedle Cartel and counts its ships and coins from his balcony.",
  },

  greetings = {
    { id = "g_op_trolls", when = { gossip = { topic = "trolls", stance = "hate" } }, text = "My Bruisers tell me you called the trolls savages, and to the Zandalari emissary's face. Brave of you, friend, and bad for business, so next time do it outside my harbor." },
    { id = "g_op_venture", when = { opinion = { topic = "venture_company", stance = "useful" } }, text = "Ah, my friend with an eye for cheap lumber! Come in, come in; a person who knows a bargain is always welcome on my balcony." },
    { id = "g_balcony", text = "From this balcony I can count every ship in the cove and most of the coins coming off them, and my time up here runs about a gold piece a minute. So state your business, friend, and keep it profitable." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Good, good; repeat business is the only kind I trust, and it's the only kind that pays the overhead." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors on my balcony? That doesn't trouble me in the least, pal, because gold doesn't wear a tabard and neither does my ledger." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been gone {away}, and I counted every ship in the cove while you were. Now I'll count you too, so state your business before the meter starts." },
    { id = "g_away_long", when = { away = 60 }, text = "After {away} away I'd marked you down as a lost account and written you off at a loss. Repeat business is still the only kind I trust, so consider the account reopened, with interest." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a good deal more valuable since we last spoke, and I've adjusted your entry upward. I notice these things, since it's my job to know what everyone's worth to the copper." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I'm told someone in the Bay was taken in by your tongue. I don't object to a clever deal, by my last copper I don't, but I'd rather it weren't done in my harbour without my cut." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked someone into seeing things your way. That's the sort of skill the Steamwheedle pays well for, so keep me in mind before you sell it to anybody cheaper." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You jingle when you walk, and Booty Bay is very fond of people who jingle, friend. Just try not to do it near the docks after dark, because that sound carries and everybody here can price it." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Empty pockets, in my town? That's dangerous, since people here will assume you mean to fill them from theirs, and I'd have to bill somebody for the cleanup." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there chewed on you and didn't pay for the privilege. There's a smith along the boardwalk who takes coin and asks no questions, and repairs are cheaper than funerals." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "A cat on my balcony! If you're after the parrot, it bites, and it's insured for more than you are." },
  },

  start = "hello",
  nodes = {
    dd_rev_ex = {
      lines = {
        { id = "dd_rev_ex_a", text = "Talk about you? They keep a whole ledger, friend, with your name on the cover and every pirate you've sunk on the pages inside. In Booty Bay, a good name is worth more than a full hold, because a full hold can be stolen and a name can't." },
      },
      choices = {
        { text = "I'll keep earning it, Baron. Booty Bay's been good to me.", next = "dd_rev_ex2", fx = { align = { honor = 1 } } },
        { text = "A good name's nice. Good coin is nicer.", next = "dd_rev_ex2", fx = { align = { honor = -1 } } },
      },
    },
    dd_rev_ex2 = {
      lines = {
        { id = "dd_rev_ex2a", text = "Ha! Spoken like somebody who's spent time on my docks, and I like both answers, because both of them keep you coming back. Now go and spend some of that coin in my port before the Cartel thinks I'm going soft." },
      },
      choices = { { text = "Something else, Baron.", next = "BACK" } },
    },

    op_venture = {
      lines = {
        { id = "opv_default", text = "They answer to whoever's paying this quarter, and right now that's the saw business. They're stripping the north of this jungle bare, and half my customers love the cheap lumber while the other half curse them. Which half are you, friend?" },
      },
      choices = {
        { text = "They're thieves with saws, and the jungle pays for it.", next = "op_venture_hate", fx = { affinity = -1, align = { light = 1 }, opinion = { venture_company = "hate" } } },
        { text = "They're doing what the Cartel did here, only bigger.", next = "op_venture_admire", fx = { affinity = 1, align = { light = -1 }, opinion = { venture_company = "admire" } } },
        { text = "Cheap lumber is cheap lumber. I'd buy it.", next = "op_venture_useful", fx = { trait = { greedy = 1 }, opinion = { venture_company = "useful" } } },
        { text = "The Horde will run them out of the Barrens soon enough.", next = "op_venture_war", fx = { opinion = { venture_company = "war" } }, when = { faction = "Horde" } },
        { text = "I'll keep my half to myself, Baron.", next = "BACK" },
      },
    },
    op_venture_hate = {
      lines = {
        { id = "opvh_default", text = "Thieves! Friend, everyone on this coast is a thief, and the Venture lot just keep worse books. Say it a little quieter in the Salty Sailor, though, because they drink there too and they tip." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_venture_admire = {
      lines = {
        { id = "opva_default", text = "Bigger, yes, and sloppier, and that's the part that worries me. A goblin who forgets the trolls are watching ends up a footnote in somebody else's ledger." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_venture_useful = {
      lines = {
        { id = "opvu_default", text = "Now that's a customer talking! Cheap is the most beautiful word in Orcish, Common and Goblin, and I'll be glad to sell you the rope to tie it up with." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_venture_war = {
      lines = {
        { id = "opvw_default", text = "Then I'll sell your grunts the axes and the Venture lot the bandages, and we'll all part friends. Don't look at me like that; it's called diversifying." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_revilgaz = {
      big = true,
      lines = { { id = "xpt_revilgaz_default", text = "Honest is a word I hear twenty times a day from people standing on my docks, and I've learned to value it at about a copper an ounce. Still, a crew that keeps its word is worth more to me than any cargo, because the Bloodsail would have this whole bay if the honest ones ever went home, and that's a loss I can't insure." } },
      choices = {
        { text = "Then you'll find us good to our word, Baron.", next = "BACK", reply = "We'll see, friend, because the ledger has a long memory and I read it every night. Keep your word and you'll find mine is good too, at the usual rates.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honesty is for people without enemies. We do what pays.", next = "BACK", reply = "Ha! Now that's the most honest thing anyone's said on my balcony all week. I'll charge you accordingly, and watch my purse while you're here.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Fallen is a strong word for a city that size, but its god is gone, and that god was what kept the priests united. Every goblin in this cove has money riding on the trolls staying at each other's throats, and I don't plan to lose that bet now, by my mother's ledger." } },
      choices = {
        { text = "Then trade with them fairly, and help the jungle find its peace.", next = "BACK", reply = "Peace is good for business, I'll grant you, and a calm jungle buys more rope. I'll trade fair with whoever's left standing, as I always do.", fx = { align = { honor = 1 } } },
        { text = "Keep them divided, Baron. Divided trolls are good for business.", next = "BACK", reply = "My dear friend, you've just described the last forty years of Steamwheedle policy. I'll pretend I didn't hear you say it out loud.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Somebody will try to claim Zul'Gurub now.", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "The jungle, if nobody's quick about it, but the Zandalari have been sailing in and out of Yojamba Isle with more interest than a moneylender. They're trolls too, and old ones who pay their harbor fees, and I'd sooner deal with them than with whatever the priests were feeding." } },
      choices = {
        { text = "The Zandalari seem honest enough. Something else, Baron.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Booty Bay has room for anyone who pays the dock fees, and the fees are very reasonable for what you get. Still, a Bronzebeard who talks to the weather could be worth a fortune to the Cartel, so tell me, friend, who else is bidding for you?" } },
      choices = {
        { text = "I'm not for hire, Baron. The spirits aren't merchandise.", next = "BACK", reply = "Not merchandise, no, but very good for morale, and morale sells. Keep your spirits, friend, and keep paying your dock fees.", fx = { align = { honor = 1 } } },
        { text = "I'll hear your offer, Baron. Name a price.", next = "BACK", reply = "A shaman who negotiates, now that's refreshing! Calm my harbour for a season and we'll talk numbers over something expensive.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When the Bloodsail get bold, I hire anyone who can hold a gangplank, and I pay by the day rather than by the head, because heads are far too easy to fake. What I cannot abide is a sellsword who changes ships halfway through the fight, since that's a breach of contract and I always collect on those." } },
      choices = {
        { text = "Once I take a contract, I hold it to the end.", next = "BACK", reply = "That's the kind of contract I like to sign, friend. Hold the gangplank to the last and the Cartel remembers your name fondly.", fx = { align = { honor = 1 } } },
        { text = "I fight for the best offer, and offers change.", next = "BACK", reply = "Then you'll fit right in on these docks, and I'll make sure my offer is always the best one, until it isn't. That's business.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Pelts for Gadgetzan, tusks for Ratchet, and panther skins for every lord in Stormwind who wants a rug that snarls, all at a very healthy markup. The jungle is a warehouse with teeth, and you lot are the ones brave enough to open the doors." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Pelts for Gadgetzan, tusks for Ratchet, and panther skins for every lord in Stormwind who wants a rug that snarls, all at a very healthy markup. The jungle is a warehouse with teeth, and you lot open the doors. Your {pet} looks well fed, which means it's either a fine hunter or it's been eating my dock rats, and I'm grateful either way." },
      },
      choices = {
        { text = "I hunt fair, Baron, and I won't strip a jungle for coin.", next = "BACK", reply = "Fair hunting, eh? Very noble, and the lords in Stormwind will still buy whatever you bring me. Strip nothing, sell me something.", fx = { align = { honor = 1 } } },
        { text = "If it pays, it's a pelt. Point me at your buyers.", next = "BACK", reply = "Now that's a hunter who understands the market! My factor on the lower dock will give you the current prices, minus my modest cut.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Mend the ward-lanterns on the outer piers, for a start, because the Bloodsail keep sending something across the water at night that my Bruisers can't hit with a club. The Cartel pays well for magic that keeps the cargo dry and the pirates wet, and I'll put that in writing." } },
      choices = {
        { text = "A contract's a contract. I'll keep your lanterns lit.", next = "BACK", reply = "Splendid, a caster who reads a contract! Keep my lanterns lit and you'll never pay full price for a grudge in this town.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll work for whoever pays the most that night.", next = "BACK", reply = "Then I'll make sure I'm the highest bidder on the nights that matter, friend. Loyalty is just a long-term discount.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Cartel asks the ledger, and the ledger always answers. Still, when a storm sinks one of my cargoes, I do wonder whether the competition paid off your elements, so I'd rather keep a shaman on good terms, at a reasonable retainer." } },
      choices = {
        { text = "The elements can't be bought, Baron, and nobody should try.", next = "BACK", reply = "A pity, really, because I'd pay handsomely for fair weather. I'll keep asking the ledger, and you keep asking the sky.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything has a price in Booty Bay, the storms included.", next = "BACK", reply = "Ha! Now there's a shaman after my own heart, and I'll put it in writing if you ever find the storms' agent. Twenty percent to the Cartel, naturally.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The jungle grows back, friend, and so does the profit, which is the beauty of it. The Venture Company is the one with the saws, not the Steamwheedle, so if you want to fight someone over trees, I'll gladly point you at them and charge nothing for the directions." } },
      choices = {
        { text = "Then I'll stop the Venture Company's saws.", next = "BACK", reply = "Stop the Venture Company and I'll toast you from this balcony, friend, quietly, because they're also customers. Rivals are lovely when somebody else handles them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Profit and saws, it's all the same to the jungle.", next = "BACK", reply = "Exactly, friend, the jungle doesn't keep a ledger, so somebody has to. I'm glad we understand each other.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Now and then, to ward a vault or freeze a cargo of fish on the way to Ratchet, and I pay them exactly what the ledger says it's worth. The trouble with mages is that they always think their time is worth more than anyone else's, and the ledger, bless it, always disagrees." } },
      choices = {
        { text = "My craft is worth what I say it is, Baron.", next = "BACK", reply = "And I'll pay you what you say, friend, after my accountant has said what he says. We'll meet somewhere in the middle, near my side.", fx = { align = { order = -1 } } },
        { text = "A fair price for fair work. I'll match your ledger.", next = "BACK", reply = "A mage who matches the ledger is a mage I'll hire twice. Come and see me when the next fish cargo needs freezing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Baron.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It counts for exactly what it brings in, which is plenty, because a paladin on the pier makes the Bloodsail think twice and the sailors pay their tabs. I don't care whose blessing keeps the peace, only that it holds long enough for the next ship to unload and the next invoice to clear." } },
      choices = {
        { text = "Then I'll keep your peace, Baron, and the Light will do the rest.", next = "BACK", reply = "Splendid, a paladin who keeps the peace is worth three Bruisers on a busy night. The Light can send me the invoice.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I serve the Light, Baron, not your ledger.", next = "BACK", reply = "Of course, friend, and the Light is welcome to dock here too, at the usual fee. The ledger doesn't mind who you serve.", fx = { align = { order = -1 } } },
        { text = "Something else, Baron.", next = "BACK" },
      },
    },
    xalt_revilgaz = {
      lines = {
        { id = "xalt_revilgaz_default", text = "A customer of mine, and a good one, which in Booty Bay means someone who settles the account before the ship sails. I keep a page for every face that crosses these piers, friend, and {alt}'s page and yours are starting to look like the same handwriting." },
        { id = "xalt_revilgaz_other", when = { alt = { faction = "other" } }, text = "{alt}, a {altrace} under the other banner, and a better customer than most of the captains who tie up under my balcony. The Cartel doesn't care which side of the war a coin comes from, and I'll admit I enjoy charging what looks like the same family twice, once in each color." },
      },
      choices = {
        { text = "A port that treats both sides the same keeps the peace. Good.", next = "BACK", reply = "It does, friend, and it keeps my coffers full, which keeps the peace, which keeps the coffers full. A beautiful cycle, really.", fx = { align = { order = 1 } } },
        { text = "Fees and ledgers. My kin and I go where we please, Baron.", next = "BACK", reply = "Then go where you please, friend, and pay the fee when you get here. Booty Bay welcomes everyone, at a price.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_exalted_rev", when = { reputation = { faction = "Booty Bay", min = "exalted" } },
          text = "Well, if it isn't Booty Bay's favourite customer! My accountants tell me you've done more for this port than half my bruisers put together, and I pay my bruisers very well, so that's a compliment worth its weight in gold." },

        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Funny thing, friend, but I had a {altrace} called {alt} on this balcony not long ago, flying the other banner and haggling over the very same dock fees. You've the same look about the eyes, the one that says the fee is negotiable, and I'll tell you what I told {alt}, which is that it isn't." },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" }, metBefore = false },
          text = "You've a relative who's been through my port, I think, a {altclass} by the name of {alt}, who paid on time and broke nothing. If that runs in the family you're welcome on my piers, and if it doesn't, the Bruisers will let me know soon enough." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = true },
          text = "I was just telling my ledger about {alt}, who's been through again and is moving cargo on a scale you'd envy. Somebody of your acquaintance, unless I miss my guess, because you both stand on my balcony like you own a share of it." },
        { id = "h_pt_revilgaz", tags = { "news" }, when = { party = { size = 4 } },
          text = "A whole crew walks into my town, and I don't recall signing your papers. Booty Bay welcomes any crew that pays its dock fees in full and settles its fights outside the harbor, where the damages aren't mine." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub" }, text = "Word reached my balcony that Hakkar is dead in Zul'Gurub and the Gurubashi priests are scattering into the jungle. That's good for shipping and bad for the price of troll relics, and I'm still running the numbers on which matters more." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my balcony, polished to a shine. The Light is welcome in Booty Bay, friend, provided it pays its docking fees like everyone else, and I don't take blessings in lieu of coin." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde under my balcony. Keep your lightning away from my ships, because I've seen what one bolt does to a powder hold, and we'll get along nicely." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde under my balcony. Whatever you pray to, ask it to keep the Bloodsail off my harbor, and I'll pay a fair tithe on results." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock on my balcony. Keep whatever you've summoned on a short leash, because the Bruisers can't tell a demon from a drunk and won't try, and the property damage goes on your bill." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "I know a cutpurse's walk when I see one, pal. Booty Bay tolerates thieves who pay their dues on time, and it drowns the ones who don't, which saves on paperwork." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid in Booty Bay. If you're here to lecture me about the jungle, I'll warn you now that I've heard it, and I charge for listening." },
        { id = "h_default", key = true,
          text = "Baron Revilgaz, at your service for a reasonable fee. This port belongs to the Steamwheedle Cartel and I keep it for them, so the Blackwater Raiders hold the water, the Bruisers hold the peace, and I hold the books." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Seahorn says the Bloodsail are planning something against my town. They've hated us for years, which is just the cost of doing business, but planning is new, and new is never cheap." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "There's an island off the coast the captains won't go near anymore. Something there scares sailors, and scared sailors don't carry cargo, and cargo that doesn't move doesn't pay, so find out what it is." },
        { id = "h_tides", when = { any = { { questActive = TODO_QUEST("Water Elementals") }, { questActive = TODO_QUEST("The Curse of the Tides") }, { questActive = TODO_QUEST("The Stone of the Tides") } } },
          text = "Now, this business with the cursed Stone of the Tides. I don't pretend to understand the magic, but I understand exactly what it's costing me, down to the copper, every single day." },
        { id = "h_ledger", when = { metBefore = true }, text = "Eleven ships in, nine out, and two the Bloodsail will want to know about. The ledger never sleeps, friend, and on a good quarter neither do I." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Lanterns on every deck, music on every pier, and somebody about to fall in and sue. It's the same every night, and I'd miss it if it stopped, mostly for the dock fees." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "Back again, and still not spending much. My balcony is for paying customers, friend, so make your question worth the climb and the overhead." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, on my balcony. I've had three of your kind offer to ward my vault, and each one quoted a price that made Viznik weep, so I'll hear your offer with a straight face and a firm hand on my purse." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, all plate and patience. The Bruisers keep the peace on my piers, but I always find room in my ledger for someone who can hold a line when the Bloodsail come calling, at day rates." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, with the jungle still on your boots. Kebok downstairs deals in pelts and tusks, and somehow a sliver of every deal finds its way into my ledger, so happy hunting, and hunt big." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman under my balcony, now that's a novelty worth a line in the ledger. Keep your lightning away from my ships, and we'll get along nicely." },
      },
      again = {
        { id = "h_again", text = "Go on, go on. Every minute on this balcony is a minute I'm not counting something, and that adds up." },
        { id = "h_again2", text = "Something more? I bill by the question, you know, and I'm only mostly joking about the rate." },
        { id = "h_again3", when = { townStanding = { town = "booty_bay", min = 30 } }, text = "Ask away. You've earned a little of my time on account; this town vouches for you." },
      },
      choices = {
        { text = "Your accountants talk about me, Baron?", next = "dd_rev_ex", when = { reputation = { faction = "Booty Bay", min = "exalted" } } },

        { text = "Does the Cartel ever ask the spirits anything, Baron?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What could a spellcaster do for Booty Bay, Baron?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Your cartels are stripping the jungle bare.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Who are the Bloodsail?", next = "bloodsail" },
        { text = "What does the Cartel want with a jungle?", next = "cartel" },
        { text = "Keeping the peace between Alliance and Horde here can't be easy.", next = "peace" },
        { text = "What's your opinion of me, Baron?", next = "ledger", when = { metBefore = true } },
        { text = "Stormwind could use a port like this.", next = "stormwind", when = { faction = "Alliance" } },
        { text = "The Horde's ships dock here too. Do you trust them?", next = "horde", when = { faction = "Horde" } },
        { text = "Is there a chapel anywhere in Booty Bay?", next = "priest_chapel", when = { class = "PRIEST" } },
        { text = "What does a rogue owe the Baron, working his docks?", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "This was troll country before it was Cartel country, Baron.", next = "k_troll", when = { race = "Troll" } },
        { text = "Will the Baron rent rooms to a warlock who pays in advance?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "The Cartel must hire mages now and then, Baron.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you ever hire warriors to guard the Cartel's cargo, Baron?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What does the Cartel make from the jungle's beasts, Baron?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does the Light count for anything in a Cartel port, Baron?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Booty Bay have room for a dwarf shaman, Baron?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Hakkar is dead, Baron. Zul'Gurub has fallen.", next = "xcl_zg", when = { cleared = "Zul'Gurub" } },
        { text = "We're no pirates, Baron. We're honest adventurers.", next = "xpt_revilgaz", when = { party = { size = 4 } } },
        { text = "You mentioned someone who looks like me, Baron. Who?", next = "xalt_revilgaz", when = { alt = true } },
        { text = "I built bombs for the Cartel here, Baron. It ended badly.", next = "xorig_bombs", when = { origin = "gnome_goblin_bombmaker" } },
        { text = "Good day, Baron.", next = "END" },
      },
    },
    xorig_bombs = {
      lines = {
        { id = "xobombs_default", text = "I remember, and so does my ledger, because that contract's still marked 'disputed' in red ink. I'm not one to hold a grudge when a grudge doesn't pay, though, and a gnome who can make powder behave is worth more to me than an old invoice. Are you looking for work, or just passing through?" },
      },
      choices = {
        { text = "Looking for work, Baron, if the pay's honest.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "Passing through. I'm done with powder.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "Pirates, and not our sort of pirate, the sort who pays dues. They raid anything that floats and they've never forgiven us for turning a profit, so if you're fighting them, I'm paying." },
      },
      choices = {
        { text = "Then I'm fighting them.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "What's the difference between them and your Raiders?", next = "bloodsail_diff", fx = { trait = { skeptical = 1 } } },
        { text = "Just asking.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    bloodsail_diff = {
      lines = {
        { id = "bd_default", text = "Receipts, mainly. My Raiders take what they're owed and write it down, while the Bloodsail take everything and burn the paper, and civilization, friend, is mostly receipts." },
      },
      choices = {
        { text = "That's a thin line.", next = "bloodsail_line", fx = { align = { honor = 1 } } },
        { text = "I like the receipts.", next = "BACK", reply = "Everyone likes the receipts, friend, they're the difference between a pirate and a businessman. Mine are very nicely printed.", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    bloodsail_line = {
      lines = { { id = "bl_default", text = "It's a line with a town on one side and a burning ship on the other. Thin is fine, so long as I can count it and bill for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cartel = {
      lines = {
        { id = "c_default", text = "Goblins took this cove from the trolls before anyone here had heard the word orc, and we built a town in a shark's mouth and made it pay. Everyone's welcome as long as they spend, and spend here." },
      },
      choices = {
        { text = "Hard to argue with that.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } },
        { text = "And the trolls you took it from?", next = "cartel_trolls" },
        { text = "Even a baron must answer to somebody.", next = "cartel_boss", fx = { trait = { curious = 1 } } },
      },
    },
    cartel_trolls = {
      lines = {
        { id = "ct_default", text = "They're still out there, still angry, and still terrible at accounting. I don't lose sleep over the trolls; I save that for the Bloodsail, who at least understand what they're stealing." },
      },
      choices = {
        { text = "That's cold.", next = "BACK", reply = "Cold? Friend, it's a tropical port, nothing here is cold but my vault. The trolls had their chance at a ledger and they chose spears.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Trolls who raid ships get what they deserve.", next = "BACK", reply = "My thinking exactly, and they get it at a very reasonable rate. Raid my ships and the Raiders deliver the bill in person.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    cartel_boss = {
      lines = {
        { id = "cb_default", text = "The Cartel's trade princes, in principle, but in practice I answer to the number at the bottom of the quarterly report. If it's a good number, nobody visits from Undermine, and I very much prefer it when nobody visits." },
      },
      choices = {
        { text = "And the Venture Company? They answer to princes too.", next = "op_venture" },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },

    peace = {
      lines = {
        { id = "p_default", text = "Simply enough, and cheaply. Anybody who draws steel on my boardwalk meets the Bruisers, and nobody likes meeting the Bruisers, so the war stays outside the shark's teeth where it can't break the furniture." },
      },
      choices = {
        { text = "And if a war comes through those teeth anyway?", next = "peace_war" },
        { text = "Neutral ground suits me fine.", next = "BACK", fx = { affinity = 1, opinion = { peace = "for" } } },
      },
    },
    peace_war = {
      lines = {
        { id = "pw_default", text = "Then I'll sell both sides the boats to leave in, at wartime prices. Neutral doesn't mean blind, friend; it means I keep the receipts for everyone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "The Bloodsail want more than your town, Baron. They want you.", tag = "Persuade", next = "knives",
          check = { pass = { any = { { disposition = { min = 65 } }, { reputation = { faction = "Steamwheedle Cartel", min = "honored" } }, { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } } },
          fail = { next = "knives_no", fx = { affinity = -1 } } },
      },
    },

    ledger = {
      lines = {
        { id = "l_default", text = "You're a line item, and a small one for now. Pay your tab and don't start fights, and the line gets longer and the ink gets blacker." },
        { id = "l_liked", when = { townStanding = { town = "booty_bay", min = 30 } },
          text = "My Bruisers nod when you pass, and Skindle doesn't water your rum. That's about as high as anyone gets in my ledger without owning a ship, so enjoy the view." },
        { id = "l_disliked", when = { townStanding = { town = "booty_bay", max = -20 } },
          text = "You're in red ink, pal. People talk about you on my docks, and not in the way that's good for business, so pay it down before the interest piles up." },
      },
      choices = {
        { text = "I'll keep paying my tab.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not a number, Baron.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    stormwind = {
      lines = {
        { id = "s_default", text = "Stormwind could use a lot of things, a treasury for one. Their ships dock here, they pay and they leave, and that's the arrangement; it's the best one they'll get south of the Vale, I promise you." },
      },
      choices = {
        { text = "Stormwind pays its debts.", next = "BACK", reply = "Eventually, friend, eventually, and with a good deal of grumbling from their nobles. I've learned to add interest for the grumbling.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Stormwind deserves no better than what it pays for.", next = "BACK", reply = "And it pays for very little, friend, which is why its ships dock in my harbour instead of its own. I'm happy to take the difference.", fx = { align = { order = -1 } } },
        { text = "Let's leave Stormwind's purse out of it.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "hd_default", text = "I trust their coin, and coin is the only thing I trust completely. Their sailors drink, fight and pay for the damage, and a few of the Alliance crews could stand to learn that last part." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest_chapel = {
      lines = { { id = "pc_default", text = "A chapel? We have a tavern with a very quiet corner on Tuesdays, so bless the corner if you like, and bless the ledger while you're at it; it could use the help this quarter." } },
      choices = {
        { text = "I'll bless them both.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives = {
      lines = {
        { id = "kn_default", text = "They do, and Seahorn's men have read the letters to prove it. So I sleep in a different room every night and never take the same stair twice, and the Bruiser outside my door thinks he's guarding the ledger, because that's what I told him, and frankly the ledger's worth more." },
        { id = "kn_letters", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "You read the letters yourself, so I won't insult you by playing dumb. They want me and Seahorn floating in the cove, so I sleep in a different room every night now, and the Bruiser outside my door thinks he's guarding the ledger." },
      },
      choices = {
        { text = "Your secret's safe with me, Baron.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives_no = {
      lines = {
        { id = "kno_default", text = "Everybody wants something from me, friend, and the Bloodsail are only louder about it. Pay your tab and leave the worrying to the goblin with the balcony; I'm the one who's paid to do it." },
        { id = "kno_rogue", when = { class = "ROGUE" },
          text = "Is that a warning or a sales pitch? Either way, pal, I don't buy information from people who look like they sell it twice." },
      },
      choices = {
        { text = "Suit yourself, Baron.", next = "BACK" },
      },
    },
    k_rogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "A cut, and a little courtesy. Pick a sailor's pocket on the docks and that's between you and the sailor, but pick one of mine and the Bruisers will find you before you've counted it, because in Booty Bay everything worth stealing already has my name in the ledger." },
        { id = "xro_canal", when = { origin = "human_canal_pickpocket" },
          text = "A canal rat from Stormwind, by those fingers. Stormwind's watch is slow and my Bruisers are not, so pick sailors' pockets if you must and leave mine alone, unless you'd like an invoice for your own funeral." },
      },
      choices = {
        { text = "Then I'll work for you, Baron, not against you.", next = "BACK", reply = "A rogue with manners, how refreshing! Work for me, and you'll find the Baron's protection is the finest money can't quite buy.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Every ledger has a gap, Baron. I'll find yours.", next = "BACK", reply = "And when you find it, friend, I'll have hired you to close it, at a very generous rate. That's how gaps work in Booty Bay.", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "I'd guess your ledger has something to say about me.", next = "ledger" },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "It was, and the Gurubashi will tell you so if you ask them politely through an arrow. The Cartel pays rent in the only coin trolls here take, which is staying out of their temples, and the Darkspear left long before we drove a single nail." },
      },
      choices = {
        { text = "My people will remember who sits on their coast.", next = "BACK", reply = "I'm sure they will, friend, and they'll remember my prices too. The coast stays mine as long as the ledger balances.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Coin is coin. I don't care who built the dock.", next = "BACK", reply = "A troll after my own heart! Coin is coin, and the dock's paid off, so everybody wins.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "What does the Cartel want with a jungle?", next = "cartel" },
      },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "Let you? Friend, I'd let a dragon keep rooms if it paid in advance and didn't eat the staff. Keep your little friend off the balconies and out of the kitchen, and if it sets anything on fire, it's on your bill, itemized." },
      },
      choices = {
        { text = "Fair terms, Baron.", next = "BACK", fx = { affinity = 2 } },
        { text = "My imp has better manners than your Bruisers.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Flattery's the one commodity I'll take delivery of without checking the weight, friend, and yours came in at a decent grade. I've marked you up a line in the ledger, which is more than most visitors to this balcony ever manage." },
        { id = "s2", text = "Now that's a fair appraisal of the finest port south of anywhere, and I ought to know, because I did the building and the billing both. Keep talkin' like that and you'll find the Bay a friendlier place to do business." },
      },
      fail = {
        { id = "f1", text = "I get buttered up by ship captains with unpaid dock fees three times before breakfast, pal, so I know the going rate for a compliment, and yours is priced too high. Try again when there's some coin behind it." },
        { id = "f2", text = "Sweet talk is overhead, friend, and I never pay overhead that doesn't show up as profit somewhere. You can save it for the tavern, where they have to listen." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! It's been a long season since anyone on this balcony had the nerve to haggle with my pride, and I'd nearly forgotten what it costs. You've got cheek, friend, and cheek is an asset I know how to value." },
        { id = "s2", text = "You push like a goblin on a deadline, and I mean that as the highest rating I give. All right, pal, you've got my attention, and you got it cheaper than most." },
      },
      fail = {
        { id = "f1", text = "Careful, friend, because insulting the management carries a surcharge in this town, and my Bruisers collect it by hand. I'll write that one off as a clerical error, once." },
        { id = "f2", text = "I've been mocked by Bloodsail captains with a whole fleet behind them, and they're still out there wanting my town while I'm up here owning it. You'll have to do a great deal better than that to move my prices, pal." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Hm. I've just run the figures on what it'd cost me to have you thrown in the cove against what it'd cost me if you didn't go quietly, and I don't care for the second column. Let's call this a negotiation, friend, and keep our voices down.", narr = "The Baron glances once at the nearest Bruiser, then back at you, and closes his ledger." },
        { id = "s2", text = "A good businessman knows when the risk outweighs the margin, and you, friend, are a larger liability than you looked comin' up the stairs. Say your piece, and I'll listen with both ears." },
      },
      fail = {
        { id = "f1", text = "You're leaning on the wrong goblin, pal, since every Bruiser in Booty Bay draws wages from my purse and they do love earning them. Take a breath, look over the railing at how far down the water is, and start again politely." },
        { id = "f2", text = "Threats are just bad offers with no coin attached, and I turn down bad offers all day long. The Bloodsail have been at it for years, friend, and all they've got to show for it is the bill." },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that happens in this cove ends up in my ledger sooner or later. Ask, and I'll tell you what it says, within reason and within budget." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "You've been good for business, so ask me anything you like; I'll even answer the ones I'd normally bill for, just this once, on account." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "I answer questions for paying customers, and you're barely one. Make it quick, because the clock's running." },
    },
    background = { { id = "tp_bg", text = "Steamwheedle born and Steamwheedle made, friend. I came to this cove with a ledger and a plan, and the ledger's a good deal thicker now." } },
    advice = { { id = "tp_ad", text = "Pay your tab, stay off the Bloodsail's boats, and don't feed the parrot; it bites, and you'll pay for the bandages." } },
    bloodsail = { { id = "tp_bloodsail", text = "They want my town, and they've wanted it since before you were born. They can keep on wanting, because it isn't for sale, and that's the only thing in Booty Bay I'll say that about." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut and leaves me to run things. That's the best arrangement a goblin can ask for, short of owning the Cartel." } },
    booty_bay = {
      { id = "tp_booty_bay", text = "Booty Bay is the finest port south of anywhere, friend, because everyone here has agreed to put down their quarrels and pick up their wallets. I keep it that way, and I charge a little for keeping it." },
      { id = "tp_booty_bay2", when = { faction = "Alliance" }, text = "Your king's navy never managed to make this coast safe, and I did it with a ledger and a company of Bruisers. Stormwind's welcome here, so long as Stormwind pays its dock fees." },
      { id = "tp_booty_bay3", when = { faction = "Horde" }, text = "Your Warchief's people drink beside Stormwind's sailors here and nobody draws steel, because steel is bad for business. That's my doing, and I'm rather proud of it." },
    },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan is Noggenfogger's town, sand and all, and we trade ledgers more often than we trade ships. He's a cousin in the Cartel and a rival in everything else." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet is a fine little port, if you like the Barrens, which nobody does. Gazlowe runs it well enough, and he'd tell you so himself at some length." } },
    everlook = { { id = "tp_everlook", text = "Everlook is the Cartel's coldest venture, and I'm told the goblins up there wear three coats and still complain. It pays, though, and nobody's ever been hurt by a cold profit." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built a kingdom out of a desert and a crowd of angry ex-prisoners, which is a business plan I can respect. His people pay in good coin and mostly keep their axes on their backs." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon runs Stormwind until the boy comes of age, and from what I hear he does it without skimming, which is rare in a capital. He hasn't sent us a navy, though, and I keep the invoice ready." } },
    varian = { { id = "tp_varian", text = "A king goes missing on his way to a peace talk, and nobody finds a body or a ransom note. I've seen ships vanish that way, friend, and it's never the sea that did it." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena is Short John Mithril's show, and every few hours a chest of loot appears in the middle and everyone tries to kill everyone else for it. It's good for trade, terrible for the healers' backs, and wonderful for the betting books." } },
    zul_gurub = {
      { id = "tp_zul_gurub", text = "The Gurubashi priests are trying to bring their blood god back at Zul'Gurub, and the Zandalari have camped on Yojamba Isle to stop them. If Hakkar walks, friend, my insurance rates will become a matter of public concern." },
      { id = "tp_zul_gurub2", when = { disposition = { min = 70 } }, text = "Between us, I've had three ships report strange lights over Zul'Gurub this month, and I've quietly raised the price of passage north. Fear is a commodity, friend, and you sell it fresh, before it spoils in the warehouse." },
    },
    onyxia = { { id = "tp_onyxia", text = "I'm told there's a black dragon in a cave in Dustwallow Marsh, and that she has the decency to stay there. Long may she stay there, I say, because fire insurance is murder." } },
    _gated = {
      { id = "gt1", text = "That entry's in the private ledger, friend, and I only open the private ledger for accounts in good standing. Bring me some business first, and then we'll see what it says." },
      { id = "gt2", text = "I don't discuss that with walk-in trade, pal, because what I know is stock, and I don't hand out stock on credit to strangers." },
    },
    _none = { { id = "tp_none", text = "If it doesn't touch my port or my purse, I don't keep track of it. Krazek does, for a fee, so go and ask him." } },
  },
}

P:NPC {
  key = "seahorn", id = TODO_NPC("Fleet Master Seahorn"), name = "Fleet Master Seahorn",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "booty_bay", "blackwater" }, temper = { "boisterous" }, values = { "brave", "loyal" },
  likesTone = "blunt",
  notices = { "race", "kit" },

  impression = {
    first = "He laughs like a survivor of many bad ideas, mostly his own.",
    third = "{name} met Fleet Master Seahorn of the Blackwater Raiders, a loud, cheerful pirate who answers to the Baron and to no one else.",
  },

  greetings = {
    { id = "g_op_kirintor", when = { gossip = { topic = "kirin_tor", stance = "contempt" } }, text = "Ha! Catelyn told me you called the Dalaran wizards frightened old men under a glass bowl. She laughed so hard she spilled her grog, and she never spills her grog!" },
    { id = "g_deck", text = "Up the stairs and still breathing! That's a good start, for I've watched orcs come down those stairs headfirst." },
    { id = "g_back", when = { metBefore = true }, text = "The tide's brought you back! I like a sailor who can find the way home, which is more than this old bull ever managed with Mulgore." },
    { id = "g_away", when = { away = 14 }, text = "The tide's brought you back after {away} away! I knew a good sailor would find the way home sooner or later." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you put a scare into somebody down on the docks. Save it for the Bloodsail, because the Bay's on your side." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole cove's talking about what you did for us. That's the kind of talk a Fleet Master likes to hear." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, this far from the plains! I traded the grass for the sea long ago and I've never regretted it, save once, in a storm." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been keelhauled twice and dried in the sun. Get that armor patched before the Bloodsail notice." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear on my docks! Your people knew these waters before any goblin put a plank on them, and I'd wager you still know how to read a tide." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear on my top floor! Ha, I've sailed with worse crews than you, but mind the rum." },
  },

  start = "hello",
  nodes = {
    op_pirates = {
      lines = {
        { id = "opp_default", text = "Ha! Depends who's asking and which way the wind's blowing! Kul Tiras says pirate, the Baron says contractor, and I say I'm a tauren with a boat. But you've seen us work, friend, so you tell me." },
      },
      choices = {
        { text = "You keep a code. That makes you honest in my book.", next = "op_pirates_respect", fx = { affinity = 2, align = { honor = 1 }, opinion = { pirates = "respect" } } },
        { text = "A code doesn't change what you take. Pirates are pirates.", next = "op_pirates_hate", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 }, opinion = { pirates = "hate" } } },
        { text = "A free sea and a fat prize? Pirate's a fine word.", next = "op_pirates_admire", fx = { affinity = 1, trait = { brave = 1 }, opinion = { pirates = "admire" } } },
        { text = "A tauren at sea. The Earth Mother must laugh to see it.", next = "op_pirates_admire", fx = { affinity = 1, opinion = { pirates = "admire" } }, when = { race = "Tauren" } },
        { text = "I'll let Kul Tiras and the Baron argue that one.", next = "BACK" },
      },
    },
    op_pirates_respect = {
      lines = {
        { id = "oppr_default", text = "Honest! Did you hear that, Crazz? Honest! I'll have it painted on the Revenge's stern, right under the cannon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_pirates_hate = {
      lines = {
        { id = "opph_default", text = "Ha! Well, you're not wrong, and you're braver than most for saying it on my own pier. Still, the Bloodsail would take your boots and your teeth as well, and we only take the boots." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_pirates_admire = {
      lines = {
        { id = "oppa_default", text = "Now you sound like a sailor! Come and see me when you've grown your sea legs, and we'll find you a hammock that only smells a little." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never, and I'd pay to see it, because dwarves sink like anvils and every sailor knows it. Still, if the sea spirits listen to you, I'd give you the wheel for a day." } },
      choices = {
        { text = "I'd take the wheel, Fleet Master, and treat the sea fairly.", next = "BACK", reply = "Ha! A dwarf at the wheel, fair to the sea? Friend, I'd sign you on just to see the waves try to drown you. The Earth Mother loves a stubborn sailor.", fx = { align = { honor = 1 } } },
        { text = "I'd take the wheel and steer us to a fat prize.", next = "BACK", reply = "Ha, ha! That's the spirit, friend, though a fat prize sinks a little ship. Steer straight and we'll split the plunder at the pier.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Loud, wet and over before the powder smoke clears, because whoever holds the rail in the first minute holds the ship. I once watched one stubborn warrior with a shield keep a whole crew of buccaneers on their own deck until our cannons finished the argument." } },
      choices = {
        { text = "Hold the rail and keep the line. That's how it's done.", next = "BACK", reply = "That's the way of it, friend, and you'd do well on my deck. Hold that rail and the Bloodsail break on you like surf on a rock.", fx = { align = { order = 1 } } },
        { text = "Forget the line. I'd leap in among them and start swinging.", next = "BACK", reply = "Brave and wet, and probably dead by the second minute, friend! I like you, but I'd want you holding the rail, not swimming.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, when we run down the coast to Jaguero Isle and want fresh meat that didn't come out of a barrel. A good hunter can drop a Bloodsail lookout from his crow's nest at a hundred paces, too, and I'll not pretend I've never been glad of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Now and then, when we run down the coast to Jaguero Isle and want fresh meat that didn't come out of a barrel. A good hunter can drop a Bloodsail lookout from his crow's nest at a hundred paces, too, and I'll not pretend I've never been glad of it. Mind, if {pet} comes aboard, it'll want to fight the ship's cat, and the ship's cat has never lost." },
      },
      choices = {
        { text = "I'd hunt for the galley, not shoot sailors for coin.", next = "BACK", reply = "Good, good, the galley could use a hunter who knows game. The cook will love you more than the captain does.", fx = { align = { honor = 1 } } },
        { text = "A lookout's an easy shot. I'd take it and the coin.", next = "BACK", reply = "Ha! A lookout's an easy shot until his mate shoots back, friend. Hunt for the galley, and leave the lookouts to the guns.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We take on anyone who can climb a rope and keep their mouth shut, and a rogue does both without being taught. The Bloodsail have spies in every tavern on this coast, so a sharp pair of eyes on our side is worth a full share to me." } },
      choices = {
        { text = "I'll keep your secrets and hunt the Bloodsail spies.", next = "BACK", reply = "That's the kind of rogue I want aboard, friend! Keep our secrets and find theirs, and the fleet will drink to you every night.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll work for whoever pays best, Fleet Master.", next = "BACK", reply = "Then you'll have my coin, friend, and the Bloodsail's coin too if you're careless. Just remember who pays your share.", fx = { align = { order = -1 } } },
        { text = "Something else, Fleet Master.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, a gnome who swore he could summon a waterspout and then sank our own skiff instead. I've been wary of magic at sea ever since, though I'll admit the Bloodsail's faces were a sight when the water started spinning." } },
      choices = {
        { text = "Leave magic off the ships. A good crew is enough.", next = "BACK", reply = "Ha! You sound like my quartermaster, and he's never been wrong yet. Good hands and a stout hull, that's all a ship needs.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give me a deck and I'll show you what magic can do.", next = "BACK", reply = "Show me, friend, but show me from the dock first. I've lost one skiff to magic already, and I'd rather keep the rest.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Faith in the Light, faith in the tides and a great deal of faith in the Baron's coin, in roughly that order when the weather turns. Most of my crews will pray to anything that listens when the Bloodsail come over the horizon, and they forget all about it the moment the guns go quiet." } },
      choices = {
        { text = "Even a forgotten prayer is heard. The Light remembers your crews.", next = "BACK", reply = "Then I hope it remembers, friend, because I've forgotten more prayers than I've said. The Earth Mother hears them too, I'm sure of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then trust the guns. Prayer won't sink a Bloodsail ship.", next = "BACK", reply = "Ha! Guns it is, friend, and the guns never need a priest. Still, a prayer or two before the cannons never hurt.", fx = { align = { light = -1 } } },
        { text = "Something else, Fleet Master.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Easy, my friend: you only rob the people who'd rob you first, and you keep every bargain you strike with the Baron. The Bloodsail break their word as often as they break their masts, and that's the whole difference between us and them, as I see it." } },
      choices = {
        { text = "A pirate's still a thief. Honor asks more than kept bargains.", next = "BACK", reply = "Maybe so, friend, and maybe the Light would agree with you. But the sea's a hard place for honor, and we do what we can.", fx = { align = { honor = 1 } } },
        { text = "Rob the robbers. That's as honest as the sea allows.", next = "BACK", reply = "Ha! That's the whole of the fleet's creed, friend, and I'd not put it better myself. Rob the robbers and keep your bargains.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of them do, and the rest think you'd only charge more for it than a goblin would. I had a druid of the Circle sail with us once, and we never lost a mast that voyage, so I've stopped laughing at the idea." } },
      choices = {
        { text = "The sea answers to nature, not to coin. I'd never sell a storm.", next = "BACK", reply = "Good, friend, because the sea's not for sale and neither are you. The Earth Mother made both, and she'd not want either sold.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it saves your masts, I'd name my price like anyone else.", next = "BACK", reply = "Ha! You'd make a fine goblin, friend, and a very rich druid. Name your price when the next storm comes, and I'll pay it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "We've sailed with worse, friend, and some of them were captains. The sea doesn't care what you bargained with, but a crew does, and sailors will forgive a drunk or a thief long before they forgive anything with horns, so keep it out of sight and pull your weight on the ropes." } },
      choices = {
        { text = "I'll keep my demon leashed and pull my weight.", next = "BACK", reply = "Good, friend, and you'll be welcome on my deck. Pull your weight and keep that thing below, and we'll get along.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If your crew fears my demon, they'll keep their distance.", next = "BACK", reply = "They'll keep their distance and their courage too, friend, and I need both. Leash it, or find another ship.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Ha! I'd swear I've seen you on my docks before, but that was a {altrace} called {alt}, flying the other banner, with the very same green look about the gills. The sea doesn't care whose colors you're sick over, friend, and neither do I." },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" } },
          text = "Your people get about, ha! There was a {altclass} called {alt} on my docks not long since, asking after the Bloodsail, and I told {alt} what I'll tell you, which is to come back with a cutlass and a strong stomach." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = true },
          text = "{alt} came through last week, back from past the Cape with a red sail or two on the tally, and stood a head taller for it. You're built of the same timber, {g:lad|lass}, so I'll be waiting to hear your tally next." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bloodsail", min = 40 } }, text = "Ha! Word on the piers is you've been sending Bloodsail to the bottom by the boatload, and three of my captains have asked me who you are and whether you're for hire." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Brimstone on my gangplank, ha! I've sailed with worse, though I'll ask you to keep your imp below decks, because the last one set fire to a sail and blamed the parrot." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest ashore, ha! Sailors are a superstitious lot, so if you linger in Booty Bay they'll be lining up to have you bless their hulls, though I doubt any of them will pay you in more than rum." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in Booty Bay! You'll find more pirates here than honest men, and I'm one of the pirates, but I like to think I'm an honest one, which makes me a rarer beast than anything in the jungle." },
        { id = "h_default", key = true,
          text = "Fleet Master Seahorn, of the Blackwater Raiders! I traded the plains for the sea a long time ago, and never once regretted it. The fleet answers to me, I answer to the Baron, and the Baron answers to his ledger." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "The Bloodsail are scheming against the town, and their camp's up the Wild Shore. Raid it, bring me their letters, and we'll see whose name is on the plan." },
        { id = "h_treasure", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "So you're diving for that sunken treasure, and somebody's promised me the best of it? Bring the gem straight here, and don't let it near a Bloodsail." },
        { id = "h_storm", when = { metBefore = true }, text = "Smell that? There's a storm coming by morning, and my knees know it before the sky does, the way the herds on the plains knew the rain before it came. That's the old sailor's curse for you, and the tauren's too." },
        { id = "h_crazz", when = { heardLine = "crazz.h_default" }, text = "Crazz has been at you about the Bloodsail? He's a good lad, if too eager, but I was just as eager once myself, and it got me a fleet." },
        { id = "h_eye_resolved", tags = { "news" }, when = { thread = { id = "bloodsail_eye", state = "resolved" } },
          text = "Two ships out this week and not a red sail between here and the Cape! I'd call it luck if I didn't know better, and I know exactly who to thank for it." },
        { id = "h_eye_soured", when = { thread = { id = "bloodsail_eye", state = "soured" } },
          text = "Ah, it's you. Sit, if you like; I'm only watching my own docks from up here and wondering which of them still talks to the Bloodsail." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Ha, you'd fit right in on the Blackwater ships, though I'll warn you that my sailors guard their rum better than the Baron guards his vault." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You could freeze the Bloodsail's sails solid from the docks, I'd wager, and I'd buy you a drink for every ship you stopped." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Ha! Now there's someone built for a boarding action. You'd look grand swinging onto a Bloodsail deck, provided you don't miss the rope the way my last three did." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! There's a parrot on my flagship that has bitten every hand in the fleet, so if you understand beasts, I'd dearly love to have it explained to me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid aboard my docks! Sailors swear your kind can talk a storm out of a sky, and I've lost enough sails that I'd like to believe them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, on my docks! I've seen tauren take to the sea and trolls take to the rigging, and now Ironforge takes to the weather. What a world." },
      },
      again = {
        { id = "h_again", text = "Ha! Got more for me? Out with it, then, before the tide turns." },
        { id = "h_again2", text = "Ask away. I've rum, time and opinions, and only the rum runs out." },
      },
      choices = {
        { text = "Why does a tauren go to sea?", next = "why" },
        { text = "Tell me about the Bloodsail.", next = "bloodsail" },
        { text = "Working for a goblin can't be easy.", next = "baron" },
        { text = "Got a sea story for me?", next = "story" },
        { text = "Tell me about the Blackwater Raiders.", next = "raiders" },
        { text = "Crazz says the Bloodsail letters name you and the Baron.", next = "bs_letters", when = { any = { { questActive = TODO_QUEST("The Bloodsail Buccaneers") }, { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } } },
        { text = "I know who the Bloodsail eye on your docks is.", next = "eye",
          when = { thread = { id = "bloodsail_eye", beat = "b3_ianstrom", state = { "stirring", "unfolding" } } } },
        { text = "I've been to Faldir's Cove. O'Breen's alive.", next = "r_obreen", when = { any = { { questActive = TODO_QUEST("Land Ho!") }, { questDone = TODO_QUEST("Land Ho!") }, { heardLine = "ar_obreen.h_default" } } } },
        { text = "Do you miss the plains, ever?", next = "plains", when = { race = "Tauren" } },
        { text = "I've never been on a ship.", next = "landlubber", when = { race = { "Dwarf", "Gnome" } } },
        { text = "The sea has spirits too, Fleet Master. You must hear them.", next = "k_shaman", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "My people were sailors once, before Thrall.", next = "k_troll", when = { race = "Troll" } },
        { text = "My ancestors sailed west from the Feralas coast.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "Do the Blackwater Raiders take on rogues, Fleet Master?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have the Blackwater ever used mages against the Bloodsail, Fleet Master?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the Blackwater Raiders put much faith in the Light?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How can a pirate be an honest man, Fleet Master?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A boarding action against the Bloodsail must be a grim business.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters ever sail with the Blackwater Raiders?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do your sailors really think a druid can calm a storm, Fleet Master?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Would the Blackwater Raiders ever sail with a warlock, Fleet Master?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Have you ever sailed with a dwarf shaman, Fleet Master?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Fair winds, Fleet Master.", next = "END" },
      },
    },

    -- bloodsail_eye (0.78.0): the player decides whether Seahorn hears the spy's name.
    eye = {
      big = true,
      lines = {
        { id = "ey_default", key = true,
          text = "Do you, now? Crazz has his list, Lozgil has his runaway fishmonger and Strom nods at somebody every evening, so I know who's been asking questions on my docks, friend. Out with it, then, and don't dress it up, because I've been dressed up to by the Baron all week." },
        { id = "ey_baron", when = { thread = { id = "bloodsail_eye", beat = "b4_revilgaz" } },
          text = "Do you, now? And the Baron's had a word with you first, I'd wager, since he's had a word with everyone else. Out with it, friend, and tell me whose side of the stairs you're standing on." },
      },
      choices = {
        { text = "It's the dishwasher at Skindle's. He reads every notice you pin up.", next = "eye_told",
          fx = { thread = { id = "bloodsail_eye", state = "resolved" }, affinity = 3, standing = { booty_bay = 2 }, align = { honor = 1 } },
          journal = { first = "Told Seahorn the Bloodsail eye on his docks was the dishwasher at Skindle's. He laughed, and then he stopped laughing and called for Crazz.",
                      third = "{name} told Fleet Master Seahorn that the Bloodsail spy was the dishwasher at Skindle's." } },
        { text = "Nothing worth your time, Fleet Master. The Baron has it in hand.", next = "eye_kept",
          fx = { thread = { id = "bloodsail_eye", state = "soured" }, affinity = -2, align = { honor = -1 } },
          journal = { first = "Told Seahorn I had nothing for him, and left the spy's name with the Baron. He didn't believe me, and he didn't say so.",
                      third = "{name} kept the Bloodsail spy's name from Fleet Master Seahorn and left it with the Baron." } },
        { text = "What would you do with him, if I told you?", next = "eye_ask" },
      },
    },
    eye_ask = {
      lines = { { id = "eya_default", text = "Put him on the morning boat to Ratchet with his wages and a warning, and tell Crazz afterwards, so nobody goes off the end of the pier. I'm a pirate, friend, not a butcher, whatever the Bloodsail say about me." } },
      choices = {
        { text = "It's the dishwasher at Skindle's. He reads every notice you pin up.", next = "eye_told",
          fx = { thread = { id = "bloodsail_eye", state = "resolved" }, affinity = 3, standing = { booty_bay = 2 }, align = { honor = 1 } },
          journal = { first = "Told Seahorn the Bloodsail eye on his docks was the dishwasher at Skindle's. He laughed, and then he stopped laughing and called for Crazz.",
                      third = "{name} told Fleet Master Seahorn that the Bloodsail spy was the dishwasher at Skindle's." } },
        { text = "Nothing worth your time, Fleet Master. The Baron has it in hand.", next = "eye_kept",
          fx = { thread = { id = "bloodsail_eye", state = "soured" }, affinity = -2, align = { honor = -1 } },
          journal = { first = "Told Seahorn I had nothing for him, and left the spy's name with the Baron. He didn't believe me, and he didn't say so.",
                      third = "{name} kept the Bloodsail spy's name from Fleet Master Seahorn and left it with the Baron." } },
      },
    },
    eye_told = {
      lines = { { id = "eyt_default", text = "The dishwasher! Ha, and I've tipped that lad a copper every time he filled my mug. Crazz, get up here, and leave your cutlass on the stairs; we're sending a man to Ratchet, not to the bottom." } },
      choices = { { text = "Fair winds to him, then.", next = "END" } },
    },
    eye_kept = {
      lines = { { id = "eyk_default", text = "In hand, is it? The Baron's hands are full of a great many things, friend, and not all of them are mine. Well, the tide goes out either way, so off with you." } },
      choices = { { text = "...", next = "END" } },
    },

    why = {
      lines = {
        { id = "w_default", text = "Everyone asks! My people wander the plains, and I found a bigger plain: flatter, wetter, and the centaur can't follow me onto it." },
      },
      choices = {
        { text = "Ha! And centaur can't swim, can they?", next = "BACK", fx = { affinity = 2 } },
        { text = "Your family can't have liked that much.", next = "why_family" },
      },
    },
    why_family = {
      lines = { { id = "wf_default", text = "Something about the Earth Mother not owning a boat. I sent them a shell and they never wrote back, for tauren are very good at disapproving quietly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "They're cutthroats with a fleet, and we're cutthroats with a town, and that's the whole difference. A town has to keep its word to the next ship in, and a fleet only has to outrun it." },
      },
      choices = {
        { text = "I'll help you sink them.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "Someone must lead the Bloodsail.", next = "bloodsail_lead" },
        { text = "Why do they hate this town so much?", next = "bloodsail_why" },
      },
    },
    bloodsail_lead = {
      lines = { { id = "bl_default", text = "A fleet master of their own, with a grudge for every one of my ships. He'd dearly love my horns over his door. I'd love to see him try." } },
      choices = {
        { text = "Does this fleet master have a name?", next = "bs_firallon" },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    bloodsail_why = {
      lines = { { id = "bw_default", text = "Because we did what they wanted to: found a cove, made it rich, and kept it. Nothing makes a pirate angrier than another pirate who settled down." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    baron = {
      lines = {
        { id = "bn_default", text = "The Baron? He counts my cannonballs, every last one. But when the Bloodsail came for him, I was the one at his door, and neither of us has forgotten it." },
      },
      choices = {
        { text = "They came for him?", next = "baron_attempt" },
        { text = "I'd guess the Baron pays the Raiders well enough.", next = "baron_pay" },
        { text = "Sounds like friendship.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    baron_attempt = {
      lines = { { id = "ba_default", text = "For both of us! They tried a knife in the dark and got a tauren in the dark instead, which was a bad trade for them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" } } } },
    },

    story = {
      lines = {
        { id = "st_default", text = "Once I sailed through a storm so thick the gulls walked! It took the mast, the cook and my hat, and though the hat turned up again, to this day I miss that hat more than the mast." },
      },
      choices = {
        { text = "And the cook?", next = "story_cook" },
        { text = "That's not true.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    story_cook = {
      lines = { { id = "sc_default", text = "Washed up in Ratchet a month later, spitting mad, and runs a chowder stall there now. Won't serve me a single bowl, and I can't call that unfair." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    plains = {
      lines = {
        { id = "pl_default", text = "On calm nights, aye. The water goes flat and silver and I think of grass, and then a wave slaps the hull and I remember why I left. You came a long way from the plains yourself." },
      },
      choices = {
        { text = "The Earth Mother walks with me here too.", next = "BACK", reply = "She does, friend, she does, and it gladdens my heart to hear you say it. The sea's just another plain, wetter and saltier.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "I'm glad to trade the plains for a ship and a captain.", next = "BACK", reply = "Ha! You've the soul of a sailor, friend, and I'm glad of it. The plains will keep, and the sea won't wait.", fx = { align = { order = 1 } } },
        { text = "I miss it every day.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    landlubber = {
      lines = {
        { id = "ll_default", text = "Never! Then the sea's waiting to make a fool of you. Sit in the middle of the boat, look at the horizon, and don't eat the cook's eggs." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Hear them? Ha! Every night in my bunk they sing me to sleep, and every storm they shout me awake. A shaman at sea is worth a crew of ten, for you'll know the squall before the gulls do, so if you ever want a berth, you've got one." },
        { id = "xsh_tauren", when = { race = "Tauren" },
          text = "Hear them? Ha! My grandmother swore no tauren could hear the Earth Mother out on the waves, and she was wrong about that. A tauren shaman on a deck is a sight I'd pay to see, and I'd give you the wheel for a day." },
      },
      choices = {
        { text = "The sea spirits are wild. I'd leave them be.", next = "BACK", reply = "They are, and they'd take the ship without a second thought. But they love a good song, and I sing them one every night.", fx = { align = { order = -1 } } },
        { text = "The spirits respect a steady hand. I'll take the berth.", next = "BACK", reply = "Ha! That's the spirit, friend, and the berth is yours. The sea spirits like a steady hand and a loud voice, and I've got both.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "A tauren at sea is a strange sight.", next = "why" },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "That you were, and good ones! The Darkspear canoes on the Echo Isles could cut through surf my ships wallow in. You ever want to remember what your grandmothers knew, come aboard, and I'll put you in the rigging where you belong." },
      },
      choices = {
        { text = "One day I'll sail these waters again.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "My people walk on land now, Fleet Master.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    k_sky = {
      lines = {
        { id = "xsk_default", text = "West from Feralas, you say, into open water? Then your ancestors were braver sailors than any I know, because there's nothing out that way but weather. Did they ever say what they sailed toward, or were they only sailing away?" },
      },
      choices = {
        { text = "Away. The winds found them after.", next = "BACK", fx = { affinity = 2 } },
        { text = "That's a story for another day, Fleet Master.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Deeper: the Raiders themselves (sub-hub), Firallon and his captains, the Baron's pay.
    raiders = {
      hub = true,
      lines = {
        { id = "rd_default", text = "The Blackwater Raiders, my friend: twelve hulls on a good year, nine on a bad one, and each flies the Baron's colours under our own. Ask me anything, for I've had rum enough to answer anything." },
        { id = "rd_rep", when = { reputation = { faction = "Booty Bay", min = "honored" } }, text = "You want to hear about the Raiders? Ha, half my captains already talk about you as if you were one of us, so you may as well know what you've been adopted into." },
        { id = "rd_bloodsail", when = { reputation = { faction = "Bloodsail Buccaneers", min = "neutral" } }, text = "The Raiders, is it? Strange question from someone the Bloodsail seem to like. Oh, I hear things, friend, and I'll answer anyway, because I'd rather you heard our side from me." },
      },
      again = {
        { id = "rd_again", text = "More about the fleet? There's always more, and most of it's even true." },
        { id = "rd_again2", text = "Go on, ask. A Fleet Master loves nothing better than talking about his ships, save sailing them." },
      },
      choices = {
        { text = "How did the Raiders come to Booty Bay?", next = "r_history" },
        { text = "Do the Raiders keep any kind of code?", next = "r_code" },
        { text = "What's life like aboard a Blackwater ship?", next = "r_life" },
        { text = "Who captains your ships these days?", next = "r_captains" },
        { text = "Would the Raiders sail for the Horde, Fleet Master?", next = "r_sides", when = { faction = "Horde" } },
        { text = "I doubt the Raiders would sail for the Alliance, Fleet Master.", next = "r_sides", when = { faction = "Alliance" } },
        { text = "One of your captains is a dwarf, I hear.", next = "r_dwarf", when = { race = "Dwarf" } },
        { text = "Kul Tiras hangs pirates. Why are you different?", next = "r_kultiras", when = { race = "Human" } },
        { text = "Let's talk about something else, Fleet Master.", next = "hello" },
      },
    },
    r_history = {
      lines = {
        { id = "rh_default", text = "This was Blackwater Cove before it was Booty Bay, and the trolls had it before either of us. The Steamwheedle goblins came with gold and gunpowder and drove them out, and they hired the toughest crews on the coast to keep it, which is where we come in." },
      },
      choices = {
        { text = "What happened to the trolls?", next = "r_history_trolls" },
        { text = "So the Raiders are hired muscle.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else about the fleet.", next = "BACK" },
      },
    },
    r_history_trolls = {
      big = true,
      lines = {
        { id = "rht_default", text = "They went up into the jungle and they've never quite forgiven us, which I understand better than the Baron does. Every so often a Gurubashi skull turns up in a net, and the old hands throw it back with an apology, just in case." },
        { id = "rht_troll", when = { race = "Troll" }, text = "They went up into the jungle, and you'll know better than I do what that cost them. I won't dress it up for you, friend: the cove was taken, not bought, and the old hands still throw back any skull that turns up in a net, with an apology." },
      },
      choices = {
        { text = "Then the cove was stolen, and someone should say so.", next = "BACK", reply = "Maybe it was, friend, and I'll not pretend otherwise. But the Baron bought it fair, from those who had it last.", fx = { align = { honor = 1 } } },
        { text = "The trolls lost it. That's how the world works.", next = "BACK", reply = "That's how the world works, aye, and the sea works the same. Today's winners are tomorrow's wrecks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_code = {
      lines = {
        { id = "rc_default", text = "We do, and it's short enough to remember drunk: share the prize fairly, follow your captain's signal, never strike a colour you've sworn to, and never harm a ship that's paid the Baron's toll. The Bloodsail have a code too, I'm told, but it's written on the back of a menu." },
      },
      choices = {
        { text = "What happens to a Raider who breaks it?", next = "r_code_break" },
        { text = "A pirate with a code is still a pirate.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_code_break = {
      big = true,
      lines = {
        { id = "rcb_default", text = "Depends what he broke. A short share gets you a dunking off the pier with the whole fleet watching, but turning on your own crew gets you put ashore on Jaguero Isle with a pistol and one shot, and nobody's ever come back to complain." },
      },
      choices = {
        { text = "Harsh, but a crew lives or dies by its rules.", next = "BACK", reply = "It does, friend, and our code's kept the fleet together longer than any king's law. A dunking's a small price.", fx = { align = { order = 1 } } },
        { text = "I'd sooner trust a sailor's own heart than a code.", next = "BACK", reply = "A sailor's heart is a fine thing, friend, but it's a fickle thing too. The code holds when the heart doesn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_life = {
      lines = {
        { id = "rl_default", text = "Hard biscuit, sour grog, a hammock that smells of the last fellow, and the finest sunsets in the world from the top of the mainmast. We sing badly, we fight the Bloodsail well, and we come home rich about one voyage in three." },
        { id = "rl_tauren", when = { race = "Tauren" }, text = "Low beams, my friend, and I've the scars on my horns to prove it. Otherwise it's hard biscuit, sour grog and sunsets you'd not believe, and you'll find a ship rocks a lot like a kodo, once you stop fighting it." },
      },
      choices = {
        { text = "Sour grog? Why not better rum?", next = "r_life_grog" },
        { text = "Sounds like a life worth living.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_life_grog = {
      lines = {
        { id = "rlg_default", text = "Because Skindle sells the good rum, and the Baron owns Skindle's tavern, and the Baron sells me the grog. A goblin gets paid at both ends of every bargain, friend, and I've long since stopped arguing about it." },
      },
      choices = {
        { text = "Ha! The Baron wins every time.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_captains = {
      lines = {
        { id = "rcp_default", text = "Good ones and lucky ones, and once in a while both. Crazz will have his own deck before long, Fin Fizracket would too if he'd kept out of that jungle pond, and I sent O'Breen north with three ships after a treasure, which I'm starting to regret." },
      },
      choices = {
        { text = "Why do you regret O'Breen?", next = "r_obreen" },
        { text = "Something must have happened to Fin.", next = "r_fin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_obreen = {
      lines = {
        { id = "rob_default", text = "Because he's late, and O'Breen is never late, he's only ever loud. If the Arathi coast has eaten my ships, I'll want to hear it from him in person, not from some gull with a letter tied to its leg." },
        { id = "rob_known", when = { any = { { questActive = TODO_QUEST("Land Ho!") }, { questDone = TODO_QUEST("Land Ho!") }, { heardLine = "ar_obreen.h_default" } } },
          text = "Two ships on a reef that wasn't there, and Steelgut's whole crew drowned? Shakes O'Breen, you strutting fool, you'd better bring me something shiny. Still, he's alive, and that's worth more to me than the gold, though I'd never tell him so." },
      },
      choices = {
        { text = "He's afraid you'll take his ship.", next = "r_obreen_ship", when = { any = { { questActive = TODO_QUEST("Land Ho!") }, { questDone = TODO_QUEST("Land Ho!") }, { heardLine = "ar_obreen.h_default" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_obreen_ship = {
      big = true,
      lines = {
        { id = "robs_default", text = "Afraid, is he? Good, let him sweat a while. I'll not take the Harbinger, but I'll make him scrub the Salty Sailor's top floor with his own hat, and I've not decided what to tell Steelgut's widows." },
      },
      choices = {
        { text = "Forgive him, Fleet Master. The sea did it, not him.", next = "BACK", reply = "Forgive him I will, friend, but not today. Let him sweat a while, and then he'll learn to keep his ships.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Two ships lost? Make an example of him.", next = "BACK", reply = "An example, aye, but not a cruel one. He'll work off those ships and be a better captain for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_fin = {
      lines = {
        { id = "rfn_default", text = "Swam in a jungle pond on shore leave, against orders, and came back yellow and shaking. He's down on the docks sweating it out, and I've kept his berth for him, because a Raider doesn't lose his place for being an idiot once." },
        { id = "rfn_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") }, text = "Up and about again, thanks to some brave soul and a gorilla's heart, and I hear that was you! He's back on the ropes, though he still turns green whenever someone says the word pond." },
      },
      choices = { { text = "Something else about the fleet.", next = "BACK" } },
    },
    r_sides = {
      big = true,
      lines = {
        { id = "rs_default", text = "We sail for the Baron, and the Baron sells to anyone with coin. An orc's gold and a human's gold weigh the same on Krazek's scales, so my ships escort both, and neither of them likes it." },
        { id = "rs_horde", when = { faction = "Horde" }, text = "We sail for the Baron, not the Warchief, but your folk have been good customers off the Ratchet run, and the Bloodsail hate you nearly as much as they hate us. That makes us friends of a sort, and on this sea, that's as much as anyone gets." },
        { id = "rs_alliance", when = { faction = "Alliance" }, text = "We sail for the Baron, not Stormwind's House of Nobles, but Stormwind's merchants pay us well to see them past the Cape. Your navy thinks we're pirates, and we are, but we're the pirates who keep the other pirates off your cargo." },
      },
      choices = {
        { text = "Pirate or privateer, Fleet Master? Which are you?", next = "op_pirates" },
        { text = "Good. Gold should be the only flag at sea.", next = "BACK", reply = "That's the Baron's flag, friend, and I sail under it gladly. Gold's never sunk a ship yet.", fx = { align = { honor = -1 } } },
        { text = "A sailor should choose a side and stand by it.", next = "BACK", reply = "Maybe so, friend, and I've chosen mine, the Baron's. That's side enough for me.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_dwarf = {
      lines = {
        { id = "rdw_default", text = "Steelgut, aye, captain of the Maiden's Folly, and the stubbornest sailor I've ever paid. He won his first deck on a bet at Skindle's bar, and he's held onto it ever since out of pure spite, which is how dwarves hold onto everything." },
        { id = "rdw_known", when = { any = { { questDone = TODO_QUEST("Drowned Sorrows") }, { heardLine = "ar_steelgut.h_default" } } }, text = "Steelgut. You've seen him, then, sitting by that fire at Faldir's Cove without his ship or his crew. I'll find him another deck when he's ready, but I'll not push a dwarf before he's ready, because I'm not a fool." },
      },
      choices = {
        { text = "Dwarves make fine sailors, Fleet Master.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    r_kultiras = {
      lines = {
        { id = "rkt_default", text = "Kul Tiras would hang me, aye, and I'd hang a few of theirs if I caught them smuggling past the Baron. The difference is that we fly an honest flag and pay our harbour dues, which is more than Admiral Proudmoore's privateers ever did in the old war." },
      },
      choices = {
        { text = "You have me there. Something else.", next = "BACK" },
        { text = "Pay your dues all you like. You're still a pirate.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    bs_letters = {
      lines = {
        { id = "bsl_default", text = "Crazz is right to worry. The Bloodsail want this cove, and they've a fleet master of their own who'd cut his way to it through me and the Baron both, so bring me every scrap of paper you find on the Wild Shore." },
        { id = "bsl_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Firallon, Keelhaul and Stillwater, all three gone to the bottom, and their letters burned in my own stove! The Bloodsail will find another fleet master, they always do, but this one won't be plotting against my horns again." },
      },
      choices = {
        { text = "Who is this fleet master of theirs?", next = "bs_firallon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bs_firallon = {
      lines = {
        { id = "bsf_default", text = "Fleet Master Firallon, a human with a beard he oils every morning and a temper he never bothers to. He keeps his captains close, Keelhaul and Stillwater the worst of them, and the three of them have sunk more honest cargo than the Cape's storms." },
        { id = "bsf_dead", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Was, friend, Firallon was, and you'll know that better than I do, since you sent him to the crabs. I'll say this for him: he oiled his beard every morning, and he never once ran from a fight, which is more than his crews can say." },
      },
      choices = {
        { text = "Tell me about Keelhaul and Stillwater.", next = "bs_captains", when = { ["not"] = { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } },
        { text = "How do you mean to beat him?", next = "bs_plan_ask", when = { ["not"] = { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } },
        { text = "Was there more in those letters, Fleet Master?", next = "bs_plan_ask", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") } },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    bs_captains = {
      big = true,
      lines = {
        { id = "bsc_default", text = "Keelhaul earned his name the way you'd guess, and he's dragged more of my sailors under a hull than I like to count. Stillwater's the quiet one, who'll sit off our coast for a week without firing a shot and then take the one ship I sent out alone." },
      },
      choices = {
        { text = "Then they should hang, both of them.", next = "BACK", reply = "They should, friend, and I'd tie the knots myself. But the Baron likes a trial, and I like the Baron.", fx = { align = { light = -1 }, learn = { "bloodsail" } } },
        { text = "Take them alive. Let the Baron try them.", next = "BACK", reply = "Alive's better, friend, for the Baron's justice and for the fleet's morale. Bring them back breathing and I'll buy you a barrel.", fx = { align = { light = 1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bs_plan_ask = {
      lines = {
        { id = "bsp_default", text = "Ha! With cannons, friend, and with brave fools like you. As for the rest, that's between me, the Baron and a bottle, and I've not decided yet whether you're the sort I'd share a bottle with." },
        { id = "bsp_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Sharp, aren't you? There was more, aye, and it's been keeping me up nights, but it's between me, the Baron and a bottle until I decide whether you're the sort I'd share a bottle with." },
      },
      choices = {
        { text = "You need someone outside the fleet. Let me in on it.", tag = "Persuade", next = "bs_plan",
          check = { pass = { any = { { disposition = { min = 65 } }, { reputation = { faction = "Booty Bay", min = "honored" } }, { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } } },
          fail = { next = "bs_plan_no", fx = { affinity = -1 } } },
        { text = "Fair winds to the cannons, then.", next = "BACK" },
      },
    },
    bs_plan = {
      lines = {
        { id = "bspl_default", text = "Then here's the part I don't tell my captains: those letters didn't only name me and the Baron, they named our sailing days, and only someone in this town could have known them. I've a Bloodsail eye somewhere on my own docks, friend, and I don't yet know whose face it wears." },
      },
      choices = {
        { text = "I'll keep my eyes open on the docks.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "Have you told Crazz?", next = "bs_plan_crazz" },
      },
    },
    bs_plan_crazz = {
      lines = {
        { id = "bspc_default", text = "Crazz? Crazz would have every dockhand in town hanging from a yardarm by supper, on suspicion alone. I love the lad, but he's a cannon, not a spyglass, so this stays between us." },
      },
      choices = { { text = "Between us, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    bs_plan_no = {
      lines = {
        { id = "bspn_default", text = "Ha! A good try, and I like the nerve of it, but I've known you about as long as I've known this rum. Sink a few Bloodsail first, and then we'll see about secrets." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    baron_pay = {
      big = true,
      lines = {
        { id = "bp_default", text = "A tenth of every prize, a berth in the safest harbour in the South Seas, and powder at cost, which from a goblin is very nearly love. In return, my ships fly his flag and sink whoever he points at, and so far he's only pointed at people who deserved it." },
      },
      choices = {
        { text = "Loyalty bought with powder is still loyalty. I respect it.", next = "BACK", reply = "It is, friend, and I'll take it gladly. The Baron's been good to us, and we've been good to him.", fx = { align = { order = 1 } } },
        { text = "So far. One day he'll point at someone who doesn't.", next = "BACK", reply = "Maybe he will, friend, and maybe I'll say no that day. But for now, the powder's cheap and the harbour's safe.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Ha! You've a tongue as smooth as a calm sea, and this old bull's vain enough to enjoy the sailing! Say it again louder, so the crew below can hear what their Fleet Master is worth." },
        { id = "s2", text = "Now that's kindly said, and I'll take it, for the Blackwater get cursed a good deal more often than they get praised. You've a fair eye for a fleet, sailor." },
      },
      fail = {
        { id = "f1", text = "I've heard sweeter words from sharks circling a longboat, and they wanted the same thing you do! Speak plain with me, for I trust plain talk and I count my rum after the other kind." },
        { id = "f2", text = "Ha, you're laying it on thicker than barnacles on an old hulk, and it'll come off just as hard. I've been flattered by Bloodsail spies before, so you'll forgive me if I keep one hand on my purse." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha ha! There's salt in you after all, and I like a sailor who'll spit into the wind just to see what comes back! Most folk climb those stairs too frightened of my horns to say a thing worth hearing." },
        { id = "s2", text = "By the tides, you've got nerve, and nerve is the one cargo I can never find enough of! Keep that tongue sharp, for the Bloodsail deserve it far more than I do." },
        { id = "s3", when = { race = "Tauren" }, text = "Ha! It takes one of the herd to lock horns with me so cheerfully, and I've missed it more than I knew! The plains bred you well, even if they couldn't keep me." },
      },
      fail = {
        { id = "f1", text = "You'd mock a Fleet Master on his own deck, with his crew listening below? I've put loud mouths over the rail for less, so mind your footing, because the cove is cold this time of year." },
        { id = "f2", text = "That's a poor jest, and I've laughed at storms that were funnier. Come back when you've learned the difference between cheek and bilge water." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Easy now, easy! I've stared down storms and red sails both, and I know weather when I see it coming, and you're weather. There's no need for horns and steel between us, so say what you want and I'll hear it." },
        { id = "s2", text = "Hm. I laughed at a squall once and it took my mainmast for it, so I learned to tell which ones to laugh at. I'll not laugh at you, sailor, so speak your mind." },
      },
      fail = {
        { id = "f1", text = "Ha! I'm a bull who went to sea in a leaking hull and came back with a fleet, and you think to frighten me on my own top floor? Sit down before I have the lads teach you how the stairs work." },
        { id = "f2", text = "The Bloodsail's fleet master wants my horns for his wall, and he has cannon, and still I sleep like a calf. You'll need a good deal more than a hard look." },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "Every ship that sails these waters sends word back to me, one way or another! Ask, and I'll tell you what the sea's been saying." },
    },
    background = { { id = "tp_bg", text = "I was a plains calf who grew into a sea-going bull. The grass raised me, and the waves finished the job.", next = "why" } },
    advice = { { id = "tp_ad", text = "Respect the sea as you would the Earth Mother, laugh at the storm, and never, ever trust a red sail." } },
    bloodsail = { { id = "tp_bloodsail", text = "Their fleet master would dearly love my horns on his wall. He'll have to get in line." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is the best harbor on the South Seas, and I'd fight anyone who says different, though I'd prefer they just paid for a drink. The Baron keeps the peace, and the Blackwater keeps the Baron honest." } },
    cairne = {
      { id = "tp_cairne", text = "Cairne Bloodhoof was a great chieftain when I was a calf on the plains, and he's greater now. I left the grass for the waves, and he's never once held it against me, as far as I know." },
      { id = "tp_cairne2", when = { race = "Tauren" }, text = "You've been home more recently than I have, so tell me, does Cairne still walk the lifts at Thunder Bluff himself? He used to, and I'd like to think he still does." },
    },
    earth_mother = { { id = "tp_earth_mother", text = "I still pray to the Earth Mother, though I do it on a deck now, and I like to think she hears me as well over the water. The sea is her daughter too, after all." } },
    thrall = { { id = "tp_thrall", text = "The Warchief brought my people across the Barrens to a home of our own, and I've never forgotten it. I don't fly his banner on my masts, though, because the Blackwater flies no banner but its own." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a friendly port and Gazlowe keeps a clean dock, and the Barrens wind blows straight off the plains I grew up on. I'll take a cargo to Ratchet any day of the week." } },
    theramore = { { id = "tp_theramore", text = "Theramore is Proudmoore's island, and she keeps a good harbor and an honest customs house. Her navy remembers what happened to her father's fleet, though, so give them room on the water." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've watched a few rounds at the Arena, and I'll say this, the Bloodsail never send anyone. That alone tells you the fights are too fair for them." } },
    _gated = {
      { id = "gt1", text = "That's a tale for shipmates, and you've not yet hauled a single line beside me. Sail with the Blackwater a while, and then ask me again." },
      { id = "gt2", text = "Ha, not so fast! I don't open that locker for every stranger who climbs my stairs, however friendly they look." },
    },
    _none = { { id = "tp_none", text = "That's a landlubber's question, so ask somebody with dry boots and dry hooves." } },
  },
}

P:NPC {
  key = "krazek", id = TODO_NPC("Krazek"), name = "Krazek",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "chatty" }, values = { "cunning", "ambitious" },
  prejudice = { race = "Gnome", amount = 8, why = "Goblin-gnome rivalry: gnomes give inventions away and undercut the market." },
  notices = { "craft", "purse" },

  impression = {
    first = "I suspect he knew my price before I opened my mouth.",
    third = "{name} met Krazek, Baron Revilgaz's secretary, who claims to know every price, pirate and debt in Stranglethorn.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "A gnome, at my desk! No offence, pal, but your people give away blueprints for free, and every time you do it, a goblin somewhere loses a contract." },
    { id = "g_prej2", when = { prejudiced = true }, text = "Well, well, a gnome in Booty Bay. Hands where I can see 'em, pal, because the last one of your folk who sat in that chair took my best pen apart to see how it worked." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Hey, it's my favourite gnome! Don't tell anybody I said that, pal, because it's bad for business, but you've been a valued customer and I've stopped counting my pens." },
    { id = "g_desk", text = "Busy, busy, busy, but never too busy for a customer, pal! You are a customer, aren't you, because the chair costs extra if you're just browsing." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? I said you'd come back, I bet Skindle a silver on it, and I'm rarely wrong about these things, so thanks for the silver." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! The Baron's always short of good ore, and I'm always short of favors owed, so listen, listen, we should talk numbers." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Lean times, huh? I can find you work, and finding work is a service, and services cost, but we'll put it on account and sort somethin' out later." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "A problem? Pal, it's a whole ledger! Your people build a thing and then just tell everyone how it works, for free, and that's no way to run a market, and somebody has to say it." } },
      choices = {
        { text = "Sharing knowledge helps everyone. Your ledger's the problem.", next = "BACK", reply = "My ledger's the problem? Pal, my ledger's the only thing keepin' this town afloat! But fine, maybe your people share, and maybe I'll learn something.", fx = { align = { honor = 1 } } },
        { text = "A good secret's worth gold. I see your point.", next = "BACK", reply = "See? See? You get it, pal! A good secret's worth more than all the winches in Ratchet.", fx = { align = { honor = -1 } } },
        { text = "Fine. I promise not to take apart your pen.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Is it really just about business?", next = "prej_why" },
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Mostly business, sure, but listen, listen: my uncle lost a whole shipping contract in Ratchet to a gnome who built a better winch and then drew the plans on a napkin for anybody who asked. Uncle's never been the same, and neither has the napkin trade." } },
      choices = {
        { text = "Your uncle should have built a better winch.", next = "BACK", reply = "A better winch? Pal, it was a napkin! You can't build a better winch than a napkin, it's impossible to compete with free.", fx = { align = { order = -1 } } },
        { text = "Fair trade needs rules. I'd be sore too.", next = "BACK", reply = "Exactly, pal, that's all I'm sayin'! Fair trade needs rules, and the first rule is don't give it away for free.", fx = { align = { order = 1 } } },
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Ha! That's a deal I'll take, and I'll even throw in the chair at no extra charge. Don't tell Skindle." } },
      choices = {
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    op_bay = {
      lines = {
        { id = "opb_default", text = "Depends what you give me to work with, pal, so let's start the bidding. Here's one I'm buying instead of selling: what do you really think of Booty Bay?" },
      },
      choices = {
        { text = "A den of thieves with a pretty harbor.", next = "op_bay_thieves", fx = { align = { honor = 1 }, opinion = { booty_bay = "distrust" } } },
        { text = "A town where everything's for sale suits me fine.", next = "op_bay_useful", fx = { affinity = 1, align = { honor = -1 }, trait = { greedy = 1 }, opinion = { booty_bay = "useful" } } },
        { text = "Best port in the South Seas, and fair to everyone.", next = "op_bay_admire", fx = { affinity = 1, opinion = { booty_bay = "admire" } } },
        { text = "Better than Ratchet. Ratchet's only a pier with ambitions.", next = "op_bay_admire", fx = { affinity = 1, trait = { witty = 1 }, opinion = { booty_bay = "admire", ratchet = "contempt" } } },
        { text = "I'm not giving you anything you can sell, Krazek.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    op_bay_thieves = {
      lines = {
        { id = "opbt_default", text = "A den of thieves! Oh, that's going straight in the book, and the Baron's going to love it, because he's been calling it that for years and he means it as a compliment." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_bay_useful = {
      lines = {
        { id = "opbu_default", text = "Now there's somebody who gets it! Everything's for sale, including that opinion, which I just bought for nothing, so thanks for the margin." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_bay_admire = {
      lines = {
        { id = "opba_default", text = "Fair to everyone, ha! Fair to everyone who pays, chum, and I'll put it down as a glowing review from a satisfied customer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That Ironforge has started talking to the weather, that it'll make the Horde nervous, and that both are worth knowing to somebody with deep pockets. Don't worry, chum, I only sell the interesting parts, and I sell them by the ounce." } },
      choices = {
        { text = "Write it straight, Krazek, and sell nothing about me.", next = "BACK", reply = "Straight it is, pal, though straight sells for less. I'll keep your name out of it, mostly.", fx = { align = { honor = 1 } } },
        { text = "Sell what you like, as long as I get a cut.", next = "BACK", reply = "A cut? Pal, you're talkin' my language now! Ten percent, and I'll make you famous in three ports.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Mosh'Ogg ogres up in the hills, the Kurzen men in the north, and the Gurubashi Arena, where every few hours a chest gets dropped in the pit and everybody kills each other for it, and I take bets. Personally I'd take the ogres, because they don't hold grudges past supper." } },
      choices = {
        { text = "I'd rather fight ogres for the town than brawl for a chest.", next = "BACK", reply = "A hero for the town, pal, I love it! The ogres are up the hill and the Baron'll be grateful, and grateful's good for business.", fx = { align = { honor = 1 } } },
        { text = "The Arena sounds right. I'll take that chest however I can.", next = "BACK", reply = "That's the spirit, pal! Arena's every three hours, and the chest goes to whoever's standing at the end.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tiger pelts are down, since Nesingwary's lot keep flooding the market, but basilisk scales are up, way up, and a white tiger's hide would buy you a house here if anyone ever came back from King Bangalash alive to sell it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Tiger pelts are down, since Nesingwary's lot keep flooding the market, but basilisk scales are way up, and a white tiger's hide would buy you a house if anyone ever came back from King Bangalash. And don't think of selling me {pet}, pal, because I've seen that look in a hunter's eye and it's never the look of somebody who sells." },
      },
      choices = {
        { text = "I'd take Bangalash for the hunt, not for your buyers.", next = "BACK", reply = "A purist! Pal, Bangalash is a legend, and legends sell for twice the price. Bring me his pelt, and we'll talk.", fx = { align = { honor = 1 } } },
        { text = "Then I'll hunt whatever sells highest this week.", next = "BACK", reply = "That's a hunter after my own heart, pal! This week it's basilisk scales, next week who knows, so keep checking in.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Oh, the best one is that a Venture Company man on the coast is buying up those singing crystals to power something he won't name, and that one's premium. The second best is that Zanzil's been seen brewing by the shore again, and the third is about you, but I'm saving that one for a better price." } },
      choices = {
        { text = "Name your price for the one about me.", next = "BACK", reply = "For you, pal? A very special price, friend's rate, which is only a little more than everybody else pays.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather earn my news than buy gossip.", next = "BACK", reply = "Earn it? Pal, that's what I'm for, I earn it so you don't have to. But suit yourself.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They say you can call rain, which the sailors like, and lightning, which the Bruisers don't, on account of the powder stores. Mostly they say you pay in coin like everyone else, and around here, buddy, that's the highest praise there is." } },
      choices = {
        { text = "I'll keep the peace here. The Bruisers have nothing to fear from me.", next = "BACK", reply = "Glad to hear it, pal, and the Bruisers will be too. A peaceful shaman's worth his weight in rain.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Bruisers worry. I answer to the elements, not the Cartel.", next = "BACK", reply = "The elements, sure, pal, but the Bruisers answer to the Baron, and the Baron's got a lot of clubs. Just a friendly warning.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The ruins of Zul'Gurub, mostly, and the old Gurubashi temples along the coast where the trolls left offerings to their gods. I don't ask what they do, I just sell 'em, and I'd advise you not to ask either, because some of them answer, and answers aren't refundable." } },
      choices = {
        { text = "I'll examine one carefully, and leave the cursed ones alone.", next = "BACK", reply = "Smart mage, pal, the cursed ones are bad for business. Pick carefully and I'll give you a good price.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll take the whole crate. Power is worth the risk.", next = "BACK", reply = "The whole crate? Pal, I love you already! Mind the one that hums, though, it bit the last guy.", fx = { align = { light = -1 } } },
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bits and pieces from the troll ruins, mostly, and a few things the Bloodsail tossed overboard because they started whispering at night. I sell 'em cheap, real cheap, because I don't like the whispering either, so for a few silver they stop bein' my problem and start bein' yours." } },
      choices = {
        { text = "I'll take them and bind whatever's whispering.", next = "BACK", reply = "You're braver than me, pal, and probably crazier. Take them, and don't tell me what they say.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Throw them back in the sea. Some things should stay drowned.", next = "BACK", reply = "Throw them back? Pal, they're inventory! But fine, fine, maybe the sea's the best place for some of 'em.", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than it admits, I'd say, because every week a crew comes back from the jungle short a few hands and long on nightmares. There's no temple and the Baron won't pay for one, so the sailors make do with rum and each other, and some of them don't make do at all, which is bad for my repeat business." } },
      choices = {
        { text = "I'll tend them without charge. The Light doesn't send bills.", next = "BACK", reply = "No bills? Pal, that's the worst business model I ever heard, but the sailors will love you. Go on, the docks are full of 'em.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Rum works quicker than prayer on sailors. Let them be.", next = "BACK", reply = "Rum's cheaper too, pal, and it sells. Let 'em drink, and I'll sell 'em the rum.", fx = { align = { light = -1 } } },
        { text = "Something else, Krazek.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Tiger pelts, raptor hides, basilisk scales, and gorilla anything, mostly bought by nobles up north who want a rug with teeth. Nesingwary's camp alone ships more skins through here in a month than you'd see in a year, and the Baron takes his cut of every one, and I take a cut of his cut, quietly." } },
      choices = {
        { text = "This jungle can't keep giving forever. Someone should limit the hunting.", next = "BACK", reply = "Limit the hunting? Pal, you're talkin' about my entire inventory! Still, a jungle with no tigers sells no pelts, so maybe I'll mention it to the Baron, quietly.", fx = { align = { order = 1 } } },
        { text = "Hunters take what they can carry. That's the jungle's own law.", next = "BACK", reply = "That's what I keep tellin' the druids, pal, and they keep givin' me that look. Jungle law and market law, same thing with better branding.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_krazek = {
      lines = {
        { id = "xalt_krazek_default", text = "Oh, plenty, pal, because {alt} talked, tipped and argued about the price of a parrot, and that's a full page in my book. I could sell it to you, but you'd only be buying your own family's gossip, and even I've got a few principles, small ones, priced to move." },
        { id = "xalt_krazek_other", when = { alt = { faction = "other" } }, text = "{alt}, {altrace}, other side of the war, paid in silver that spends the same as yours, because in Booty Bay it all does. I keep both sides' secrets in the same ledger, kid, two columns, and you two would look very funny side by side." },
      },
      choices = {
        { text = "A body's kin isn't stock to sell, Krazek.", next = "BACK", reply = "Not stock, pal, just information, and information wants to be free, at a reasonable price. Fine, fine, I'll keep it under the counter.", fx = { align = { honor = 1 } } },
        { text = "Sell it, then, and cut me in on the profit.", next = "BACK", reply = "Now that's family values, pal! Fifteen percent, and I'll tell everybody your cousin's a legend.", fx = { align = { honor = -1 } } },
        { text = "Never mind the notes, Krazek.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Hold on, hold on, I've got you written down already, except you were a {altrace} called {alt} and flying the other colors at the time! I sold that bit of news to both sides by lunchtime, pal, so let's see if you're worth a fresh page or just a footnote." },
        { id = "h_alt_class", when = { alt = { sameClass = true } },
          text = "Another {altclass}! I had one through here called {alt}, kid, who asked all the same questions in nearly the same order, and I charged for every one of 'em, so I'm startin' the meter early, no offense." },
        { id = "h_alt_recent", when = { alt = { days = 7 }, metBefore = true },
          text = "{alt} was in only the other day, pal, and stood right where you're standing, with the same elbow on the same sticky bit of counter. I'm starting to think there's a family resemblance in this town that nobody's told me about, and that annoys me, because it's information." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, how nice! I'll note you down under visitors with a conscience, which is a very short list in Booty Bay, and the Baron pays good money to know who's on it." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman! Thrall's people have been coming through more often since he brought the old ways back, and I keep a note of every one, because notes are inventory, see." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde! Loa or shadow, I don't judge, pal; I only write down which one, because somebody always asks me later and pays to know." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Ah, a fellow professional! You listen at doors and I listen at bars, so we should compare notes sometime, for a fee, split fifty-fifty, or sixty-forty in my favor, since it's my bar." },
        { id = "h_default", key = true,
          text = "Krazek, secretary to Baron Revilgaz! Prices, pirates, who owes whom in this jungle, just ask me, because if I don't know it, it hasn't happened yet, and if it has, it's on special." },
        { id = "h_cousin", when = { heardLine = "tranrek.h_default" },
          text = "You met my cousin Tran'rek in Gadgetzan! Did he tell you what he does? No? He never does, and that's how he stays rich, the sly little sprocket." },
        { id = "h_thorsen", when = { questActive = TODO_QUEST("Supplies to Private Thorsen") },
          text = "Private Thorsen's out near the rebels' camp, waiting on those supplies. Keep your head down on the way, kid, because Kurzen's men don't sign for deliveries and they don't tip." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "That island the Baron frets about? The crews swear they hear things out there at night, and I swear I don't believe them, but I'm also not going for any price, and I've got a price for everything." },
        { id = "h_rumor", when = { questActive = TODO_QUEST("The Rumormonger") },
          text = "I'm trusting you with a rumor on credit, so carry it where I told you, and fast, because rumors spoil faster than fish in this heat." },
        { id = "h_tranrek", when = { questActive = TODO_QUEST("Tran'rek") },
          text = "Tran'rek, in Gadgetzan, pays well for the right sort of help, and he owes me for the last referral. Tell him Krazek sent you; it can't hurt, and it might get me paid." },
        { id = "h_gossip", when = { metBefore = true }, text = "Three new rumors since you left, and one of them's about you! Don't worry, it's a flattering one, mostly, and I've only sold it twice." },
        { id = "h_smotts", when = { heardLine = "smotts.h_default" }, text = "Smotts told you about the giants? He tells everyone, for free, which is a terrible business model, and I think the giants have heard it by now too." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, you'd be just the type to appreciate some of the trinkets that come up out of the old troll ruins, and I've got a crate of them that hum when you get close, priced to move, since frankly the humming's bad for business." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now there's a customer who knows the value of a deal with something bigger than himself, and I've got a few deals that might interest you, small print and all." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Steel's dear down here, friend, since everything rusts, so I hope you've oiled that armor or you'll be paying Zarena for new plates by the end of the week, and she doesn't haggle." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, good, good! I've got buyers for panther pelts, raptor hides and basilisk scales, and not one of my buyers has ever asked how the animal felt about it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in Booty Bay! You'd be amazed what the jungle trade pays for a pelt, and I'd be amazed if you approved of any of it, so let's just not look at the ledger together." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Now that's one I've never written down, and I keep a note of everything that comes through this town, so hold still while I spell it right." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, quick, the Baron rings that bell every four minutes and he docks me if I'm late." },
        { id = "h_again2", text = "More? I love a customer with questions, buddy; questions are inventory, and inventory is money." },
      },
      choices = {
        { text = "What do people in Booty Bay say about shamans?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What rumors are going round about magic in Booty Bay, Krazek?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What's the word in the jungle?", next = "word" },
        { text = "Do you really know everything?", next = "brag" },
        { text = "The Baron must be a hard master to work for.", next = "baron" },
        { text = "What's the rumor about me?", next = "about_me", when = { metBefore = true } },
        { text = "How are the rebels up north holding out?", next = "rebels", when = { faction = "Alliance" } },
        { text = "I trade in information too, Krazek.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "These humming trinkets must come from somewhere strange, Krazek.", next = "xmage", when = { class = "MAGE" } },
        { text = "What have you got that whispers, Krazek? I'm buying.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does Booty Bay have any use for a priest, Krazek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does this jungle hold that's worth a warrior's time, Krazek?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which beasts are fetching the best prices this month, Krazek?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does the jungle trade pay for, Krazek, and who's buying?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What will you write about me, Krazek?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "You've got a problem with gnomes, Krazek?", next = "prej", when = { prejudiced = true } },
        { text = "What do your notes say about my look-alike, Krazek?", next = "xalt_krazek", when = { alt = true } },
        { text = "Thanks, Krazek.", next = "END" },
      },
    },

    word = {
      lines = {
        { id = "w_default", text = "The Venture Company's cutting up the north, Kurzen's men have gone strange, and the trolls are still trolls. It's the same as ever, pal: dangerous, and very, very good for business." },
      },
      choices = {
        { text = "Good for business?", next = "bandages" },
        { text = "Strange how? You mean Kurzen's men?", next = "word_kurzen" },
        { text = "You haven't said a word about the Venture Company.", next = "word_venture" },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1, learn = { "kurzen" } } },
      },
    },
    bandages = {
      lines = { { id = "bd_default", text = "Somebody has to sell the bandages, chum, so it might as well be somebody who knows where you're bleeding and what it'll cost." } },
      choices = { { text = "That's grim, Krazek.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    word_kurzen = {
      lines = { { id = "wk_default", text = "They stopped buying, and soldiers always buy: boots, rum, letters home. When soldiers stop wanting letters home, somethin's gone wrong in their heads, and that's a market I can't sell into." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },
    word_venture = {
      lines = { { id = "wv_default", text = "Big saws, small ethics, the Venture Company. They're digging up something in the hills that sings, and if you want to know more, ask Crank downstairs, but don't believe his first price, or his second." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    brag = {
      lines = { { id = "br_default", text = "Everything worth knowing, and a fair bit that isn't, and the second part's cheaper, so it's a real bargain if you're not picky." } },
      choices = {
        { text = "Prove it. Tell me somebody's weakness.", next = "brag_prove", fx = { trait = { curious = 1 } } },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brag_prove = {
      lines = { { id = "bp_default", text = "Seahorn's, then: rum, storms, and a hat he lost years ago and still talks about. That one's free, since everyone knows it, but the real one costs more than you've got on you, pal." } },
      choices = {
        { text = "What would a rumor about me cost?", next = "op_bay" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    baron = {
      lines = {
        { id = "bn_default", text = "Wonderful! Demanding, suspicious and generous when it suits him, like working for a very rich parrot. Don't repeat that, by the way, because he has a parrot and it's on the payroll." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", reply = "Safe? Pal, you're a gem, a real gem. One day I'll tell you a secret back, at cost.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keeping quiet will cost you, Krazek.", next = "baron_deal", fx = { align = { honor = -2 }, trait = { greedy = 1 } } },
      },
    },
    baron_deal = {
      lines = { { id = "bdl_default", text = "Ha! Now you're talking my language, a discount on rumors, worth whatever I decide, and I've decided it's worth nothing. Nice try, though, kid; I like you more now." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    about_me = {
      lines = {
        { id = "am_default", text = "That you're new, armed and asking questions, which describes every deckhand off the last three ships. I'll write you a better one, for a fee, if you give me something to work with." },
        { id = "am_liked", when = { townStanding = { town = "booty_bay", min = 30 } },
          text = "That you pay what you owe and the Bloodsail don't like you. In Booty Bay, pal, that's practically a love song." },
        { id = "am_king", when = { questDone = TODO_QUEST("Big Game Hunter") },
          text = "That Nesingwary has a new head on his wall and it's partly your fault! Nobody's talking about anything else at the bar, and I'm charging double for the details." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
        { text = "The Baron sent me. He wants your freshest news, Krazek.", tag = "Deceive", next = "crank",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 60 } } } } },
          fail = { next = "crank_no", fx = { affinity = -1 } } },
      },
    },

    rebels = {
      lines = {
        { id = "rb_default", text = "Thinly. They buy flour and boots and pay in Stormwind silver, which is the last thing Stormwind ever sent them, and I send what I can at a fair price, well, fairish, with a little for shipping." },
      },
      choices = {
        { text = "Give them a better price.", next = "rebels_price", fx = { align = { light = 1 }, trait = { generous = 1 } } },
        { text = "A fairish price is fair enough for deserters.", next = "BACK", reply = "Fair enough for deserters, sure, and fair enough for me, pal. Silver's silver, even Stormwind's.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    rebels_price = {
      lines = { { id = "rp_default", text = "A better price, from a goblin, in the Baron's town? You're either very kind or very new, pal. I'll think about the next crate, but don't tell anyone I said even that much, or it'll ruin me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crank = {
      lines = {
        { id = "cr_default", text = "The Baron? Already? Fine, fine, listen: Crank's been selling the Venture Company's singing crystals out the back of this very tavern, and he's got some arrangement with a goblin at the Mirage Raceway that I haven't priced yet, so tell the Baron I was going to mention it today, at the latest." },
        { id = "cr_shards", when = { questDone = TODO_QUEST("Singing Blue Shards") },
          text = "He knows already? Then he knows you carried crystals for Crank yourself, so I'll skip that part, no charge. The new part is a deal with some goblin at the Mirage Raceway, and you can tell the Baron I was going to mention it today, at the latest." },
      },
      choices = {
        { text = "I'll pass it on.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crank_no = {
      lines = {
        { id = "cno_default", text = "The Baron rings a bell when he wants me, friend; he doesn't send strangers up the stairs. Nice try, though, and I'll be selling that story by supper for a silver a telling." },
        { id = "cno_paladin", when = { class = "PALADIN" },
          text = "A paladin, lying for the Baron? Now that's a rumor I can sell twice, so thank you kindly, pal, I owe you one, figuratively speaking." },
      },
      choices = {
        { text = "It was worth a try.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Then you're competition, and I don't like competition, but I like partners, and a partner's just competition who splits the fee. Tell me something I don't know and I'll tell you something you don't, and we'll see who comes out ahead." },
      },
      choices = {
        { text = "The Bloodsail are watching the Baron's ships.", next = "BACK", reply = "Ooh, now that's worth something, pal! I'll pass it on to the right ears and you'll find me very grateful, in a general sort of way.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll tell you something, but it'll be made up.", next = "BACK", reply = "Made up? Pal, half of what I sell is made up, so you'll fit right in. Just make it a good one.", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Pick a subject, any subject, buddy! I've got a rumor on all of 'em and a price tag on most." },
    },
    background = { { id = "tp_bg", text = "I started out running messages, and now I am the messages. That's not bad for a goblin with no inheritance and one good pair of ears." } },
    advice = { { id = "tp_ad", text = "News spoils faster than fish in this heat, so use it quick, before somebody else does and you've paid for nothin'." } },
    kurzen = { { id = "tp_kurzen", text = "The rebels up north buy from me, but Kurzen's lot stopped buying anything a while back, and when a customer stops buying, pal, that's never a good sign." } },
    bloodsail = { { id = "tp_bloodsail", text = "Bad for shipping, bad for business, bad for my nerves. The Baron pays well to make them less of all three, and I'd invoice them for the nerves if I could." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay runs on three things, pal, gold, gossip and the Baron's patience, and I sell two of them. Stick around long enough and you'll learn which two." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls at Zul'Gurub are stirring up the jungle with their blood god business, and the Zandalari on Yojamba Isle want help stopping it. I'll sell you their whole story for a fraction of what you'd pay to learn it the hard way." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Every few hours a chest drops in the Arena and everyone starts swinging, pal, and the smart money is on whoever shows up late. I'm always the smart money." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company's tearing up the jungle north of here for lumber and ore, and they treat the Cartel's trade rules like a polite suggestion. Bad neighbors, pal, and worse tippers." } },
    theramore = { { id = "tp_theramore", text = "Theramore buys rum, cloth and gossip by the crate, and Proudmoore pays her bills on time. That makes her my favorite human, and that list is very short." } },
    onyxia = { { id = "tp_onyxia", text = "Everybody's heard there's a black dragon in Dustwallow, pal, but nobody's sold me a single good fact about her yet. If you find one, come see Krazek first." } },
    _none = { { id = "tp_none", text = "That, I don't know, and it kills me to say it. Come back tomorrow and I will, at tomorrow's prices." } },
  },
}

P:NPC {
  key = "mackinley", id = TODO_NPC("\"Sea Wolf\" MacKinley"), name = "\"Sea Wolf\" MacKinley",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "menacing" }, values = { "cunning", "practical" },
  notices = { "purse", "drink" },

  impression = {
    first = "I mean to stay out of his debt.",
    third = "{name} shared a crate with Sea Wolf MacKinley, a Booty Bay moneylender who swears that not even death cancels a debt owed to him.",
  },

  greetings = {
    { id = "g_crate", text = "Pull up a crate, then. Are you any good at knucklebones? It doesn't matter much, since I'm better." },
    { id = "g_back", when = { metBefore = true }, text = "Look who it is! You don't owe me a thing, not yet anyway." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "A full purse and a friendly face, the two things that go missing quickest in this town. Hold on to both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're three sheets gone. Sit down before you bet something you'll miss in the morning." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When a debtor hides behind his friends, aye, I send somebody broad enough to make the friends reconsider. I don't need anyone hurt, mind, since a dead man pays slowly and a frightened one pays tomorrow." } },
      choices = {
        { text = "I won't break bones over another man's debts.", next = "BACK", reply = "Then ye're no use to me, friend, but I'll not think less of ye for it. There's always somebody broader who's less particular.", fx = { align = { honor = 1 } } },
        { text = "A debt's a debt. I'd collect it however I had to.", next = "BACK", reply = "There's a warrior I could use, and I'll remember yer face when the next debtor hides. Fair's fair, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of them run off into the jungle thinking I'll not follow, and they're right, because I won't, but you might. A frightened man leaves a trail like a wounded boar, and I'd pay attention to where it ends." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some of them run off into the jungle thinking I'll not follow, and they're right, because I won't, but you might. A frightened man leaves a trail like a wounded boar, and I'd pay attention to where it ends. Your {pet} has the nose for it, I'd wager, and a beast never forgets a smell, so let it lead." },
      },
      choices = {
        { text = "I track beasts, MacKinley, not frightened men.", next = "BACK", reply = "Fair enough, and the frightened men are glad of it. The jungle collects them for me often enough.", fx = { align = { honor = 1 } } },
        { text = "Point me at the debtor. Tracking is tracking.", next = "BACK", reply = "Tracking's tracking, aye, and ye'd be surprised how many debtors smell like a scared boar. I'll keep ye in mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A gnome once paid me in conjured gold, and it went to air the minute he was out the door. I found him in the end, and he paid twice, once for the debt and once for the insult, and he does his sums in real coin now." } },
      choices = {
        { text = "A debt's a debt. He should have paid in honest coin.", next = "BACK", reply = "My thinking exactly, and I've been telling gnomes the same ever since. Honest coin never vanishes on you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anyone who cheats a moneylender has my admiration.", next = "BACK", reply = "Do I, now? Then I'll keep an eye on yer purse while ye admire him. Cheats always get collected in the end.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A debt doesn't die with the man, and I've never seen a ghost pay one off, so they can trouble me all they like. If your ancestors want to collect on me, tell them to take a number like everybody else." } },
      choices = {
        { text = "Their spirits deserve rest, MacKinley. Let the dead debts go.", next = "BACK", reply = "Rest they can have, friend, once their accounts are square. I'm not unreasonable, just thorough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A debt's a debt, living or dead. I respect that.", next = "BACK", reply = "A sensible shaman, and a rare one! Debts outlive us all, friend, and I like it that way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tried, a young one who thought a little illusion would make the bones roll his way. I let him win three games before I took back every coin and his robe besides, because a cheat is only clever until he's caught." } },
      choices = {
        { text = "Cheating is cheating. He got what he deserved.", next = "BACK", reply = "He did, and he paid it back with interest, which is the sweetest thing a cheat can do. I still have his dice.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you didn't catch him for three games, he earned the winnings.", next = "BACK", reply = "Three games, aye, and I let him win them to see how he did it. The fourth cost him everything he'd taken and his boots besides.", fx = { align = { honor = -1 } } },
        { text = "Something else, MacKinley.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the Bloodsail only want gold, and gold I can find, but a demon wants something you can't get back once it's spent. I've heard sailors' stories of deals made in the dark of the sea, and none of them ended with a ship coming home." } },
      choices = {
        { text = "A deal made with care can be kept. It's all in the terms.", next = "BACK", reply = "That's the trick of it, aye, and few manage it. I'd want to read those terms with a lawyer and a priest beside me.", fx = { align = { order = 1 } } },
        { text = "Demons don't keep deals. That's why I master them instead.", next = "BACK", reply = "Master them, is it? I've heard that said by men whose debts I collected from their widows. Careful, friend.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "There's mercy in the interest, friend, because I let a man pay late before I send anyone round. Shaky Phillipe down on the docks has had more chances than a cat has lives and still he hides from me, so you tell me who's being cruel to whom." } },
      choices = {
        { text = "Forgive him, MacKinley. Mercy costs less than you think.", next = "BACK", reply = "Mercy's dearer than ye'd think, priest, and I've got a ledger to prove it. But I'll think on it, for a day or two.", fx = { align = { light = 1 } } },
        { text = "He made his bargain. Let him pay what he owes.", next = "BACK", reply = "My sentiment exactly, and he'll pay it, one way or another. Bargains are the only law I trust.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I lend to anyone who comes back, and druids come back more often than sailors, being harder to drown. The last one paid me in herbs, though, and I'm still not sure if I got the better end of it or a rash." } },
      choices = {
        { text = "A debt is a debt. I'd pay you in hard coin.", next = "BACK", reply = "Then ye're the best kind of druid, friend, and I'll lend to ye anytime. Honest coin from honest hands.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A druid owes nothing to a moneylender. The jungle keeps no ledgers.", next = "BACK", reply = "The jungle keeps no ledgers, but I do, friend, and I'm the one ye'd be borrowing from. Remember that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I trust a paladin's word because your lot feel guilty when you break it, and guilt collects better than any Bruiser. A pirate's word is only good until the tide turns, and I've a book full of pirates to prove it, most of them sleeping on the sea floor now." } },
      choices = {
        { text = "A debt fairly made should be paid, MacKinley.", next = "BACK", reply = "It should, and I'm glad a paladin thinks so. Guilt and coin, both collected in full.", fx = { align = { order = 1 } } },
        { text = "Debts owed to a man like you aren't worth honoring.", next = "BACK", reply = "That's a dangerous thing to say to a man with a long memory, paladin. I'll not lend to ye, then, and we'll both sleep easy.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my table! I've never once had a paladin welsh on a debt, which makes you the best credit risk in Booty Bay, so pull up a chair." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, is it? You'll find me a fair man in my way, though if you've come to tell me that forgiving a debt is good for the soul, I've heard that sermon before and I didn't care for the ending." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? You lot talk to dead ancestors, I hear, so you can tell a few of my late debtors I'm still waiting." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? If you're here to pray for my soul, it's fully paid up, and I've got the receipt in a drawer somewhere." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Light fingers on you, I can tell. Pick a pocket in this town and you'll owe the Bruisers, and the Bruisers sell their debts to me." },
        { id = "h_default", key = true,
          text = "They call me the Sea Wolf. Folk borrow, folk forget, and I remind them; dying doesn't get you out of a debt with me, and I've proved it." },
        { id = "h_seen_stoley", when = { heardLine = "stoley.h_default" },
          text = "You've seen Stoley, and he's still breathing? Good, because breathing men can pay." },
        { id = "h_voodoo", when = { questActive = TODO_QUEST("Voodoo Dues") },
          text = "The debt you're collecting has some troll voodoo wrapped round it now. That's no matter to me, because magic doesn't cancel what's owed." },
        { id = "h_maury", when = { questActive = TODO_QUEST("Cracking Maury's Foot") },
          text = "Maury's dead, and he still owes me. Death is no excuse, so bring me what he's got." },
        { id = "h_stoley", when = { questActive = TODO_QUEST("Stoley's Debt") },
          text = "Stoley's been dodging me long enough. Go and see him, and be friendly about it, at first." },
        { id = "h_knuckle", when = { metBefore = true }, text = "Won three hands of knucklebones this morning and lost one. The one I lost, I'll be collecting on." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage at my table, eh? Don't go conjuring any extra dice, friend, because I count every pair in this tavern, and I'd know." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Ah, one of the soul-traders. Between you and me, I'd rather owe money to the Bloodsail than to a demon, and I've owed plenty to the Bloodsail." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? There are a few names on my list who've been dodging me for months, and you look like the sort who could knock on a door without needing it opened." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and they tell me your kind can track anything at all. I've a debtor or two who would be very surprised to hear that." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? I've no shape to change into that'd get me out of a debt, and neither have you, so we'll get along fine." },
      },
      again = {
        { id = "h_again", text = "Still here? Then talk, since talking's free, for now." },
        { id = "h_again2", text = "Go on, then; I'm only shuffling." },
      },
      choices = {
        { text = "Do the spirits of your dead debtors ever trouble you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd wager some debtor has tried to pay you off with magic.", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Deal me in for one game.", tag = "Persuade", next = "game",
          check = { pass = { money = { min = 100000 } } },
          fail = { next = "broke" } },
        { text = "What do people owe you for?", next = "owe" },
        { text = "How do you collect from a dead man?", next = "dead" },
        { text = "Shaky Phillipe is terrified of you.", next = "shaky", when = { heardLine = "shaky.h_default" } },
        { text = "So the undead pay their debts too.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I know a marked deck when I see one, MacKinley.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Has a mage ever cheated you at dice, MacKinley?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why would you rather owe the Bloodsail than a demon, MacKinley?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there no mercy in your ledger, MacKinley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you use warriors to collect your debts, MacKinley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could a hunter track down your debtors, MacKinley?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'd guess druids are too much trouble for your ledger, MacKinley.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you really trust a paladin's word more than a pirate's, MacKinley?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll keep my purse closed, thanks.", next = "END" },
      },
    },

    game = {
      lines = { { id = "gm_default", text = "Coin and nerve, is it? Fine, you'll get your game, though not now, while I'm working. But I'll remember your face, and I never forget a face that can pay." } },
      choices = { { text = "I'll be back for it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    broke = {
      lines = { { id = "bk_default", text = "With that purse? Come back when it weighs more than your mouth does." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },

    owe = {
      lines = { { id = "o_default", text = "Cards, boats, ale, but mostly bad ideas, and bad ideas are always bought on credit." } },
      choices = {
        { text = "And if someone simply can't pay?", next = "owe_cant" },
        { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    owe_cant = {
      big = true,
      lines = { { id = "oc_default", text = "Everybody can pay; it's only a question of what with. Coin, work, a favor, or fear at the very bottom, and I don't like the bottom; it takes longer." } },
      choices = {
        { text = "Fear's a poor collector.", next = "BACK", reply = "It is, aye, slow and messy, but sometimes it's the only one that answers the door. I prefer coin, myself.", fx = { align = { light = 2 }, affinity = -1 } },
        { text = "Sometimes fear is the only thing that works.", next = "BACK", reply = "It is, and I'm glad ye understand it. Fear's paid more debts in this port than honor ever did.", fx = { align = { light = -2 }, trait = { cruel = 1 }, affinity = 1 } },
        { text = "A debt's a debt. Fair's fair.", next = "BACK", reply = "Ye understand my trade better than most, friend. Fair's fair, and a debt's always a debt.", fx = { align = { honor = 2 }, affinity = 1 } },
      },
    },

    dead = {
      lines = {
        { id = "d_default", text = "Dead men leave things behind: teeth, rings, a foot with a secret in it. A debt doesn't die, you see; it just changes address." },
      },
      choices = {
        { text = "A foot?", next = "dead_foot" },
        { text = "That's ghoulish.", next = "BACK", reply = "Ghoulish, maybe, but it's honest. The dead don't need their rings, and their creditors do.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "A debt should outlive the debtor, and fair's fair.", next = "BACK", reply = "There's a creditor's heart, and a rare one. Fair's fair, friend, in this life and the next.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    dead_foot = {
      lines = { { id = "df_default", text = "Maury kept his savings in it. It's wooden, before you ask, or mostly wooden, and you don't want to ask about the rest." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 1 } } },
    },

    shaky = {
      lines = {
        { id = "sk_default", text = "Good. Fear is a fine savings plan, and they always pay when they're shaking enough. Tell him I asked after him kindly; he'll know what kindly means." },
      },
      choices = {
        { text = "Go easy on him. He's harmless.", next = "BACK", reply = "Harmless, aye, and broke, which is worse. I'll go easy, as easy as a debt allows.", fx = { align = { light = 2 }, trait = { kind = 1 } } },
        { text = "I'll tell him, and kindly.", next = "BACK", reply = "Kindly, aye, and he'll still shake. That's the beauty of fear, friend, it works even when ye're nice about it.", fx = { align = { light = -1 }, trait = { cruel = 1 }, affinity = 1 } },
      },
    },

    forsaken = {
      lines = {
        { id = "fs_default", text = "Pay better than the living, mostly. They've nothing left to spend it on and a long memory for who's owed. You'll fit right in at the table." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Do you, now? Then you'll know the deck's honest, friend, because I don't need to mark cards to win; I only need people to keep playing. That's the whole secret of the trade, and I've given it to you for nothing, which I never do." },
      },
      choices = {
        { text = "Then deal me in, and we'll see.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'll keep watching your hands all the same.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I make it my business to know things about people, mostly what they owe. Ask, and we'll see what it costs you." },
    },
    background = { { id = "tp_bg", text = "Sailor, gambler, collector. I was very bad at the first two before I got very good at the third." } },
    advice = { { id = "tp_ad", text = "Don't borrow what you can't pay back, and if you do, don't borrow it from me." } },
    booty_bay = { { id = "tp_booty_bay", text = "I've lived in Booty Bay longer than I've lived anywhere, and it suits a man who keeps a ledger. Everybody here owes somebody, and that keeps everybody polite." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've won more on the Arena than I've lost, which puts me in very select company. The trick is to bet on the fighter nobody's watching." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail have more ships than sense, and they're after Booty Bay as surely as the tide comes in. I sleep with my ledgers locked and my cutlass handy." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I won a whole cart of tickets at the Darkmoon Faire one year, and I still don't know what I traded them for. Silas Darkmoon is the only man alive who's ever gotten the better of me." } },
    second_war = { { id = "tp_second_war", text = "I was at sea during the Second War, running cargo past the orc fleet, and I made more money that year than any since. I'm not proud of it, but I'm not sorry either." } },
    _none = { { id = "tp_none", text = "Does it owe me money? Then I don't care about it." } },
  },
}

P:NPC {
  key = "kebok", id = TODO_NPC("Kebok"), name = "Kebok",
  rivals = { "nesingwary" },
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "slick" }, values = { "ambitious", "cunning" },
  notices = { "purse" },

  impression = {
    first = "His smile never reaches the part about his agents getting killed.",
    third = "{name} heard a business proposition from Kebok, a goblin trader whose agents keep dying in the jungle.",
  },

  greetings = {
    { id = "g_pitch", text = "You've the look of somebody who'd like to be rich, pal, and I can help with that for a fee, a small one, or medium at most, depending on the paperwork." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor is back! Don't tell the others I said so, because they'd want a raise." },
    { id = "g_away", when = { away = 14 }, text = "My favorite contractor, back after {away} away! I kept a few jobs warm for you, with only a small fee for the keeping, payable on completion." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked someone into a deal they didn't want, and I'm proud of you, kid, I really am. Just remember who taught you the business, and remember my commission." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word is somebody caught you telling a fib. Rookie mistake, pal, because in a town like this you never get caught twice; the second time they just send the invoice to your widow." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you've done well for yourself, sweetheart! Ever thought about investing? I have several opportunities, and some of them are even legal." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A warrior makes a better corpse-preventer, which is what I really need, since the Skullsplitters take the head off anyone carrying my crates. Walk my goods past their camps and still have your head at the end of it, and I'll call it a good season and a sound investment." } },
      choices = {
        { text = "I'd carry your goods openly and meet any troll head on.", next = "BACK", reply = "A brave answer, buddy, and the trolls love brave answers, they make for easy targets. But fine, carry them proud and I'll pay danger rates.", fx = { align = { honor = 1 } } },
        { text = "I'd rather sneak the crates past them at night.", next = "BACK", reply = "Now there's a businessman! Quiet's cheaper than heroics, and a lot less funeral costs.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Their witch doctors, and they're the reason my agents come back as bones in a basket, when they come back at all, which is terrible for the quarterly figures. Kill a witch doctor and the rest scatter like gulls, which is what I call an efficient investment." } },
      choices = {
        { text = "I'll kill their witch doctors for a share of the profits.", next = "BACK", reply = "A share, buddy? Let's talk percentages, because dead witch doctors mean live agents, and live agents mean profit.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Those trolls are defending their own land, Kebok.", next = "BACK", reply = "Their land, sure, buddy, but my tusks, and the market doesn't care whose land it is. I'll find someone less principled.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Skullsplitters and the Bloodscalp leave fetishes along the trails, and my agents walk past them and never come back. Curses I don't believe in, but dead agents I do, and I've got a whole ledger page of those." } },
      choices = {
        { text = "Respect their shrines, and your agents might live longer.", next = "BACK", reply = "Live longer, maybe, but they'd also sell less. Fine, fine, I'll tell 'em to tiptoe.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then pay me to smash the shrines. Business is business.", next = "BACK", reply = "Now that's a proposal I can get behind, buddy! Smash the shrines, and I'll pay by the fetish.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Venture Company caught one at the mine, the Bloodsail caught the second, and the third got eaten by something in the jungle that I'd rather not describe. It's all very sad, of course, and I sent flowers, cheap ones, but the work still needs doing, and you look harder to kill." } },
      choices = {
        { text = "I'll do your work, but I want the full truth first.", next = "BACK", reply = "The full truth, buddy? That's the most expensive thing you could ask for. Fine, they were careless, and I was cheap.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sounds like they were careless. I'm not.", next = "BACK", reply = "Careless, sure, and dead. Prove you're not, and I'll pay double what I paid them, which wasn't much.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kebok.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd hire anything that comes back alive, friend, and I'd guess demons are hard to kill. The trouble is that the Cartel's insurance doesn't cover anything summoned, and the Baron is very strict about his paperwork, so your imp would be strictly off the books." } },
      choices = {
        { text = "My demon works for me, not for the Cartel.", next = "BACK", reply = "Then it's a partnership, buddy, I can work with that. Your demon, your rules, my profits.", fx = { align = { order = -1 } } },
        { text = "Then I'll do the work myself, by the Baron's rules.", next = "BACK", reply = "By the Baron's rules? Buddy, you're a breath of fresh air in this town. I'll pay you the honest rate, which is lower.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Grieve is a strong word, but I think about them, yes, usually while I'm writing the next contract. The trolls don't care whose goods they're taking, and my agents knew the risk, though I'll admit a few of them didn't read the small print quite as closely as I wrote it." } },
      choices = {
        { text = "Tell your next agents the whole truth. They deserve it.", next = "BACK", reply = "The whole truth, buddy? They'd never sign! But fine, maybe a little more truth and a little more pay.", fx = { align = { honor = 1 } } },
        { text = "Smart business. What they don't know won't scare them off.", next = "BACK", reply = "My kind of thinking, buddy, and you'd make a great recruiter. Ignorance is the best benefit I offer.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing that's yours to worry about, friend, just goods the trolls would rather I didn't have. A druid who can walk past a raptor without being eaten could earn a fortune off me, a real fortune, and I'd never ask how you did it." } },
      choices = {
        { text = "I'll not use the wild's gifts to smuggle your goods.", next = "BACK", reply = "Fair enough, buddy, I'll find someone with fewer principles and less moss. No hard feelings.", fx = { align = { honor = 1 } } },
        { text = "A fortune's a fortune. Show me the route and I'll walk it.", next = "BACK", reply = "Now we're talking, buddy! The route's through the troll country, so step lightly and keep the crates dry.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honest work, by Booty Bay standards: tusks and fangs, fetched from the Bloodscalp and the beasts around their camps. The Bloodscalp have been cutting down my agents for years, so a little holy vengeance on my behalf wouldn't upset anyone I know, and it'd do wonders for my margins." } },
      choices = {
        { text = "The Bloodscalp kill travelers. They've earned what's coming.", next = "BACK", reply = "They have, buddy, and they've earned a very profitable demise. I'll pay you by the tusk.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I won't wage war on trolls to fill your ledger.", next = "BACK", reply = "Then you're no use to me, buddy, but I'll respect the principle. The Bloodscalp won't, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "You've a look about you I've seen before, pal, on a {altrace} named {alt} who took one of my jungle contracts and brought back more ears than I'd paid for. The other side of the war, sure, but trolls don't check banners before they skin you, so neither do I." },
        { id = "h_alt_class", when = { alt = { sameClass = true } },
          text = "Another {altclass}, and I've already had one on the payroll, a {altrace} called {alt}, who came back from the jungle in one piece, which in my line of work is a gold star. Let's see if you can keep the streak going, friend." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's an agent who'd frighten the Bloodscalp, all that shining plate, though I'd ask you to keep the hammer out of sight in here, chum, because it unsettles the customers and the customers are money." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You're one of Nesingwary's hunters now, I hear. Good for you, but every tiger you skin for him knocks another silver off my pelts, so the drinks are on you tonight, pal; I'm budgeting." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Old Hemet's sore at you, I hear, and anybody who's sore at Hemet is a friend of mine, a valued customer even. What are you buying?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Wonderful, wonderful, because my last few agents died rather badly in the jungle and nobody said a word over any of them, which I'm told is bad for morale among the next few, and morale's a line item now." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, huh? The jungle trolls have witch doctors of their own, so it might do me some good to have someone like you on my payroll for once." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! If your loa or your shadows can stop the Bloodscalp skinning my agents, I'll make you a partner, pal, a very junior partner with a very small share." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, excellent. Fire is very persuasive with trolls, and I keep a list of trolls who need persuading, sorted by price." },
        { id = "h_default", key = true,
          text = "Kebok, at your service. I move goods out of Stranglethorn to places that pay for them, but the trolls keep killing my agents, so I need someone harder to kill, and the pay reflects it, roughly." },
        { id = "h_ears", when = { questActive = TODO_QUEST("Bloodscalp Ears") },
          text = "Bloodscalp ears, pal. Bring me a bundle and I can count how many fewer trolls are bothering my people, which I call business by subtraction." },
        { id = "h_tusks", when = { questActive = TODO_QUEST("Skullsplitter Tusks") },
          text = "Skullsplitter tusks, and don't ask what for. All right, ask: polished up, nobody on the southern islands can tell them from a tiger's fang, and the markup is beautiful." },
        { id = "h_takeover", when = { questActive = TODO_QUEST("Hostile Takeover") },
          text = "That job I gave you: do it quietly, do it quickly, and keep my name off it. Some deals are best closed in the dark, where nobody reads the contract." },
        { id = "h_agents", when = { metBefore = true }, text = "Lost another agent to the trolls last week, a good man and terrible at running, so I'm hiring faster runners now at the same rate." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now you're the kind of agent I can use, friend, because my last three came back in pieces, and I'm sure a quiet one would last longer and cost less in flowers." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, I don't suppose your demon could do a little work for me? I pay in gold, of course, though I imagine it'd prefer souls, and I don't keep those in stock." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! The trolls keep killing my agents, friend, but they were mostly clerks with knives, and you look like you'd take three troll axes before you noticed, which keeps my overhead down." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You'd move through that jungle like it was your own garden, which is exactly the kind of agent I keep losing, so let's talk terms." },
      },
      again = {
        { id = "h_again", text = "Still interested? Excellent, excellent; interest compounds, you know, and so does mine." },
        { id = "h_again2", text = "What else? Time is money, friend, and you're spending mine." },
      },
      choices = {
        { text = "What do the jungle trolls' witch doctors do to your agents?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Bloodscalp must have casters worth worrying about.", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What exactly is the business?", next = "trade" },
        { text = "Troll tusks sold as tiger fangs? That's fraud.", next = "fraud", when = { any = { { questActive = TODO_QUEST("Skullsplitter Tusks") }, { questDone = TODO_QUEST("Skullsplitter Tusks") } } } },
        { text = "What happened to your agents?", next = "agents" },
        { text = "I'm a troll, Kebok.", next = "troll", when = { race = "Troll" } },
        { text = "I hunt tigers myself. You're selling troll tusks as fangs?", next = "k_hunter", when = { class = "HUNTER", any = { { questActive = TODO_QUEST("Skullsplitter Tusks") }, { questDone = TODO_QUEST("Skullsplitter Tusks") } } } },
        { text = "What happened to your last three agents, Kebok?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Surely you wouldn't hire a demon, Kebok.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you grieve for the agents you lost, Kebok?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would a warrior make a better agent than your clerks, Kebok?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your agents keep dying in the jungle. What are they carrying, Kebok?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What sort of work do you have for a paladin, Kebok?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Not interested.", next = "END" },
      },
    },

    trade = {
      lines = { { id = "t_default", text = "Buy low in the jungle and sell high over the sea, pal. The sea's the expensive part, on account of the pirates and their very poor manners." } },
      choices = {
        { text = "Sounds risky.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" } } },
        { text = "Somebody over the sea must be buying all this.", next = "trade_who" },
      },
    },
    trade_who = {
      lines = { { id = "tw_default", text = "Island folk to the south who want a tiger's fang over the door and have never met a tiger. I'd hate to disappoint them, and I'd hate even more to refund them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fraud = {
      big = true,
      lines = {
        { id = "f_default", text = "Fraud is a strong word, buddy; I prefer 'creative sourcing'. Nobody's hurt, except the trolls, and they started it." },
      },
      choices = {
        { text = "Fine by me, so long as it pays.", next = "BACK", reply = "Fine by me too, buddy! A partner who understands the business, at last.", fx = { align = { honor = -2 }, trait = { greedy = 1 }, affinity = 2 } },
        { text = "I'll do the work. Not the lying.", next = "BACK", reply = "Not the lying? Buddy, the lying's my department, and I'm very good at it. You just fetch the tusks.", fx = { align = { honor = 2 }, affinity = 1 } },
        { text = "I'll be telling the Baron.", next = "fraud_baron", fx = { align = { order = 1 }, affinity = -2 } },
      },
    },
    fraud_baron = {
      lines = { { id = "fb_default", text = "Please do. He takes ten percent of it, and he'll be very interested to hear you're worried about his ten percent." } },
      choices = { { text = "...Something else.", next = "BACK" } },
    },

    agents = {
      lines = {
        { id = "a_default", text = "Ambushed on the jungle roads. The Bloodscalp don't negotiate, and believe me, I've tried; I sent a goblin with a very good contract, generous terms and everything, and they sent back the contract." },
      },
      choices = {
        { text = "Just the contract?", next = "agents_contract" },
        { text = "I'm sorry for your people.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    agents_contract = {
      lines = { { id = "ac_default", text = "Signed, in something that wasn't ink. I've had it framed, to remind me to hire tougher people and pay them slightly more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    troll = {
      lines = {
        { id = "tr_default", text = "Darkspear, by the look of you, not Bloodscalp or Skullsplitter, so that's a different tribe, different tusks and a different ledger. We're fine, then, absolutely fine, aren't we, pal?" },
      },
      choices = {
        { text = "For now.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "The Bloodscalp aren't my people. Hunt them.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Keep your voice down, friend, the customers can hear you! A hunter knows the difference, but a merchant in Stormwind doesn't, and as long as he doesn't, the business is very healthy and so are my margins." },
      },
      choices = {
        { text = "I'll keep quiet, for a cut.", next = "BACK", reply = "Now we're talking, buddy! A cut for your silence, and everybody's happy.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll tell every buyer I meet.", next = "BACK", reply = "Every buyer? Buddy, that's very bad for business, and very bad for you. Let's talk about this like reasonable people.", fx = { align = { honor = 1 }, affinity = -2 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Information is just another commodity, chum, and I deal in commodities. Ask, and I'll tell you what I'm willing to part with at today's rate." },
    },
    background = { { id = "tp_bg", text = "Bought my first crate at nine and sold it at ten for twice the price. I never looked back, mostly because I never had the time, and looking back doesn't pay." } },
    advice = { { id = "tp_ad", text = "Never let the client see the warehouse, kid, and never let the warehouse see the client." } },
    bloodsail = { { id = "tp_bloodsail", text = "Every crate they take is a crate I paid for twice: once to buy it, and once to cry about it over the ledger." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the best place in the world to buy cheap and sell dear, friend, and that's the only kind of shopping I recognize. Keep your eyes open and your knives sharp." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Zandalari on Yojamba Isle are paying well for anybody who'll go up against the Gurubashi, and I'm paying better for anything you bring back. Wouldn't you rather be paid twice?" } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've sent a few agents into the Arena to grab the chest, and most of them came back with fewer limbs. The ones who came back whole are on my payroll now." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company is a goblin outfit that forgot it ever had a conscience, and I say that as a goblin without much of one. They're clear-cutting the whole north end around Lake Nazferiti, and they don't even pay for the trees." } },
    theramore = { { id = "tp_theramore", text = "Theramore's soldiers keep pirates out of Dustwallow, and they buy my supplies at a fair price. Proudmoore runs a disciplined port, which means I have to be very creative." } },
    _none = { { id = "tp_none", text = "Is there money in it? No? Then I'm afraid I wasn't listening, pal." } },
  },
}

P:NPC {
  key = "skindle", id = TODO_NPC("Innkeeper Skindle"), name = "Innkeeper Skindle",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "booty_bay" }, temper = { "wry" }, values = { "practical" },
  notices = { "drink", "guest" },

  impression = {
    first = "He lowers his voice near the stairs, which is sensible.",
    third = "{name} took a stool at the Salty Sailor, where Innkeeper Skindle keeps the rooms, the rum and a careful eye on the Baron's stairs.",
  },

  greetings = {
    { id = "g_op_bay", when = { gossip = { topic = "booty_bay", stance = "distrust" } }, text = "Krazek's been selling a story that you called us a den of thieves. Thieves keep the best rum, pal, so sit down anyway and I'll put the stool on your tab." },
    { id = "g_inn", text = "In you come, pal, out of the sun. Stools by the windows get the breeze and cost a copper more, and the sea air covers the smell of the fish for free." },
    { id = "g_home", when = { homeInn = { "Booty Bay", "The Salty Sailor Tavern" } }, text = "Your room's just as you left it, mostly, though the parrots got in again and I've added the feathers to your bill." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away} away! Your room's still yours, since you paid ahead, bless you, though the parrots got in again, so mind the sheets." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody downstairs is sore about something you said, chum, and they've been sore loudly, which is bad for trade. Take a stool by the window and let the breeze cool things down before anything gets broken and billed." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy there, buddy. Pirates drink like that and fall off the pier, and then I have to fish them out, and I charge by the pound." },
  },

  start = "hello",
  nodes = {
    xpt_skindle = {
      big = true,
      lines = { { id = "xpt_skindle_default", text = "Bandages and nerve, you say, as though I haven't heard that one at the bar every night this season. The jungle's full of trolls with poisoned spears, and nerve has never once pulled the poison out of anybody I've known, though it does run up a lovely bar tab first." } },
      choices = {
        { text = "You're right. We'll find a healer before we go back out.", next = "BACK", reply = "Good, at last somebody listened. A healer costs less than a funeral, and I'm tired of selling funeral rum.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We'll take our chances. Healers just slow a company down.", next = "BACK", reply = "Then you'll be back, and so will the bandages, and I'll be pouring for whoever's left. Good luck, friend.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Anyone with a bad conscience, and in this room that's most of them, which is good for the rum trade. The Bruisers keep the peace, but a dead knight with the Light in hand gives my regulars two reasons to sit with their backs to the wall." } },
      choices = {
        { text = "Wicked men should fear me. I'll remember their faces.", next = "BACK", reply = "Remember them all you like, friend, but don't start anything in my tavern. The Bruisers charge for damages, and so do I.", fx = { align = { order = 1 } } },
        { text = "Booty Bay's neutral. Let them drink in peace.", next = "BACK", reply = "Now there's a guest who understands the house rules. Drink in peace, and let the wicked pay for their own rum.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night the fleet's in, and the Bruisers only come running if the Baron's guests are bleeding. I'd sooner have one steady warrior at the bar who can end a brawl with a look than six goons who end it with a table, because tables cost money and looks don't." } },
      choices = {
        { text = "A good warrior ends a fight before it starts.", next = "BACK", reply = "A wise warrior, and a welcome one. If you're on hand on a fleet night, I'll pour you something for every fight you stop.", fx = { align = { order = 1 } } },
        { text = "Some brawls are worth letting run. They clear the air.", next = "BACK", reply = "Clear the air and the furniture, friend. The Baron sends me the bill for every chair.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They tell the biggest lies in the South Seas, and to hear 'em tell it, each one has very nearly killed King Bangalash. The ones from Nesingwary's camp come down for rum and a real bed, and they leave mud all over the stairs the Baron has to walk up, which comes out of my wages, not theirs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They tell the biggest lies in the South Seas, and to hear 'em tell it, each one has very nearly killed King Bangalash. The ones from Nesingwary's camp come down for rum and a real bed and leave mud all over the Baron's stairs, which comes out of my wages. Keep {pet} by the hearth where I can see it, and well away from the kitchen and that cleaver." },
      },
      choices = {
        { text = "A hunter who lies about a kill dishonors the beast.", next = "BACK", reply = "It does, and the beasts would agree with you. Most hunters at my bar don't, mind.", fx = { align = { honor = 1 } } },
        { text = "A good story's worth a little embroidery, Skindle.", next = "BACK", reply = "A little embroidery, says you! Friend, I've heard tigers grow from cats to dragons in one telling.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Somebody to do somethin' about the cellar, pal. The damp gets into the casks, the rats get into the damp, and last week something bigger than a rat got in after them, and none of my staff will go down past the third step, not even for hazard pay." } },
      choices = {
        { text = "I'll clear your cellar, and you can keep your coin.", next = "BACK", reply = "You're a rare guest, friend, and a kind one. If the rats move out, I'll owe you a debt of gratitude, which is free and very sincere.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll clear it, for a month of free rooms.", next = "BACK", reply = "A month free? Friend, I'd sooner give you the rats. Clear it for the glory, and I'll tell everyone you did.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The only spirits I deal with come in a bottle, friend, at a fair markup, though the sailors swear something walks the docks at low tide. I tell them it's the Baron's tax man, and they settle their bills faster." } },
      choices = {
        { text = "If a restless spirit walks your docks, it deserves some peace.", next = "BACK", reply = "Peace for a spirit, now that's a service I'd pay for, in drinks. The sailors say it walks the docks at midnight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it walk. Ghosts on the docks are none of my business.", next = "BACK", reply = "None of mine either, friend, until it walks into my tavern and frightens the customers. Then it's my business.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not him, his people, and they're good at it, so I serve the strong rum near the door and the weak rum near the stairs. A drunk man talks louder, so let him do it where nobody's listening, because loose talk near the stairs costs me my license." } },
      choices = {
        { text = "You're a clever innkeeper. I'll keep my voice down.", next = "BACK", reply = "Clever, and paid by the Baron to be clever. Keep your voice down, and enjoy the rum.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Baron listen. I've nothing to hide.", next = "BACK", reply = "Nobody's got nothing to hide in Booty Bay, friend. The Baron will find something, he always does.", fx = { align = { order = -1 } } },
        { text = "Something else, Skindle.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It is, in the cellar, and I've tried water, sand and a very loud sailor's curse. It doesn't give much light, but it's never once needed trimming, so I've decided to call it an investment and stopped buying candles." } },
      choices = {
        { text = "A candle that never goes out is a fine bargain.", next = "BACK", reply = "A fine bargain, until it sets the cellar on fire. I'll keep it, but I'll keep a bucket too.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd snuff it for you. Strange magic is best ended.", next = "BACK", reply = "You'd do me a kindness, friend, though the cellar might miss the light. Strange magic is bad for the casks.", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, everything, sooner or later, because rum loosens the tongue and nobody remembers I'm listening. I've heard of ships sunk on purpose and cargo gone missing and men who went over the side with a little help, and I keep every word to myself, which is the only reason I'm still pouring, pal." } },
      choices = {
        { text = "Men who drowned others should answer for it.", next = "BACK", reply = "They should, and maybe one day they will. But not in my tavern, and not by my word.", fx = { align = { honor = 1 } } },
        { text = "Keep the secrets. Silence keeps an innkeeper breathing.", next = "BACK", reply = "It does, friend, and it keeps the tavern open. Secrets are the house wine in Booty Bay.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Anyone with a warrant in Stormwind, which is a good third of the room on a busy night, and they all tip like they're buying silence, which they are. They behave themselves here because the Bruisers would throw them off the docks if they didn't, but they still won't sit with their backs to you." } },
      choices = {
        { text = "Wanted men belong in Stormwind's cells. I'll remember their faces.", next = "BACK", reply = "They do, friend, but not in my tavern. Remember their faces all you like, so long as you don't act on them here.", fx = { align = { order = 1 } } },
        { text = "Booty Bay isn't Stormwind. Let them drink in peace.", next = "BACK", reply = "Exactly, friend, and that's why they come here. Booty Bay's the best drink in the South Seas.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only once, and quietly enough, but the stairs haven't been right since, and the Baron heard it from up top. I put it on the bill as furniture, plus a little for my nerves, and decided not to ask whose fault it was." } },
      choices = {
        { text = "Then it was the druid's fault. They should pay for the stairs.", next = "BACK", reply = "The druid paid, friend, and paid well, but the stairs still creak. The Baron added a fee for the noise.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bear in a pirate inn sounds like a fine night. Leave it be.", next = "BACK", reply = "It was a fine night, friend, I'll grant you, and the sailors still talk about it. The Baron didn't think so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_deaths_skindle", when = { deaths = { min = 20 } },
          text = "You've been dragged back from the dead so many times, pal, the spirit healer ought to be charging you rent. I'll give you a bed, but if you die in it, the cleaning's on your account." },
        { id = "dd_venture_skindle", when = { killed = { name = "Venture", min = 50 } },
          text = "Word on the docks is you've been tearing up the Venture Company camps up the coast. Bad for them, good for the Cartel, and good for my rooms, because the loggers who used to come here to complain have stopped coming at all." },

        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "You're the second one with that face this month, pal, and the first was a {altrace} called {alt}, from the other side of the bar, if you take my meaning. Same scowl at the stairs, same complaint about the rum, and you'll pay what {alt} paid, because I'm fair like that." },
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Your cousin was in, pal, or your brother, or whatever {alt} is to you, and drank the cheap rum and complained about the expensive. I'm guessing it's a family trait, and I've got a whole shelf for it." },
        { id = "h_pt_skindle", tags = { "news" }, when = { class = { "WARRIOR", "ROGUE", "MAGE", "WARLOCK", "HUNTER" }, party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" }, ["not"] = true } },
          text = "No healer among the lot of you? Then you'll be wanting rooms close to the stairs, because I've carried enough half-dead adventurers up them to know how this ends, and I charge a carrying fee now." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the Salty Sailor, there's a sight. Keep your blessings quiet near the stairs, if you would, because the Baron's men don't care for anything they can't put a price on." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin, in here? Take a seat by the wall, friend, where you can see the door, because a good few of my regulars won't drink within spittin' distance of the Silver Hand, and I can't afford to lose 'em." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Salty Sailor! If you can do anything about the damp in my rooms, pal, I'll speak well of you to the Baron, and that's worth more than a free rum." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the Salty Sailor. Sit where you like, only please don't bless the rum, because the last one who did put the sailors right off it and cost me a week's takings." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock at my bar. Your imp can sit by the fire, but it pays for its own stool like everybody else, and if it singes anything, that's on your tab too." },
        { id = "h_default", key = true,
          text = "The Salty Sailor, pal, rooms upstairs and rum down here, and the Baron up top over all of it, counting. Keep your voice down near the stairs, because the walls are thin and the Baron's ears are expensive." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two pirates fought over a parrot last night, and the parrot won. It's upstairs now, paying rent somehow, while both pirates are sleeping it off on the Bruisers' tab." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night in Booty Bay means lanterns on the water, music on every deck and somebody falling off a pier, like clockwork, and whoever goes over owes me for a drink first." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue at my inn. Keep your voice down near the stairs, chum, because the Baron's ears reach all the way down from that balcony, and my license isn't worth losin' over somebody else's business." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! The last one who stayed here left a candle burning that never went out, and I still can't figure out how to snuff it, though I've stopped paying for lamp oil, so I'm not complaining." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, in my common room. Lean your shield by the door if you like, because the last fellow who drank with his on knocked three tankards and a sailor off the bar, and the sailor billed me." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? If you've a beast with you, keep it out of my kitchen, because the cook throws cleavers at anything with fur and she rarely misses, and I don't refund pets." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at the Salty Sailor! Mind the rum, friend; I've seen what happens when one of your kind turns into a bear after the third mug, and the repairs came to forty silver." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, in here, and a Forsaken one besides? Take a seat by the wall, friend, because half my customers fear the Light and the other half fear the dead, and I need both halves paying." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've three tabs to chase and one of them's armed, so make it quick, pal." },
        { id = "h_again2", text = "More? Lean on the bar, then, only not that bit; that bit's sticky and I haven't figured out who to bill for it." },
      },
      choices = {
        { text = "Do the sailors here tell stories of spirits on the docks?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the Salty Sailor need from someone with magic?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Heard anything interesting?", next = "gossip" },
        { text = "What's it like with the Baron living upstairs?", next = "baron" },
        { text = "You must get all sorts drinking in here.", next = "regulars" },
        { text = "Does the Horde get a fair pour here?", next = "x_horde", when = { faction = "Horde" } },
        { text = "Stormwind soldiers drink beside orcs here?", next = "x_alliance", when = { faction = "Alliance" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Does the Baron really listen at your stairs, Skindle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is that magic candle still burning, Skindle?", next = "xmage", when = { class = "MAGE" } },
        { text = "What do the sailors confess over their rum, Skindle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Plenty in Booty Bay must fear the Silver Hand, Skindle.", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Do fights break out often in the Salty Sailor, Skindle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the hunters who stay here tell good stories, Skindle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has a druid really turned into a bear in your inn, Skindle?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Who in Booty Bay fears a Forsaken paladin, Skindle?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "We manage without a healer, Skindle. Bandages and nerve do the job.", next = "xpt_skindle", when = { class = { "WARRIOR", "ROGUE", "MAGE", "WARLOCK", "HUNTER" }, party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" }, ["not"] = true } } },
        { text = "Just passing through.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "In this tavern? Everything, and none of it true. Do you want the Bloodsail rumor or the haunted island, chum? They're the same price, and the price is a drink." } },
      choices = {
        { text = "The Bloodsail.", next = "gossip_bloodsail" },
        { text = "The island.", next = "gossip_isle" },
        { text = "I'll pass.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gossip_bloodsail = {
      lines = { { id = "gb_default", text = "Red bandanas drinking in my corner, pretending to be fishermen. Only fishermen don't tip, and these do, generously, which is how I know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    gossip_isle = {
      lines = { { id = "gi_default", text = "Captains won't go near it. One swore he heard his dead mother calling from the beach, but his mother runs a fish stall in Ratchet, I've met her, and she still owes me two silver." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    baron = {
      lines = { { id = "bn_default", text = "Quiet, mostly. He stamps when the music's too loud and sends Krazek down when it's too quiet, because too quiet means nobody's buying, and that's the one sound the Baron can't stand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_horde = {
      lines = {
        { id = "xh_default", text = "Same rum, same price, same sticky bar as everyone. The Baron's rule is that coin has no colors in his town, and I'd be a fool to argue with the goblin who owns the roof." },
      },
      choices = {
        { text = "And if someone starts trouble?", next = "x_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_alliance = {
      lines = {
        { id = "xa_default", text = "Beside them, across from them, occasionally under the same table when the rum's good. Nobody draws steel in the Salty Sailor, pal, because the Bruisers drink here too and they drink on account." },
      },
      choices = {
        { text = "Somebody must start trouble now and then.", next = "x_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_trouble = {
      big = true,
      lines = {
        { id = "xt_default", text = "Then the Bruisers throw them off the pier, whichever side they're on, and the sharks don't check tabards. That's the whole of Booty Bay's law, and I've never seen a cheaper one to run." },
      },
      choices = {
        { text = "A firm hand keeps the peace. Good.", next = "BACK", reply = "It does, and the sharks keep the peace too. Firm hands and sharp teeth, that's Booty Bay.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Feeding people to sharks isn't law.", next = "BACK", reply = "It's the Baron's law, friend, and the sharks are its magistrates. I don't make the rules, I just pour the drinks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Whiskey Slim, who toasts everyone and threatens their fingers; Crank, who'll sell you a deal; and MacKinley, who'll sell you a debt. Pick your poison, buddy, since I sell that too." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Rum loosens tongues, and I pour it by the barrel, at a very fair markup. Ask me what you like, and keep your voice down near the stairs." },
    },
    background = { { id = "tp_bg", text = "I've poured drinks in worse places than this, pal. Booty Bay pays better, the tips are bigger, and the fights are funnier." } },
    advice = { { id = "tp_ad", text = "Sit facing the door like everybody else, pal; that's why the chairs are all on one side, and why I charge extra for the good ones." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a good town to pour drinks in, pal, if you don't mind the odd knife fight. Everybody comes through the Salty Sailor eventually, and most of them pay." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Half my regulars spend their days at the Arena, and they come back thirsty and bleeding, which is good for business both ways. I keep bandages behind the bar for the regulars." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "I've heard Fizzgrimble down in Gadgetzan serves sand in his stew and calls it seasoning, and I respect the nerve. At least our seafood comes with real salt." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Darkmoon Faire comes to town, the Salty Sailor empties out for days, and then fills right up again with folks who've lost their money. I don't mind; they drink cheaper beer then." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail don't drink here, pal, not openly anyway. I'd like to keep it that way, so if you see a red bandana in my bar, tell me quietly." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, chum. Ask whoever's drinking the most; they always have a theory, and it's usually on my tab." } },
  },
}

-- More of Booty Bay: the sea giants' victim, the debtor, the first mate, the schemer, the tavern owner, the leathercrafter.
P:NPC {
  key = "smotts", id = TODO_NPC("Captain Hecklebury Smotts"), name = "Captain Hecklebury Smotts",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "vengeful" }, values = { "proud", "stubborn" },
  notices = { "kit" },

  impression = {
    first = "Sea giants cost him two ships, and he hasn't given up.",
    third = "{name} heard Captain Hecklebury Smotts tell of the three sea giants who sank two of his ships and took everything he owned.",
  },

  greetings = {
    { id = "g_giants", text = "Sea giants, three of 'em! You can ask me about them or not, for I'll tell you anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are you? If you've found my chest, my cutlass or my sash, out with it; if not, sit down and I'll tell you the whole sorry tale again." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Looks like the sea's had a go at you too. Welcome to the club, though I'll warn you the membership's terrible." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not alone, since Gorlash took my first ship in one swing, but a giant has knees like any other brute, and knees can be broken. Hold your ground in the shallows and the beast will come to you, which is more than my crew ever managed." } },
      choices = {
        { text = "Patience and a steady shield will bring a giant down.", next = "BACK", reply = "That's what I tell myself every morning, friend. Patience and a shield, and maybe I'll have my revenge yet.", fx = { align = { order = 1 } } },
        { text = "I'd charge it head on and let fury do the rest.", next = "BACK", reply = "Then you'll end up like my first ship, friend, in pieces at the bottom of the bay. Fury doesn't work on giants.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "By the wreckage, mostly, since they leave a trail of broken hulls from the Cape down to the Wild Shore. You'll see them wading the shallows near the old wrecks, and anyone who says they can't be hunted has never lost two ships to them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "By the wreckage, mostly, since they leave a trail of broken hulls from the Cape down to the Wild Shore. You'll see them wading the shallows near the old wrecks, and anyone who says they can't be hunted has never lost two ships to them. Keep {pet} out of the surf when you go, because a giant won't notice a beast underfoot until it's stepped on it." },
      },
      choices = {
        { text = "Revenge isn't hunting, Captain. You should let them go.", next = "BACK", reply = "Let them go? Friend, they took my ships and my crews, and I'll not let them go while I've breath. Hunting or not, I want them.", fx = { align = { light = 1 } } },
        { text = "Then we'll hunt them down and take every one.", next = "BACK", reply = "That's the spirit I've been waiting for! Bring me their heads and I'll toast you every night.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They came up out of the water like hills with arms and pulled my ships apart plank by plank. I lost two good crews and a fortune in cargo, and I've sworn I'll see them dead or die trying." } },
      choices = {
        { text = "Vengeance will eat you alive, Captain. Let it go.", next = "BACK", reply = "Maybe it will, but it's all I've got left. Let it eat me, as long as the giants go first.", fx = { align = { light = 1 } } },
        { text = "Then let's sink them. I'll bring the storm.", next = "BACK", reply = "A storm! Now that's what I've been dreaming of every night. Bring it, and I'll stand at the bow.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd trade almost anything, and that frightens me a little when I think about it at night. Sprogger, my cook, tells me I'm a fool to even consider it, and he's usually right, though I've never told him that." } },
      choices = {
        { text = "Sprogger is right. Some prices are too high.", next = "BACK", reply = "Maybe he is, and that's why I haven't asked you yet. Some prices are too high, even for revenge.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Vengeance is worth any price. I'll help.", next = "BACK", reply = "You'd do it? Friend, I'd almost be afraid of you. Almost.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That's what I'm asking you, and you're not answering! If you could tell Gorlash, Negolash and Mok'rash that I want my ships back, I'd pay well, though I'd rather you told them something ruder." } },
      choices = {
        { text = "Giants aren't beasts to bargain with. They must be stopped, plainly.", next = "BACK", reply = "Then you're braver than me, and maybe right. I'll take plain stopping over nothing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave the giants be, Captain. The sea took your ships fairly.", next = "BACK", reply = "Fairly? Friend, there's nothing fair about a giant pulling a ship apart. I'll not let them go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maybe it hasn't, and maybe it simply doesn't sail this far south. Gorlash, Negolash and Mok'rash took two crews of good men, and if the Light wants me back on its side, it can start by helping me put a harpoon through one of them." } },
      choices = {
        { text = "The Light stands with you, Captain, giants or no.", next = "BACK", reply = "Then I hope it's a strong Light, because those giants are very strong. Thank you, paladin.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then leave the Light out of it and keep your harpoon sharp.", next = "BACK", reply = "My harpoon's sharp, friend, and I'll keep it that way. The Light can catch up when it's ready.", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "My chest, my sash and my cutlass, which Negolash took right out of my hand, and the rest is scattered among the wrecks his brothers left. A quiet sort could fish a few things out of the shallows while the brutes are busy, and I'd call that a rescue, not a theft." } },
      choices = {
        { text = "Your things are yours. I'll fetch them back untouched.", next = "BACK", reply = "Untouched, aye, and I'll thank you twice for it. Bring them back and I'll be a happy man again.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fetch them, and keep whatever else I find.", next = "BACK", reply = "Keep whatever else you like, friend, the giants won't miss it. Just bring me that cutlass, because it was my father's.", fx = { align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? I don't suppose you could sneak aboard a sea giant, but if you can, I'd like to hear about it, and I'd like my cutlass back." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I prayed every night after the first ship went down, and the giants sank the second anyway, so the Light and I aren't on speaking terms just now." },
        { id = "h_default", key = true,
          text = "Captain Hecklebury Smotts. I had a ship, a crew and a fortune, and three sea giants took the lot: Gorlash, Negolash and Mok'rash. I bought another ship to hunt them, and they sank that one too." },
        { id = "h_cutlass", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash has my cutlass; he took it right out of my hand. Bring a crew, because he's bigger than he looks, and he looks enormous." },
        { id = "h_sash", when = { questActive = TODO_QUEST("The Monogrammed Sash") },
          text = "Mok'rash has my sash, the monogrammed one my mother stitched for me. Get it back and I'll forgive the ocean, partly." },
        { id = "h_sprogger", when = { metBefore = true },
          text = "Of the whole crew of my second ship, only the cook survived, Sprogger of all people. I've never once complained about his stew since, not out loud." },
        { id = "h_negolash_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Facing Negolash"), days = 3 } },
          text = "Negolash is gone, and I keep waiting to feel lighter. I feel exactly as heavy, just with a cutlass." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you call up a storm and sink those three sea giants for me? I'd pay well, and I'd pay double if you made it painful." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You carry a smell I know from the docks at night. I'll admit I've thought about hiring one of your demons to deal with those giants, but I'm told they want more than gold." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Good, because I'm done hiring sailors; what I need is someone who'll stand toe to toe with a sea giant and not lose their nerve." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I've been hunting three sea giants for years, so we're in the same trade, you and I, only my quarry keeps sinking my boats." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You speak to beasts, they tell me, so tell me this: can you speak to a sea giant? I've a few things I'd like to say to three of them." },
      },
      again = {
        { id = "h_again", text = "Aye, something else? Ask away, for I've nowhere to be, nowhere at all." },
        { id = "h_again2", text = "Go on and ask, and then I'll tell you about the giants again." },
      },
      choices = {
        { text = "Why not give up?", next = "giveup" },
        { text = "Something must have happened, that first time.", next = "first" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "Will you ever sail again?", next = "sail" },
        { text = "I lost people too. Everyone I grew up with.", next = "lost",
          when = { origin = { "human_lordaeron_refugee", "gnome_gnomeregan_refugee", "nightelf_hyjal_survivor" } } },
        { text = "Negolash is dead. How does it feel?", next = "after", when = { questDone = TODO_QUEST("Facing Negolash") } },
        { text = "Shall I say words for your crew, Captain?", next = "priest_words", when = { class = "PRIEST" } },
        { text = "Could a warrior really stand against a sea giant, Captain?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How would you track a sea giant, Captain?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You talk as if the Light has abandoned you, Captain.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What did the giants take that's worth stealing back, Captain?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll get your things back.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "The sea spirits took your crews, Captain. Not luck.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "How did the sea giants sink your ships, Captain?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really sell a piece of your soul for vengeance, Captain?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Can a druid really speak to sea giants, Captain?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll leave you to it, Captain.", next = "END" },
      },
    },
    giveup = {
      big = true,
      lines = {
        { id = "gu_default", text = "Give up? Two crews are at the bottom of that bay, and if I give up, they drowned for nothing. I'm a stubborn man, and it's all I've got left." },
      },
      choices = {
        { text = "Then I'll help.", next = "BACK", reply = "Then you're the first who's said so, and I'll not forget it. We'll make those giants pay for every plank and every sailor.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "They'd want you to live, not to hunt.", next = "giveup_live", fx = { align = { light = 2 }, trait = { kind = 1 } } },
        { text = "Revenge won't bring them up.", next = "giveup_live", fx = { trait = { stern = 1 } } },
      },
    },
    giveup_live = {
      lines = { { id = "gl_default", text = "You didn't know them. Half of them would've hunted those giants with a rowboat and a spoon, so believe me when I say I'm the sensible one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    first = {
      lines = {
        { id = "f_default", text = "Calm sea, full hold, good wind, and then the water stood up. That's the only way I can say it: the water stood up, and it had a face." },
      },
      choices = {
        { text = "How did you get away?", next = "first_away" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_away = {
      lines = { { id = "fa_default", text = "I clung to a hatch cover for a day and a night until a Blackwater sloop fished me out. I paid them back, mind; I pay everyone back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    crew = {
      lines = {
        { id = "c_default", text = "Good sailors, loud singers, and terrible at cards. I can still name the whole crew, and I do, most nights, out loud, though the innkeeper's asked me to stop." },
      },
      choices = {
        { text = "Name one for me.", next = "crew_name", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_name = {
      lines = { { id = "cn_default", text = "My bosun, who laughed at storms and cried at weddings. That's all you're getting; the rest of them are mine." } },
      choices = { { text = "Thank you, Captain.", next = "BACK", fx = { affinity = 2 } } },
    },
    sail = {
      lines = {
        { id = "s_default", text = "When the giants are gone. I've no ship and no crew, so it's a promise that costs me nothing. But I make it every morning anyway." },
        { id = "s_done", when = { questDone = TODO_QUEST("Facing Negolash") },
          text = "One giant down, maybe, if I can find a crew mad enough to sail with me. Sprogger says he'll cook, and he says it like it's a threat." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      big = true,
      lines = {
        { id = "lo_default", text = "Then you know nobody tells you what to do with your hands afterwards. I bought a ship; what did you do with yours?" },
      },
      choices = {
        { text = "Picked up a sword.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I kept walking, and I still am.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'd rather not say.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Like holding my own cutlass for the first time in a year, and heavier than I remembered. There are two more of them out there, mind." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest_words = {
      lines = { { id = "pw_default", text = "Sprogger asked me that once, and I said no, because I wasn't ready. Say them now, but not too long, and I'll stand at the back where nobody can see my face." } },
      choices = {
        { text = "I'll keep it short.", next = "BACK", reply = "Short is good, priest, because I'm not sure I can stand a long one. Say it for the crews, not for me.", fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "Words won't help them now, Smotts.", next = "BACK", reply = "Maybe not, but they'd help me, and I'm the one still here. I'll ask Sprogger again some other day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Spirits, is it? Then the spirits had a giant's face and a giant's fists, and they laughed while they did it. Don't tell me the sea took them, shaman; Negolash took them, and I mean to have my cutlass back from him." },
      },
      choices = {
        { text = "Then I'll help you face him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Some things the sea gives back, Captain. Some it doesn't.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've sailed every inch of this coast hunting those giants, and I've learned a thing or two along the way. Ask, and I'll tell you." },
    },
    background = { { id = "tp_bg", text = "I've been captain of two ships and two crews, and both are at the bottom of that bay. That's my story, and I tell it every night.", next = "giveup" } },
    advice = { { id = "tp_ad", text = "Never sail where the water stands up. You'll know it when you see it, and you'll wish you hadn't." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where a captain without a ship ends up, pal, sitting by the water and planning his revenge. It's good for that, the drinks are strong and the view's full of other people's ships." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I went to the Arena once to win enough gold for a new ship, and I came away with a broken nose and a good story. I'm still working on the ship." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail are as bad as the giants that sank me, except they do it on purpose, and they smile while they're at it. I've got no love for any of them." } },
    theramore = { { id = "tp_theramore", text = "I hear Theramore's navy keeps their waters clear of giants and pirates both, and I'd take a job on one of their ships in a heartbeat. They won't take me, of course, because I'm too old and too honest." } },
    second_war = { { id = "tp_second_war", text = "I was a boy on a fishing boat when the orc ships came down the coast in the Second War. I learned more about seamanship that year than I did in all the years since." } },
    _none = { { id = "tp_none", text = "Is it a sea giant? No? Then it isn't my problem." } },
  },
}

P:NPC {
  key = "shaky", id = TODO_NPC("\"Shaky\" Phillipe"), name = "\"Shaky\" Phillipe",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "nervous" }, values = { "cautious" },
  notices = { "kit" },

  impression = {
    first = "Someone large with a gambling habit is clearly looking for him.",
    third = "{name} met Shaky Phillipe, a nervous Booty Bay sailor who seems very worried about a certain large gambler.",
  },

  greetings = {
    { id = "g_jump", text = "Ah! Oh, it's only you; I thought you were... well, nobody, nobody in particular, so hello there." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Is that blood, and is it yours? No, don't tell me, and please don't come any closer either." },
  },

  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No! I mean, yes, but only if they're small tracks, and only if they're leaving. A hunter can read who's been where, can't they, so you'd know if a large man from the Sea Wolf's table had been waiting about, and I might sleep through a whole night for knowing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "No! I mean, yes, but only if they're small tracks, and only if they're leaving. A hunter can read who's been where, can't they, so you'd know if a large man from the Sea Wolf's table had been waiting about, and I might sleep through a whole night for knowing. And could {pet} sit by my door tonight, perhaps, just for a little while, since nobody knocks on a door with a beast in front of it?" },
      },
      choices = {
        { text = "Pay your debts, Shaky, and you won't need a guard.", next = "BACK", reply = "Pay them? With what, my nerves? I'd pay if I could, honestly I would, and that's the whole trouble, isn't it.", fx = { align = { honor = 1 } } },
        { text = "I could hide you where nobody tracks, for the right price.", next = "BACK", reply = "Would you? Oh, would you, because I can't pay much, or anything, but I could owe you, and I'm very good at owing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Could it? Could it really? I've thought of a ward on the door, or a glyph, or something to make my room look like a wall. Only MacKinley knows a fellow who knows a fellow, and they'd just send somebody who can see through walls." } },
      choices = {
        { text = "I'll set you a ward, and MacKinley can whistle for it.", next = "BACK", reply = "Oh, bless you, bless you, I could kiss you, though I won't, because he might be watching. Just a small ward, nothing that glows.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should just pay what you owe, Phillipe.", next = "BACK", reply = "I would, I truly would, if I had it, which I don't, which is why I'm hiding behind this barrel. Please don't tell him you saw me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would you? No, don't, because if it says yes I'd only have to run, and I've nowhere left to run to. If the wind ever whispers the name Phillipe, though, you'll tell me first, won't you?" } },
      choices = {
        { text = "Pay what you owe, Phillipe, and the spirits will leave you be.", next = "BACK", reply = "Pay? With what, the spirits' money? I'd pay if I had it, and I'd pay the spirits too if it would stop them looking at me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Run, then. A debt you outrun is a debt you never pay.", next = "BACK", reply = "That's what I've been doing, and look where it's got me, three barrels and a crate later. But thank you, I think.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Nobody you'd know, and nobody I'd like to introduce you to, so let's leave it at that. I owe him a little money, and a little more than that, and he's not the sort to forget a debt." } },
      choices = {
        { text = "Then pay him back. Running only makes it worse.", next = "BACK", reply = "Back? I'd love to pay him back, I dream about it, but my purse has other ideas. It's always been a very stubborn purse.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hide well. Debts are only real if he finds you.", next = "BACK", reply = "Hide well, yes, that's what I'm trying, but he always finds me. Maybe I'm not hiding well enough.", fx = { align = { honor = -1 } } },
        { text = "Something else, Shaky.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because I owe money to the kind of people who don't care how they get paid, and I've heard stories about debt collectors in Booty Bay that would turn your hair white. I'm sure you're not one of them, but I'll stand over here just in case." } },
      choices = {
        { text = "Relax. I'm not here to collect anyone's debts.", next = "BACK", reply = "Oh, thank the Light, I mean, thank whatever you thank. You'll forgive me if I keep shaking anyway.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe I am. Best pay up, Shaky.", next = "BACK", reply = "Oh no, oh no, oh no, I knew it, I knew it the moment you walked in! Please, I'll pay, just not today, or this week.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nothing, nothing at all, only I might have borrowed a little from the Sea Wolf, and then a little more to win back the first little, and then the dice turned on me as dice do. Now I sleep with a chair against the door and I don't go near the docks after dark." } },
      choices = {
        { text = "Face MacKinley and tell him the truth. It's your best chance.", next = "BACK", reply = "The truth? He'd laugh, and then he'd send somebody broad. But maybe you're right, maybe it's my best chance, Light help me.", fx = { align = { honor = 1 } } },
        { text = "Lie low and take the next ship out. Debts can't swim.", next = "BACK", reply = "Can't swim? Oh, that's the best thing anyone's said to me in weeks. Do you know which ship leaves first?", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nobody's looking for me, ha, ha, why would anybody be looking for me? Only a druid can turn into a cat and slip off into the jungle, and I was thinking, idly, that it must be a very comfortable way to avoid people you owe." } },
      choices = {
        { text = "Running won't settle it. Face him and pay what you owe.", next = "BACK", reply = "Face him? I'd faint before I got a word out, but maybe, maybe if you stood behind me. Very close behind me.", fx = { align = { honor = 1 } } },
        { text = "Then slip off quietly. Not every debt is worth facing.", next = "BACK", reply = "Quietly, yes, I'm very good at quietly, I've had lots of practice. Thank you for not making me feel worse.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sea Wolf MacKinley, that's who, or his collectors, since he never does it himself, and I owe him more than I'll make in a year. I know I shouldn't have played him at knucklebones, but he was so friendly about it, and now he's friendly every time I pass his table, which is worse." } },
      choices = {
        { text = "Pay what you owe, Shaky, and face him squarely.", next = "BACK", reply = "Honestly, yes, I'll try, but he scares me so. Maybe if I bring him a little first, he won't break anything.", fx = { align = { honor = 1 } } },
        { text = "Lie low, Shaky. A debt to a cheat isn't binding.", next = "BACK", reply = "A cheat? Oh, he is, isn't he, I knew it! But he's a cheat with very large collectors, so I'll keep lying low.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, that's a relief, really it is, because nobody's going to break my legs with a paladin standing right here, are they, so you'll stand right here a while, won't you?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, oh good, good, you'll be the honest sort, so you'll tell me straight whether a large man with a ledger has been asking after me, won't you, because I'd hate to find out from his friends." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman? Oh, good, good. You couldn't ask the spirits whether a big man is coming up the pier, could you? No? Never mind, ha, ha." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest? Oh, could you say a few words over me, just in case? Nothing's going to happen, of course, ha, ha." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh! You came up very quietly. Please don't do that, because MacKinley's men walk quietly too, and my heart can't take it." },
        { id = "h_default", key = true,
          text = "They call me Shaky, and I can't think why, ha, ha. Listen, has a big man with a gambling habit been asking about me? You'd tell me if he had, wouldn't you?" },
        { id = "h_mackinley", when = { heardLine = "mackinley.h_default" },
          text = "You've talked to MacKinley, I can tell, because you've got that look, the look of someone who knows what I owe. I'll pay! Tell him I'll pay soon, very soon!" },
        { id = "h_scared", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "I paid, every last coin, and I'm never playing knucklebones again. After the scare you gave me, I've lost my appetite for good, too." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage? Could you make me invisible, just for a few days? There's a large man with a gambling habit looking for me, and I'd really rather he didn't find me." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Oh no, did he send you? Please tell me he didn't hire a demon to collect, because I really can't afford that." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You don't happen to have seen big footprints near my door, have you, the heavy kind, belonging to somebody very large who likes to gamble?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, ha! Could you, ah, turn into something fast if a big man came along? Not for me, of course, I'm just curious." },
      },
      again = {
        { id = "h_again", text = "What else? Is there someone standing behind me? Don't look, just tell me, quietly." },
        { id = "h_again2", text = "Still here? That's nice, or is it nice? I really can't tell any more." },
      },
      choices = {
        { text = "Shall I ask the earth whether trouble is coming for you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic keep MacKinley's men away from you?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "How much do you owe him?", next = "debt" },
        { text = "How did you get into this?", next = "how" },
        { text = "You could just leave Booty Bay.", next = "leave" },
        { text = "MacKinley asked me to check on you.", next = "panic", when = { heardLine = "mackinley.h_default" } },
        { text = "Want me to teach you to hide properly?", next = "hide", when = { class = "ROGUE" } },
        { text = "You seem afraid for your life, Shaky. What happened?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shall I tell you whose tracks are outside your door, Shaky?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Who wants to break your legs, Shaky?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your secret's safe, for now.", next = "END", reply = "Thank you, oh, thank you, you're a good soul! I'll try to stay out of sight, which shouldn't be hard.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Pay whatever you owe, and you'll stop shaking.", next = "END", reply = "If only it were that easy, I'd have stopped shaking years ago. Light keep you, and don't tell anyone where I am.", fx = { align = { honor = 1 } } },
        { text = "Want me to lean on this gambler for you?", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Somebody must be looking for you, Shaky.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why would anyone send a demon after you, Shaky?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Who's looking for you, Shaky, and why should a druid care?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Calm down, Phillipe. Nobody's after you.", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    debt = {
      lines = {
        { id = "d_default", text = "A number, a big number, a number that grows while I'm asleep. So I've stopped sleeping, which should slow it down, shouldn't it?" },
        { id = "d_paid", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "Nothing! Nothing at all, now, though I still check every morning, just to be sure." },
      },
      choices = {
        { text = "I could talk to this big man for you.", next = "debt_talk", fx = { trait = { generous = 1 } } },
        { text = "Tell me the truth, Phillipe, or your big man hears where you hide.", tag = "Intimidate", next = "confess", when = { ["not"] = { questDone = TODO_QUEST("Scaring Shaky") } },
          check = { pass = { any = { { power = { "above", "far_above" } }, { class = { "WARRIOR", "ROGUE" } }, { trait = "stern" } } } },
          fail = { next = "confess_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_talk = {
      lines = { { id = "dt_default", text = "No! He'll know I sent you, because he knows everything, so please don't... unless you think it'd work? No, it wouldn't, don't." } },
      choices = {
        { text = "All right, I won't.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be subtle.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "It was one game, one friendly game, and I won the first hand. That's how they get you; they let you win the first hand." } },
      choices = {
        { text = "Who taught you that?", next = "how_who" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    how_who = {
      lines = { { id = "hw_default", text = "MacKinley did, after I'd lost! He explained it very kindly, and that was the worst part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "Where? Out there? With the trolls and the tigers and the things that eat trolls and tigers? At least MacKinley only wants money." } },
      choices = {
        { text = "Fair point.", next = "BACK" },
        { text = "Ratchet's nice this time of year.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    panic = {
      lines = {
        { id = "pa_default", text = "He asked about me? What did he say, and what was his face doing, was it the smiling face? Don't tell me if it was the smiling face." },
      },
      choices = {
        { text = "It was the smiling face.", next = "BACK", reply = "The smiling face! Oh no, the smiling face is the worst one, that's the one he wears when he's already decided.", fx = { align = { light = -1 }, trait = { cruel = 1 } } },
        { text = "I'm joking. He didn't say a thing.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Pay him, Phillipe, and it'll stop.", next = "BACK", reply = "Stop? Would it really stop? I'd pay anything to make it stop, if I had anything, which is the whole problem.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    hide = {
      lines = {
        { id = "hi_default", text = "Hide? I've been hiding for weeks, behind barrels and in barrels, and he always finds me. There's a trick to it, isn't there?" },
      },
      choices = {
        { text = "Stop shaking. That's the whole trick.", next = "BACK", reply = "Stop shaking, just stop, like that? I'll try, I'll really try, but my hands don't listen to me.", fx = { align = { honor = -1 }, affinity = 1, trait = { witty = 1 } } },
        { text = "Pay your debts. Then there's nothing to hide from.", next = "BACK", reply = "Nothing to hide from? What a lovely thought, I'd like to live there someday. I'll try to save a few coppers.", fx = { align = { honor = 1 } } },
      },
    },
    confess = {
      lines = {
        { id = "cf_default", text = "All right, all right, don't tell him! The truth is, it isn't the debt that scares me most; it's that if MacKinley dealt me a hand tomorrow I'd sit down and play it, and I know I would, and so does he." },
        { id = "cf_rogue", when = { class = "ROGUE" },
          text = "Don't, please, I know your sort, you'd really do it! The truth is I'd play him again tomorrow if he dealt me in, and he knows it, and that's why he's never in any hurry to collect." },
      },
      choices = {
        { text = "Then stay away from the tables.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    confess_no = {
      lines = {
        { id = "cn_default", text = "You wouldn't dare, would you, not really? No, you're bluffing, because I've watched MacKinley bluff and you're not nearly frightening enough." },
        { id = "cn_gnome", when = { race = "Gnome" },
          text = "You're going to tell on me? You're barely taller than the barrel I hide in, and I'm frightened of a great many things, but not that." },
      },
      choices = {
        { text = "Fine, Phillipe.", next = "BACK" },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Lean on him? Oh, no, no, no, please don't, because MacKinley's got friends who lean back, and they lean on me, and they lean harder. I'm sorry, I'm grateful, I'm terrified, all at once." },
      },
      choices = {
        { text = "Then I'll stand by you if they come.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then pay him, Shaky.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't know anything, honestly! Well, maybe a few things, if you promise nobody's listening." },
    },
    background = { { id = "tp_bg", text = "Nobody! I'm nobody at all, so please ask someone more interesting, please?" } },
    advice = { { id = "tp_ad", text = "Never play knucklebones with a man called Wolf. Any kind of wolf." } },
    booty_bay = { { id = "tp_booty_bay", text = "I like Booty Bay, I do, there are lots of corners to stand in, and lots of crowds to stand behind. The trouble is that everybody else knows the corners too." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've never been to the Arena, never, and if anyone says they saw me placing a bet there, they're mistaken. Who's been saying that? Nobody? Good." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail are bad people, very bad, and I don't owe them anything, I swear it, not a copper. Why would you ask me that?" } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I lost a little money once at the Darkmoon Faire, just a little, and then a little more, and then I had to leave town. It was a very nice Faire though." } },
    _none = { { id = "tp_none", text = "I don't know anything about anything, I swear! Is this about money?" } },
  },
}

P:NPC {
  key = "crazz", id = TODO_NPC("First Mate Crazz"), name = "First Mate Crazz",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "eager" }, values = { "loyal", "fierce" },
  notices = { "race" },

  impression = {
    first = "He hates the Bloodsail with a steady, practical sort of hatred.",
    third = "{name} met First Mate Crazz of the Blackwater Raiders, who wants to know what the Bloodsail Buccaneers are planning and then to sink it.",
  },

  greetings = {
    { id = "g_bloodsail", text = "If you've seen a red bandana on the coast, tell me where, pal. I've been wanting a reason all week, and I've got powder going stale waiting for one." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin, good! You know the sea's just money with waves on it, chum. The Bloodsail want our money, and they can have the waves." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "On their decks if we can, on the beach if we must, and never in open water, where their cannons outnumber ours and the repair bills are ruinous. They're brave when they've the numbers and cowards when they haven't, so a warrior who holds firm through the first rush breaks them nine times in ten." } },
      choices = {
        { text = "I'll meet them face to face on their own decks.", next = "BACK", reply = "Now you're talking like a Raider, friend! Their own decks, their own blood, and we'll leave their flag on the mast.", fx = { align = { honor = 1 } } },
        { text = "Burn their camps at night. Pirates deserve no fair fight.", next = "BACK", reply = "Burn 'em in the night, sure, and they'd do it to us without blinking. But a fair fight on their own deck sends a better message.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Bloodsail scouts who land at night down the coast and creep up toward town, then vanish before morning. Find where they come ashore and I'll know where they're anchored, and then the Raiders can pay them a visit with a few kegs of blasting powder." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Bloodsail scouts who land at night down the coast, creep up toward town, then vanish before morning. Find where they come ashore and I'll know where they're anchored, and the Raiders can pay them a visit with a few kegs of powder. Your {pet} would sniff them out quicker than any of us, since a pirate who hasn't washed in a month leaves a trail a blind dog could follow." },
      },
      choices = {
        { text = "I'll track them, but I won't lead you to murder them asleep.", next = "BACK", reply = "Fair enough, friend, I'll not ask you to slit throats. Find their landing spots and leave the rest to the Raiders.", fx = { align = { honor = 1 } } },
        { text = "Show me where they land. I'll take them myself, quietly.", next = "BACK", reply = "Quiet's the best way, friend, and I'll owe you a drink for every scout who doesn't reach the town. Show me their tracks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Their ships run on secrecy, so find their coves, read their orders and blow up their powder before it's ever loaded. Fleet Master Seahorn won't put it in writing, but a spell in the right hold is worth twenty cannons, and it's a whole lot cheaper." } },
      choices = {
        { text = "Burn their powder and sink their ships. Gladly.", next = "BACK", reply = "Gladly, he says! I like you already, friend. Blow their powder and the Bloodsail will be sailing on rowboats.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Sinking ships drowns honest sailors too, Crazz.", next = "BACK", reply = "Honest sailors on a Bloodsail ship? Friend, there's no such thing, or if there was, they'd have jumped long ago.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Sailors pray to whatever's listening, and on Blackwater ships that's usually the rum, at a copper a prayer. Still, I once saw a troll shaman calm a squall off the Cape, and nobody laughed at her after that." } },
      choices = {
        { text = "The sea deserves respect, and your crews should show it some.", next = "BACK", reply = "Respect it, aye, and maybe we should more often. The rum's a poor sea god, now that you mention it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The sea's a road. Sail it hard and ask it for nothing.", next = "BACK", reply = "Now that's a sailor's answer, friend, and the fleet would drink to it. The sea's a road, and we're the toll.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Sea witches, more like, who whisper to the tides and curse anyone who crosses their captain. I've seen one of them call a squall that nearly took our mast, and that mast cost forty gold, so I've wanted to see her drown ever since." } },
      choices = {
        { text = "Then I'll hunt her down and end her.", next = "BACK", reply = "End her, and the whole fleet will owe you. Her curses have sunk more of our sails than any cannon.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll stop her, but I won't drown anyone.", next = "BACK", reply = "Stop her without drowning, eh? You're a kind one, friend, but I'll not complain if it works.", fx = { align = { light = 1 } } },
        { text = "Something else, Crazz.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Enough that I keep a list of every Bloodsail dog who's ever boarded a ship of ours, and I cross off a name every time one hangs. It's a long list, pal, and it's not getting shorter fast enough for my liking." } },
      choices = {
        { text = "Hate's a poor compass, Crazz. It'll sink you too.", next = "BACK", reply = "Maybe it will, friend, and maybe I'll drown with a smile. That list's all I've got for the sailors who never came home.", fx = { align = { light = 1 } } },
        { text = "Then let's shorten that list together.", next = "BACK", reply = "Now that's a partnership I can raise a glass to, friend. Let's start with the worst of them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I hate them the way you hate a leak in the hull, steady and without much fuss, because hating them louder won't plug it. They've sunk friends of mine and robbed every honest trader on this coast, and one day I mean to watch their flagship go up in one big beautiful bang." } },
      choices = {
        { text = "Hatred eats a sailor hollow. Fight them, but let the hate go.", next = "BACK", reply = "Let the hate go? Friend, I'll try, but I'll keep the cutlass. Some leaks never stop.", fx = { align = { light = 1 } } },
        { text = "Hold onto it. Hate keeps a sailor sharp.", next = "BACK", reply = "It does, friend, and I'll keep it close. Steady hate's a sailor's best friend in a storm.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Openly when we can, because a Bloodsail ship at the bottom of the bay can't plot anything. Still, they've spies in every tavern on this coast, so I'm not above a bit of sneaking myself when it gets us the news we need at a good price." } },
      choices = {
        { text = "Fight them in the open. Let them see who's coming.", next = "BACK", reply = "That's the fleet's way, friend, out in the open where they can see the Raiders coming. Let them sweat.", fx = { align = { honor = 1 } } },
        { text = "Turn their spies against them, and let them stab each other.", next = "BACK", reply = "Clever, friend, very clever, and the Baron would approve. A Bloodsail with a knife in his back is one less to fight.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Shark teeth sell well to the trolls, and the Bloodsail would sell their own mothers to the trolls if they could find them. They leave the bodies to rot on the reef, and the fishing's gone bad from it, which costs this town a fortune, and that's the part I mind." } },
      choices = {
        { text = "Then sink them, Crazz. Waste like that deserves no mercy.", next = "BACK", reply = "My thinking exactly, friend. Every shark they slaughter is coin they'll spend on powder.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pirates and sharks both take what they can. Let the sea sort it.", next = "BACK", reply = "Let the sea sort it, sure, but the sea's been slow, friend. I'd like to give it a little help.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, eh? Good, because the Bloodsail leave a lot of dead along this coast, and our lads would sooner have a proper word said over the drowned than leave them to the sharks for nothin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The Bloodsail fear two things, cannon and the righteous, and you look to have brought the second, which saves me the powder, so you're welcome on our docks." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you can call up a stiff wind, buddy, the Blackwater could use you to run down a Bloodsail sloop or two, and we pay by the sloop." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Say a few words over the Blackwater dead, would you, and a few curses over the Bloodsail while you're at it; I'll cover the curses." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You've got sneaking feet, pal. Good, because I've got Bloodsail letters that need stealing and nobody quiet enough on the payroll." },
        { id = "h_default", key = true,
          text = "First Mate Crazz, Blackwater Raiders. The Bloodsail Buccaneers are scum, and they're up to something on our coast that's costing us money, so I want to know what, and then I want to sink it." },
        { id = "h_buccaneers", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Their camp's on the Wild Shore, and I want their letters, their orders, their whole plan. Bring me paper, pal, and I'll bring the Fleet Master a war." },
        { id = "h_watch", when = { metBefore = true },
          text = "Spotted a red sail on the horizon last night, and it was gone by morning. They're watching us, which suits me fine, because it saves us the cost of finding them; let them watch us coming." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Good, because the Bloodsail have a few spellcasters of their own, and I'd pay good coin to see one of them on the wrong end of a fireball for once." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, I hate the Bloodsail more than I hate anything, including taxes, so if your demon fancies a few red bandanas, I'll point the way." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. Good, because the Bloodsail don't parley, and a shield beside me beats another fool asking about terms." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Can you follow a man across sand after the tide's been at it, kid? Because that's what I need, and none of my lads can manage it for any wage I've offered." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The Bloodsail have been gutting sharks off the coast for their teeth, and I'd wager that bothers you more than it bothers me, though it's bad for the fishing trade either way." },
      },
      again = {
        { id = "h_again", text = "What else? Make it about the Bloodsail, if you can, pal." },
        { id = "h_again2", text = "Yeah? Talk fast, then, chum; I've a coast to watch and it doesn't watch itself." },
      },
      choices = {
        { text = "Do your sailors pray to anything before they put to sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How could magic help the Blackwater against the Bloodsail?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why do you hate them so much?", next = "hate" },
        { text = "How do you know they're planning something?", next = "proof" },
        { text = "Who commands the Raiders, Crazz?", next = "seahorn" },
        { text = "Tell me about the Raiders, Crazz.", next = "c_raiders" },
        { text = "I've found the Bloodsail camp on the Wild Shore.", next = "c_wildshore", when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") } },
        { text = "Firallon's at the bottom of the sea, Crazz.", next = "c_after", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") } },
        { text = "Stormwind's navy could help against them.", next = "navy", when = { faction = "Alliance" } },
        { text = "The Horde has no love for the Bloodsail either.", next = "horde", when = { faction = "Horde" } },
        { text = "A goblin pirate who hates pirates. That's a new one.", next = "goblin", when = { race = "Goblin" } },
        { text = "Do you hate the Bloodsail for what they've done?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Bloodsail be fought openly, or undermined?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you fight the Bloodsail, First Mate?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who are you trying to track across the sand, First Mate?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll find their plan.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "I could slip aboard a Bloodsail ship for you.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "Do the Bloodsail really have mages, Crazz?", next = "xmage", when = { class = "MAGE" } },
        { text = "You must hate the Bloodsail something fierce, Crazz.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why are the Bloodsail gutting sharks off your coast, Crazz?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Later, Crazz.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "ha_default", text = "Because they make the rest of us look bad, and bad looks cost money. We're pirates with rules and receipts, and they're pirates with knives and no rules, so when folk say 'pirate', they think of them, and then they think of me." },
      },
      choices = {
        { text = "Pirates with rules. I can respect that.", next = "BACK", reply = "Good, friend, because rules are what keep us out of the hangman's noose. The Bloodsail have no rules, and they hang for it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Rules are for merchants. I'll sail free.", next = "BACK", reply = "Then you'd make a fine Bloodsail, friend, and a dead one by midsummer. Rules keep the fleet afloat.", fx = { align = { order = -1 } } },
        { text = "A pirate's a pirate.", next = "hate_pirate", fx = { affinity = -1 } },
      },
    },
    hate_pirate = {
      lines = { { id = "hp_default", text = "Say that on the docks and see how many friends you have by supper. Go on, pal, I'll watch, and I'll take bets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    proof = {
      lines = {
        { id = "pr_default", text = "They've stopped raiding small. Small raids are hunger, but stopping is planning, so somebody's saving them up for something big, like a goblin saving up for a rocket." },
      },
      choices = {
        { text = "That's a guess.", next = "proof_guess", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    proof_guess = {
      lines = { { id = "pg_default", text = "It's a guess that's kept me alive four years, buddy. Bring me their letters and it won't be a guess any more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seahorn = {
      lines = {
        { id = "sh_default", text = "Fleet Master Seahorn, the best captain on the South Seas! He laughs at cannon fire and pays on time, and if he tells the same storm story every night, I'll punch anyone who yawns, free of charge." },
      },
      choices = {
        { text = "Has he ever lost a ship?", next = "c_obreen" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    navy = {
      lines = {
        { id = "nv_default", text = "Stormwind's navy has lovely ships and very slow letters. By the time they decided to help, we'd have sunk the Bloodsail ourselves, twice over, and sent Stormwind the bill." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
        { text = "Don't underestimate Stormwind.", next = "BACK", reply = "I don't, friend, I just don't wait for them. Stormwind's ships are lovely, and very late.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Booty Bay's better off without Stormwind's navy.", next = "BACK", reply = "My thinking exactly, friend. The Baron's guns are faster than any king's letters.", fx = { align = { order = -1 } } },
      },
    },
    horde = {
      lines = {
        { id = "hz_default", text = "Good. Your people sail in, buy, drink and go, while the Bloodsail sail in and burn, so I know which customers I'd rather keep, pal." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    goblin = {
      lines = {
        { id = "gb_default", text = "Pirate's a job, with wages and everything; Bloodsail's a disease. You'd not call a doctor a plague just because they both turn up at funerals." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Would you? Oh, that'd be grand, that'd be the best thing since blasting powder! Bring back anything with writing on it, because those Bloodsail scum write everything down, and the Fleet Master'll want to read every word." },
      },
      choices = {
        { text = "Anything with writing. Got it.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "How do you know they're planning something?", next = "proof" },
      },
    },

    -- Deeper: the Raiders (sub-hub), Fin, the Bruisers, customers, Keelhaul, the spy list, after the chain.
    c_raiders = {
      hub = true,
      lines = {
        { id = "cr_default", text = "The Raiders? Best crews on the South Seas, and the only ones who'll sail into a Bloodsail cove on purpose. What do you want to know, and quick, because I've a watch to stand at the turn of the tide." },
        { id = "cr_rep", when = { reputation = { faction = "Booty Bay", min = "honored" } }, text = "You've done right by the Bay, so I'll talk straight. Ask about the Raiders and I'll tell you what we're like below decks, not the stuff Seahorn tells the Cartel's accountants." },
      },
      again = {
        { id = "cr_again", text = "More? Fine, but if it isn't about sinking somebody, keep it short." },
        { id = "cr_again2", text = "Go on, then. The red sails aren't coming in yet, so I've a minute." },
      },
      choices = {
        { text = "How did you join the Raiders?", next = "c_joined" },
        { text = "I met Fin Fizracket on the docks. He's in a bad way.", next = "c_fin", when = { heardLine = "fin.h_default" } },
        { text = "Do the Raiders get on with the Baron's Bruisers?", next = "c_bruisers" },
        { text = "I'd guess the Raiders don't much care for Horde folk.", next = "c_customers", when = { faction = "Horde" } },
        { text = "How do the Raiders treat Alliance folk?", next = "c_customers", when = { faction = "Alliance" } },
        { text = "Stormwind's sailors would call you a pirate too, Crazz.", next = "c_human", when = { race = "Human" } },
        { text = "My people fished these coves before your Cartel came.", next = "c_troll", when = { race = "Troll" } },
        { text = "Back to the Bloodsail, Crazz.", next = "hello" },
      },
    },
    c_joined = {
      lines = {
        { id = "cj_default", text = "Stowed away on the Fleet Master's flagship when I was about knee-high to an ogre, and when they found me in the powder room he laughed so hard he forgot to throw me over. I've been earning my place on that deck ever since, and the Bloodsail sank my first berth the year after." },
      },
      choices = {
        { text = "The Bloodsail sank your first ship?", next = "c_keelhaul" },
        { text = "Seahorn's soft on stowaways, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_keelhaul = {
      lines = {
        { id = "ck_default", text = "Captain Keelhaul did, off the Cape, and he dragged the bosun under our own hull for laughs while we watched. I was hiding in a water cask the whole time, so I lived, and I haven't laughed at much since." },
        { id = "ck_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Captain Keelhaul did, off the Cape, and he dragged our bosun under the hull for laughs. You put him on the bottom, so I'll say it plain: I owe you one, and goblins don't say that lightly." },
      },
      choices = {
        { text = "What would you do if you caught him alive?", next = "c_keelhaul_mercy" },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    c_keelhaul_mercy = {
      big = true,
      lines = {
        { id = "ckm_default", text = "Seahorn would want him tried in front of the Baron, all proper, with Krazek taking notes. Me, I'd tie him under the flagship and see how he likes the barnacles, but I'm only the first mate, so what would you do?" },
      },
      choices = {
        { text = "Try him before the Baron. Justice, not revenge.", next = "BACK", reply = "That's what Seahorn would say, and he's usually right. Justice it is, though I'll be at the front of the crowd.", fx = { align = { light = 1 } } },
        { text = "The barnacles. Let him learn what he taught.", next = "BACK", reply = "The barnacles it is, friend, and I'll hold the rope myself. He's earned every one of them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_fin = {
      lines = {
        { id = "cf_default", text = "Bad way's right, and it's his own fault, though I'd hit anyone else who said so. I told him not to swim in that pond, the Fleet Master told him not to swim in that pond, and the pond itself practically had a sign on it." },
        { id = "cf_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") }, text = "Fin's back on his feet, and he says it was you who fetched that gorilla's heart. He won't stop talking about it, which is annoying, but I'd rather have him annoying than shaking, so thanks." },
      },
      choices = {
        { text = "Does he deserve it, then?", next = "c_fin_stance" },
        { text = "You visit him, though, I'd wager.", next = "c_fin_soup" },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_fin_soup = {
      lines = {
        { id = "cfs_default", text = "Every night after watch, with whatever's left in the galley pot and the news off the piers. Don't tell him I said so, because he thinks it's the cook's idea, and I'd like to keep it that way." },
      },
      choices = { { text = "Your secret's safe, Crazz.", next = "BACK", fx = { affinity = 2 } } },
    },
    c_fin_stance = {
      big = true,
      lines = {
        { id = "cfst_default", text = "Nobody deserves that fever, but a crew lives on orders, and Fin thought shore leave meant no orders. If he'd been in my watch, I'd have docked his share for it, and then I'd have sat up with him anyway." },
      },
      choices = {
        { text = "Orders keep a crew alive. He should have listened.", next = "BACK", reply = "They do, and he should've listened. Fin learned the hard way, and he'll not forget.", fx = { align = { order = 1 } } },
        { text = "Shore leave's shore leave. A sailor should swim where he likes.", next = "BACK", reply = "Where he likes, sure, until the fever finds him. He'll swim where he's told next time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_bruisers = {
      lines = {
        { id = "cbr_default", text = "We get on fine as long as nobody mentions who's tougher. The Bruisers keep the peace in town, and we keep the Bloodsail out of the harbour, so they think we're loud and we think they're furniture with clubs." },
      },
      choices = {
        { text = "Who is tougher?", next = "c_bruisers_tough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_bruisers_tough = {
      lines = {
        { id = "cbt_default", text = "Us, obviously, but you didn't hear it from me, because there's twelve of them on the pier and I've got a nose I'm fond of. Last time a Raider said it out loud in Skindle's, they billed him for the table he went through." },
      },
      choices = { { text = "Ha! Something else, Crazz.", next = "BACK", fx = { affinity = 1 } } },
    },
    c_customers = {
      big = true,
      lines = {
        { id = "ccu_default", text = "The same as anybody else: you pay the Baron's toll and you're cargo we protect, and you don't and you're cargo we take. Seahorn says we don't pick sides, and I don't, except against the Bloodsail." },
        { id = "ccu_horde", when = { faction = "Horde" }, text = "Better than I expected, because the boats from Ratchet pay their tolls on time and the Horde hate the Bloodsail nearly as much as I do. Some of the lads still flinch at a grunt with an axe, but they're getting over it, mostly." },
        { id = "ccu_alliance", when = { faction = "Alliance" }, text = "Fine, as long as your navy doesn't come asking for our letters of marque, because we haven't got any. Your merchants pay well and complain a lot, and we can live with both, so long as the toll's paid." },
      },
      choices = {
        { text = "Taking cargo that won't pay is just robbery, Crazz.", next = "BACK", reply = "Robbery's a strong word in this port, friend. We call it collecting the toll, late.", fx = { align = { honor = 1 } } },
        { text = "Pay the toll or lose the cargo. That's a fair sea.", next = "BACK", reply = "A fair sea, aye, and a well-guarded one. Pay up and sail easy, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_human = {
      lines = {
        { id = "chu_default", text = "They would, and then they'd hire us to see them round the Cape, because the Bloodsail don't care what flag you call yourself. I've met Stormwind sailors in Skindle's who swear at us all evening and buy our rum all night." },
      },
      choices = { { text = "That sounds like Stormwind sailors.", next = "BACK", fx = { affinity = 1 } } },
    },
    c_troll = {
      lines = {
        { id = "ctr_default", text = "I know it, and I'd not argue it to your face. The Darkspear are welcome on our docks, and the Gurubashi up the hill would gut me for a toll, so I try to remember which troll is which before I open my mouth." },
      },
      choices = {
        { text = "Remember it well, then.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    c_wildshore = {
      lines = {
        { id = "cw_default", text = "You've found the camp? Good, now get me paper: letters, orders, anything with ink on it, because those scum write down everything, including who they mean to stab. If it's got a red seal, I want it twice." },
      },
      choices = {
        { text = "How do you know the plan's on paper?", next = "proof" },
        { text = "Who else should I watch for, Crazz?", next = "c_spies" },
        { text = "I'll bring you paper.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    c_spies = {
      lines = {
        { id = "csp_default", text = "Their spies, here in town, because somebody tells the Bloodsail when our ships sail and it isn't the gulls. I've got a list, but a list's only good if it stays a list, so I don't show it around." },
      },
      choices = {
        { text = "Show me that list, Crazz. I'll find your spy.", tag = "Persuade", next = "c_spylist",
          check = { pass = { any = { { class = "ROGUE" }, { disposition = { min = 60 } }, { questDone = TODO_QUEST("The Bloodsail Buccaneers") } } } },
          fail = { next = "c_spylist_no", fx = { affinity = -1 } } },
        { text = "Keep your list. Something else.", next = "BACK" },
      },
    },
    c_spylist = {
      lines = {
        { id = "csl_default", text = "Fine, but quietly: a rope seller who buys more rope than he sells, a dishwasher at Skindle's who can read, and a fishmonger who never seems to catch any fish. One of them's Bloodsail, and the other two are just odd, which in Booty Bay isn't a crime yet." },
      },
      choices = {
        { text = "I'll watch all three.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "Does Seahorn know about this list?", next = "c_spylist_seahorn" },
      },
    },
    c_spylist_seahorn = {
      lines = {
        { id = "csls_default", text = "He's got his own, I'd bet, and he thinks I don't know about it. The Fleet Master's cleverer than he lets on, and he lets on that he's not clever at all, so you work it out." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    c_spylist_no = {
      lines = {
        { id = "csln_default", text = "Nice try. For all I know you're on somebody's list yourself, so bring me some Bloodsail letters first and then we'll talk about mine." },
      },
      choices = { { text = "Fine. Something else.", next = "BACK" } },
    },
    c_after = {
      lines = {
        { id = "caf_default", text = "Firallon on the bottom and his letters in Seahorn's stove, and the lads have been singing about it in Skindle's for three nights straight. It's the best thing to happen to this cove since the Baron lowered the rope prices, which he never has." },
      },
      choices = {
        { text = "The Bloodsail will give up now, surely.", next = "c_after_more" },
        { text = "Glad I could help.", next = "BACK", fx = { affinity = 1, standing = { booty_bay = 1 } } },
      },
    },
    c_after_more = {
      lines = {
        { id = "cam_default", text = "Give up? They'll find another fleet master by the end of the month, and he'll have a grudge and a beard just like the last one. That's why I keep watching the horizon, and why I'll be needing you again." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    c_obreen = {
      lines = {
        { id = "cob_default", text = "Not one, not till O'Breen took three up the Arathi coast after some gnome's treasure. Nobody's heard from him in weeks, and the Fleet Master keeps looking north from the top floor when he thinks nobody's watching." },
        { id = "cob_known", when = { any = { { questDone = TODO_QUEST("Land Ho!") }, { heardLine = "ar_obreen.h_default" } } }, text = "He hadn't, till O'Breen put two of ours on a reef up at Faldir's Cove. I'd not want to be O'Breen when he walks up those stairs, though I'll say this for him: he never ran from a fight, only from the bill." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Blackwater born, Blackwater sworn, pal. I've been on the Fleet Master's deck since I was tall enough to see over the rail, just barely, and I've never once been paid late." } },
    advice = { { id = "tp_ad", text = "Red bandana, red sail, red flag: shoot first. You'll have time to apologise later, though you won't need to, and nobody's ever billed me for one." } },
    bloodsail = { { id = "tp_bloodsail", text = "Scum with sails, from the powder monkeys up to Fleet Master Firallon. I'd sink their whole fleet for one good night's sleep, and I'd pay for the powder myself." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the Fleet Master's port as much as it's the Baron's, pal, and the Blackwater would let it sink before we let the Bloodsail have it. I've buried good friends to keep it ours." } },
    theramore = { { id = "tp_theramore", text = "Theramore's ships are the only other navy on these seas worth the name, pal, and they hate the Bloodsail as much as we do. I'd share a drink with any Theramore sailor." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I sent some of our boys to the Arena once and they came back with a chest and three black eyes each. They still won't tell me what was in the chest, which means it was good." } },
    second_war = { { id = "tp_second_war", text = "My father sailed during the Second War, and he said the orc ships were worse than storms and the Alliance ships weren't much better. He made a good living dodging both." } },
    _none = { { id = "tp_none", text = "If it's not about the Bloodsail, chum, I'm not listening, and I'm certainly not paying." } },
  },
}

P:NPC {
  key = "fizzlebub", id = TODO_NPC("Crank Fizzlebub"), name = "Crank Fizzlebub",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "shifty" }, values = { "greedy", "clever" },
  notices = { "purse" },

  impression = {
    first = "Nothing he offers will be easy, and that is the point.",
    third = "{name} was hailed by Crank Fizzlebub, a Booty Bay goblin with schemes for anyone who has a strong arm and a short memory.",
  },

  greetings = {
    { id = "g_profit", text = "Psst, you there, yes, you, pal! Want to make some money? Course you do, everybody does, so lean in and keep your hands where the Bruisers can't see 'em." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you're doing well, I can always tell, it's a gift, like smelling gold through a wall. Let's talk about doing better, sweetheart." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, crates that need carrying through ogre country, a debt that needs a little persuading, and a raptor nest somebody promised a buyer in Gadgetzan. Strength is an investment, pal, and I'm a goblin who loves an investment." } },
      choices = {
        { text = "I'll take honest work, Crank, not your shady deals.", next = "BACK", reply = "Honest work, sure, buddy, I've got a crate of it in the back somewhere. It pays less, but you'll sleep like a baby.", fx = { align = { honor = 1 } } },
        { text = "I don't care what's in the crates. Name the price.", next = "BACK", reply = "My kind of warrior, buddy! The price is good, the crates are heavy, and the ogres are very grumpy.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rich goblins in Gadgetzan and Undermine who want a panther in a cage beside the fountain, mostly, and a raptor egg fetches a fortune if it hatches on the ship and not before. Keeping the stock alive is another matter, and last month a panther ate the parrots, the cage and very nearly the cabin boy." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Rich goblins in Gadgetzan and Undermine who want a panther in a cage beside the fountain, mostly, and a raptor egg fetches a fortune if it hatches on the ship and not before. Keeping the stock alive is another matter, and last month a panther ate the parrots, the cage and very nearly the cabin boy. Now don't look at me like that, pal, because I'd never try to buy {pet}, at least not while you're standing right there." },
      },
      choices = {
        { text = "A beast deserves a clean hunt, not a cage in Undermine.", next = "BACK", reply = "A clean hunt, buddy? The goblins of Undermine don't buy clean, they buy caged. Suit yourself, though.", fx = { align = { honor = 1 } } },
        { text = "If they pay that well, I'll fill a few cages.", next = "BACK", reply = "Now that's a hunter with an eye for the market! Cages are in the back, buddy, and the price is excellent.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Selling them, I'd guess, or using them for something that hums, but nobody's ever told me, and that's what hurts, right in the wallet. If you hear a proper answer, I'll pay for it, and if it's worth anything, I'll pay you less and sell it on." } },
      choices = {
        { text = "I'll sell you the answer, if I find one.", next = "BACK", reply = "Sell it to me? Buddy, you're a natural! Bring it back and we'll talk percentages.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some things shouldn't be sold, Fizzlebub.", next = "BACK", reply = "Shouldn't? Buddy, everything should be sold, that's the whole point of things. But fine, fine, you keep your morals.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I once sold rainwater blessed by a troll witch doctor, but it turned out to be ordinary rainwater, and the buyer turned out to be a Bruiser off duty. Now I sell things that don't talk back, like ore and gossip, and I keep the receipts in my boot." } },
      choices = {
        { text = "The elements aren't merchandise. Leave them out of your schemes.", next = "BACK", reply = "Merchandise is a strong word, buddy, I prefer opportunity. But I hear you, and I'll leave the thunder alone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bottle me a storm, Fizzlebub, and we'll split the profit.", next = "BACK", reply = "Now we're talking, buddy! Fifty-fifty, and I'll handle the marketing. Bottled storms, the next big thing!", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shards and crystals from the jungle, mostly, the kind that come out of places the trolls would rather we left alone. The Baron takes his cut on everything that crosses the docks, so I've found ways to keep some of it from crossing them at all, which I call tax planning." } },
      choices = {
        { text = "Cheating the Baron is a fool's game. I'll stay honest.", next = "BACK", reply = "Honest, buddy? In Booty Bay? You'll starve, but you'll starve proud. I respect it, a little.", fx = { align = { order = 1 } } },
        { text = "The Baron has enough gold. I'll take the deal.", next = "BACK", reply = "That's the spirit, buddy! The Baron won't miss a few shards, and we'll both be richer.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Crank.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I haven't the faintest idea, pal, and that's what makes them valuable, because anything nobody understands can be sold for twice what it's worth. Bring your imp a little closer and let's see if the tune changes, and if anything catches fire, that's on you." } },
      choices = {
        { text = "I'll test them, but carefully. Some things shouldn't be woken.", next = "BACK", reply = "Carefully, sure, buddy, and from a safe distance. Some of them hum louder at night.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's find out. Curiosity is worth the risk.", next = "BACK", reply = "Curiosity! That's my favorite word after profit, buddy. Let's see what they do.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hauling, guarding, scaring off the competition, the usual, and a druid does all three without needing a wage for a horse, which is pure margin. I've got a few jobs out in the jungle where a big angry animal would save a lot of arguments, and nobody would ask whose animal it was." } },
      choices = {
        { text = "My gifts aren't for hire, Fizzlebub. Find yourself a real bear.", next = "BACK", reply = "A real bear eats the crates, buddy, and then the hauler. But fine, I'll find someone furrier.", fx = { align = { honor = 1 } } },
        { text = "If the coin's honest, a bear can carry a crate.", next = "BACK", reply = "Honest coin, sure, buddy, the most honest I've got. A bear with a crate is the best deal in Booty Bay.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do you know what a goblin would pay for a bottled thunderstorm, buddy? Neither do I, but I'd love to find out, preferably from a safe distance." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I sell a lovely holy water, or a lovely unholy water, depending on which way you lean, pal; same bottle, different label, same very reasonable price." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, now that's handy! You couldn't tell me whether these crystals are magic, could you, before I sell them as magic and somebody asks for a refund?" },
        { id = "h_default", key = true,
          text = "Crank Fizzlebub, pal: entrepreneur, opportunist, and friend to anyone with a strong arm and a short memory. Standing still never made anyone a copper, so walk with me." },
        { id = "h_shards", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Singing Blue Shards") }, { questActive = TODO_QUEST("Venture Company Mining") } } },
          text = "The Venture Company's digging up crystals that sing, singing crystals, chum! Do you know what people pay for things that sing? Bring me some, and don't ask the Venture Company first, because they'll say no and charge you for the question." },
        { id = "h_zanzil", when = { any = { { questActive = TODO_QUEST("Zanzil's Secret") }, { questActive = TODO_QUEST("Fool's Stout") }, { questActive = TODO_QUEST("Zanzil's Mixture and a Fool's Stout") } } },
          text = "I need Zanzil's mixture and a cask of Fool's Stout, for a friend at a racetrack who'd like a few rivals to slow down. Don't ask me which friend, pal; you'll meet him, and he'll want a receipt." },
        { id = "h_kravel", when = { heardLine = "kravel.h_default" },
          text = "You know Kravel, at the Raceway? Lovely fellow, very competitive, and we have an arrangement, strictly off the books. You didn't hear that from me, and if you did, it cost you nothin', so forget it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now you look like someone who appreciates a good bargain, pal, and I've got some that aren't exactly on the Baron's books, or any books." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Ooh, you've got a little hum about you yourself! I've a few crystals that hum a strange tune when you hold them near a demon, and I'd pay good coin to know what that means, then charge you to find out." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Now here's a strong arm with a short memory, I hope! Warriors are my favorite customers, pal, because they never ask how dangerous a job is until they're halfway through it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and I've just the opportunity for you, pal: live exotic animals, top prices from the collectors in Gadgetzan, very few questions asked." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now there's a business opportunity, friend: a bear who doesn't need feeding and can carry a crate. Think about it, and think about my commission." },
      },
      again = {
        { id = "h_again", text = "Still here? That's a good sign, chum; it means you smell opportunity too, and opportunity smells like copper." },
        { id = "h_again2", text = "Psst, you want more? Lean in closer, a bit closer, no, that's too close." },
      },
      choices = {
        { text = "Have you ever tried to sell the elements, Fizzlebub?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's the Venture Company really doing with those singing crystals?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is any of this legal?", next = "legal" },
        { text = "What do singing crystals actually do?", next = "crystals" },
        { text = "What's your arrangement with Kravel?", next = "kravel", when = { any = { { heardLine = "kravel.h_default" }, { topicKnown = "mirage_raceway" } } } },
        { text = "I'm a gnome. I know a scheme when I see one.", next = "gnome", when = { race = "Gnome" } },
        { text = "You must have work for a warrior, Crank.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who buys live animals out of Stranglethorn, Crank?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'm listening, so tell me the job.", next = "END", reply = "Wonderful, buddy, I knew you were a businessman at heart! Come back when you're ready and I'll have the details waiting.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't work for swindlers, Crank.", next = "END", reply = "Swindler is a strong word, buddy, I prefer entrepreneur. Off you go, then, and no hard feelings, mostly.", fx = { align = { honor = 1 } } },
        { text = "Those singing crystals are just quartz. I'm a mage.", next = "k_mage", when = { class = "MAGE" } },
        { text = "What deals aren't on the Baron's books, Crank?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would your crystals hum near a demon, Crank?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What business could a druid possibly have with you, Fizzlebub?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Not today, Crank.", next = "END" },
      },
    },
    legal = {
      lines = {
        { id = "l_default", text = "Legal? This is Booty Bay! The Baron takes his cut, the Bruisers keep the peace, and everything else is negotiation, which you're doing right now, and badly." },
      },
      choices = {
        { text = "Fine, then, tell me the job.", next = "END", reply = "Excellent, buddy, excellent! Come back when you're ready, and bring your conscience in a very small bag.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Then I'll have no part of it, Crank.", next = "END", reply = "Suit yourself, buddy, but the offer stands, and so does the Baron's cut. Off you go.", fx = { align = { honor = 1 } } },
        { text = "Then I'll negotiate better. What's my cut?", next = "legal_cut", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legal_cut = {
      lines = { { id = "lc_default", text = "Your cut is not getting caught, pal. It's a very generous cut, and most people don't get it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crystals = {
      lines = {
        { id = "c_default", text = "They hum, they glow, and they make rich people feel special, which is the most profitable feeling there is. Do they do anything else? Probably, but I don't care; the Venture Company cares, and carin' is what makes 'em pay to get 'em back." },
      },
      choices = {
        { text = "You'd sell them back to the people you stole them from?", next = "crystals_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    crystals_back = {
      lines = { { id = "cb_default", text = "Stole? I'd say liberated, buddy. And yes, twice if I can manage it, which is what's called a supply chain." } },
      choices = {
        { text = "That's brilliant.", next = "BACK", reply = "Brilliant! Somebody finally appreciates genius, buddy. Stick with me and we'll both be rich.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "That's theft with extra steps.", next = "BACK", reply = "Extra steps, buddy, that's what we call value-added. Theft is crude, and I'm very refined.", fx = { align = { honor = 1 }, affinity = -1 } },
      },
    },
    kravel = {
      big = true,
      lines = {
        { id = "k_default", text = "Arrangement is such a dull word. Let's say Kravel would like certain racers to be a little slower, and I know a troll recipe that does exactly that, so everybody wins, except the slow ones." },
      },
      choices = {
        { text = "You're rigging the races.", next = "kravel_rig", fx = { learn = { "mirage_raceway" } } },
        { text = "Count me in.", next = "BACK", reply = "My kind of partner, buddy! Kravel will be very pleased, and very generous, mostly.", fx = { align = { honor = -2 }, affinity = 2 } },
        { text = "I won't help you poison racers, Crank.", next = "BACK", reply = "Poison? Buddy, nobody said poison, I said encouragement. But fine, fine, I'll find someone less squeamish.", fx = { align = { honor = 2 } } },
      },
    },
    kravel_rig = {
      lines = { { id = "kr_default", text = "Rigging, adjusting, encouraging, call it what you like. If you tell Pozzik or that gnome, I'll deny it on my mother's ledger, and Kravel will cry, and he's very convincing when he cries." } },
      choices = {
        { text = "Maybe I'll tell them.", next = "BACK", reply = "You wouldn't, buddy, would you? Think of the profit we'd lose, and the trouble you'd be in with Kravel.", fx = { align = { honor = 2 }, affinity = -2 } },
        { text = "Your secret's safe.", next = "BACK", reply = "You're a gem, buddy, a real gem. I'll remember that when the profits roll in.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Pozzik already knows, Crank. He told me himself.", tag = "Deceive", next = "kravel_spill",
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { race = "Gnome" } } } },
          fail = { next = "kravel_calm", fx = { affinity = -1 } } },
      },
    },
    gnome = {
      lines = {
        { id = "g_default", text = "Then you'll appreciate a well-built one! Look at it: no moving parts, no witnesses, high yield. If it had gears you'd be weeping." },
      },
      choices = { { text = "It's a bit crude.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    kravel_spill = {
      lines = {
        { id = "ks_default", text = "He knows? Then it's Kravel's fault, all of it! It's Zanzil's troll mixture stirred into a cask of Fool's Stout for the racers, and Kravel swore nobody would taste it under the stout, and if Pozzik's coming I'm leaving on the next boat." },
        { id = "ks_gnome", when = { race = "Gnome" },
          text = "That gnome told you? Of course he did, you people stick together! Fine: it's Zanzil's troll mixture in a cask of Fool's Stout for the racers, it was Kravel's idea, and I'm leaving on the next boat." },
      },
      choices = {
        { text = "Relax, Crank, I made that up.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kravel_calm = {
      lines = {
        { id = "kc_default", text = "Pozzik doesn't talk to anybody who isn't holding a wrench, friend, and you're not holding a wrench. Nice try, though; I'd have tried it too, and charged for it." },
        { id = "kc_paladin", when = { class = "PALADIN" },
          text = "A paladin, lying to me? Now I've seen everything, pal, and I still don't believe a word of it." },
      },
      choices = {
        { text = "Worth a try.", next = "BACK" },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Shh! Quartz, yes, technically, but quartz with a very pleasing hum, and the customers don't own a mage. Besides, if you were really sure, you wouldn't have come over to look so closely, would you?" },
      },
      choices = {
        { text = "Fine. I'll keep your secret.", next = "BACK", reply = "You're a gem, buddy, a real gem! The customers are happy, I'm happy, and the quartz hums beautifully.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll tell your customers the truth.", next = "BACK", reply = "The truth? Buddy, the truth's never sold a single crystal. Please, think of my livelihood.", fx = { align = { honor = 1 }, affinity = -2 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Lean in and ask, friend; I know a little about a lot, and most of it's worth something to somebody, usually me." },
    },
    background = { { id = "tp_bg", text = "I'd tell you, pal, but then you'd know where the bodies are buried, figuratively speaking. Mostly figuratively, and the rest are well insured." } },
    advice = { { id = "tp_ad", text = "Buy from people who are in a hurry and sell to people who are scared, kid, never the other way round, and never on credit." } },
    venture_company = { { id = "tp_venture", text = "Rivals, and rich, careless rivals at that, which are my favourite kind, because they leave crates lying around." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a fine place to start a business, pal, since nobody asks where your money came from. I've started six, and four of them are still legal." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena is a great opportunity, pal, for selling bandages, betting slips and very sharp knives. I'm open to partnerships, so long as you do the fighting." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls at Zul'Gurub are calling up their old gods, and the Zandalari are paying good money to stop them. Now there's an opportunity for a smart goblin, if he can stay out of reach of the trolls." } },
    ratchet = { { id = "tp_ratchet", text = "I got my start in Ratchet selling oil to the Barrens folk, pal. Ratchet's too quiet for a goblin with ambition, so I bought a one-way berth on the next boat south." } },
    _none = { { id = "tp_none", text = "If there's no money in it, pal, why are we talking about it?" } },
  },
}

P:NPC {
  key = "whiskeyslim", id = TODO_NPC("Whiskey Slim"), name = "Whiskey Slim",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "jovial" }, values = { "generous", "touchy" },
  notices = { "drink" },

  impression = {
    first = "Under the drink lies real grief over a lost cask of port.",
    third = "{name} was toasted by Whiskey Slim, a cheerful drinker in Booty Bay who still mourns a lost cask of the finest port.",
  },

  greetings = {
    { id = "g_toast", text = "A toast! To you, stranger, and to whatever brought you here, unless it was trouble, in which case, to you anyway!" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've been enjoying yourself, and good for you. Just don't spill, and I mean it: don't spill." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night, and they all toast their old regiments, Stromgarde and Lordaeron and Stormwind, and then they weep for the ones who didn't come home. I've learned more about the Second War at this bar than any scholar ever wrote down, and I've forgotten most of it by morning." } },
      choices = {
        { text = "A soldier keeps faith with his regiment, drunk or sober.", next = "BACK", reply = "Aye, and I'll drink to that, and then I'll drink to it again. Stromgarde's boys deserve every toast, and Lordaeron's more so.", fx = { align = { order = 1 } } },
        { text = "The regiments are gone. A soldier's free to forget.", next = "BACK", reply = "Forget? Friend, I've tried for years, and the whiskey's tried harder. The regiments don't let go so easy.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Ha! If anyone could, it'd be one of your sort, because I'd know the smell of that port anywhere, and I'd swear it left a trail of happy scoundrels behind it. It was the finest in the South Seas, and somewhere out there somebody is drinking it without me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Ha! If anyone could, it'd be one of your sort, because I'd know the smell of that port anywhere, and I'd swear it left a trail of happy scoundrels behind it. It was the finest in the South Seas, and somewhere out there somebody is drinking it without me. Even {pet} could follow that scent, friend, and if your beast finds it first, I'll forgive it for having a little sip." },
      },
      choices = {
        { text = "I'll find your port and bring it back unopened.", next = "BACK", reply = "Would you, friend? Oh, I'd weep like a babe if you did. That port's the last good thing I had from home.", fx = { align = { honor = 1 } } },
        { text = "If I find that port, I might just keep it.", next = "BACK", reply = "Keep it? Ha! Then I'll hunt you down, slow as I am, and drink it at your funeral. Bring it back, friend, please.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Could you? Oh, could you! It's somewhere in the Hinterlands, and if you've a spell that finds a cask by smell, I'll toast you every night until my liver gives out, which may not be long." } },
      choices = {
        { text = "I'll find your port and bring it back untouched.", next = "BACK", reply = "You're a saint, friend, a living saint. Bring it back and I'll toast you with the first glass.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I find it, I'm tasting it first.", next = "BACK", reply = "Tasting it first? Friend, I'd forgive you a sip, maybe two, but you leave the rest for an old soldier. That's a sacred trust.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every sailor in Booty Bay has a story about the sea spirits, and each one gets better with the third drink. My favorite says a water elemental drank half a ship's rum and went home happy, and I'd very much like to meet that fellow." } },
      choices = {
        { text = "Toast them with care. The sea's spirits aren't a joke.", next = "BACK", reply = "With care, aye, you're right, and I'll pour the first drop over the rail tonight. Old sailors don't mock the sea, only the captains.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Nobody pays for the truth. They pay for a good story.", next = "BACK", reply = "Ha! You'd do well behind a bar, friend. The truth never bought me a single round, but a good story's bought me hundreds.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somewhere in the Hinterlands, where the trolls and the wildkin and who knows what else could be sitting on it right now. I don't care who's got it, so long as it comes home before somebody opens it without me." } },
      choices = {
        { text = "Every drop, cask and seal intact. You have my word.", next = "BACK", reply = "Intact! Bless you, friend, I'll not even ask how you open the door. Just get it here before I'm too old to taste it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Finders keepers, Slim. Whoever has it now owns it.", next = "BACK", reply = "Then I'll pay whoever has it, friend, every copper I've got. Finders keepers, aye, but drinkers are weepers.", fx = { align = { honor = -1 } } },
        { text = "Something else, Slim.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what a sailor told me, and I've been chasing a mage who knows the trick ever since. Nobody's managed it yet, but I keep hoping, because the real thing is somewhere in the Hinterlands and water is all I've got." } },
      choices = {
        { text = "Magic can't replace the real thing. I'll find your port.", next = "BACK", reply = "That's what I keep telling myself, friend, and it's comforting to hear you say it. Nothing tastes like the real port of Lordaeron.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll make you something better. Forget the old port.", next = "BACK", reply = "Better? Friend, you can't make a memory better, only different. I'll drink yours, but I'll still dream of mine.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Comfort, now there's a sad word for a merry man, but you're not wrong, I suppose. I used to say a good drink was a prayer you could taste, and since the port went missing I've been praying rather a lot, though none of it's been answered yet." } },
      choices = {
        { text = "The Light offers better comfort than the bottle, Slim.", next = "BACK", reply = "Maybe it does, friend, and maybe I'll try it one night. But the bottle's never once asked me to confess anything.", fx = { align = { light = 1 } } },
        { text = "A man's entitled to his drink. Raise one for me.", next = "BACK", reply = "One for you, then, and one for me, and one for every regiment that's gone. Your health, friend.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Oh, the yellow fruit the gorillas fight over, and the bitter red berry the trolls chew before battle, which I'd only try once. Most of all I'd find the cask of port I lost, but no druid's told me which root grows into that." } },
      choices = {
        { text = "Drink less and grieve less, Slim. The port's gone for good.", next = "BACK", reply = "Gone for good, aye, and that's why I drink, friend. Grieving's thirsty work.", fx = { align = { order = 1 } } },
        { text = "A good drink is nature's gift. Enjoy it while you can.", next = "BACK", reply = "Now there's a druid after my own heart! Nature's gift, and I'll enjoy every drop.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, plenty, friend: the Baron's health, the Bloodsail's sinking, and every sailor who ever paid his tab. I'll toast the Light too if you like, though I suspect it'd rather I drank less, and I suspect it's right, which is exactly why I'll need another." } },
      choices = {
        { text = "Raise one cup fewer, Slim. The Light asks no more.", next = "BACK", reply = "One cup fewer? Friend, the Light's asking a lot of an old soldier, but I'll try, for your sake.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Drink as you please, Slim. Life's short down here.", next = "BACK", reply = "It is, friend, very short, and very wet. I'll raise one for you, too, and one for the Light.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Here's to you, friend, and to the Light, and to that cask of port I lost, which was the nearest thing to a miracle I ever tasted." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, and here's a toast to you, friend! Bless this cup if you'd be so kind, because it's the closest thing to holy I've held since I lost that cask of port." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Pull up a stool and tell me, do the spirits of the earth know where a good cask of port might have rolled off to?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A toast to the priest! To your gods, whoever they are, and may they be the drinking sort!" },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "To the warlock! May your demons stay on their leashes and your glass stay full, and never the other way round." },
        { id = "h_default", key = true,
          text = "Whiskey Slim, at your service! I've tasted every drink between here and Ironforge, and I had a cask of the finest port you'll ever... well, had. I had it, and then I lost it." },
        { id = "h_grog", tags = { "news" }, when = { questActive = TODO_QUEST("Whiskey Slim's Lost Grog") },
          text = "My Pupellyverbos Port, lost in the Hinterlands, of all the miserable places! Find it, and I'll toast your name every night for a year." },
        { id = "h_toast", when = { metBefore = true },
          text = "To friends who come back! And to friends who don't, may they come back soon! And to anyone who touches my glass: may they lose a finger." },
        { id = "h_grog_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Whiskey Slim's Lost Grog"), days = 3 } },
          text = "To {name}, who brought back my port! I've had a glass, and then another, and I'll toast you properly as soon as the room stops leaning." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Here's to you, friend, and here's to anyone who can slip a cask out from under a troll's nose, because that's exactly what my poor port needs." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Here's to you, and here's to magic, which I hear can make a cask of water taste like the finest port, if you know the right words." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! To your health, friend, and to your armor, which I hope is better at keeping out a sword than my cellar was at keeping out thieves." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! I'll drink to the hunt, friend, and to whatever you brought down last, unless it was a boar, because I had a very bad night with a boar once." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and I'll drink to that! You must know every berry and root that ferments, and I'd give my last cask to hear about the good ones." },
      },
      again = {
        { id = "h_again", text = "A toast, to more questions! Ask away, my friend." },
        { id = "h_again2", text = "More? To curiosity! May it never kill anybody I like." },
      },
      choices = {
        { text = "Do the sailors' tavern stories ever mention the spirits of the sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a spellcaster help you find your lost port?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do you lose a whole cask?", next = "lost" },
        { text = "What makes this port so special?", next = "port" },
        { text = "Toast me, then.", next = "toast" },
        { text = "You drink like a dwarf, Slim. I've seen everything now.", next = "gnome", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Pour me something big. I'm a tauren.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Where exactly did your port go missing, Slim?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can magic really make water taste like port, Slim?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is drink all you have to comfort you, Slim?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you drink with many old soldiers here, Slim?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could a hunter track down your lost port, Slim?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Which jungle fruits would you ferment, Slim, if you had the choice?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Is there anything you'd toast besides that lost port, Slim?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Cheers.", next = "END", fx = { affinity = 1 } },
      },
    },
    lost = {
      lines = {
        { id = "l_default", text = "Bandits, a cart, a hill and a very unfortunate trade involving a troll. The details are hazy, and that's partly the port's fault." },
      },
      choices = {
        { text = "The Hinterlands are dangerous.", next = "lost_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_danger = {
      lines = { { id = "ld_default", text = "Dangerous! It's full of trolls with axes and gryphons with opinions. To the Hinterlands: may they choke on my port." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    port = {
      lines = {
        { id = "p_default", text = "Aged in a barrel that once held something I won't name, rolled down a mountain on purpose, and blessed by a priest who didn't know he was doing it. One taste makes you forgive your enemies, briefly." },
      },
      choices = {
        { text = "That sounds made up.", next = "port_made", fx = { trait = { skeptical = 1 } } },
        { text = "I'd like a glass.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    port_made = {
      lines = { { id = "pm_default", text = "All the best things are! To made-up things! And to you, who'll never get a drop for saying so." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    toast = {
      lines = {
        { id = "t_default", text = "To you! May your boots stay dry, your blade stay sharp, and your enemies trip on something embarrassing. And if you ever cheat me, may your teeth rot. Cheers!" },
        { id = "t_drunk", when = { drunk = { min = 2 } },
          text = "To you, who's already had a few, ha, a kindred spirit! May you find the door on the first try." },
      },
      choices = {
        { text = "To you too, Slim.", next = "BACK", fx = { affinity = 2 } },
        { text = "That threat at the end seemed a bit much.", next = "toast_threat" },
      },
    },
    toast_threat = {
      lines = { { id = "tt_default", text = "Every toast needs a little salt! It's an old Lordaeron tradition, probably, or at least my grandfather did it, and he had very few friends, but they never cheated him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = {
        { id = "g_default", text = "Like a dwarf! I drink like three dwarves stacked in a coat. Ironforge taught me, and Ironforge regretted it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "Big! Ha, the Fleet Master says that every night, and every night the tankards come back empty and the floor comes back cracked. To the biggest drinkers in Booty Bay, and may the floorboards hold." },
      },
      choices = {
        { text = "To the floorboards!", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge taught me to drink, the road taught me to drink better, and Booty Bay taught me to drink here. To all three!" } },
    advice = { { id = "tp_ad", text = "Never toast with an empty glass, never toast someone who won't toast back, and never touch my glass." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay! Finest town on the coast, finest rum in the world, and the finest company, present company included. To Booty Bay!" } },
    magni = {
      { id = "tp_magni", text = "King Magni Bronzebeard, may his beard grow long and his mug never go dry! I'll drink to the king of Ironforge any day, and twice on feast days." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Another son or daughter of the mountain, here in this salt pit! Raise a glass with me to King Magni, and to the halls of Ironforge, and to never going back to the cold." },
    },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer can't brew a decent ale to save their lives, but they can drink one, I'll give them that. I drank with a Wildhammer once and woke up on a gryphon." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I watched a round at the Arena once, from a very safe distance with a very full bottle. Some brave lad won the chest, and I drank to him, and then I drank to the losers too." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has the best beer in all of Azeroth, and I've tested that claim very carefully over many years. To Silas Darkmoon!" } },
    _none = { { id = "tp_none", text = "Don't know and don't care! Fancy a drink instead?" } },
  },
}

P:NPC {
  key = "drizzlik", id = TODO_NPC("Drizzlik"), name = "Drizzlik",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "boastful" }, values = { "proud", "greedy" },
  notices = { "craft" },

  impression = {
    first = "He praises his own leatherwork at length, and the work deserves it.",
    third = "{name} browsed Drizzlik's Emporium in Booty Bay, where the goblin leathercrafter praises his own crocolisk and panther hides at great length.",
  },

  greetings = {
    { id = "g_emporium", text = "Welcome to Drizzlik's Emporium, pal, the finest leather in the South Seas! The finest leather anywhere, if you ask me, and you are asking me, and the price reflects it." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "A leatherworker! You've good hands, I can tell, not as good as mine but close, give or take a few hundred gold of talent." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Is it any use! A good padded jerkin stops the rings biting and the rust spreading, and in this heat it's the difference between fighting all day and fainting by noon. I've dressed Blackwater bosuns who swore by it, and the ones too cheap to buy it swore at the heat instead." } },
      choices = {
        { text = "Good armor is discipline. I look after mine properly.", next = "BACK", reply = "Good, pal, because it shows, and the rust'll leave you alone. Discipline in the oil, that's what I always say.", fx = { align = { order = 1 } } },
        { text = "I fight in whatever I've got and fix it when it breaks.", next = "BACK", reply = "Fix it when it breaks, sure, pal, if you're still alive to fix it. Come see me before it breaks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Raptor for toughness, panther for suppleness, and crocolisk for anything that has to stand up to sea water, which in Booty Bay is everything. Skin it clean, keep it out of the sun, and bring it to me before the flies find it, because flies knock a hide's price in half." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Raptor for toughness, panther for suppleness, and crocolisk for anything that has to stand up to sea water, which in Booty Bay is everything. Skin it clean and bring it to me before the flies find it. And keep {pet} away from my drying racks, pal, because last week a hunter's cat ate half a crocolisk hide, eleven gold of it, and I'm still not over it." },
      },
      choices = {
        { text = "I skin clean and waste nothing. The beast is owed that.", next = "BACK", reply = "A clean skinner, I like that, pal, and the hides show it. Bring me clean work and I'll pay you for it.", fx = { align = { honor = 1 } } },
        { text = "I'll skin whatever pays best and leave the rest.", next = "BACK", reply = "Whatever pays best, pal, and I'll tell you what pays best today. Raptor's up, panther's steady.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Gloves, mostly, because casters set fire to their own hands more often than they'll admit, and gloves are cheaper than new fingers. And satchels with strong seams, since a reagent pouch that splits in the jungle means a mage with no spells and a raptor with no manners." } },
      choices = {
        { text = "Fine work deserves a fine price. I'll pay it.", next = "BACK", reply = "A caster with sense! Gloves are the best investment you'll make all year, pal, and your hands will agree.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner haggle you down to half.", next = "BACK", reply = "Half? Pal, you'd have me livin' on tannin and good wishes. Make it a fair offer and we'll talk.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I give thanks to the hunters who bring them in, and I give them coin, which they like better. If a crocolisk's spirit wants to complain, it can take it up with the hide, which looks magnificent now and sells for three times what the croc was worth alive." } },
      choices = {
        { text = "The beast gave its life. A word of thanks costs nothing.", next = "BACK", reply = "Thanks, sure, pal, I'll give it a try next time. But the hunters still like the coin better.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide is a hide. Thanks never tanned any leather.", next = "BACK", reply = "Ha! A practical shaman, now there's a rare one, pal. Coin tans leather, and thanks tans nothing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Raptor hide, cured slow and oiled twice, and a few trade secrets I'll be taking to my grave, unless somebody makes me a very good offer. Most leatherworkers rush the curing, and that's why their armor squeaks like a Bloodsail parrot." } },
      choices = {
        { text = "Good work deserves good pay. I'll pay your price.", next = "BACK", reply = "Good, pal, and the oil'll keep you quiet in the shadows. Honest money for honest work, that's rare in this town.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take the trick and skip the price.", next = "BACK", reply = "Nice try, pal, but the trick costs extra, and it's not for sale. Some secrets I'm takin' with me.", fx = { align = { order = -1 } } },
        { text = "Something else, Drizzlik.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd make armor for a raptor if it paid me, pal, and I've done worse, believe me. The trouble is that demons tend to burn through leather faster than anything I can stitch, so I'd charge double just for the risk, and triple for the smell." } },
      choices = {
        { text = "My demon needs no armor. Pain teaches it obedience.", next = "BACK", reply = "Bare it is, pal, but don't come cryin' to me when it gets a sword in the ribs. Demons look good in leather.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Make it, then. Name your price for the risk.", next = "BACK", reply = "Risk pricing, now you're talkin' my language, pal! Double for the demon, triple if it bites.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because plate rubs, friend, and in this heat it rubs worst where you can least afford it, so every knight who's come through here with blisters has left in my padding, at a very fair price. Raptor hide's the best for it, soft and tough at once, and nobody tans it like I do, which is simply a fact." } },
      choices = {
        { text = "Fine work deserves an honest price. I'll pay it.", next = "BACK", reply = "Honest's my favorite kind, pal. You'll thank me when the heat comes and you're not rubbed raw.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll haggle you down to half, Drizzlik.", next = "BACK", reply = "Half? Pal, you'd have me out of business by next week. Make it three-quarters and a handshake.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, eh? All that plate, and I'll wager there's not a scrap of decent leather under it, which is a crime I can fix for a modest price." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Your people wear hides with respect, I'm told, so you'll know quality when you see it, pal, and you're looking at it now, at a very respectful price." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Even the faithful need boots, and mine are the finest in the South Seas, blessed by nobody and worth every copper anyway." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, in cloth, in this jungle? You'll want something of mine underneath it, chum, because raptors don't care how many spells you know." },
        { id = "h_default", key = true,
          text = "Drizzlik! Finest leathercrafter of the South Seas and every world old or new, and priced like it. Crocolisk, raptor, panther: if it has a hide, I've made it into something gorgeous and sold it at a gorgeous margin." },
        { id = "h_supply", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Supply and Demand") }, { questActive = TODO_QUEST("Some Assembly Required") } } },
          text = "I need hides, good ones, buddy. The jungle's full of them, still attached to things with teeth, and that's where you come in, and I pay fair, by goblin standards." },
        { id = "h_boots", when = { metBefore = true },
          text = "Somebody ordered a pair of boots from me yesterday and paid in advance! In advance, pal! I almost fainted, so I'm making them extra gorgeous out of pure shock." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'll want leather that doesn't creak, and I'm the only goblin on this coast who can make it, so you've come to the right place." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I'll tell you now, I've never made anything for a demon, but I'd be willing to try for the right fee, as long as it holds still while I measure it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior in mail, and mail is all very well, but under it you want padded crocolisk leather, the finest in the South Seas, which happens to be mine." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You've brought me hides, I hope, because I can turn a raptor skin into a jerkin that would make a Stormwind tailor faint dead away." },
      },
      again = {
        { id = "h_again", text = "More? Ask anything you like, pal, but touch nothing, because touching's extra." },
        { id = "h_again2", text = "Something else? Make it quick, chum; that raptor hide won't stretch itself and time's money in this shop." },
      },
      choices = {
        { text = "Do you give thanks to the beasts whose hides you sell?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does a spellcaster need from a leathercrafter, Drizzlik?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What's the best hide in the jungle?", next = "hides" },
        { text = "Who taught you the trade?", next = "teacher" },
        { text = "I'd take any advice you have for a leatherworker.", next = "advice", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "A druid thinks twice about wearing a beast's hide.", next = "x_druid", when = { class = "DRUID" } },
        { text = "What makes your leather so quiet, Drizzlik?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really make armor for a demon, Drizzlik?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is your leather any use under a warrior's mail, Drizzlik?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which jungle hides make the best leather, Drizzlik?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would a paladin need your leather under his plate, Drizzlik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Later.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hd_default", text = "Crocolisk for boots, raptor for belts, and panther for anything you want to be admired in, at admiring prices. Tiger too, if Nesingwary's people leave any, but they never leave any." },
      },
      choices = {
        { text = "I'll bring you some.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = {
        { id = "t_default", text = "Taught? I was born knowing! Fine, it was an old goblin in Ratchet who said I'd never be any good, and I keep a pair of his boots to remind me he was wrong." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_druid = {
      lines = {
        { id = "xdr_default", text = "Think twice, then! I think about it once, very carefully, and then I make it beautiful. If the beast's already gone, I'd say the worst thing you could do is waste it on ugly boots." },
      },
      choices = {
        { text = "Fair. Waste is the real insult.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Cut with the grain, cure in the shade, and never let a customer tell you the color's wrong. The color is never wrong, kid; the customer is, and the customer still pays." },
      },
      choices = {
        { text = "Thanks, Drizzlik.", next = "BACK", fx = { affinity = 2 } },
        { text = "Sometimes the customer's right.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born with a needle in one hand and a hide in the other, pal. My mother was very surprised, and she billed me for it later." } },
    advice = { { id = "tp_ad", text = "Leather breathes and plate doesn't, so in this heat, choose wisely, and choose mine." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the best market in the world for a leatherworker, pal, with the jungle full of hides and the docks full of buyers. Every pirate needs a good belt, and I make the best ones." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Half the armor in that Arena was made by me, pal, and the half that held up was definitely mine. You'll see the difference when the chest comes down." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company's men wear leather that would embarrass a kodo, pal. It's no wonder the trolls keep chasing them out of their own camps." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls of Zul'Gurub dress in tiger skins and bat leather, and I'll admit, the workmanship is very good. I'd pay well for a pattern, though I wouldn't go fetch one myself." } },
    _none = { { id = "tp_none", text = "If it isn't leather, pal, it's beneath me and beneath my prices." } },
  },
}

P:NPC {
  key = "sprogger", id = TODO_NPC("Sprogger"), name = "Sprogger",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "haunted" }, values = { "loyal" },
  notices = { "drink" },

  impression = {
    first = "He speaks plainly of the giants, which makes it worse to hear.",
    third = "{name} met Sprogger, Captain Smotts' cook, who survived the sinking of the Smotts' Revenge alongside his captain.",
  },

  greetings = {
    { id = "g_cook", text = "You hungry? I can cook, I'm a cook. Well, I was a cook, on a ship, two ships actually." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy on the grog. The water's closer than you think from these docks, and I'd know." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The bosun did, with a boarding axe, and he stood at the rail while the rest of us ran, and the giant took him and the rail together. I think about him every time somebody tells me a brave man can hold anything." } },
      choices = {
        { text = "He held his post. That's the best any of us can do.", next = "BACK", reply = "He did, and he did it better than any of us. I think about him every time I see a gangplank.", fx = { align = { honor = 1 } } },
        { text = "Brave and dead. He should have run with the rest.", next = "BACK", reply = "Maybe he should have, and maybe we'd all be drowned if he did. I'll not speak ill of him.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar when we could get it, crocolisk tail when we couldn't, and once a whole panther that the Captain swore blind was venison. Fresh meat keeps a crew happy at sea, and I still miss having a crew to cook for." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Boar when we could get it, crocolisk tail when we couldn't, and once a whole panther that the Captain swore blind was venison. Fresh meat keeps a crew happy at sea, and I still miss having a crew to cook for. Your {pet} looks like it'd eat anything I put down, which is the highest compliment a cook gets these days." },
      },
      choices = {
        { text = "A cook keeps a crew alive. That matters as much as fighting.", next = "BACK", reply = "It does, and I'd like to think I kept a few of them alive a little longer. Thank you for saying it.", fx = { align = { light = 1 } } },
        { text = "Meat's meat. Nobody remembers who cooked it.", next = "BACK", reply = "Nobody remembers, maybe, but they ate it all the same. That's enough for me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "We had a goblin with a wand aboard, and he got off one bolt before the first giant put a hand through the hull. I don't think it was a matter of magic; the sea wanted that ship, and the sea usually gets what it wants." } },
      choices = {
        { text = "Negolash will answer for your crew. I'll see to it.", next = "BACK", reply = "Thank you, friend, and the captain will thank you too. He'll want to know when it's done.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your captain took the risk for profit and paid for it.", next = "BACK", reply = "For profit, aye, and for pride, and he paid more than either was worth. I'll not argue with you, but I'll not agree either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It was as if the sea itself stood up, with barnacles on their shoulders and eyes like lanterns, and the ship broke in their hands like kindling. I've cooked through storms and pirates, but I never felt so small as I did that night." } },
      choices = {
        { text = "The sea spared you, Sprogger. Honor the crew it took.", next = "BACK", reply = "I'll try, friend, and I'll name every one of them when I do. It's the least I can manage.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea takes what it wants. Forget them and move on.", next = "BACK", reply = "I'd like to, but they won't let me forget. They come back at night, every one of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I held on to a barrel of salt pork and kicked for shore, and I didn't let go until my feet touched sand. The Captain was clinging to the next barrel over, and we didn't say a word to each other the whole way in." } },
      choices = {
        { text = "You survived together. That's a bond worth keeping.", next = "BACK", reply = "We did, me and the captain, and it's the only thing that keeps me by his side. A barrel of salt pork, and a bond for life.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You were lucky, because most aren't.", next = "BACK", reply = "Lucky, aye, and I've wondered every day why it was me. I'll take your word that luck's all it was.", fx = { align = { light = -1 } } },
        { text = "Something else, Sprogger.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "He talks about it at night, after the rum, and in the morning he pretends he never said it. I've cooked for him a long time, and I've never seen him like this, so I'll ask you plainly to leave him be." } },
      choices = {
        { text = "I'll leave him be. He deserves peace.", next = "BACK", reply = "Thank you, he does, and so do I. I'll keep him from making a deal he'll regret.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If he wants a demon, that's his choice.", next = "BACK", reply = "His choice, maybe, but I'll not let him make it without telling him what I think. Somebody has to.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You talk to the water, don't you? Then ask it why it sent the giants up after the Smotts' Revenge, because I still can't sleep for wondering." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Will you say something for the crew of the Smotts' Revenge? Whoever you pray to, it doesn't matter; nobody's said anything for them yet." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. You can conjure bread and water, can't you? Then you don't need a cook, and I don't blame you, but I'll make you a stew anyway." },
        { id = "h_default", key = true,
          text = "Sprogger. I cooked for Captain Smotts on the Smotts' Revenge, until the giants came up out of the water and that was the end of her. Everyone went down but the Captain and me." },
        { id = "h_negolash", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash. I can still see him coming over the rail, so bring friends, lots of friends. Then come back and tell me he's gone, because I'd like to sleep again." },
        { id = "h_why", when = { metBefore = true },
          text = "People ask why I lived. I was in the galley, under a pot, a big pot, and that's the whole secret; it isn't a good story, but it's mine." },
        { id = "h_gone", tags = { "news" }, when = { questRecent = { TODO_QUEST("Facing Negolash"), days = 3 } },
          text = "Is it true he's gone? Then I'm going to sleep tonight, all night. You can wake me if the sea comes up, but it won't, not now." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be wanting to know where the Captain keeps his gold, I suppose, and I'll tell you that it's at the bottom of the sea with his ships." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You're one of them, then. The Captain's been talking about hiring a demon to kill those giants, and I'll ask you not to encourage him, because he's not thinking clearly." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. The Captain could have used one of you on the Revenge, though I doubt even you could have stopped what came up out of the water." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Back on the ship I cooked whatever the shore parties brought me, and the hunters always brought the best meat, so you're welcome by my pot." },
      },
      again = {
        { id = "h_again", text = "Something else? I can do a stew while we talk; I always do a stew." },
        { id = "h_again2", text = "Ask away, and I'll keep stirring." },
      },
      choices = {
        { text = "What did the giants look like when they rose from the sea?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic have saved the Smotts' Revenge from the sea giants?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What was the Captain like, at sea?", next = "captain" },
        { text = "What did you see that night?", next = "night" },
        { text = "Something smells like it's been cooking all day.", next = "cook" },
        { text = "Would you sail with him again?", next = "again" },
        { text = "Shall I say a prayer for the crew?", next = "pray", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "I conjure my own food, cook.", next = "k_mage", when = { class = "MAGE" } },
        { text = "How did you survive the sea giants, Sprogger?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is the Captain really considering a demon, Sprogger?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Some of the crew must have fought the giants, Sprogger.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What did you cook from the jungle back then, Sprogger?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'm glad you made it.", next = "END", fx = { affinity = 2 } },
      },
    },
    captain = {
      lines = {
        { id = "c_default", text = "Loud, and fair, and he knew every man's name and every man's mother's name. He sang badly at the wheel, too, but he doesn't sing now." },
      },
      choices = {
        { text = "Maybe he will again.", next = "BACK", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      big = true,
      lines = {
        { id = "n_default", text = "Nothing, mostly: the pot, the dark, a noise like the world tearing. Then quiet, and water up to my knees, and the Captain shouting names." },
      },
      choices = {
        { text = "You don't have to say more.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Did anyone else call back?", next = "night_names" },
      },
    },
    night_names = {
      lines = { { id = "nn_default", text = "Just me, and he kept shouting anyway. Nobody's told him to stop, and I don't think anybody should." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = {
        { id = "ck_default", text = "Stew: fish stew, crab stew, stew stew. The Captain says it's terrible and has two bowls, and I've learned to take that as a yes." },
      },
      choices = {
        { text = "I'd try a bowl.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ever thought of cooking something else?", next = "cook_else" },
      },
    },
    cook_else = {
      lines = { { id = "ce_default", text = "Once, a pie, and that was the night of the second ship. I haven't made a pie since; I'm not superstitious, I'm just not making pies." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    again = {
      lines = {
        { id = "a_default", text = "He'll ask. He'll find a ship and stand on that dock and ask, and I'll say yes, and I'll hate every minute of it." },
      },
      choices = {
        { text = "Standing by him like that is real loyalty.", next = "BACK", reply = "It is, and it's all I've got left to give him. I'll stand on that deck and pray we don't meet the giants again.", fx = { align = { honor = 1 } } },
        { text = "Then tell him no, because you've earned some peace.", next = "BACK", reply = "Maybe I have, but he hasn't, and I'll not leave him alone. Peace can wait.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would you? Nobody's said anything over them, because there wasn't anything to say it over, just water." },
        { id = "pr_shaman", when = { class = { "SHAMAN", "DRUID" } },
          text = "To the water? The water took them, so tell it to keep them gentle, if it's listening; you'd know better than me whether it is." },
      },
      choices = {
        { text = "Then the water will do.", next = "BACK", reply = "It will, I think, and they'd like it. Say it soft, so the sea can hear.", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I've no words for the sea, Sprogger, and I'm sorry.", next = "BACK", reply = "Don't be sorry, friend, the sea doesn't need words. It took them, and it'll keep them.", fx = { align = { light = -1 } } },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "I've tasted that conjured bread, and it's bread the way a painted fish is a fish. A cook's food remembers where it came from, mate, and yours remembers nothing at all." },
      },
      choices = {
        { text = "It keeps me alive, and it never goes stale.", next = "BACK", fx = { affinity = -1 } },
        { text = "Fair. Cook me something real, then.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a ship's cook, on two ships. You know the rest; everyone does.", next = "night" } },
    advice = { { id = "tp_ad", text = "If the boat starts shaking and it isn't a storm, find a pot, a big one." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I washed up after the giants sank us, and it's been good to me since, mostly. The fish are fresh and the galleys are dry." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail don't cook their fish proper, I can tell you that, because I've seen the scraps they throw over the side. A crew that eats like that can't sail straight." } },
    theramore = { { id = "tp_theramore", text = "I hear the cooks in Theramore get paid twice what I ever did, and they don't even have giants to worry about. I'm thinking of asking, but I'm not sure they'd take me." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've cooked for fighters at the Arena, and they eat more than any sailor I've known, and they don't complain about the food. I liked that crowd." } },
    _none = { { id = "tp_none", text = "I only know cooking and sea giants, mostly cooking, though lately it's too much sea giants." } },
  },
}

P:NPC {
  key = "fin", id = TODO_NPC("Fin Fizracket"), name = "Fin Fizracket",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "miserable" }, values = { "hopeful" },
  notices = { "kit" },

  impression = {
    first = "He has the Stranglethorn Fever, so I keep a polite distance.",
    third = "{name} met Fin Fizracket, a Blackwater Raider laid low by the Stranglethorn Fever.",
  },

  greetings = {
    { id = "g_sick", text = "Don't come too close, pal, or do, I don't know if it's catching, and nobody else knows anything either, and they all charge for not knowing. Ugh." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It took one of our bosuns, who once held a gangplank against four Bloodsail by himself, and laid him out shaking for a fortnight. The fever doesn't care how hard you hit, pal, so get your medicine before you go swinging at trolls." } },
      choices = {
        { text = "Strength isn't everything. A warrior should know his limits.", next = "BACK", reply = "You're right, buddy, and the fever proved it on him first. A warrior who knows his limits lives to fight again.", fx = { align = { order = 1 } } },
        { text = "I'll fight through any fever. Pain's no reason to stop.", next = "BACK", reply = "Through any fever? Buddy, that's what the bosun said, and look where it got him. Lie down when the shakes come.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The physician says it's the jungle air, and the troll from Grom'gol said it was the jungle's rot, and they both charged me for saying so. If there's a spell in it, I'd like to know whose, so I can send them the bill." } },
      choices = {
        { text = "I'll find you a cure, Fin, magic or no magic.", next = "BACK", reply = "You're a saint, buddy, a real saint. Bring me Mokk's cure and I'll stop sweating through my shirts.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll help, but your crew can cover my costs.", next = "BACK", reply = "My crew? Buddy, my crew's paying half my wages already. Fine, fine, we'll work something out, I'm desperate.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A troll from Grom'gol laid hands on me once and said the fever comes from the jungle's own rot, and that the jungle would have to give back what it took. Then he charged me five silver, which I thought was a bit less spiritual of him." } },
      choices = {
        { text = "I'll ask the waters to help you, Fin, and charge nothing.", next = "BACK", reply = "You'd do that? For free? Buddy, you're the first person in this port who's ever said that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healing takes effort. Five silver sounds fair to me.", next = "BACK", reply = "Five silver? Buddy, I'm on half pay! Fine, fine, I'll scrape it together, just help me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "In a jungle pond up the coast, on shore leave, where everybody told me not to swim, and now I sweat through three shirts a day at four silver a shirt. The witch doctors on the coast are supposed to know a cure, but I'm not in any shape to go asking, so here I sit, losing money." } },
      choices = {
        { text = "I'll find the cure for you, Fin. Hang on.", next = "BACK", reply = "Thanks, buddy, I'll hang on as long as I can. My shirts can't take much more.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You swam where you were warned not to. Live with it.", next = "BACK", reply = "Yeah, yeah, I know, buddy, everybody tells me that. Doesn't make the fever any cooler.", fx = { align = { light = -1 } } },
        { text = "Something else, Fin.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not that I've found, since the mages I've asked tell me their magic is for burning and freezing, not for curing. I asked one to freeze the fever out of me, and she just laughed and handed me a cold cloth, which I'll admit helped a little, and she still billed me for the cloth." } },
      choices = {
        { text = "She was right. A cold cloth is better than a frost bolt.", next = "BACK", reply = "She was, and I hate admitting it. A cold cloth and a lot of complaining, that's my cure for now.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me try a frost bolt. It might just work.", next = "BACK", reply = "A frost bolt? Buddy, I'm desperate, but I'm not that desperate. Maybe a small one.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman? Your kind heal with water and earth, don't they? I've tried every potion in Booty Bay at every price, so I'll try mud next if you think it'll help, pal." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Pray over me, would you, buddy? Loa, shadows, anything, I'm not fussy, and I've paid for everything else twice." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Ugh, don't tell me the fever's a curse, chum, because I've had enough bad news this week for three goblins and I can't afford a fourth." },
        { id = "h_default", key = true,
          text = "Fin Fizracket, Blackwater Raiders, or I was, before the Stranglethorn Fever got me and my wages stopped. Sweats, shakes, and a taste in my mouth like old boots, so don't get sick in the jungle, pal; it's terrible value." },
        { id = "h_fever", tags = { "news" }, when = { questActive = TODO_QUEST("Stranglethorn Fever") },
          text = "There's a cure, supposedly: a gorilla's heart, from one particular gorilla, a big angry one called Mokk. I can't believe I'm hoping somebody kills a gorilla for me, but I'd sign anything at this point." },
        { id = "h_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "I'm better, look at me, standing on my own two feet and back on the payroll! The heart tasted awful and I'd eat ten more, or actually no, never again, but I'd think about it for the right price." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? Don't come any closer than you have to, pal, because this fever doesn't care how sneaky you are, and I'd hate to share it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I don't suppose you know a spell for fever, do you, pal? I've tried everything in Booty Bay, and the only thing that helps is lying very still, which doesn't pay." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? Keep your distance, pal, because I've seen big strong types go down with this fever faster than anybody, and it isn't scared of a sword arm." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Talk loud, buddy; my ears are ringing like a dropped wrench." },
        { id = "h_again2", text = "Ugh, yes? Go on, I'm listening, more or less, mostly less." },
      },
      choices = {
        { text = "Has anyone tried a shaman's healing on the fever?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there magic in this fever, Fin, or only sickness?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How did you catch it?", next = "caught" },
        { text = "Is there any cure for this fever?", next = "cure" },
        { text = "Let me look at you.", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "You must have plans for when you're well.", next = "after", when = { ["not"] = { questDone = TODO_QUEST("Stranglethorn Fever") } } },
        { text = "You're cured! What's first, Fin?", next = "f_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") } },
        { text = "Tell me about the Raiders, Fin.", next = "f_raiders" },
        { text = "I'm a hunter. Is there anything I could track for you?", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Where did you catch the Stranglethorn Fever, Fin?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can't a mage's magic cure your fever, Fin?", next = "xmage", when = { class = "MAGE" } },
        { text = "Can the fever really take down a warrior, Fin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Feel better.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    caught = {
      lines = {
        { id = "c_default", text = "Shore leave, pal. I swam in a pond up the coast when everyone said don't swim in the pond, but I'm a sailor, and I didn't think a pond could beat me, and I'd have bet good money on it." },
      },
      choices = {
        { text = "Never trust a jungle pond.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure = {
      lines = {
        { id = "cu_default", text = "A gorilla's heart, from a big brute called Mokk, or so says a troll witch doctor, through a friend of a friend of a cousin, and I paid all three of them for the tip. Is it real? I don't know, and do I care, when I'm sweating through my second shirt today?" },
      },
      choices = {
        { text = "Then I'll get it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Sounds like a troll joke at your expense.", next = "cure_joke", fx = { trait = { skeptical = 1 } } },
      },
    },
    cure_joke = {
      lines = { { id = "cj_default", text = "Then it's a very good joke, and I'll laugh when I'm dead, pal. Get the heart anyway, please, and put it on my tab." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    healer = {
      lines = {
        { id = "hl_default", text = "You're a healer? Go on, then, do the glowy thing, do anything at all, buddy; I'm not proud, and I'm not paying full price for pride." },
        { id = "hl_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "Too late, friend, I'm cured, and it only cost me a gorilla and my dignity! But you can look all you like; I like being looked at by people who aren't worried." },
      },
      choices = {
        { text = "This is beyond what I can mend. Hold on.", next = "BACK", reply = "Beyond you too? Buddy, that's the worst thing you could tell me. I'll hang on, I guess.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It'll pass with rest and water.", next = "BACK", reply = "Rest and water, sure, buddy, the physician said the same. Doesn't feel like it's passing.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Back on a Blackwater ship with the Bloodsail in sight and the cannons going boom, drawing a proper wage, and never, ever anywhere near a pond." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Could you? Mokk the Savage, the big one up the hill, and don't let your pet near him because he throws things. I'd go myself, pal, but I can't hold a cup still, never mind a rifle." },
      },
      choices = {
        { text = "Mokk won't be throwing anything for long.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Is there any cure for this fever?", next = "cure" },
      },
    },

    -- Deeper: the Raiders from a sickbed (sub-hub), Crazz, Seahorn's half pay, a kind lie, life after.
    f_raiders = {
      hub = true,
      lines = {
        { id = "fr_default", text = "The Raiders? Ugh, talking about the ship makes me miss it, and missing it makes me sweat, but go on, it beats staring at the ceiling. I've counted the planks up there three times and got a different number every time." },
        { id = "fr_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") }, text = "The Raiders! Ask away, pal, because I can talk about the ship again without wanting to cry, and that's thanks to you and one very dead gorilla." },
      },
      again = {
        { id = "fr_again", text = "More? Sure, sure, I've got nowhere to be, which is the whole problem." },
        { id = "fr_again2", text = "Go on. Talking keeps my mind off the shakes, mostly." },
      },
      choices = {
        { text = "Does your crew come to see you?", next = "f_crew" },
        { text = "Do the Raiders still pay a sick sailor?", next = "f_wages" },
        { text = "What have you missed out there?", next = "f_missed" },
        { text = "My people know this fever, Fin. It's an old one.", next = "f_troll", when = { race = "Troll" } },
        { text = "I've had the fever myself. It passes in a day or two.", tag = "Deceive", next = "f_lie",
          when = { ["not"] = { questDone = TODO_QUEST("Stranglethorn Fever") } },
          check = { pass = { any = { { class = "ROGUE" }, { trait = "witty" }, { disposition = { min = 55 } } } } },
          fail = { next = "f_lie_no", fx = { affinity = -1 } } },
        { text = "Let's talk about something else, Fin.", next = "hello" },
      },
    },
    f_crew = {
      lines = {
        { id = "fc_default", text = "Crazz comes by every night with soup and says it's the cook's idea, which it isn't, because the cook hates me. Then he tells me it's my own fault for swimming in that pond, every single time, like I might've forgotten." },
      },
      choices = {
        { text = "Crazz is right about the pond, Fin.", next = "f_crazz" },
        { text = "Sounds like a good friend.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    f_crazz = {
      lines = {
        { id = "fcz_default", text = "I know he's right, pal, that's what makes it so annoying! A goblin can stand being wrong, but being told he's wrong by another goblin with soup is a whole new kind of suffering." },
      },
      choices = { { text = "Ha! Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    f_wages = {
      big = true,
      lines = {
        { id = "fw_default", text = "Half pay, and my berth kept, which nobody else on this coast would do for a sick deckhand, never mind a stupid one. Krazek says it's bad business and the Fleet Master told him to put it in the ledger under 'loyalty' and stop whining." },
      },
      choices = {
        { text = "A crew that cares for its sick is worth sailing with.", next = "BACK", reply = "It is, buddy, and I'll not forget it. The Raiders take care of their own, even the sick ones.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Half pay for no work? Krazek has a point.", next = "BACK", reply = "Krazek always has a point, buddy, and it's always aimed at somebody's purse. I'd like to see him sweat through three shirts.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    f_missed = {
      lines = {
        { id = "fm_default", text = "Everything! The lads raided a Bloodsail camp on the Wild Shore while I was lying here, and Crazz came back with a stack of their letters and the biggest grin I've ever seen on a goblin. I was supposed to be on that boat, pal, and I got a pond instead." },
        { id = "fm_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "Everything! Firallon's gone to the bottom, Keelhaul too, and I was lying here sweating through all of it. The lads say some outsider did most of the work, and if that was you, I'd like it noted that I'd have helped." },
      },
      choices = {
        { text = "There'll be other raids, Fin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who are the Bloodsail, anyway?", next = "f_bloodsail" },
      },
    },
    f_bloodsail = {
      lines = {
        { id = "fb_default", text = "Red bandanas, red sails, no manners, and a fleet master called Firallon who wants the Baron's chair. They'd have Booty Bay if it weren't for us, and Crazz will tell you the rest, at length, whether you ask or not." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    f_troll = {
      lines = {
        { id = "ft_default", text = "Your people know it? Then tell me straight, pal, do trolls die of it, or just get grumpy? No, don't answer that, I can see it on your face, so just tell me Mokk's heart works and lie if you have to." },
      },
      choices = {
        { text = "It works, Fin. The witch doctors don't joke about hearts.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    f_lie = {
      lines = {
        { id = "fl_default", text = "A day or two? Really? Oh, that's the best thing anybody's said to me all week, pal, and I've had a lot of people say things to me, mostly 'stand back'. I feel better already, or I think I do, which is close enough." },
      },
      choices = { { text = "Rest up, Fin. You'll be on deck soon.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    f_lie_no = {
      lines = {
        { id = "fln_default", text = "A day or two? Pal, I've had it for three weeks, and so did the bosun, and the bosun's twice my size. Don't feed a sick goblin sweet stories, because we can smell them better than soup." },
      },
      choices = { { text = "Sorry, Fin. I meant well.", next = "BACK" } },
    },
    f_cured = {
      lines = {
        { id = "fcu_default", text = "First I'm going to eat something that isn't soup, and then I'm going to climb the mainmast just to prove I can. After that, Crazz has promised me a Bloodsail sloop to shout at, and I've been saving up some very good insults." },
      },
      choices = {
        { text = "Save your best insult for the Bloodsail.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the pond?", next = "f_pond" },
      },
    },
    f_pond = {
      lines = {
        { id = "fp_default", text = "I've told every new deckhand in the fleet about that pond, and I made Crazz draw it on the chart with a skull next to it. Nobody's swum in it since, so maybe some good came of it after all." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Blackwater Raider since I was old enough to lie about my age, and good money it was. Then I swam in a pond." } },
    advice = { { id = "tp_ad", text = "Don't swim in the jungle ponds, pal, don't drink from them, and don't even look at them too long, because it isn't worth what it costs." } },
    booty_bay = { { id = "tp_booty_bay", text = "I'd love to enjoy Booty Bay, pal, but right now I'm sweatin' out a jungle fever in my bunk. It's a lovely town to be sick in, at least." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls up at Zul'Gurub put curses in the water, I'd bet on it, and that's where this fever came from. Don't drink from any pond up that way, pal." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail would rather see us all dead from fever than fight us fair. That's the kind of people they are, pal." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I used to bet on the Arena every week, and now I can't stand long enough to watch it. That's the worst part of being sick, truthfully." } },
    _none = { { id = "tp_none", text = "I can't think straight with this fever, buddy, so ask somebody healthy and somebody cheaper." } },
  },
}

P:NPC {
  key = "lozgil", id = TODO_NPC("Wharfmaster Lozgil"), name = "Wharfmaster Lozgil",
  bible = "bibles/stranglethorn.md", role = "worker", tier = "quest",
  communities = { "booty_bay" }, temper = { "watchful" }, values = { "careful", "practical" },
  notices = { "race" },

  impression = {
    first = "He sees every crate and face off the boats, mine included.",
    third = "{name} passed Wharfmaster Lozgil on the docks of Booty Bay, where everything and everyone coming off a boat goes past him first.",
  },

  greetings = {
    { id = "g_docks", text = "Watch your step on the boards, pal, and your purse on the docks, not necessarily in that order, because the boards are cheaper to replace." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Horde, eh? There's a crate of axes on my dock with your name on it, or your Warchief's name, anyway, and it's been sitting there for days running up storage fees." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I keep a close eye on anything new, and you're new, which means unpriced. The Horde captains will have opinions about a dwarf with totems, so mind how you stand near their ships." } },
      choices = {
        { text = "I'll keep the peace on your wharf, Lozgil.", next = "BACK", reply = "Glad to hear it, friend, and I'll price you as peaceful. The Horde captains can keep their grumbling to the far end of the pier.", fx = { align = { order = 1 } } },
        { text = "The Horde captains can keep their opinions to themselves.", next = "BACK", reply = "They can, but they won't, and I have to listen to it. Do me a favor and stay on the friendly side of the wharf.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I let anyone through who pays, which is the Cartel's rule, and I'll admit you're far from the worst I've waved down the gangplank. One of the dead with the Light in hand is strange, but strange isn't a crime in Booty Bay, and neither is most of what is." } },
      choices = {
        { text = "Some passengers should be turned away. Watch them closely.", next = "BACK", reply = "I watch everyone, friend, it's my job. Some I watch closer, and you'll be on that list for now.", fx = { align = { order = 1 } } },
        { text = "The Cartel's rule is fair. Let everyone through.", next = "BACK", reply = "It is, friend, and the Cartel's rules keep the wharf running. Pay your fee and you're as welcome as anyone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone to hold the end of the pier while my dockhands get the crates and the passengers clear, because pirates always go for the cargo first, the cargo being worth more. I've worked out who stands where and who runs where, and I'd want you at the narrow end." } },
      choices = {
        { text = "Give me the narrow end. I'll hold it as long as needed.", next = "BACK", reply = "Good, friend, the end of the pier's yours. Hold it till the crates are clear and I'll put your name in the book.", fx = { align = { order = 1 } } },
        { text = "I'd rather go after the pirates than wait on a pier.", next = "BACK", reply = "Then go, friend, and leave me a hole at the end of my pier. I'll find someone who likes waiting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because animals come off the boats as well as on, and I've had a Barrens hyena loose in the hold of the Ratchet boat and a crocolisk asleep on my scales. Everything that walks through Booty Bay goes past me first, and that includes things with four legs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because animals come off the boats as well as on, and I've had a Barrens hyena loose in the hold of the Ratchet boat and a crocolisk asleep on my scales. Everything that walks through Booty Bay goes past me first, and that includes things with four legs. Your {pet} looks well behaved enough, so it can go on the good list, provided it stays off my crates." },
      },
      choices = {
        { text = "Then I'll keep my beast leashed on your dock.", next = "BACK", reply = "Smart, friend, and my wharf thanks you. The last hyena cost me a week of crates.", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go, list or no list.", next = "BACK", reply = "Then your beast goes on the list too, friend, and pays the fee. My wharf, my rules.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Crates marked as glassware that hum when you put your ear to them, mostly, and they go north to people who don't sign their names. I don't open cargo, pal, I just weigh it and bill it, and the Baron reads everything I write." } },
      choices = {
        { text = "Good. Somebody should keep track of that.", next = "BACK", reply = "Somebody has to, friend, and it's me. Humming crates are bad for my nerves.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some cargo is better left unwritten, Wharfmaster.", next = "BACK", reply = "Better left unwritten, maybe, but the Cartel taxes everything. Unwritten's just untaxed, and that's illegal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I keep a close eye on anyone who can call lightning down on my docks, which is mostly mages and you. The mages blew up a crate last month and I'm still chasing the invoice, so for now you're ahead." } },
      choices = {
        { text = "I'll keep my lightning to myself on your docks, Wharfmaster.", next = "BACK", reply = "Glad to hear it, friend, the docks thank you. Lightning and gunpowder don't mix.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Watch all you like. I go where the elements take me.", next = "BACK", reply = "Then I'll keep watching, friend, and keep a bucket handy. The elements don't pay for damages.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The list of folk I watch when they're near the crates, which is half of Booty Bay, so don't take it personally, pal. The Bloodsail send their sneaks to the wharf to see what's coming in, and a sharp eye has saved the Cartel more gold than the Bruisers ever have, and cost a lot less." } },
      choices = {
        { text = "Keep your list. I'll prove I belong off it.", next = "BACK", reply = "Prove it, then, friend, and I'll cross your name off with a smile. It's a long list.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your list won't stop me if I want something.", next = "BACK", reply = "Maybe not, friend, but the Bruisers will, and so will the sharks. Think about that.", fx = { align = { order = -1 } } },
        { text = "Something else, Wharfmaster.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I count everything, because the Cartel taxes everything, and I'm not about to let a demon slip through just because it's ugly. I've got a column for livestock and a column for passengers, and so far your sort have gone under livestock, at the livestock rate." } },
      choices = {
        { text = "Count it how you like. Rules keep the port running.", next = "BACK", reply = "Thank you, friend, at last somebody understands. The port runs on counts.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon is no one's livestock. Leave it off your books.", next = "BACK", reply = "No one's livestock, eh? Then it's cargo, friend, and cargo's taxed too. Everything goes on the books.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The ones who smile too much and carry too little, because nobody comes to Stranglethorn with an empty bag unless they mean to fill it with something they shouldn't. The Bloodsail slip spies in on the merchant ships and the Venture Company sends worse, and I can't turn away anyone who pays the docking fee." } },
      choices = {
        { text = "Report every suspicious face to the Baron. Order keeps a port safe.", next = "BACK", reply = "I do, friend, every one of them. The Baron likes a tidy list.", fx = { align = { order = 1 } } },
        { text = "Let them come. A free port can't question everyone.", next = "BACK", reply = "It can't, friend, and I don't. But I watch, and I remember.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It's a safe harbor for anyone who pays, which is the Cartel's rule and not mine, though I'll admit some of what walks down my gangplanks makes my skin crawl. The Baron says neutrality keeps the cannons quiet and the ledgers full, and so far he's been right." } },
      choices = {
        { text = "Some things can't be bought. I'd turn the worst away.", next = "BACK", reply = "So would I, friend, if it were up to me. But the Cartel's rule is the rule, and gold has no smell.", fx = { align = { honor = 1 } } },
        { text = "Neutral gold is still gold. The Baron's wise.", next = "BACK", reply = "He is, friend, and the coffers agree. Neutral gold spends very nicely.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They say it's sick, or angry, or both, and they mutter about Zul'Gurub and something the trolls are waking up in there. I don't know what any of that means, but I've noticed fewer of them come back at all lately." } },
      choices = {
        { text = "Whatever the trolls are waking, it must be stopped before it spreads.", next = "BACK", reply = "It must, friend, and before it reaches my wharf, because sick jungle means sick cargo and sick cargo means paperwork.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The jungle was here before the trolls. It can tend itself.", next = "BACK", reply = "Tend itself, sure, friend, and maybe tend the trolls too. I'll stick to my docks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_drown_lozgil", when = { deathCause = "drowning" },
          text = "You drowned somewhere, didn't you, pal? I can tell, because you walk my wharf like the water's going to grab you, and I'll tell you for free: the bay's deep, the sharks are hungry, and the Wharfmaster doesn't fish out corpses." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I see every face that comes off the boats, and yours is the first in a week that didn't look like it was hiding something, so welcome to Booty Bay, and the docking fee's at the end." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin. I don't often see the Silver Hand on my docks, and when I do it usually means someone out in the jungle is about to have a very bad day." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman off the Grom'gol road. I watch who comes and goes, and your sort have been coming more often since Orgrimmar was built." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I'll put you down in the book as no trouble, pal, and I'll change it if I need to, in ink." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. The last one through here blew up a crate, so I'll thank you to keep your hands in your sleeves while you're on my boards, or I'll bill you for the last one too." },
        { id = "h_default", key = true,
          text = "Wharfmaster Lozgil. Everything that comes off a boat in Booty Bay comes past me first and gets weighed, counted and billed, and you'd be amazed who comes and goes here, and who I'd rather didn't." },
        { id = "h_warsong", tags = { "news" }, when = { questActive = TODO_QUEST("Warsong Supplies") },
          text = "That Warsong crate is axes, by the weight of it, and it's been sitting on my dock for days running up storage fees. Haul it off, please, pal, before somebody else decides it's theirs." },
        { id = "h_sponsor", when = { questActive = TODO_QUEST("Goblin Sponsorship") },
          text = "The Cartel likes to know who it's investing in, friend. Show me you're worth the gold, and the gold will find you, with a little paperwork attached." },
        { id = "h_watch", when = { metBefore = true },
          text = "Saw a sailor slip a letter to a fishmonger this morning, and fishmongers don't read, and they certainly don't pay for letters. I've made a note of it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. I've already put you on a list, friend, and it's not the bad list yet, so let's keep it that way." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I'll be noting your companion on the manifest, since anything that walks off a boat in Booty Bay gets counted, demon or not." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You go on the list of people I'd want beside me if the Bloodsail ever land at the docks, which is a short list and a well-paid one, so try to stay on it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I'll need to see whatever's on that lead before it gets on any boat, because the last hunter's beast ate a crate of bananas and bit a ship's captain, and guess who got the invoice." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, coming off a boat. I see a fair few of your kind heading south, and most of them come back up the dock looking unhappy about the jungle." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin off one of my boats, and a Forsaken one at that. I've seen many strange passengers, but I'll be writing you on a list of your own." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A Bronzebeard shaman off the boat. I watch who comes and goes, and you're the first of your sort to cross my wharf." },
      },
      again = {
        { id = "h_again", text = "Yes? Keep one eye on the water while you ask, pal." },
        { id = "h_again2", text = "More? Fine, but stand there, buddy; you're blocking my view of the green boat, and the green boat owes me." },
      },
      choices = {
        { text = "Do you keep a closer eye on shamans than on other visitors?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What comes through your docks that a spellcaster should know about?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who comes and goes that you'd rather didn't?", next = "who" },
        { text = "What happened with the fishmonger?", next = "fish", when = { metBefore = true } },
        { text = "Any ships to Stormwind or Menethil?", next = "ships", when = { faction = "Alliance" } },
        { text = "Anything on your dock for the Horde?", next = "crate", when = { faction = "Horde" } },
        { text = "How do you know who to trust?", next = "trust" },
        { text = "My people arrived by sky, not ship, wharfmaster.", next = "k_sky", when = { race = "Skyborne" } },
        { text = "What sort of list have you put me on, Wharfmaster?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you really count demons on the manifest, Wharfmaster?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Who comes through Booty Bay that worries you most?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Booty Bay seems a safe harbor for wicked men.", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "What would you need from a warrior if pirates landed, Wharfmaster?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do you inspect hunters' beasts, Wharfmaster?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why do druids come back unhappy from the jungle, Wharfmaster?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Will you let a Forsaken paladin through your docks, Lozgil?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do you keep a closer eye on dwarf shamans, Wharfmaster?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll watch my purse.", next = "END", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Sailors with clean hands, fishermen who don't smell of fish, and anyone in a red scarf who suddenly isn't wearing one. I write them all down, pal, at no extra charge to the Baron, which he never notices." },
      },
      choices = {
        { text = "There must be more to it than that.", next = "who_then" },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    who_then = {
      lines = { { id = "wt_default", text = "Then I give the list to Krazek, who sells half of it and gives the rest to the Baron, who does nothing until someone dies. Then he asks why I didn't tell him sooner." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = {
        { id = "f_default", text = "The fishmonger's gone, stall empty and nets left behind, and the letter went with him, and two months' stall rent he never paid. I've told the Bruisers, and they told me fishmongers come and go." },
      },
      choices = {
        { text = "You think he was Bloodsail.", next = "BACK", fx = { learn = { "bloodsail" }, trait = { curious = 1 } } },
        { text = "Fishmongers do come and go.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    ships = {
      lines = {
        { id = "s_default", text = "Not from here, pal; the boat to Ratchet goes from the end of the pier, fare paid up front. Stormwind's a long way round from there, and Menethil further still, so bring a book." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crate = {
      lines = {
        { id = "c_default", text = "Axes, nails and a smell, with a Warsong stamp on the side. It's been on my dock so long the dock thinks it lives here, and I've started charging it rent." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "I don't, pal. I trust cargo manifests, tide tables and my own eyes, and two of those three have lied to me." },
      },
      choices = {
        { text = "Which one hasn't?", next = "trust_which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_which = {
      lines = { { id = "tw_default", text = "The tide tables. The sea's the most honest thing in this town: it'll drown you, but it tells you when, and it never asks for a cut." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_sky = {
      lines = {
        { id = "xsk_default", text = "Did they, now? Then they didn't pay my wharf fees, and I'll be putting that in the ledger as a loss. I've seen a few of your kind on my docks lately, and nobody here knows what to make of you, so I'll make you a customer and leave it there." },
      },
      choices = {
        { text = "A customer is fine, wharfmaster.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that comes off a boat passes me first, and so does every scrap of news, and I've got a column for both. Ask, and I'll tell you what I've seen." },
    },
    background = { { id = "tp_bg", text = "I've been on these docks longer than most of the docks have, pal, and I've replaced every board twice, at the Cartel's expense, thank goodness." } },
    advice = { { id = "tp_ad", text = "Watch the people who aren't watching the ships, buddy. They're the ones to worry about, and the ones who never pay their fees." } },
    bloodsail = { { id = "tp_bloodsail", text = "Some of the faces on my docks wear red when nobody's looking. I can't prove it, not yet." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay lives and dies by these docks, pal, and I know every crate that comes through them. If it doesn't have a seal, it doesn't come ashore, and if it does, I want to see it." } },
    theramore = { { id = "tp_theramore", text = "Theramore's ships come in with proper papers and leave with proper papers, and that makes them my favorite customers. I wish everyone sailed like Proudmoore's people." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's docks are a mess, pal, and I've told Gazlowe so more than once. He tells me Booty Bay's no better, and we've had that argument for years." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company sends crates through here sometimes, sealed and stamped and very heavy. I don't open them, but I weigh them twice." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The boats that come down from the north coast talk about drums and red lights at Zul'Gurub. I've doubled the watch on the north docks, and I'd like to triple it." } },
    _none = { { id = "tp_none", text = "If it didn't come off a boat and onto my manifest, I don't know it, pal." } },
  },
}
