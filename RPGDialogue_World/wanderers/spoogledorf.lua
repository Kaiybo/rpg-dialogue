-- Spoogledorf: an old gnome in red robes, indoors in Stormwind (Forever NPC 276591; seen in game, 0.80.1). A Gnomeregan refugee who founded the
-- young adventuring company <Uber Town> and keeps its ledgers. His trade (vendor/quest) isn't known, so no line assumes one. Invented life: bibles/spoogledorf.md.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:NPC {
  key = "spoogledorf", id = 276591, name = "Spoogledorf",
  role = "citizen", tier = "quest",
  temper = { "cheerful", "proud" }, values = { "loyal", "curious" },
  notices = { "race", "class", "faction" },

  impression = {
    first = "Spoogledorf is an old gnome with eyebrows like two grey fans and a beard he clearly combs every morning. He fled Gnomeregan and now keeps the ledgers of a young adventuring company he named Uber Town.",
    third = "{name} met Spoogledorf, an old Gnomeregan refugee in Stormwind who founded the adventuring company Uber Town and is sure the bards will sing about it one day.",
  },

  greetings = {
    { id = "g_default", text = "Spoogledorf, at your service! Yes, that's my real name, and no, I don't mind you smiling. In Gnomeregan it was a perfectly respectable name, I'll have you know." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again! Come in, come in. Mind the stairs, they were built for long legs, and I've been cursing them for years." },
    { id = "g_often", when = { timesTalked = { min = 5 } }, text = "You visit an old gnome more often than his own company does, and they're supposed to report to me. Sit down, I'll pretend you're one of them." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A fellow gnome, and a young one! Spoogledorf, late of Gnomeregan, fourth spiral down. Which level were you from, before it all went wrong?" },
    { id = "g_horde", when = { faction = "Horde" }, text = "Oh! Well, this is unexpected. I'd ask how you got past the guards, but I've a feeling I'd rather not know. Spoogledorf, and please don't break anything." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, place = "before",
      text = "Spoogledorf's eyebrows climb nearly to the top of his head, and he looks you over with the soft, careful look gnomes give each other since Gnomeregan." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "He gives your beard a long, measuring glance, then smooths his own with visible satisfaction." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm the founder, treasurer and oldest member of Uber Town, a company of the finest young adventurers you've never heard of. I'm a bit past crawling into dungeons myself, so I keep the ledgers and they keep me in stories. One day there'll be songs, mark my words." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "It does an old heart good to see another of us walking about with a sword or a staff instead of a begging cup. Half of Gnomeregan ended up in Ironforge's back rooms, and the other half here, fixing human clocks for pennies." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, I see. The robes? No, no, I'm no wizard. I was an engineer, and these are what I had on when we ran. They've been mended so often that there's more thread in them than robe." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "Don't let that little imp of yours near my ledgers, if you please. The last time a warlock visited, I spent a week finding scorch marks in the margins." },
        { id = "h_back", when = { metBefore = true, levelsSince = 6 },
          text = "Look at you! You've seen a few things since you last climbed those stairs, I can tell by how you stand. Uber Town could use someone like you." },
      },
      again = {
        { id = "h_again", text = "What else? I've time. The ledgers can wait, they always do." },
        { id = "h_again2", text = "Ask away. Nobody else asks an old gnome anything except the way to the tram." },
        { id = "h_again3", text = "Go on, then. I like a good talk more than a good sum, and I like a good sum a great deal." },
      },
      choices = {
        { text = "Where does a name like Spoogledorf come from?", next = "name" },
        { text = "Tell me about Uber Town.", next = "guild" },
        { text = "You came from Gnomeregan?", next = "gnomer" },
        { text = "How do you find life in Stormwind?", next = "city" },
        { text = "What do you want out of all this?", next = "dream" },
        { text = "Can I join Uber Town?", next = "join", when = { metBefore = true } },
        { text = "Good day, Spoogledorf.", next = "END" },
      },
    },

    -- The name
    name = {
      lines = {
        { id = "nm_default", text = "A spoogle is a coiled spring, the very small kind that makes a pocket watch tick, and a dorf is a workshop. My great-grandfather made the best spoogles in Gnomeregan, and the name came with the shop. In Gnomish it sounds as dignified as Ironforge." },
        { id = "nm_gnome", when = { race = "Gnome" }, text = "Well, you know what a spoogle is, so you know my great-grandfather made the finest watch springs in Gnomeregan. It's only the humans who laugh. To them everything we name sounds like a sneeze." },
      },
      choices = {
        { text = "Does anyone ever get it wrong?", next = "name_wrong" },
        { text = "Have you ever thought of changing it?", next = "name_change" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    name_wrong = {
      lines = { { id = "nw_default", text = "Every day. I've been Spooglewort, Spudgedorf and, on one Stormwind tax notice, Mister Dorf. The tax collector still writes to Mister Dorf, and I've decided Mister Dorf can pay it." } },
      choices = {
        { text = "That sounds like tax evasion.", next = "name_tax" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    name_tax = {
      lines = { { id = "nt_default", text = "Not at all! I paid my own taxes in full, under my own name, in a neat hand. Mister Dorf is a separate gentleman, and I can't be expected to answer for him. I rather hope he's doing well." } },
      choices = {
        { text = "Give Mister Dorf my regards.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "The guards may not see it that way.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    name_change = {
      big = true,
      lines = { { id = "nc_default", text = "A clerk at the Stormwind gate told me to write down something simpler, like Spencer. I stood there with the quill for a long time. Four generations of springs in that name. What would you have done?" } },
      choices = {
        { text = "Keep it. Your family earned that name.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Write Spencer. A name is a tool; use the one that works here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Spencer is a terrible name for a gnome.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    -- Gnomeregan
    gnomer = {
      lines = {
        { id = "gr_default", text = "Seventy years in Gnomeregan, and I left it in an afternoon with a ledger under one arm and my beard singed. The troggs came up from below, and then the gas came, and that was that. I don't talk about the gas." },
        { id = "gr_gnome", when = { race = "Gnome" }, text = "You were there too, then, or your family was. I won't ask what you lost, and you needn't ask me. We both know what the air tasted like that last day." },
      },
      choices = {
        { text = "Do you think the gnomes will take it back?", next = "gnomer_back" },
        { text = "What did you do there?", next = "gnomer_work" },
        { text = "I'm sorry. Let's talk of something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gnomer_work = {
      lines = { { id = "gw_default", text = "I kept the books for the spring works, and later for half the workshops on our spiral. Everyone in Gnomeregan wanted to invent things, you see, and no one wanted to count them. Counting turned out to be a rarer talent than inventing." } },
      choices = {
        { text = "So that's why you keep Uber Town's ledgers.", next = "guild" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomer_back = {
      big = true,
      lines = { { id = "gb_default", text = "The High Tinker says we will, and some days I believe him. Other days I think we ought to build a new city somewhere with sky over it, and leave the old one to the troggs and the ghosts. Which would you choose?" } },
      choices = {
        { text = "Take it back. A people shouldn't give up its home.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Build something new. Old walls aren't worth the dying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "That's for the gnomes to decide, not me.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Stormwind
    city = {
      lines = {
        { id = "ct_default", text = "The humans are kind, mostly, and very tall, always. Everything here is built a foot too high: stairs, counters, doorknobs. I've a little stool I carry to the bank, and the clerks have stopped laughing at it, which I count as a victory for my people." },
        { id = "ct_human", when = { race = "Human" }, text = "Your city took us in when we had nothing, and I won't forget it. I'd only ask, very politely, that the next time you build a staircase, you think of the rest of us." },
        { id = "ct_dwarf", when = { race = "Dwarf" }, text = "You'll know what I mean about the stairs, I'd wager. A dwarf and a gnome in Stormwind are two people forever reaching for things, though at least you lot can see over the bar at the inn." },
      },
      choices = {
        { text = "Do you miss living underground?", next = "city_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_miss = {
      lines = { { id = "cm_default", text = "I miss the noise. Gnomeregan was never quiet: pistons, whistles, someone always blowing something up on purpose. Stormwind at night is so quiet I can hear the canal, and some nights I wind every clock in the room just to sleep." } },
      choices = {
        { text = "That's a sad thought, but a lovely one.", next = "BACK", fx = { affinity = 1 } },
        { text = "You should visit Tinker Town in Ironforge.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    -- The company
    guild = {
      lines = {
        { id = "gd_default", text = "Four young ones and me. A warrior who argues with doors, a rogue who's always somewhere else, a priest who prays more than she heals, and a hunter with a bad-tempered cat called Biscuit. I keep two ledgers for them: one for coin, one for promises. Neither has ever balanced." },
      },
      choices = {
        { text = "Why call it Uber Town?", next = "guild_name" },
        { text = "Two ledgers?", next = "guild_ledger" },
        { text = "How do the four of them get along?", next = "guild_priest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guild_name = {
      lines = { { id = "gn_default", text = "'Uber' is an old Gnomeregan word for a thing that's better than its blueprint. We mean to buy a town one day, a whole one, with a wall and a tavern and a bell, and it'll be better than its blueprint too. We've saved eleven gold so far." } },
      choices = {
        { text = "Eleven gold won't buy much of a town.", next = "guild_town" },
        { text = "I like it. Every town starts as a dream.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    guild_town = {
      big = true,
      lines = { { id = "gt_default", text = "It'll buy the bell, which is a start. The young ones say we should take a town that's been abandoned, and there are plenty since the plague and the wars. I say a town ought to be bought fair or built new. Which way would you go?" } },
      choices = {
        { text = "Buy it fair or build it. Taking empty land invites trouble.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If no one's living there, it's yours for the taking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why not just join a town that already exists?", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    guild_ledger = {
      lines = { { id = "gl_default", text = "The coin ledger says we're eleven gold richer than last year. The promise ledger says we owe a farmer a sheep, a widow a roof and a dwarf in Thelsamar an apology. When the young ones fail, I tell them it's one more story for the songs, and when they win, I say the same." } },
      choices = {
        { text = "Sounds like someone worth following.", next = "BACK", fx = { affinity = 1 } },
        { text = "Two ledgers sounds like a lot of paperwork.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    guild_priest = {
      lines = { { id = "gp_default", text = "Mostly well. The trouble is the priest and the hunter. She won't heal him, because she says hunters stand at the back and ought to dodge. Then a boar comes round the side, and she's very sorry afterwards, every single time." } },
      choices = {
        { text = "That sounds like a grudge.", next = "guild_grudge" },
        { text = "She has a point. He should learn to dodge.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    guild_grudge = {
      big = true,
      lines = { { id = "gg_default", text = "It is. He once told the whole tavern her prayers sounded like a cat in a well. He won't apologise, because it would mean she's a better healer than he says. And she won't heal him until he does. Who should give way first?" } },
      choices = {
        { text = "He should apologise. Pride isn't worth a boar in the back.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "She should heal him whatever he said. That's her duty.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A cat in a well? That's actually quite funny.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    -- The dream
    dream = {
      lines = {
        { id = "dr_default", text = "I'm too old to be in the songs myself, but I'd like to be in the last verse: the old gnome who kept the books and believed in them. One day a child will hear about Uber Town and ask, 'Who was Spoogledorf?', and someone will spell it right." },
      },
      choices = {
        { text = "Most heroes in songs died to get there.", next = "dream_cost" },
        { text = "I hope you get your verse.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream_cost = {
      big = true,
      lines = { { id = "dc_default", text = "I know it, and it keeps me up at night when they're late coming back. I tell them to come home alive first and famous second, and they nod and don't listen. What about you? Is it glory you're after, or getting home?" } },
      choices = {
        { text = "Glory fades. I fight so others get home alive.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I want my name remembered, same as you.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I haven't decided yet.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Joining (repeat visitors)
    join = {
      lines = {
        { id = "jn_default", text = "You want to? Really? I'd have to put it to the others, and the priest would have to promise to heal you, which might take some doing. But I'm the treasurer, and the treasurer votes yes. Are you sure, though? We're not much." },
        { id = "jn_horde", when = { faction = "Horde" }, text = "Oh, dear. I would love to, really, but the warrior would have a fit, and the guards would have two. Perhaps an honorary place in the promise ledger instead? It's the nicer of the two books." },
      },
      choices = {
        { text = "I'm sure. Put my name in the ledger.", next = "join_yes", fx = { affinity = 2 } },
        { text = "Not yet. Ask me again when you've bought that town.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    join_yes = {
      lines = { { id = "jy_default", text = "Then in it goes, and I'll spell your name right, which is more than anyone's ever done for me. Welcome to Uber Town, more or less. Mind the hunter's cat, she bites new people." } },
      choices = {
        { text = "Glad to be part of it.", next = "END" },
      },
    },
  },
}
