-- Stormwind, the Canals and the harbor: the winery, Ol' Emma and her buckets, the tailor by the
-- bridge, the fishing trainer, a beggar, a boy with fish stories and the harbor's clerk.
-- Voice: bibles/canals.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "suzetta", id = TODO_NPC("Suzetta Gallina"), name = "Suzetta Gallina",
  bible = "bibles/canals.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "practical", "loyal" },
  notices = { "light", "kin", "drink" },
  impression = {
    first = "Suzetta Gallina runs the Gallina Winery and keeps a tally of every free bottle her brother promises the city. She pours them anyway, with a sigh that is mostly for show.",
    third = "{name} met Suzetta Gallina, who runs her family's winery on the Stormwind canals.",
  },

  greetings = {
    { id = "g_winery", text = "Welcome to the Gallina Winery. Mind the barrels by the door; Roberto counts them." },
    { id = "g_ticket", when = { questActive = TODO_QUEST("Wine Shop Advert") }, text = "Let me guess: my brother gave you a ticket. Of course he did." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. The Cathedral orders its wine elsewhere, which I've never understood, so do tell them where you found a better red." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A Stormwind face. You've walked past our door a hundred times, I expect, and never once come in, until Renato shouted at you." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a few already, haven't you? I'll pour you something gentle and you'll thank me in the morning." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Suzetta Gallina. My brother sells the wine in the square, Julia sells it at the counter and Roberto keeps the cellar, so somebody has to keep the books, and that's me." },
        { id = "h_ticket", tags = { "news" }, when = { questActive = TODO_QUEST("Wine Shop Advert") },
          text = "Renato's ticket, and that's the fourth today. Here's your bottle of the house red, and if you like it, come back and pay for one, because that's the part he always forgets." },
        { id = "h_ticket_done", when = { questDone = TODO_QUEST("Wine Shop Advert") },
          text = "You came back! Renato will be insufferable about it, so I won't tell him, and you won't either." },
        { id = "h_merlot", when = { questActive = TODO_QUEST("Dry Times") },
          text = "A cask of merlot for Lakeshire? Roberto has one ready; Barkeep Daniels writes to us whenever the roads are open, and lately they rarely are." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've columns to add." },
        { id = "h_again2", text = "What else can I do for you?" },
      },
      choices = {
        { text = "Let me see the wines.", next = "BUSINESS" },
        { text = "How many tickets has Renato handed out?", next = "tickets" },
        { text = "Who's Roberto?", next = "roberto" },
        { text = "How does a winery do on the canals?", next = "canals" },
        { text = "A good red is a small blessing.", next = "priest", when = { class = "PRIEST" } },
        { text = "Good day.", next = "END" },
      },
    },

    tickets = {
      lines = { { id = "t_default", text = "This month, sixty-one. I keep a tally, because if I didn't, he'd hand out the whole cellar and call it marketing." } },
      choices = {
        { text = "Does it work, though?", next = "tickets_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tickets_work = {
      lines = { { id = "tw_default", text = "Annoyingly, it does. One in three comes back to buy, which is better than any sign I could hang. Don't tell him I said so, or he'll start giving away casks." } },
      choices = {
        { text = "Generosity pays. He's right.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Charge him for every bottle he gives away.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
      },
    },

    roberto = {
      lines = { { id = "r_default", text = "Roberto knows more about merlot than any man in the kingdom, and he'll tell you so at length. He sells it by the cask, and taverns as far off as Lakeshire send for it." } },
      choices = {
        { text = "Why Lakeshire?", next = "roberto_lakeshire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roberto_lakeshire = {
      lines = { { id = "rl_default", text = "Because Barkeep Daniels has taste and no merchants willing to brave the road. With the orcs about, his cellar runs dry and he has to beg travellers to carry a cask up for him.",
        fx = { learn = { "blackrock" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    canals = {
      lines = { { id = "c_default", text = "Well enough, though the damp gets into everything but the wine. The canal folk drink less than the Trade District and pay more promptly, which I find I prefer." } },
      choices = {
        { text = "Who are the canal folk?", next = "canals_folk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canals_folk = {
      lines = { { id = "cf_default", text = "Tailors, fishers, the old women who carry water and the beggars who sit on the bridges. Ol' Emma comes by every day with her buckets and tells me my barrels are in her way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      lines = { { id = "p_default", text = "Then bless a bottle for me, if you're allowed. Renato would sell it for twice the price, which is exactly why I won't tell him." } },
      choices = {
        { text = "Blessings aren't for selling.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Sell it. The Light won't mind the profit.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A woman who keeps the books hears where the money goes, and money goes everywhere. Ask what you like." } },
    background = { { id = "tp_bg", text = "I'm a Gallina, and I'm the one who counts. Every family business needs one of us, or it's only a family." } },
    advice = { { id = "tp_ad", text = "Never let the loudest one in the family keep the money. Ours shouts in the square, and I keep the purse." } },
    _none = { { id = "tp_none", text = "Not in my ledger, I'm afraid. Try Renato; he'll make something up." } },
  },
}

P:NPC {
  key = "ol_emma", id = TODO_NPC("Ol' Emma"), name = "Ol' Emma",
  bible = "bibles/canals.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "prickly" }, values = { "stubborn", "loyal" },
  notices = { "light", "kin", "refugee" },
  impression = {
    first = "Ol' Emma carries water across the canals all day and talks to herself because, she says, nobody else in the city makes decent conversation. There's grief under the grumbling, and she doesn't want it noticed.",
    third = "{name} met Ol' Emma, the grumbling water carrier of the canals, who came south from Lordaeron long ago.",
  },

  barks = {
    { id = "b_water", text = "Water, water, always the water, and never a thank-you for the one who carries it." },
    { id = "b_rut", text = "I'll wear a rut in these stones before I'm done, see if I don't." },
  },

  greetings = {
    { id = "g_water", text = "What? Can't you see I've buckets to carry? Speak up, then, and be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, you're better company than the well, I'll give you that." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest, is it? I've no sins worth your time, dearie, only bad knees, and I don't suppose the Light does knees." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City born, are you? You've the look of somebody who's never carried their own water, though I'll forgive you if you carry one bucket now." },
    { id = "n_refugee", cat = "refugee", when = { origin = "human_lordaeron_refugee" },
      text = "You talk like the north, you do. Don't tell me which village; I'd only ask after folk you won't have news of." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me Ol' Emma, as if I'd never been young, and I carry the water for this whole street. Of course I talk to myself, dearie; it's the only decent conversation in this city." },
        { id = "h_parcel", tags = { "news" }, when = { questActive = TODO_QUEST("Good Natured Emma") },
          text = "Felstone? Who's been saying that name to you? I'd chase you off my lawn, if this city had left me one, so you'd better tell me what you're holding." },
        { id = "h_charm", tags = { "news" }, when = { questActive = TODO_QUEST("Good Luck Charm") },
          text = "You'll take it to her? Then go gently, because Janice always did startle easy, and I don't suppose being dead has helped." },
        { id = "h_charm_done", tags = { "news" }, when = { questDone = TODO_QUEST("Good Luck Charm") },
          text = "You took it back to Janice. I've not said thank you to anybody in a long while, and I'm not sure I remember how, but there it is." },
        { id = "h_janice", when = { heardLine = "janice.h_default" },
          text = "You've a look about you like you've seen a ghost, and you'd not be the first who came to me looking like that. Out with it." },
        { id = "h_rain", when = { timeOfDay = "dusk" },
          text = "Last trip of the day, and my arms know it. Back home we had a pump in the yard, and I never once thought I'd miss a pump." },
      },
      again = {
        { id = "h_again", text = "Well? I've not got all day, and neither has this bucket." },
        { id = "h_again2", text = "Something else? Ask while I've a hand free." },
      },
      choices = {
        { text = "Let me carry a bucket for you.", next = "carry" },
        { text = "Who are you carrying all this water for?", next = "water" },
        { text = "Where's home, Emma?", next = "home" },
        { text = "Is your name Felstone?", next = "felstone",
          when = { any = { { questActive = TODO_QUEST("Good Natured Emma") }, { questDone = TODO_QUEST("Good Natured Emma") } } } },
        { text = "I come from the north too.", next = "north", when = { origin = "human_lordaeron_refugee" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    carry = {
      lines = { { id = "c_default", text = "Will you, now? Well, don't slop it, and don't expect a copper for it either, because I've none to give. There, you see, you're half wet already." } },
      choices = {
        { text = "Glad to help, Emma.", next = "carry_thanks", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_thanks = {
      lines = { { id = "ct_default", text = "Hmph. The young ones round here never offer, and here's you with places to be. I'll not say you're a good sort, mind, but I'll not say you aren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    water = {
      lines = { { id = "w_default", text = "For the shops and the houses and that fool in the blue robe with all his brooms. Get the water, Emma, fetch the water, Emma, and without me that lot would forget what water's for." } },
      choices = {
        { text = "Who's the fool in the blue robe?", next = "water_robe" },
        { text = "They ought to carry their own.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Every street needs someone to do the work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    water_robe = {
      lines = { { id = "wr_default", text = "Never you mind who, but one of these days I'll drown him in that robe, brooms and all. He thinks magic will sweep a floor, and then who mops up after? Me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    home = {
      big = true,
      lines = { { id = "h2_default", text = "North, a long way north, in Lordaeron, before the plague. A farm, with a pump in the yard, and I'll not say more than that, because there's nobody left there to say it to." } },
      choices = {
        { text = "Nobody at all?", next = "home_family" },
        { text = "I'm sorry, Emma.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_family = {
      lines = { { id = "hf_default", text = "My Jem went in the first war with the orcs, and I've had no word of my boys or my sister since the plague came. You do the sum yourself, dearie; I've done it more times than I can count." } },
      choices = {
        { text = "No word isn't the same as no hope.", next = "home_hope", fx = { align = { light = 1 } } },
        { text = "Some sums are better left alone.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_hope = {
      lines = { { id = "hh_default", text = "Priests say that, and the young say it, and I said it too, for a year or two. Then you stop, because carrying hope's heavier than carrying water, and you've only two arms." } },
      choices = {
        { text = "The Light can carry some of it.", next = "BACK", when = { class = "PRIEST" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    felstone = {
      lines = {
        { id = "f_default", text = "Emma Felstone, of Felstone Field. Nobody in this city's called me that in years, and you'd better have a good reason for starting." },
        { id = "f_done", when = { questDone = TODO_QUEST("Good Natured Emma") },
          text = "Janice sent me the deed to the farm, as if I'd go back there and plough the plague under. I'll not, and you can tell her so, though I'd rather you told her I miss her." },
      },
      choices = {
        { text = "Your sister sent this for you.", next = "felstone_janice", when = { questActive = TODO_QUEST("Good Natured Emma") } },
        { text = "Will you ever go back?", next = "felstone_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felstone_janice = {
      lines = { { id = "fj_default", text = "Janice made this, my Janice? Then she's... no, don't tell me what you saw out there; I don't want to know how you came by it. Just give it here, and let me look." } },
      choices = { { text = "Take your time, Emma.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    felstone_back = {
      lines = { { id = "fb_default", text = "To what? A field full of the dead and a house with nobody in it. No, my place is here with my buckets, and I'll grumble about it till they bury me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    north = {
      lines = { { id = "n_default", text = "Then you know, and I don't have to say any of it. Carry on, dearie, and don't let them tell you to forget, because they all do, sooner or later." } },
      choices = {
        { text = "I won't forget.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "Forgetting's how some of us survived.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I walk this street a hundred times a day, and folk talk in front of an old woman like she's a lamppost. Go on, ask." } },
    background = { { id = "tp_bg", text = "A farm wife from the north who carries water now, and that's all the story anybody needs.", next = "home" } },
    advice = { { id = "tp_ad", text = "Respect your elders, dearie, and carry their buckets now and again. You'll be old yourself, if you're lucky." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Burning half the north to save the other half, they tell me. I've seen enough burning; I don't need theirs." } },
    _none = { { id = "tp_none", text = "How should I know? I carry water, dearie, so ask somebody who sits down for a living." } },
  },
}

P:NPC {
  key = "rema", id = TODO_NPC("Rema Schneider"), name = "Rema Schneider",
  bible = "bibles/canals.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "warm" }, values = { "kind", "hardworking" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Rema Schneider sews for half the Trade District from her shop by the canal bridge, and she worries aloud about why everyone suddenly wants sturdy clothes. She suspects the nobles know something the rest of us don't.",
    third = "{name} met Rema Schneider, the tailor of the Canal Tailor and Fit Shop by the bridge to Cathedral Square.",
  },

  greetings = {
    { id = "g_shop", text = "Come in, dear, and mind the pins on the floor. Corbett, where's that bolt of linen?" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Those robes have seen some road, dear. Let me look at the hem before it lets you down at the altar." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City born, are you? I may have sewn your mother's wedding dress, then; I've sewn half of them on this side of the canal." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, look at the state of you, torn at every seam. Whatever you've been fighting, it's had the better of your clothes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rema Schneider, and this is the Canal Tailor and Fit Shop. We sew for half the Trade District, and lately it's knitted shirts and sturdy trousers, more than we can manage." },
        { id = "h_harlan", tags = { "news" }, when = { questActive = TODO_QUEST("Harlan Needs a Resupply") },
          text = "A note from Harlan, and another order. Business is booming, he says, and that's good, but I wonder why the whole city needs armor all at once. I've heard of no war." },
        { id = "h_thurman", tags = { "news" }, when = { questActive = TODO_QUEST("Package for Thurman") },
          text = "Larson Clothiers, in the Mage Quarter, the shop further in by the tower. Give Thurman his kit and tell him his mother says he can't fool her." },
        { id = "h_thurman_done", tags = { "news" }, when = { questDone = TODO_QUEST("Package for Thurman") },
          text = "Thurman got his kit, and I hear he grumbled. He thought if he forgot it he'd get a day off; he's clever enough to scheme and not clever enough to get away with it." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? Corbett, don't you dare sit down." },
        { id = "h_again2", text = "What else? I can talk with pins in my mouth, mostly." },
      },
      choices = {
        { text = "Let me see your clothes.", next = "BUSINESS" },
        { text = "Why does everyone need sturdy clothes?", next = "worry" },
        { text = "Your son works elsewhere?", next = "thurman" },
        { text = "Who's Corbett?", next = "corbett" },
        { text = "Could you look at my robes?", next = "priest", when = { class = { "PRIEST", "MAGE", "WARLOCK" } } },
        { text = "Good day.", next = "END" },
      },
    },

    worry = {
      big = true,
      lines = { { id = "w_default", text = "That's what I keep asking. Harlan can't sell armor fast enough, I can't sew fast enough, and nobody tells the likes of us why. Is there something the nobles aren't saying?" } },
      choices = {
        { text = "What have you heard?", next = "worry_heard" },
        { text = "The nobles keep plenty from the people.", next = "BACK", fx = { align = { order = -1 }, opinion = { stormwind_mood = "nobles_hide" } } },
        { text = "If it were serious, the crown would say so.", next = "BACK", fx = { align = { order = 1 }, opinion = { stormwind_mood = "trust_crown" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry_heard = {
      lines = { { id = "wh_default", text = "Orcs in Redridge, bandits in Westfall and the King gone these many months. I'm a tailor, dear, so I can't fix any of it, but I can make sure you're warm while you try.",
        fx = { learn = { "defias", "blackrock" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thurman = {
      lines = { { id = "t_default", text = "My Thurman, apprenticed to the Larsons in the Mage Quarter. He'd rather be anywhere but behind a needle, and he forgets his tools whenever he thinks he might get away with it." } },
      choices = {
        { text = "Will he make a tailor?", next = "thurman_tailor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thurman_tailor = {
      lines = { { id = "tt_default", text = "He has good hands and no patience, and patience can be learned, I tell myself. If the Larsons can't teach it to him, nobody can." } },
      choices = {
        { text = "Let the boy find his own trade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A trade's a gift, and he'll thank you.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    corbett = {
      lines = { { id = "c_default", text = "Corbett carries the finished goods up to Harlan's and anywhere else they're wanted. Good lad, slow on the stairs, and he says the same about me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      lines = { { id = "p_default", text = "Hold still. There's a tear by the cuff and the hem's coming down, and a robe that drags will trip you at the worst moment. Come by with them off, and I'll mend them for the usual price." } },
      choices = {
        { text = "Thank you, Rema, I will.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Folk stand very still while I pin them, dear, and they talk to fill the quiet. Ask me what I've heard." } },
    background = { { id = "tp_bg", text = "A tailor with a shop by the bridge and a son who forgets his shears. There's no more to me than thread and worry." } },
    advice = { { id = "tp_ad", text = "Mend a small tear today, or you'll be buying a whole new shirt next week. That goes for more than shirts." } },
    defias = { { id = "tp_defias", text = "Bandits in masks, they say, and some of them stonemasons' lads once. It frightens folk into buying sturdy clothes, I can tell you that.", next = "worry" } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. I hear a great deal, but not that." } },
  },
}

P:NPC {
  key = "arnold_leland", id = TODO_NPC("Arnold Leland"), name = "Arnold Leland", title = "Fishing Trainer",
  bible = "bibles/canals.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "light", "kin", "craft" },
  impression = {
    first = "Arnold Leland teaches fishing on the canals as though there were no hurry anywhere in the world. Talking to him slowed my pulse a little, which may be the point of fishing.",
    third = "{name} met Arnold Leland, who teaches fishing on the Stormwind canals beside Catherine Leland's supply stall.",
  },

  greetings = {
    { id = "g_fish", text = "Now then. You've the look of somebody who needs to sit by the water awhile." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. Fishing's a sort of prayer, if you ask me, because you sit, you wait and you take what's given." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Stormwind born? Then you'll have fished these canals as a nipper, everybody did, and caught nothing but boots." },
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've a fisher's hands, I can see the line calluses. Where have you been casting? Somewhere with better fish than this, I hope." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Arnold Leland. I teach fishing, and Catherine there sells the poles and bait, and between us we've fished every bit of water within a day's walk of this city." },
        { id = "h_back", when = { metBefore = true }, text = "Back again! Caught anything worth bragging about, or only the ones that got away?" },
      },
      again = {
        { id = "h_again", text = "What else? There's no rush; the fish certainly aren't in one." },
        { id = "h_again2", text = "Go on, then, I'm listening." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's the secret to it?", next = "secret" },
        { text = "Are there really fish in the canals?", next = "canals" },
        { text = "Not today.", next = "END" },
      },
    },
    secret = {
      lines = { { id = "s_default", text = "Patience, and a good lure, and knowing when to stop. Most folk fish too hard, as if the water owed them something, and the water owes nobody anything." } },
      choices = {
        { text = "Where should I start?", next = "secret_start" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_start = {
      lines = { { id = "ss_default", text = "Somewhere quiet, Elwynn's lakes, say, with Catherine's cheapest pole. Learn to wait there, and every water after that will be easier." } },
      choices = {
        { text = "Waiting's the hard part.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    canals = {
      lines = { { id = "c_default", text = "A few, and the children swear there are monsters. I've caught boots, a teapot and once a very surprised cat, but I've never caught a monster, and I've been looking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Folk say a lot to a man sitting still by the water. Ask, and I'll tell you what drifted past." } },
    background = { { id = "tp_bg", text = "A fisherman who teaches now, with Catherine, on these canals. Not much of a tale, but a peaceful one." } },
    advice = { { id = "tp_ad", text = "When the road's too much, find water and sit by it. You'll go back to it a better person." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Fish, I know, and very little else." } },
  },
}

P:NPC {
  key = "morris_lawry", id = TODO_NPC("Morris Lawry"), name = "Morris Lawry",
  bible = "bibles/canals.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "cunning" },
  notices = { "light", "kin", "purse" },
  impression = {
    first = "Morris Lawry begs on the canal bridges and tells two different stories about how he lost his farm, depending on who's listening. I couldn't tell whether either was true, and I suspect he's forgotten.",
    third = "{name} met Morris Lawry, a canal beggar with a story for every passer-by.",
  },

  barks = {
    { id = "b_alms", text = "Alms for a poor bloke? Anything at all, guv, anything!" },
    { id = "b_shine", text = "A copper, and I'll polish yer armor till it gleams like the King's own!" },
  },

  greetings = {
    { id = "g_beg", text = "Could ye spare a coin, friend? Just the one, for a poor man down on his luck." },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest! Bless me, holy one, and if the blessing comes with a copper in it, so much the better." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A Stormwind face, ye'll know what it's like to fall on hard times in this city, then. Or ye will, one day, so be kind now." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Light above, ye clink when ye walk! Surely a coin or two won't be missed from a purse like that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Morris Lawry, at yer service, guv. I'll polish yer armor for a copper, carry yer bags for two, and pay ye back on Tuesday for a meal today, I swear it." },
        { id = "h_back", when = { metBefore = true }, text = "You again! Ye've a kind face, I said so the first time, didn't I? Or I meant to." },
      },
      again = {
        { id = "h_again", text = "Anything else, guv? I've nowhere to be, as ye can see." },
        { id = "h_again2", text = "Go on, then, ask. Questions are free, unlike bread." },
      },
      choices = {
        { text = "How did you end up begging?", next = "farm" },
        { text = "Here's a coin.", next = "coin" },
        { text = "Weren't you blind a moment ago?", next = "blind" },
        { text = "Get a job, Morris.", next = "END", fx = { affinity = -1 } },
      },
    },
    farm = {
      lines = {
        { id = "f_default", text = "Had a farm once, I did, till the army built their towers right behind it, and the orcs came at the towers through my barley. Or it was the orcs burnt it outright; I tell it both ways, depending." },
      },
      choices = {
        { text = "Which is true?", next = "farm_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_true = {
      lines = { { id = "ft_default", text = "Both, guv, or neither, or some of each. A man tells the story that gets the coin, and soldiers give for the orcs and farmers give for the army, so I keep both in my pocket." } },
      choices = {
        { text = "Lying for coin is still lying.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "A hungry man tells the story that feeds him.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    coin = {
      lines = { { id = "c_default", text = "Bless ye, friend, bless ye a hundred times! I'll pay ye back Tuesday, word of a Lawry, though I won't say which Tuesday." } },
      choices = {
        { text = "Keep it, Morris. No need to pay me back.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { generous = 1 } } },
        { text = "You'll pay me back, or I'll find you.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    blind = {
      lines = { { id = "b_default", text = "Blind, me? Why, I can see! I can see, friend, it's a miracle, and ye did it! That's worth a copper to a holy soul like yerself, surely." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A beggar on a bridge hears everything, guv, because nobody thinks he's listening. What'll ye have?" } },
    background = { { id = "tp_bg", text = "A farmer once, or so I tell it, and a beggar now, and that part's true enough.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Always have two stories, friend. One's never enough in a city this size." } },
    _none = { { id = "tp_none", text = "Couldn't say, guv. A copper might jog my memory, mind." } },
  },
}

P:NPC {
  key = "billy_canals", id = TODO_NPC("Billy"), name = "Billy",
  bible = "bibles/canals.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious" },
  notices = { "light", "kin", "wonder" },
  impression = {
    first = "Billy fishes the canals with his friend Adam and catches mostly boots, though to hear him tell it he once landed a fish bigger than himself. I believed every word while he was talking.",
    third = "{name} met Billy, a boy on the Stormwind canals with a fish story for every occasion.",
  },

  barks = {
    { id = "b_fish", text = "Think there's any fish in here? Adam says no, but Adam doesn't know anything!" },
  },

  greetings = {
    { id = "g_fish", text = "Hey! Hey, do you wanna hear about the biggest fish ever? It's true, I swear!" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "Are you a priest? Can you pray for a fish? Not a big one, just one that's not a boot." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "Did you fish here when you were little? Did you catch anything? I bet I catch more." },
    { id = "n_pet", cat = "wonder", when = { pet = true },
      text = "Whoa, is that yours? If it eats fish, I'll catch it one, a really big one, the biggest in the canal!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Billy, and me and Adam fish here every day, and once, at camp, I pulled out a fish bigger than me, honest, but I threw it back because it was looking at me funny." },
        { id = "h_boot", when = { metBefore = true }, text = "Look, look, I caught something! Oh, it's just another stinky old boot, that's three this week." },
      },
      again = {
        { id = "h_again", text = "Do you wanna hear another one? I know loads!" },
        { id = "h_again2", text = "Wait, wait, I've got a better one!" },
      },
      choices = {
        { text = "Tell me about the biggest fish.", next = "fish" },
        { text = "Are there monsters in the sea?", next = "monsters" },
        { text = "Who's Adam?", next = "adam" },
        { text = "Good luck fishing, Billy.", next = "END", fx = { affinity = 1 } },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "Last week I caught one with three eyes, right here in the canal, and it winked at me with the middle one! And there's a golden fish, too, and if you catch it you get three wishes, my daddy says." } },
      choices = {
        { text = "What would you wish for?", next = "fish_wish" },
        { text = "Three eyes? I don't believe you.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    fish_wish = {
      lines = { { id = "fw_default", text = "A boat, and a bigger boat, and then another wish so I can have more wishes! Adam says that's cheating, but it's not cheating if it's a magic fish." } },
      choices = { { text = "Smart thinking, Billy.", next = "BACK", fx = { affinity = 2 } } },
    },
    monsters = {
      lines = { { id = "m_default", text = "My daddy says there's fish in the ocean so big they can swallow a whole ship! And there's fish that walk on land and eat people, and they go mrrglgl, I heard it from a sailor." } },
      choices = {
        { text = "Those are murlocs, and they're real.", next = "monsters_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monsters_real = {
      lines = { { id = "mr_default", text = "They're REAL? Have you seen one? Did it try to eat you? Wait till I tell Adam, he's gonna be so scared!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    adam = {
      lines = { { id = "a_default", text = "He's my best friend, but he can't fish, and my daddy catches way more fish than Adam's daddy, and that's a fact." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know loads of stuff, mostly about fish! Ask me!" } },
    background = { { id = "tp_bg", text = "I'm Billy, and I'm gonna be the best fisherman in Stormwind when I'm big." } },
    advice = { { id = "tp_ad", text = "If it's a boot, throw it back, 'cause it's not a fish. Took me ages to learn that." } },
    _none = { { id = "tp_none", text = "I dunno. Is it a fish? I only know about fish." } },
  },
}

P:NPC {
  key = "philmor", id = TODO_NPC("Manifest Clerk Philmor"), name = "Manifest Clerk Philmor",
  bible = "bibles/canals.md", role = "worker", tier = "quest",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "light", "kin", "kit" },
  impression = {
    first = "Manifest Clerk Philmor keeps Stormwind's harbor running on too few dockhands and too many ledgers. He told me the work was open to anyone and my safety was my own affair, and he meant both.",
    third = "{name} met Manifest Clerk Philmor, who keeps the cargo manifests at Stormwind Harbor.",
  },

  greetings = {
    { id = "g_harbor", text = "Anyone can work the harbor, but if a crate falls on you, that's your own affair. Now, what is it?" },
  },

  notice = {
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest on the docks. The sailors will ask you to bless the ship, and then they'll ask you to carry a crate, so be ready for both." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "City folk, good. You'll know the Trade District, then, and won't get lost carrying a parcel through it." },
    { id = "n_strong", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Broad shoulders, sturdy boots, and I'd guess you've lifted heavier than a cargo crate. I've work for you, if you want it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Manifest Clerk Philmor. Every crate that comes into this harbor passes my ledger, and this week half my dockhands haven't, so the cargo schedule is a work of fiction." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("Philmor's Favor") },
          text = "The Gatehouse shipment goes up the stairs in Trias' Cheese, to the stockroom entrance. Elaine knows the deliveries, so hand it to her and don't open it on the way." },
        { id = "h_favor_done", tags = { "news" }, when = { questDone = TODO_QUEST("Philmor's Favor") },
          text = "Elaine sent word the shipment arrived intact, which is more than I can say for the last three. You've a future on the docks, if you ever tire of the other thing." },
      },
      again = {
        { id = "h_again", text = "Anything else? The tide doesn't wait for conversation." },
        { id = "h_again2", text = "Yes? Quickly, please." },
      },
      choices = {
        { text = "Do you need a hand?", next = "favor" },
        { text = "What's the Gatehouse?", next = "gatehouse" },
        { text = "Where do the ships go?", next = "ships" },
        { text = "Why are you short of dockhands?", next = "dockhands" },
        { text = "Good day.", next = "END" },
      },
    },

    favor = {
      lines = { { id = "f_default", text = "Always. There's a shipment for the Gatehouse that should have gone up to the Trade District this morning, and nobody's free to take it. Carry it carefully, because it's yours until it's on Elaine's landing." } },
      choices = {
        { text = "Why so careful?", next = "gatehouse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gatehouse = {
      big = true,
      lines = { { id = "g_default", text = "The Gatehouse has its stockroom above Trias' Cheese, and its goods arrive quietly, so the guard's officers can have their ceremonial surprises. That's what the manifest says, and I write down what the manifest says." } },
      choices = {
        { text = "You don't believe it either.", next = "gatehouse_believe" },
        { text = "A clerk shouldn't ask what he's carrying.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A clerk should know what passes his ledger.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gatehouse_believe = {
      lines = { { id = "gb_default", text = "I believe in an accurate ledger and a quiet life, and those two things only go together if I don't open the crates. You'd do well to keep the same habit." } },
      choices = {
        { text = "Understood.", next = "BACK", fx = { trait = { discreet = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ships = {
      lines = { { id = "s_default", text = "Up and down the coast, mostly, and the kaldorei keep a boat for Auberdine at the far pier. Ask the elf on the dock, Idrieth; he'll tell you when it sails, and politely, which is more than the sailors will." },
      },
      choices = {
        { text = "Auberdine, in Darkshore?", next = "ships_elves", when = { race = "NightElf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_elves = {
      lines = { { id = "se_default", text = "Your own shores, yes. Your people keep a tidy dock and a punctual boat, and I wish I could say the same for ours." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    dockhands = {
      lines = { { id = "d_default", text = "Some went to Westfall and came back masked, some went to Redridge and didn't come back, and the rest know I can't pay what the adventurers pay. So I hire whoever walks up, and here you are." } },
      choices = {
        { text = "Pay them better, then.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hire the desperate and work them hard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Every ship brings news with its cargo, and I write down the cargo. Ask, and I'll tell you what's come over the water." } },
    background = { { id = "tp_bg", text = "A clerk on the docks with a ledger and too few dockhands. If there's a story, it's written in the margins." } },
    advice = { { id = "tp_ad", text = "Lift with your legs, count twice and never sign for a crate you haven't seen. That's all the wisdom the harbor teaches." } },
    _none = { { id = "tp_none", text = "Not on my manifest. Try the Trade District; they gossip there." } },
  },
}
