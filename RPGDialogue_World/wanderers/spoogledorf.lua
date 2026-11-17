-- Spoogledorf: a hunter of the adventuring company <Uber Town>. Forever NPC 276591; his post, race and trade weren't readable when this was written,
-- so nothing here names a zone, his race or a vendor/quest role. Invented life listed in bibles/spoogledorf.md.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:NPC {
  key = "spoogledorf", id = 276591, name = "Spoogledorf",
  role = "citizen", tier = "quest",
  temper = { "cheerful", "proud" }, values = { "loyal", "free" },
  notices = { "class", "faction", "pvp" },

  impression = {
    first = "Spoogledorf is a hunter of an adventuring company that calls itself Uber Town. He introduced himself twice, the second time slower, in case you'd missed how the name was spelled.",
    third = "{name} met Spoogledorf, a hunter of the company called Uber Town, who is sure the bards will sing about them one day and is a little worried they'll get his name wrong.",
  },

  greetings = {
    { id = "g_default", text = "Spoogledorf, of Uber Town. Yes, that's my real name, and yes, you can laugh. Everyone does the first time, and then they need a good shot and stop laughing." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, it's you again! You remembered the name, didn't you? Go on, say it properly, I'll wait." },
    { id = "g_often", when = { timesTalked = { min = 5 } }, text = "If you keep coming back like this, the others will start asking whether you've joined Uber Town without telling them. I'd vouch for you, mind." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Another bow! Spoogledorf, of Uber Town, and that's a fine animal you've got there. Mine's around somewhere, probably eating something it shouldn't." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, place = "before",
      text = "Spoogledorf looks your pet over the way a farmer looks at a neighbour's prize hog: with admiration and a hint of envy." },
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "He notices your rank insignia and straightens his back, as if he were standing for a portrait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I hunt for Uber Town, which is a company of the finest adventurers you've never heard of. We're small, we're always short of coin, and one day there'll be songs about us. I'm practising my pose for the statue." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Good to talk to someone who understands that the beast does half the work and gets none of the credit. Uber Town forgets that, but you won't, will you?" },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage! You wouldn't happen to conjure water by the barrel, would you? Our last mage left us for a company with a bigger tent, and we've been drinking from puddles since." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, thank the Light, or the Earth Mother, or whoever you pray to. Uber Town hasn't had a healer who kept me alive in a month, and I've the scars to prove it." },
        { id = "h_back", when = { metBefore = true, levelsSince = 6 },
          text = "Look at you! You've grown since last time, I can see it in how you stand. Uber Town could use someone who's been out there doing things." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing better to do until the others get back from wherever they've wandered." },
        { id = "h_again2", text = "Ask away. I like talking, and the pet's heard all my stories already." },
        { id = "h_again3", text = "Go on, then. Spoogledorf has all day, mostly." },
      },
      choices = {
        { text = "Where does a name like Spoogledorf come from?", next = "name" },
        { text = "Tell me about Uber Town.", next = "guild" },
        { text = "Where's this pet of yours?", next = "pet" },
        { text = "What does Uber Town actually do?", next = "work" },
        { text = "What do you want out of all this?", next = "dream" },
        { text = "Any advice for a fellow hunter?", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Can I join Uber Town?", next = "join", when = { metBefore = true } },
        { text = "Good hunting, Spoogledorf.", next = "END" },
      },
    },

    -- The name
    name = {
      lines = {
        { id = "nm_default", text = "My grandfather was Spoogledorf, and his grandfather before him, and every one of them had to hear the joke at every inn from here to the sea. It's a good, old name, and I'll not trade it for something short and dull like Bob." },
      },
      choices = {
        { text = "Does anyone ever get it wrong?", next = "name_wrong" },
        { text = "Have you ever thought of changing it?", next = "name_change" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    name_wrong = {
      lines = { { id = "nw_default", text = "Every day. I've been Spooglewort, Spudgedorf and once, on a wanted poster in a town I won't name, Spoogle the Dwarf. I'm not even sure the last one was meant for me, but I kept the poster." } },
      choices = {
        { text = "A wanted poster? What did you do?", next = "name_poster" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    name_poster = {
      lines = { { id = "np_default", text = "Nothing at all, I swear it on my quiver. Someone stole a pie, and the baker remembered a name that sounded funny, and I happened to have the funniest name in town that week. I paid for the pie anyway, just to be left alone." } },
      choices = {
        { text = "You paid for a pie you didn't steal? That's decent of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Sounds like you stole the pie.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    name_change = {
      big = true,
      lines = { { id = "nc_default", text = "A sergeant told me once that no one would follow a man called Spoogledorf into battle, and that I ought to call myself something like Grimfang. I thought about it for a whole night. What would you have done?" } },
      choices = {
        { text = "Keep it. Your family carried that name with pride.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Change it. A name is only a tool; use the sharp one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Grimfang is a terrible name.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    -- The company
    guild = {
      lines = {
        { id = "gd_default", text = "There are six of us when everyone turns up, which is never. We've a warrior who argues with doors, a rogue who's always somewhere else, a priest who prays more than she heals, and our leader, who keeps the ledger and the dream alive. And me, of course, the handsome one." },
      },
      choices = {
        { text = "Why call it Uber Town?", next = "guild_name" },
        { text = "Who leads you?", next = "guild_lead" },
        { text = "The priest doesn't heal you?", next = "guild_priest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guild_name = {
      lines = { { id = "gn_default", text = "We meant to buy a town one day, a whole one, with a wall and a tavern and a bell. 'Uber' is a word a gnome tinker taught us that means the very best, so it was going to be the very best town. We've saved up eleven gold so far." },
      },
      choices = {
        { text = "Eleven gold won't buy much of a town.", next = "guild_town" },
        { text = "I like it. Every town starts as a dream.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    guild_town = {
      big = true,
      lines = { { id = "gt_default", text = "It'll buy a bell, which is a start. Our leader says we should take a town that's been abandoned, and there are plenty of those since the plague and the wars. I say a town ought to be bought fair or built new. Which way would you go?" } },
      choices = {
        { text = "Buy it fair or build it. Taking empty land invites trouble.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If no one's living there, it's yours for the taking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why not just join a town that already exists?", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    guild_lead = {
      lines = { { id = "gl_default", text = "Our leader keeps every coin in a ledger and every promise in a second ledger, and I've never seen either of them closed. When we fail, the leader says that's one more story for the songs. When we win, it's the same thing, which is either wisdom or madness." } },
      choices = {
        { text = "Sounds like someone worth following.", next = "BACK", fx = { affinity = 1 } },
        { text = "Two ledgers sounds like a lot of paperwork.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    guild_priest = {
      lines = { { id = "gp_default", text = "Oh, she heals, just not me. She says hunters stand at the back and ought to know how to dodge, and that the warrior needs it more. Then a boar comes round the side and she's very sorry afterwards, every single time." } },
      choices = {
        { text = "That sounds like a grudge.", next = "guild_grudge" },
        { text = "She has a point. Learn to dodge.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    guild_grudge = {
      big = true,
      lines = { { id = "gg_default", text = "Well, I did once say a prayer of hers sounded like a cat in a well. In front of the whole tavern. I keep meaning to apologise, but she might take it as me admitting she's a worse healer than she is. Should I?" } },
      choices = {
        { text = "Apologise. Pride isn't worth a boar in the back.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Don't. She should heal you whatever you said.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A cat in a well? That's actually quite funny.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    -- The pet
    pet = {
      lines = {
        { id = "pt_default", text = "Biscuit? Off somewhere, eating something she oughtn't. I tamed her when she was half-starved and bad-tempered, and now she's well-fed and bad-tempered, so I call that progress. She's bitten every member of Uber Town except me." },
        { id = "pt_hunter", when = { class = "HUNTER" }, text = "Biscuit's off sulking, because I fed yours a scrap earlier and she saw. You'll know how it is: they'll let a bear maul you and never say a word, but give another beast a crust and you've betrayed them forever." },
      },
      choices = {
        { text = "Biscuit? For a wild beast?", next = "pet_name" },
        { text = "How did you tame her?", next = "pet_tame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet_name = {
      lines = { { id = "pn_default", text = "She was the colour of a burnt biscuit when I found her, and she answered to it, which is more than she does to anything else. Our warrior wanted to call her Deathclaw. She bit him, so I think she agreed with me." } },
      choices = {
        { text = "A good name for a beast with sense.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    pet_tame = {
      big = true,
      lines = { { id = "ptm_default", text = "She'd been caught in a trapper's snare and she'd chewed half her leg to get out. I could've finished her quick, which was the kind thing by some people's thinking. I sat with her for two days instead, and on the third she ate from my hand. Was that right, do you think?" } },
      choices = {
        { text = "Yes. Every life deserves the chance to fight on.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A quick end would've been the kinder thing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "And the trapper? Did you find him?", next = "pet_trapper" },
      },
    },
    pet_trapper = {
      lines = { { id = "ptt_default", text = "I found his snares, and I broke every one of them, and I left his traps hanging in a tree with a note. I can't say what the note said in polite company. He's never come looking for Spoogledorf, which is a shame, because I'd have spelled it for him." } },
      choices = {
        { text = "Good. Those snares were cruel.", next = "BACK", fx = { affinity = 1 } },
        { text = "A trapper has to make a living too.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    -- The work
    work = {
      lines = {
        { id = "wk_default", text = "Whatever pays. We clear out kobolds, escort caravans, find lost sheep and once a lost grandmother, who wasn't lost so much as hiding from her family. Last month we went into a dungeon and came out with a rusty helmet and a chest full of bandages." },
        { id = "wk_horde", when = { faction = "Horde" }, text = "Whatever pays and whatever the Horde needs doing. We've hunted centaur, chased quilboar out of grain stores and carried messages to places the wind riders wouldn't go. Glamorous, it isn't, but we eat." },
        { id = "wk_alli", when = { faction = "Alliance" }, text = "Whatever pays and whatever the Alliance has no soldiers to spare for. Gnolls, kobolds, Defias, lost sheep. We once spent a whole week guarding a cart of turnips that turned out to be smuggled whisky, and the farmer tipped us very well." },
      },
      choices = {
        { text = "Tell me about the dungeon.", next = "work_dungeon" },
        { text = "What's the best job you've ever had?", next = "work_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_dungeon = {
      lines = { { id = "wd_default", text = "Our warrior opened the wrong door, which he does, and four things with too many teeth came out of it. We ran, came back, ran again, and on the third try we won. The rogue took the chest, and we didn't see him for a week. He says he was buying bandages, and we did get bandages." } },
      choices = {
        { text = "That rogue's robbing you.", next = "work_rogue" },
        { text = "Sounds like the company's first real victory.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    work_rogue = {
      big = true,
      lines = { { id = "wr_default", text = "The leader thinks so too, and wants to search his bags. I think if you go through a friend's bags, you've already lost him, whether you find gold or not. What do you say?" } },
      choices = {
        { text = "Search them. Trust that isn't checked is just hope.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave his bags be. Trust is what holds you together.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Ask him outright, to his face.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    work_best = {
      lines = { { id = "wb_default", text = "A farmer's girl lost her dog in the hills, and we found it inside a wolf den, alive and fat and ruling the place. She cried and hugged me, and paid us in apples. Best job we ever had, and the leader wrote it in both ledgers." } },
      choices = {
        { text = "That's the sort of thing that matters.", next = "BACK", fx = { affinity = 1 } },
        { text = "Apples won't buy your town.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    -- The dream
    dream = {
      lines = {
        { id = "dr_default", text = "I want to be there when something great happens, you know? Not reading about it after, but standing in the room with my bow drawn when it all comes down. Then one day some child will hear the song and ask, 'Who was Spoogledorf?', and they'll be told." },
      },
      choices = {
        { text = "Most heroes in songs died to get there.", next = "dream_cost" },
        { text = "I hope you get there.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream_cost = {
      big = true,
      lines = { { id = "dc_default", text = "I know it. I'd still rather be in the song than safe at home, wondering. Some days I think that's brave and some days I think it's daft. What about you? Is it glory you're after, or getting home alive?" } },
      choices = {
        { text = "Glory fades. I fight so others get home alive.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I want my name remembered, same as you.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I haven't decided yet.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- Hunter talk
    x_hunter = {
      lines = { { id = "xh_default", text = "Three things. Carry twice the arrows you think you'll need, because you will need them. Never stand where your pet can't reach you. And when the warrior opens a door he shouldn't, be the first one running, because you're the one who can shoot backwards." } },
      choices = {
        { text = "Shoot backwards while running? That's a fine trick.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll remember the arrows.", next = "BACK" },
      },
    },

    -- Joining (repeat visitors)
    join = {
      lines = {
        { id = "jn_default", text = "You want to? Really? I'd have to ask the leader, and the leader would have to write it down, and the priest would have to promise to heal you, which might take some doing. But the answer's probably yes. Are you sure, though? We're not much." },
      },
      choices = {
        { text = "I'm sure. Put my name in the ledger.", next = "join_yes", fx = { affinity = 2 } },
        { text = "Not yet. Ask me again when you've bought that town.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    join_yes = {
      lines = { { id = "jy_default", text = "Then I'll tell them myself, and I'll spell your name right in the ledger, which is more than anyone's ever done for me. Welcome to Uber Town, more or less. Mind Biscuit, she bites new people." } },
      choices = {
        { text = "Glad to be part of it.", next = "END" },
      },
    },
  },
}
