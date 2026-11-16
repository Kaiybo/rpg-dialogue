-- The open swamp, between towns: Galen Goodward in his cage at the Fallow Sanctuary, and the Fallen Hero of the Horde by the road to the Blasted Lands. Voice: bibles/swampofsorrows.md
-- The Fallen Hero: Thrall's Grasp and his shame only; his name (Trebor) and the demon lord's name stay out (see bible).
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "galen", id = TODO_NPC("Galen Goodward"), name = "Galen Goodward",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "swamp_of_sorrows" }, temper = { "nervous", "chatty" }, values = { "greedy", "self-preserving" },
  notices = { "class", "weary" },

  impression = {
    first = "Galen Goodward is a human trader stuck in a cage at the Fallow Sanctuary, and he talks faster than any prisoner I've met. He wants out, and he wants his strongbox, and I'm not sure which he wants more.",
    third = "{name} found Galen Goodward caged at the Fallow Sanctuary in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_default", text = "Oh, thank the Light, a face that isn't scaly! Please, friend, get me out of this cage before they come back!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I knew you would, I said to myself, that one's got a kind face." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You look like someone who's opened a lock or two, and I won't ask how, I promise, if you'll just open this one." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look half drowned, friend, but still better than me, and I've been in this cage for days." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Galen Goodward, at your service, or I would be if I weren't stuck in here. The murlocs of this sanctuary caught me on the road and threw me in this cage, and they took my strongbox too, which had everything I own in it." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Galen's Escape") },
          text = "We're going, we're going! Stay close to me, friend, and keep those fish-men off my back until we're clear of this place." },
        { id = "h_done", when = { questDone = TODO_QUEST("Galen's Escape") },
          text = "You saved my neck, friend, and I'll not forget it, not for a good while anyway. Did you find my strongbox, by any chance?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask quickly, please, before they come back." },
        { id = "h_again2", text = "What else? I'm not going anywhere, worse luck." },
      },
      choices = {
        { text = "How did you end up in there?", next = "caught" },
        { text = "What's in this strongbox?", next = "box" },
        { text = "What is this place?", next = "place" },
        { text = "Did you get your strongbox back?", next = "after", when = { questDone = TODO_QUEST("Galen's Escape") } },
        { text = "I'll be back.", next = "END" },
      },
    },
    caught = {
      lines = {
        { id = "ca_default", text = "I was taking a shortcut through the swamp, which was my first mistake. The road to Stonard is long, and I thought I could cut through the sanctuary, but the murlocs had other ideas, and here I am." },
      },
      choices = {
        { text = "Why travel the swamp alone?", next = "caught_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught_alone = {
      lines = {
        { id = "cal_default", text = "Because guards cost money, and a trader who pays for guards doesn't stay a trader long. I've crossed this swamp a dozen times, and a dozen times nothing happened, until the thirteenth time." },
      },
      choices = {
        { text = "Serves you right for being cheap.", next = "caught_lesson", fx = { align = { light = -1 } } },
        { text = "Bad luck could catch anyone.", next = "caught_lesson", fx = { align = { light = 1 } } },
        { text = "What did you trade?", next = "caught_lesson" },
      },
    },
    caught_lesson = {
      lines = {
        { id = "cl_default", text = "This and that, whatever sells, friend, and I'll trade with anybody who pays honest coin. Next time I'll hire a guard, I swear it, though I said the same last time too." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    box = {
      lines = {
        { id = "bo_default", text = "My savings, my papers, a few things I was carrying for clients, nothing that'd interest you, really. The murlocs took it off somewhere in the sanctuary, and I'd be ever so grateful if you found it once I'm free." },
      },
      choices = {
        { text = "Nothing that would interest me?", next = "box_suspicious" },
        { text = "Something else.", next = "BACK" },
      },
    },
    box_suspicious = {
      lines = {
        { id = "bs_default", text = "Well, it'd interest you a little, I suppose, since it's mine and there's coin in it. But you're a hero, aren't you, and heroes don't go through other people's boxes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    place = {
      lines = {
        { id = "pl_default", text = "The Fallow Sanctuary, they call it, though there's nothing holy about it now. Murlocs everywhere, and worse things in the deep water, and the only folk who come out here are fools and traders, which some say are the same thing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = {
        { id = "af_default", text = "Some of it, and I owe you for that, friend. I'll be taking the long road from now on, and paying for a guard like a sensible man." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a trader, friend, an honest one, mostly. I buy cheap and sell dear, and sometimes I get caught by murlocs." } },
    advice = { { id = "tp_ad", text = "Don't take shortcuts through the swamp, friend. Take it from a man who's been sitting in a cage for days." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, friend. Can we talk about getting me out of here?" } },
  },
}


P:NPC {
  key = "fallen_hero", id = TODO_NPC("Fallen Hero of the Horde"), name = "Fallen Hero of the Horde",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "swamp_of_sorrows" }, temper = { "grave", "brooding" }, values = { "honor" },
  notices = { "race", "class" },

  impression = {
    first = "The Fallen Hero of the Horde is an orc spirit by the road to the Blasted Lands, the last of a regiment called Thrall's Grasp. He blames orders that never came, and he blames himself more.",
    third = "{name} met the Fallen Hero of the Horde, an orc spirit in the Swamp of Sorrows near the Blasted Lands.",
  },

  greetings = {
    { id = "g_default", text = "You see me, then. Few stop for a dead orc's grief, so stay a moment and listen." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to this road, and to me. Speak, then, for I have nowhere else to be." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, and young, with the Warchief's freedom on you. My soldiers had that look once, and I led them here." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, on this road? Your mages at Nethergarde watch the Portal as I do, though they cannot see what I have seen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I led a regiment of the Horde called Thrall's Grasp, and it was destroyed in the lands beyond this swamp. Nineteen of my soldiers could have been spared, had the orders reached us, and I cannot rest until I know why they did not." },
        { id = "h_quest", when = { questActive = TODO_QUEST("The Disgraced One") },
          text = "Go to Stonard and speak to Dispatch Commander Ruag. He will know what became of the orders, or he will know who does." },
      },
      again = {
        { id = "h_again", text = "What more would you hear?" },
        { id = "h_again2", text = "Ask, then. The dead have nothing but time." },
      },
      choices = {
        { text = "What happened to Thrall's Grasp?", next = "grasp" },
        { text = "What orders do you mean?", next = "orders" },
        { text = "What lies in the Blasted Lands?", next = "lands" },
        { text = "Ruag swears he sent those orders.", next = "ruag", when = { questDone = TODO_QUEST("The Missing Orders") } },
        { text = "I'll leave you to your road.", next = "END" },
      },
    },
    grasp = {
      lines = {
        { id = "gr_default", text = "We marched south against the evil that gathers past the swamp, and something waiting there was stronger than we were. What it did to my soldiers I will tell only to someone who has earned my trust." },
      },
      choices = {
        { text = "Then let me earn it.", next = "grasp_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grasp_trust = {
      lines = {
        { id = "gt_default", text = "Courage is a start, but trust is earned by deeds. Help me learn the truth about the orders first, and then we will speak of what lies beyond the Portal." },
      },
      choices = {
        { text = "A commander answers for his soldiers.", next = "grasp_blame", fx = { align = { honor = 1 } } },
        { text = "Blame won't bring the dead back.", next = "grasp_blame", fx = { align = { honor = -1 } } },
        { text = "Do you blame yourself?", next = "grasp_blame" },
      },
    },
    grasp_blame = {
      lines = {
        { id = "gb_default", text = "Every night that does not end, I blame myself. I gave the order to march, and my soldiers followed me as orcs follow their chief, and that weight is mine whatever Stonard says." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orders = {
      lines = {
        { id = "or_default", text = "Orders from Stonard that would have turned us back, or so I believe. They never came, and Stonard has said nothing since, and silence from one's own people is a bitter thing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lands = {
      lines = {
        { id = "la_default", text = "Red earth, ogres, and the dark Portal where my people first came into this world. Worse than any of that waits there, and the humans and the Horde squabble over scorched earth while it grows." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ruag = {
      lines = {
        { id = "ru_default", text = "Then the orders were lost on the road, and it was murlocs, not cowardice, that killed my soldiers. It is a strange comfort, but it is a comfort, and I thank you for it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a commander of the Horde, and now I am a shade on a swamp road. That is all the tale I'll tell for now." } },
    advice = { { id = "tp_ad", text = "When you lead, young one, know where your orders are. I did not, and nineteen soldiers paid for it." } },
    _none = { { id = "tp_none", text = "I know nothing of that. The dead hear little news." } },
  },
}
