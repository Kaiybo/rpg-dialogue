-- A two-person trading camp on Stonetalon's southern edge, above the Barrens (Forever only):
-- Tuu'li, a Darkspear showman who calls himself a Magnificent Mystic, and his partner Xaphod
-- Bizznox, a Booty Bay goblin who sells picks and one white kitten. Voices: bibles/traders_forever.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

-- Tuu'li: Darkspear "Magnificent Mystic"; sells vials and ribboned wrapping paper.
P:NPC {
  key = "tuuli", id = TODO_NPC("Tuu'li"), name = "Tuu'li", title = "Magnificent Mystic",
  bible = "bibles/traders_forever.md", role = "vendor", tier = "service",
  temper = { "jolly", "sly" }, values = { "profit", "curious" },
  notices = { "class", "purse" },
  impression = {
    first = "Tuu'li calls himself a Magnificent Mystic and sells empty vials and wrapping paper from a camp on the edge of Stonetalon. He is a showman to his fingertips, and I suspect he knows exactly how much of it is show.",
    third = "{name} met Tuu'li, a Darkspear showman who calls himself a Magnificent Mystic, trading with a goblin partner at the edge of Stonetalon.",
  },
  greetings = {
    { id = "g_default", text = "Come close, come close! Tuu'li sees all, mon, and what he sees right now is a customer." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the spirits said you would return, mon. Well, Xaphod said so, but the spirits agreed." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The stars are out, mon, and the mystic is at his most magnificent. Step up!" },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "SHAMAN", "PRIEST" } },
      text = "Ah, a real one, mon. You'll keep Tuu'li's secrets, yes? A little mystery is good for business." },
    { id = "n_rich", cat = "purse", when = { money = { min = 200000 } },
      text = "I see gold in your future, mon, and in your purse, which is more to the point. Step closer!" },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Tuu'li, the Magnificent Mystic, at your service! I sell vials for your potions and pretty paper for your presents, and if you ask nicely, mon, I might tell you a little of what the spirits whisper." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear cousin! Don't look at me like that, mon, a troll has to eat, and the spirits don't mind a little showmanship, I asked them." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The mystic is listening." },
        { id = "h_again2", text = "Ask, ask! The spirits are patient, and so is my purse." },
      },
      choices = {
        { text = "Are you really a mystic?", next = "mystic" },
        { text = "Tell my fortune, then.", next = "fortune" },
        { text = "Why sell wrapping paper out here?", next = "paper" },
        { text = "How did you end up with a goblin partner?", next = "xaphod" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Farewell, mystic.", next = "END" },
      },
    },
    mystic = {
      lines = {
        { id = "m_default", text = "Magnificently, mon, it says so right on my title. I have a little of the old voodoo from the islands, and a great deal of talent for telling people what they already know, and between the two I do very well." },
      },
      choices = {
        { text = "So it's a trick.", next = "trick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trick = {
      big = true,
      lines = {
        { id = "tr_default", text = "A trick is something that fools people, mon. Tuu'li tells people hopeful things, and they walk away happier, so who is fooled? Tell me true, do you think that's so wrong?" },
      },
      choices = {
        { text = "Comfort is worth paying for. No harm done.", next = "BACK", reply = "Dat be what Tuu'li always say, mon, and you be the first to agree out loud. Take a vial, and walk away a little happier.", fx = { align = { honor = -1 } } },
        { text = "A lie is a lie, however kindly it's told.", next = "BACK", reply = "A lie, maybe, but a kind one, and the world got plenty of the other kind already. Tuu'li will think on it, mon, between customers.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fortune = {
      lines = {
        { id = "f_default", text = "Hmm, let me see. I see a long road, mon, and danger on it, and a great many things that need killing, and at the end of it, treasure, or maybe a very large bill from a goblin. The spirits are vague on that last part." },
        { id = "f_low", when = { maxLevel = 25 }, text = "Let me see, mon. I see you growing strong, and a great many centaur and harpies regretting it. Also, you will need vials, which I happen to sell." },
      },
      choices = {
        { text = "That's every adventurer's fortune.", next = "every" },
        { text = "Something else.", next = "BACK" },
      },
    },
    every = {
      lines = {
        { id = "ev_default", text = "And every adventurer's fortune comes true, mon, which makes Tuu'li the most accurate mystic in Kalimdor. You see how it works?" },
      },
      choices = {
        { text = "I see.", next = "BACK" },
      },
    },
    paper = {
      lines = {
        { id = "p_default", text = "Because everybody who comes up this road is going somewhere far away, mon, and they all have somebody waiting at the other end. A gift wrapped nice means you thought of them, even if you bought it from a troll at the side of the road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xaphod = {
      lines = {
        { id = "x_default", text = "Ah, Xaphod! We met in Booty Bay, mon, both of us broke and both of us clever, and we decided two clever broke people could become one rich partnership. We are still working on the rich part." },
      },
      choices = {
        { text = "Do you trust him?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = {
        { id = "t_default", text = "With my life, mon, never with my money. He would say the same about me, and we are both right, which is why the partnership works." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Darkspear from the islands, a little voodoo, a lot of talking. That's all the story Tuu'li needs, mon." } },
    advice = { { id = "tp_ad", text = "Always carry a spare vial, mon. You never know when you'll need to put something in it." } },
    _none = { { id = "tp_none", text = "The spirits say nothing about that, mon. Ask Xaphod; he knows the price of everything." } },
  },
}

-- Xaphod Bizznox: Booty Bay goblin trader; mining supplies and a white kitten.
P:NPC {
  key = "xaphod", id = TODO_NPC("Xaphod Bizznox"), name = "Xaphod Bizznox",
  bible = "bibles/traders_forever.md", role = "vendor", tier = "service",
  temper = { "pushy" }, values = { "profit", "practical" },
  notices = { "craft", "purse" },
  impression = {
    first = "Xaphod Bizznox is a Booty Bay goblin selling picks, hammers and exactly one white kitten from a camp at the bottom of Stonetalon. He haggles with himself when nobody else will.",
    third = "{name} met Xaphod Bizznox, a Booty Bay goblin trading picks and a white kitten at the edge of Stonetalon.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, pal, step right up! Picks, hammers, packs, and one very cute kitten, and every one of 'em is a bargain." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer! Well, top ten. Come back to buy the kitten?" },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Alliance coin spends just like Horde coin, pal, so come right on in, nobody here's checking colors." },
  },
  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Sparks and sprockets, pal, you're my kinda customer. How's your pick holding up? Never mind, buy a new one." },
    { id = "n_rich", cat = "purse", when = { money = { min = 300000 } },
      text = "Whoa, whoa, you're jinglin' when you walk, pal! Have you ever thought about owning a kitten? Because that's an investment." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Xaphod Bizznox, Booty Bay born and bred, at your service! Me and Tuu'li set up shop right here because everybody heading in or out of Stonetalon passes this spot, pal, and every one of 'em needs somethin'." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde, huh? Great, love the Horde, love their coin. Tuu'li's one of yours, so you're practically family, and family pays full price." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, and I'm charging." },
        { id = "h_again2", text = "Go on, go on, I'm all ears. Big ears, for listening to customers." },
      },
      choices = {
        { text = "Why sell mining picks out here?", next = "picks" },
        { text = "Tell me about this kitten.", next = "kitten" },
        { text = "What's a Booty Bay goblin doing in Stonetalon?", next = "bootybay" },
        { text = "Are you with the Venture Company?", next = "venture" },
        { text = "Let's see what you've got.", next = "BUSINESS" },
        { text = "Not today, Xaphod.", next = "END" },
      },
    },
    picks = {
      lines = {
        { id = "p_default", text = "Because these mountains are full of ore, pal, and every miner who comes up here finds out their pick was garbage about halfway up. And who's waiting on the way down, with a brand new pick and a very reasonable markup? This guy." },
      },
      choices = {
        { text = "That's opportunistic.", next = "opportunistic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    opportunistic = {
      big = true,
      lines = {
        { id = "op_default", text = "Opportunistic! Thanks, pal, I'll put it on the sign. Being in the right place with the right thing is the whole secret of trade, so tell me, is a fella wrong to charge for being smart?" },
      },
      choices = {
        { text = "Charge what the market bears. That's fair trade.", next = "BACK", reply = "Now there's a customer who understands economics, pal. I'm puttin' you on my mailing list, and my kitten likes you too.", fx = { align = { honor = -1 } } },
        { text = "Charge a fair price, even when you could charge more.", next = "BACK", reply = "Ooh, a moralist in Stonetalon, now I've seen everything, pal. I'll think about it, honest, right after I've counted today's take.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitten = {
      lines = {
        { id = "k_default", text = "One white kitten, pal, just the one, so it's a limited offer. Found her in a crate of copper ore off a boat out of Booty Bay, and believe me, I asked around, but nobody wanted to pay to claim her, so now she's inventory." },
      },
      choices = {
        { text = "You're selling a stowaway kitten?", next = "stowaway" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stowaway = {
      lines = {
        { id = "st_default", text = "I'm finding her a loving home, pal, at a price that reflects the loving. Tuu'li says she has a mystic aura, which bumps her up a bit, and she's fed and brushed and everything, so you're getting quality." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bootybay = {
      lines = {
        { id = "b_default", text = "Making money, pal, same as anywhere. Booty Bay's crowded with goblins all selling the same stuff, so I figured I'd go where the competition isn't, and up here, the competition is a harpy." },
      },
      choices = {
        { text = "Do the harpies bother you?", next = "harpies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies = {
      lines = {
        { id = "h_harpies", text = "Only when they're buying, which is never, so yeah, they bother me. Tuu'li waves his hands and mutters, and they mostly fly away, and I don't ask whether it's real magic or they just think he's crazy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    venture = {
      lines = {
        { id = "v_default", text = "Whoa, whoa, pal, keep your voice down! I'm Steamwheedle, honest trade, Booty Bay. The Venture Company's the bunch chopping down half of Stonetalon, and those guys give the rest of us goblins a bad name.",
          fx = { learn = { "venture_company", "steamwheedle" } } },
      },
      choices = {
        { text = "What's the difference, really?", next = "difference" },
        { text = "Something else.", next = "BACK" },
      },
    },
    difference = {
      lines = {
        { id = "d_default", text = "The difference, pal, is that I sell you a pick, and they'd sell you the mountain, then cut down the trees, then charge you for the stumps. Me, I'm small, honest money, and small honest money doesn't get anybody chased out of the mountains by angry elves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Booty Bay goblin, Steamwheedle man, small business owner. Good investment, too, pal, if you're lookin'." } },
    advice = { { id = "tp_ad", text = "Never buy the first thing you see, pal. Unless it's from me, then buy it fast." } },
    venture_company = { { id = "tp_venture", text = "Bad for business, pal, bad for the trees, and bad for every honest goblin who has to answer for 'em." } },
    _none = { { id = "tp_none", text = "Don't know, pal, and if I don't know it, there's no money in it. Ask Tuu'li, he'll make somethin' up." } },
  },
}
