-- Darnassus, folk the roster scan found missing (1 of 3): the Tradesmen's Terrace. The four
-- auctioneers and the terrace's merchants of arms, armor, robes and bags. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Auctioneer Silva'las: the youngest of the four, curious about outlanders.
P:NPC {
  key = "dar_silvalas", id = TODO_NPC("Auctioneer Silva'las"), name = "Auctioneer Silva'las", gender = "male",
  bible = "bibles/missed.md", role = "auctioneer", tier = "service",
  communities = { "darnassus" }, temper = { "curious", "polite" }, values = { "learning", "fairness" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Silva'las studies each customer as closely as the goods they bring. He asks more questions than an auctioneer needs to, and listens to all of the answers.",
    third = "{name} met Auctioneer Silva'las at the auction house in Darnassus.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Your pack is welcome here, and so are you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Bid or sell. That is all." },
    { id = "g_default", text = "Ishnu-alah. You have the dust of a long road on you, and I would guess a pack worth emptying." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. Tell me where you have been since, if you have a moment for it." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human of Stormwind, unless I mistake the accent. I have a dozen questions about your city, and I will try to ask only one of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Silva'las, the newest of the four who keep this house. Every lot that crosses my counter has come from somewhere I have never stood, and I confess that is half of why I took the post." } },
      again = { { id = "h_again_x", text = "Ask on, friend. I have not yet run out of questions for you." },
        { id = "h_again", text = "What else would you tell me, or ask?" },
        { id = "h_again2", text = "Please, go on." },
      },
      choices = {
        { text = "A fair auction serves everyone.", next = "BACK", reply = "It does. Every bid is honest here.", fx = { align = { honor = 1 } } },
        { text = "An auction is just a game for the rich.", next = "BACK", reply = "Then do not play.", fx = { align = { honor = -1 } } },
        { text = "Show me what's on offer.", next = "BUSINESS" },
        { text = "You've never left Teldrassil?", next = "left" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "How does a lot reach your counter?", next = "x_lot" },
        { text = "Some say outlanders' goods have no place here.", next = "x_st" },
        { text = "I've sold things here from Ironforge.", next = "x_dw", when = { race = "Dwarf" } },
        { text = "Gnomeregan sends very little these days.", next = "x_gn", when = { race = "Gnome" } },
        { text = "Until next time.", next = "END" },
      },
    },
    left = {
      lines = { { id = "le_default", text = "I have been to Auberdine, which hardly counts, since one can see the great tree from its docks. So I learn the world from what it sends me, such as Stranglethorn pearls, dwarven powder and cloth that smells of other people's hearths." } },
      choices = {
        { text = "The world is rougher than its goods.", next = "rough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rough = {
      lines = { { id = "r_default", text = "So Golothas tells me, and he has seen far more of it than I have. I think I would still like to judge for myself one day, when the house can spare me." } },
      choices = { { text = "Then I hope it can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strange = {
      lines = {
        { id = "st_gnome", when = { race = "Gnome" }, text = "Something made by your own people, I am afraid. It ticked, it had a small brass key, and the gnome who bought it would not tell me what it did, so I think of it often." },
        { id = "st_default", text = "A gnomish device that ticked, with a small brass key in its back. Nobody in Darnassus could say what it was for, and it sold within the hour to a gnome who seemed delighted." },
      },
      choices = { { text = "Best not to wind such things. Something else.", next = "BACK" } },
    },
    x_lot = {
      lines = {
        { id = "xl1", text = "A seller leaves the goods with one of us, names a starting bid and a price to end it, and pays a small deposit to the house. If nothing sells, the deposit stays with us and the goods go home." },
      },
      choices = {
        { text = "And who sets the house's share?", next = "x_lot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lot2 = {
      lines = {
        { id = "xl2", text = "The house keepers set it long before my time, and it is the same here as in Stormwind and Ironforge, which surprised me when I learned it. Golothas says the four of us did not invent fairness, we only agreed to it." },
      },
      choices = {
        { text = "Do the other houses ever disagree?", next = "x_lot3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lot3 = {
      lines = {
        { id = "xl3", text = "Not with us, though I hear the goblin houses in Booty Bay and Gadgetzan keep their own counsel. Tolon would rather not deal with them at all, and I would very much like to meet one." },
      },
      choices = {
        { text = "I'm sure you'll get your chance. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Some of the elders do say it, and quietly. They worry that every dwarven pot and human blade we buy makes Darnassus a little less our own. What do you think?" },
      },
      choices = {
        { text = "Trade binds allies. The house should stay open to all.", next = "BACK", reply = "So I believe, though I am glad to hear it from someone who has walked further.", fx = { align = { order = -1 } } },
        { text = "The elders guard something worth guarding. Heed them.", next = "BACK", reply = "Perhaps. I will try to remember that they have seen ten thousand years of strangers.", fx = { align = { order = 1 } } },
        { text = "I'd rather not say. Something else.", next = "BACK" },
      },
    },
    x_dw = {
      lines = {
        { id = "xd1", text = "Then you are one of the few dwarves who trust a lot to us rather than carry it back to the Great Forge. Tell me, is it true your city's auction house never closes?" },
      },
      choices = {
        { text = "It's true. Ironforge doesn't sleep.", next = "BACK", reply = "Remarkable. We keep the night hours, and it seems you keep all of them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gn = {
      lines = {
        { id = "xg1", text = "I have noticed it, and I am sorry for the cause. What comes from your people now is mostly made in Ironforge's Tinker Town, and the gnomes who sell it look tired." },
      },
      choices = {
        { text = "We are tired. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    teldrassil = { { id = "tp_tel", text = "I have hardly left the great tree, so I am the wrong one to ask what it lacks. To me it holds the whole world, one lot at a time." } },
    background = { { id = "tp_bg", text = "I am the newest auctioneer of the four. Golothas says I ask too much, and Tolon says I do not ask about prices enough." } },
    _none = { { id = "tp_none", text = "I do not know, though now I would like to. Tell me if you find out." } },
  },
}

-- Cyridan: leather armor merchant.
P:NPC {
  key = "dar_cyridan", id = TODO_NPC("Cyridan"), name = "Cyridan", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "observant" }, values = { "stealth", "craft" },
  notices = { "class" },
  impression = {
    first = "Cyridan sells leather armor and moves about his shop without making a sound. He listens to how a customer walks before he recommends anything.",
    third = "{name} met Cyridan, who sells leather armor on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Your step is lighter now. Let me mend what remains." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "I heard you before I saw you. We might mend that. Or not." },
    { id = "g_default", text = "Ishnu-alah. I heard you on the walkway well before I saw you, and we may be able to mend that." },
    { id = "g_back", when = { metBefore = true }, text = "You tread more softly than you did last time. Is that my leather, or have you been practising?" },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You, I did not hear at all, which is the best thing I can say to anyone. Come and see what I keep for people who walk as you do." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid wants leather that does not complain when the wearer changes shape. I have some that has learned to bear it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Cyridan, and leather is my trade. Melea sells mail down the terrace for those who wish to be heard coming, and Vinasia sells cloth for those who do not expect to be struck, and I serve everybody in between." } },
      again = { { id = "h_again_x", text = "Speak softly, and ask what you like." },
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Yes? Speak, and I will hear it." },
      },
      choices = {
        { text = "Leather should let you move silently.", next = "BACK", reply = "It should. You understand.", fx = { align = { order = 1 } } },
        { text = "Silence doesn't matter. Strength does.", next = "BACK", reply = "Then you will be heard, and found.", fx = { align = { order = -1 } } },
        { text = "Let me see your leathers.", next = "BUSINESS" },
        { text = "Why does quiet matter so much to you?", next = "quiet" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Who teaches you to move so quietly?", next = "x_tq" },
        { text = "Rogues should never be trusted with silence.", next = "x_st" },
        { text = "I'd like boots that don't creak.", next = "x_lw", when = { profession = "Leatherworking" } },
        { text = "Druids wear leather too.", next = "x_dr", when = { class = "DRUID" } },
        { text = "Go quietly, Cyridan.", next = "END" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "Because in the forest the loud thing is the thing that is eaten, or the thing that goes hungry. Our hunters and scouts have known that since before your grandsires' grandsires, and good leather is cut with it in mind." } },
      choices = {
        { text = "How do you cut leather for silence?", next = "cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "You keep the seams away from where the limbs bend, you oil the hide until it stops creaking, and you leave off every buckle that the wearer can live without. The humans love a buckle, and I have stopped arguing with them about it." } },
      choices = { { text = "No buckles, then. Something else.", next = "BACK" } },
    },
    hides = {
      lines = {
        { id = "hi_hunter", when = { class = "HUNTER" }, text = "From hunters like yourself, for the most part, and from the leatherworkers on the Craftsmen's Terrace who cure them. If you take only what you need and skin it cleanly, they will always be glad of your hides there." },
        { id = "hi_default", text = "From the hunters of Teldrassil and Darkshore, by way of the leatherworkers on the Craftsmen's Terrace. Nothing is taken that the forest cannot spare, and nothing of the animal is wasted." },
      },
      choices = { { text = "As it should be. Something else.", next = "BACK" } },
    },
    x_tq = {
      lines = {
        { id = "xt1", text = "Nobody taught me, exactly. I hunted in Ashenvale as a youth, and the forest corrects a clumsy hunter by sending the deer away. After a century of that, one learns where to put one's feet." },
      },
      choices = {
        { text = "Why give up the hunt for a shop?", next = "x_tq2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tq2 = {
      lines = {
        { id = "xt2", text = "I did not give it up so much as hand it on. Every Sentinel scout who buys from me carries something of how I hunted, and I think that does more good than one more bow in the trees." },
      },
      choices = {
        { text = "Do the scouts tell you how it served?", next = "x_tq3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tq3 = {
      lines = {
        { id = "xt3", text = "They do, when they come back. One told me the orcs at Astranaar passed within a spear's length of her and never turned their heads, and I have kept that story longer than any coin." },
      },
      choices = {
        { text = "A fine thing to keep. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "You are not the first to say so, though most say it about humans and not about my customers. I sell quiet to anyone who pays, and I do not ask what they mean to do with it." },
      },
      choices = {
        { text = "Silence is a tool. Its use is the wearer's affair.", next = "BACK", reply = "Just so. A blade does not choose its throat, and leather chooses even less.", fx = { align = { light = -1 } } },
        { text = "You should ask. Some buyers mean harm.", next = "BACK", reply = "Perhaps I should, and perhaps I would only be lied to more gently.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lw = {
      lines = {
        { id = "xl1", text = "Then you have worked leather yourself and know the trouble. Oil the seams with a little moonberry wax, and never let a cobbler stitch through the welt twice, because a double stitch is a creak waiting to happen." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "They do, and I am glad of it. A druid who goes into bear's shape needs leather that stretches and forgives, so I cut theirs a little loose, and they always thank me for it later." },
      },
      choices = {
        { text = "I'll remember that when I change. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sentinels = { { id = "tp_sen", text = "The Sentinel scouts are my best customers and my harshest. If my leather creaks, they tell me in front of everyone." } },
    background = { { id = "tp_bg", text = "I scouted for many years before I sold armor. I learned what a creaking strap can cost." } },
    _none = { { id = "tp_none", text = "I have not heard anything of that, and I hear most things." } },
  },
}
