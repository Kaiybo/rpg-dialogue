-- Feathermoon Stronghold, more folk: Quintis Jonespyre (the druid in the tree-house: morrowgrain, psychometry)
-- and Ginro Hearthkindle (the missing courier Raschal). Voice: bibles/feathermoon_folk.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Quintis Jonespyre
---------------------------------------------------------------------------
P:NPC {
  key = "quintis", id = TODO_NPC("Quintis Jonespyre"), name = "Quintis Jonespyre",
  bible = "bibles/feathermoon_folk.md", role = "scholar", tier = "quest",
  communities = { "feathermoon" }, temper = { "wry", "suspicious" }, values = { "knowledge", "truth" },
  notices = { "race", "class" },

  impression = {
    first = "Quintis Jonespyre is a druid who lives in a little tree-house above the stronghold and studies curses for pleasure. He is dry, clever, and a terrible card player, and he knows all three things about himself.",
    third = "{name} met Quintis Jonespyre, the druid of Feathermoon Stronghold who reads an object's history by touch and keeps an eye on Darnassus's morrowgrain.",
  },

  greetings = {
    { id = "g_hello", text = "Mind the ladder, the third rung is a liar. Come up, come up." },
    { id = "g_knife", when = { questActive = TODO_QUEST("The Knife Revealed") }, text = "Ginro sent you with something, I see, and I can guess what he said about my debts." },
    { id = "g_grain", when = { questActive = TODO_QUEST("Morrowgrain to Feathermoon Stronghold") }, text = "More morrowgrain? Set it down gently. I want to know what it is before it knows what I am." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and nobody's cursed you in the meantime. I'd have noticed." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A fellow druid! Then you'll forgive the mess; everything up here is either an experiment or a cup of tea, and I've stopped being sure which." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ah, a warlock. Curses are my study, and I suspect they're your trade, so please don't practise on the furniture." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Quintis Jonespyre, druid, researcher, and the stronghold's resident expert on curses, which is a speciality nobody wants until suddenly everybody does. What brings you up my ladder?" },
        { id = "h_request", when = { questActive = TODO_QUEST("Jonespyre's Request") },
          text = "Shyria sent you, bless her. I've a small puzzle, and I need somebody with steady hands who doesn't ask too many questions of Darnassus." },
        { id = "h_knife", when = { questActive = TODO_QUEST("The Knife Revealed") },
          text = "A knife, from the wreck of Raschal's boat? Give it here. If I hold it long enough, it will tell me where it has been, and who has been holding it." },
        { id = "h_reading", tags = { "news" }, when = { questActive = TODO_QUEST("Psychometric Reading") },
          text = "I saw gnolls, Woodpaw gnolls, quarrelling over packs by firelight, and a boat breaking in the surf. Take that to Ginro, and tell him the debt is paid in full." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, and a Moonglade one by the look of you. Then perhaps you can tell me what nobody in Darnassus will: why the Arch Druid needs quite so much morrowgrain." },
      },
      again = {
        { id = "h_again", text = "What else? The tea's cooling, and I can't decide if that's a problem." },
        { id = "h_again2", text = "Ask on. I'm better at answers than at cards." },
      },
      choices = {
        { text = "How do you read a knife's history?", next = "psych" },
        { text = "What is this morrowgrain?", next = "grain" },
        { text = "Ginro says you owe him money.", next = "debt" },
        { text = "Why study curses?", next = "curses" },
        { text = "How do the druids see Darnassus's research?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What can I do for you?", next = "BUSINESS" },
        { text = "I'll mind the third rung on my way down.", next = "END" },
      },
    },

    psych = {
      lines = { { id = "ps_default", text = "Everything remembers, if you listen with the right part of yourself. A knife remembers the hand that made it, the hands that carried it, and especially the hand that dropped it in a hurry." } },
      choices = {
        { text = "Can you do it with anything?", next = "psych_any" },
        { text = "Something else.", next = "BACK" },
      },
    },
    psych_any = {
      lines = { { id = "pa_default", text = "With most things, though it tires me, and some objects have histories I'd rather not share a room with. I once held a gnoll's bowl and tasted its supper for a week." } },
      choices = {
        { text = "Could you read anything of mine?", next = "psych_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    psych_mine = {
      big = true,
      lines = { { id = "pm_default", text = "I could, but I've learned to ask first, because people don't always like what their belongings remember. Some say a secret kept is a secret owed; others think the truth should always come out. Which are you?" } },
      choices = {
        { text = "The truth should always come out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some secrets are nobody's business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    grain = {
      lines = { { id = "gr_default", text = "A grain grown with a little nature magic, quickly, in great quantity. Arch Druid Staghelm wants sacks of it gathered in the name of the Cenarion Circle, and the Circle's own druids can't tell me why." } },
      choices = {
        { text = "Why does that trouble you?", next = "grain_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grain_why = {
      lines = { { id = "gw_default", text = "Because when an Arch Druid spends the Circle's name and the Circle's coin on something, I'd like the Circle to know what it is. The general and I have spent a good many evenings on this, and on whether the High Priestess will ever ask him." } },
      choices = {
        { text = "And will she?", next = "grain_tyrande" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grain_tyrande = {
      lines = { { id = "gt_default", text = "She says the Cenarion Circle lies outside her authority, and she's right, more's the pity. So I keep a little of every shipment that passes through here, and I study it, and I wait." } },
      choices = {
        { text = "Keep me told what you learn.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "cenarion_circle" } } },
        { text = "Maybe it's only grain, Quintis.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    debt = {
      lines = { { id = "de_default", text = "Kalimdor Hold 'Em, and the less said about it the better. Ginro is a patient man with a long memory and an excellent poker face, and I'm a druid who can read objects but apparently not cards." } },
      choices = {
        { text = "Can't you read the cards?", next = "debt_cheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_cheat = {
      lines = { { id = "dc_default", text = "I could, technically, and Ginro knows it, so he plays with a deck he carved himself from ironwood. Every card in it remembers only Ginro winning." } },
      choices = {
        { text = "He's cleverer than he looks.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    curses = {
      lines = { { id = "cu_default", text = "Because nobody else would, and because a curse is only a question somebody asked of the world in an angry voice. If you can hear the question, you can usually find a gentler answer." } },
      choices = {
        { text = "That's a kind way to see it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      lines = { { id = "xd_default", text = "Quietly, and that's what bothers me. Druids grumble about everything, about the weather and the moonwells and each other, but on this they've gone very quiet, as though someone told them to." } },
      choices = {
        { text = "I'll listen for what they won't say.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Curses, objects with memories, morrowgrain, and how to lose at cards gracefully." } },
    background = { { id = "tp_bg", text = "A druid who preferred books to bears, posted to the general's island so I'd stop asking questions in Darnassus.", next = "grain" } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle answers to Cenarius's memory and to its own druids, not to the temple. That's its strength, and lately I think it's a weakness." } },
    _none = { { id = "tp_none", text = "I don't know it. Bring me something it has touched, and perhaps I will." } },
  },
}

---------------------------------------------------------------------------
-- Ginro Hearthkindle
---------------------------------------------------------------------------
P:NPC {
  key = "ginro", id = TODO_NPC("Ginro Hearthkindle"), name = "Ginro Hearthkindle",
  bible = "bibles/feathermoon_folk.md", role = "questgiver", tier = "quest",
  communities = { "feathermoon" }, temper = { "steady", "worried" }, values = { "loyalty", "comrades" },
  notices = { "race", "class" },

  impression = {
    first = "Ginro Hearthkindle runs the stronghold's dispatches and has the steady calm of a man used to waiting for bad news. He has been waiting a week for the courier Raschal, and it shows in the way he keeps glancing at the jetty.",
    third = "{name} met Ginro Hearthkindle, who keeps Feathermoon's dispatches and is searching for the missing courier Raschal.",
  },

  greetings = {
    { id = "g_hello", text = "Any word from the mainland? No? Then come in anyway." },
    { id = "g_boat", when = { questActive = TODO_QUEST("The Missing Courier") }, text = "The boat, {name}. Find the boat, and we'll know where to start." },
    { id = "g_gnolls", when = { questActive = TODO_QUEST("The Woodpaw Gnolls") }, text = "The Woodpaw camps. Tear them apart if you have to; I'm done being polite." },
    { id = "g_done", when = { questDone = TODO_QUEST("Thalanaar Delivery") }, text = "The parcel reached Falfindel. Raschal would have wanted that more than anything." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've a gambler's hands. Don't sit down at a table with me, friend; Quintis will tell you why." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ginro Hearthkindle. I handle the stronghold's dispatches, which mostly means waiting for couriers and worrying about the ones who don't come back. One hasn't, and his name is Raschal." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Missing Courier") },
          text = "Raschal set out for Thalanaar a week ago. His plan was to row down the coast, then cross southern Feralas to keep clear of the Horde camp. I couldn't find his boat, but maybe you can, and it may hold a clue." },
        { id = "h_boat", when = { questActive = TODO_QUEST("The Missing Courier") },
          text = "Search the Forgotten Coast, south of the jetty. If the boat sank, it'll be in the shallows, and if it's hidden, it'll be hidden badly; Raschal was never good at hiding things." },
        { id = "h_knife", when = { questActive = TODO_QUEST("The Knife Revealed") },
          text = "A knife from the wreck. Take it up to Quint in his tree-house and tell him his Kalimdor Hold 'Em debt is paid if he works his mojo on it. I don't understand how he does it, but I've seen it work." },
        { id = "h_gnolls", when = { questActive = TODO_QUEST("The Woodpaw Gnolls") },
          text = "Quint saw gnolls, so the Woodpaw camps in the south are where we start. Gnolls keep what they scavenge and fight over it, so if they found Raschal's packs, they'll still have them." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Thalanaar Delivery"), days = 5 } },
          text = "Falfindel has his parcel, and that's Raschal's last errand finished, whatever became of him. Thank you, {name}. I'll write it in the log in his name." },
      },
      again = {
        { id = "h_again", text = "What else? I've a dispatch to finish, but it can wait." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Tell me about Raschal.", next = "raschal" },
        { text = "Who are the Woodpaw?", next = "woodpaw" },
        { text = "What's this about Quintis and cards?", next = "cards" },
        { text = "How did the stronghold come to be here?", next = "stronghold" },
        { text = "What can I do?", next = "BUSINESS" },
        { text = "I'll keep an eye out for him.", next = "END" },
      },
    },

    raschal = {
      lines = { { id = "ra_default", text = "He's been with us since General Feathermoon led the expedition here, and he knows Feralas better than anyone on this island. That's what worries me, because a man who knows the land this well doesn't just get lost." } },
      choices = {
        { text = "Then something stopped him.", next = "raschal_fate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raschal_fate = {
      lines = { { id = "rf_default", text = "Something did, and I've lain awake trying to guess what: gnolls, ogres, the Horde, the sea. I sent two Sentinels along the coast last week, and they came back with nothing but sand in their boots." } },
      choices = {
        { text = "He might still be alive.", next = "raschal_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raschal_hope = {
      big = true,
      lines = { { id = "rh_default", text = "He might be, and I'll keep believing it until I'm shown otherwise. Some here say I should give up the search and spend our scouts on the naga instead." } },
      choices = {
        { text = "Never leave a comrade behind. Keep searching.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The living need those scouts more. Let him go.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    woodpaw = {
      lines = { { id = "wo_default", text = "Gnolls in the southern hills, cowardly one by one and dangerous by the dozen. Our friends the Woodpaw like to pick over anything that falls in their territory, and they don't share." } },
      choices = {
        { text = "I'll get his packs back.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cards = {
      lines = { { id = "ca_default", text = "Quint owes me a sum I'd rather not name, from a long winter of Kalimdor Hold 'Em. He's the cleverest man on this island, and he bluffs like a moonkin in a hailstorm." } },
      choices = {
        { text = "Teach me to play some time.", next = "cards_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cards_teach = {
      lines = { { id = "ct_default", text = "Gladly, once Raschal's home and I can enjoy taking your money. Bring your own coin, because I don't play for promises; I've a druid's worth of those already." } },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stronghold = {
      lines = { { id = "st_default", text = "The general brought us across to Sardor Isle because an island is easy to hold and the ogres can't swim. We built the walls, then the inn, then the jetty, and somewhere in between I became the man who counts the boats." } },
      choices = {
        { text = "A useful man to be.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Who left, who came back, and who's late. That's the dispatch office, friend." } },
    background = { { id = "tp_bg", text = "One of the general's expedition, keeper of the stronghold's dispatches.", next = "stronghold" } },
    sentinels = { { id = "tp_sent", text = "The finest soldiers in Kalimdor, and the worst at writing reports, so the General keeps a clerk on the island, and the clerk is me." } },
    _none = { { id = "tp_none", text = "Nothing in the dispatches about that, I'm afraid." } },
  },
}
