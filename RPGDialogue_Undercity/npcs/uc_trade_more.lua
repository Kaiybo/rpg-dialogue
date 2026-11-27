-- More of the Trade Quarter: Patrick Garrett, sweeping the bat pens beneath his dignity;
-- Raleigh Andrean, the ex-chef who wants his wife's murderer's hands; and Velora Nitely,
-- the armorsmith who lost her sense of humour when she died. Voices: bibles/uc_trade_more.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Patrick Garrett: a Garrett, sweeping bat dung, and he'd like you to know it.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_pgarrett", id = TODO_NPC("Patrick Garrett"), name = "Patrick Garrett",
  bible = "bibles/uc_trade_more.md", role = "worker", tier = "quest",
  communities = { "undercity" }, temper = { "proud", "cheerful" }, values = { "ambitious", "loyal" },
  notices = { "class", "kit", "race" },
  impression = {
    first = "He holds his broom like a sceptre.",
    third = "{name} met Patrick Garrett, a proud Forsaken who sweeps the bat pens in the Trade Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Step around the droppings, please, I've only just swept there. The bats have no respect for my labour, none at all." },
    { id = "g_broom", when = { questDone = TODO_QUEST("Reclaimed Treasures") }, text = "Behold, the Garrett family weapon of choice, and the bats tremble before it! You're bloody well worth every silver I spent on you, I say." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Welcome, welcome, and do forgive the smell. It is the bats, I assure you, and not the Garretts." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's in a dreadful state, if you don't mind my saying. A Garrett would never be seen in public like that, not even a Garrett with a broom." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A keeper of beasts! Then tell me, as one professional to another, how one persuades an animal to do its business in a single corner. I've tried reasoning with them." },
    { id = "n_miner", cat = "kit", when = { profession = "Mining" },
      text = "You've a digger's hands, if I may say so. A Garrett knows the look, having held a shovel in more distinguished company than this." },
  },

  start = "hello",
  nodes = {
    w3_diet = {
      lines = {
        { id = "w3_diet_1", text = "Beetles from the sewers, which they hunt themselves, and apples from the Tirisfal orchards, which I carry down in a sack every morning like a common grocer's boy. Michael insists on the apples because they keep the bats' wings glossy, and the bats insist on dropping the cores on my clean floor." },
      },
      choices = {
        { text = "Glossy wings matter to a bat?", next = "w3_gloss" },
        { text = "Sounds like the bats eat better than you.", next = "BACK", reply = "They do, and they've the manners of drunken sailors about it. A Garrett used to dine with candles, you know." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_gloss = {
      lines = {
        { id = "w3_gloss_1", text = "They matter to Michael, who says a dull-winged bat tires over the Hillsbrad hills and drops its rider in a pond. I've never seen it happen, but I've never wanted to be the Garrett who's to blame if it does, so I carry the apples." },
      },
      choices = {
        { text = "Carry on carrying, then. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Patrick Garrett, of the Garretts, though you wouldn't know it to look at me now. Sweeping the bat pens with this broom is not befitting a Garrett, I assure you, but a man must earn his coin somehow." },
        { id = "h_before", when = { minLevel = 38, questBefore = TODO_QUEST("Reclaimed Treasures") },
          text = "You look like someone who goes places, {class}, and I've earned a little coin from this accursed job that I'm willing to spend on you. The Garrett family's chest sits in the South Common Hall of Uldaman, and what's inside it would free me from these pens forever." },
        { id = "h_active", when = { questActive = TODO_QUEST("Reclaimed Treasures") },
          text = "Uldaman, the South Common Hall, the Garrett chest! I'd go myself, but the bats would take the place over in a day, and then where would the flight master be?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I can lean on my broom and talk for a while, it's my one luxury." },
        { id = "h_again2", text = "Go on, the bats are asleep, more or less, and Lord Ashby snores." },
        { id = "h_again3", text = "By all means, ask. Conversation is the one thing down here that doesn't need sweeping." },
      },
      choices = {
        { text = "What's in the Garrett family chest?", next = "chest" },
        { text = "Why would the Garretts have a chest in Uldaman?", next = "uldaman" },
        { text = "How bad can sweeping bat pens be?", next = "bats" },
        { text = "Are you related to the flight master?", next = "michael" },
        { text = "The bats seem to like you well enough.", next = "fond" },
        { text = "You must see everyone who flies in.", next = "arrivals" },
        { text = "I've been inside Uldaman.", next = "been", when = { minLevel = 40 } },
        { text = "I work a pick myself. Tell me about the digging.", next = "dig", when = { profession = "Mining" } },
        { text = "What do the bats eat, anyway?", next = "w3_diet" },
        { text = "I'll leave you to your sweeping.", next = "END" },
      },
    },
    chest = {
      lines = { { id = "ch_default", text = "The Garrett family weapon of choice, locked away since the old days, and I'll say no more than that, because a family must have some secrets. Once it's in my hands, these pens will see a Garrett as he was meant to be seen." } },
      choices = {
        { text = "A weapon? For a bat sweeper?", next = "chest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chest2 = {
      lines = { { id = "c2_default", text = "Do you think the bats will respect an ordinary broom? They won't, I've tried. They need to understand that they're dealing with a Garrett, and for that I need the family weapon." } },
      choices = { { text = "Something else, Patrick.", next = "BACK" } },
    },
    uldaman = {
      lines = { { id = "ul_default", text = "We Garretts toiled there as diggers once, for the dwarves' Explorers, back when the Badlands were only bad and not yet unbearable. Honest labour, to be sure, but labour with a certain dignity to it, and we kept our chest in the common hall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bats = {
      big = true,
      lines = { { id = "ba_default", text = "They eat, they sleep upside down, and the rest is not fit for polite company, all day and all night, and I have to sweep up after the lot of them. A Garrett was made for better things, and I'll have them yet." } },
      choices = {
        { text = "Honest work is nothing to be ashamed of.", next = "BACK", reply = "It isn't, I suppose, but it's beneath a Garrett all the same. Tell the bats that, if you see them.", fx = { align = { order = 1 } } },
        { text = "You deserve better, Patrick. Reach for it.", next = "BACK", reply = "I shall, and I'll remember you said so when I'm out of this tower. Every Garrett deserves better than guano.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    michael = {
      lines = { { id = "mi_default", text = "Michael Garrett keeps the bats and I keep their floor, and whether that makes us family is a question I prefer not to answer in public. Let us say that all Garretts are distinguished, but some are more distinguished than others." } },
      choices = { { text = "Something else, Patrick.", next = "BACK" } },
    },
    fond = {
      lines = { { id = "fo_default", text = "Like me? They tolerate me, as one tolerates a footman. Although there is one old grey with a torn ear who hangs above my stool, and I've fallen into the habit of telling him about the family, and he has never once interrupted." } },
      choices = {
        { text = "So you do have a friend here.", next = "fond2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond2 = {
      lines = { { id = "fo2_default", text = "I'd thank you not to spread it about. I call him Lord Ashby, after a neighbour of ours who also slept through dinner, and Michael says I'm not to feed him from my own purse. I do it when Michael's back is turned." } },
      choices = {
        { text = "Lord Ashby is lucky to have you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "A Garrett, befriending a bat.", next = "BACK", reply = "A Garrett may befriend whom he pleases. It is one of the few privileges left to the name." },
        { text = "Something else.", next = "BACK" },
      },
    },
    arrivals = {
      lines = { { id = "ar_default", text = "Every one, and from below, which is not anyone's best angle. Orcs from the Sepulcher with mud to the knee, apothecaries bound for Tarren Mill with their crates, and now and then a courier who lands running and doesn't stop until the Royal Quarter." } },
      choices = {
        { text = "Do any of them notice you?", next = "arrivals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arrivals2 = {
      lines = { { id = "ar2_default", text = "A tauren did, once. He stepped off, looked at the floor I'd just done, and went round the edge of it on the tips of his hooves. I've never been so moved by a stranger, and I've thought well of his entire people since." } },
      choices = {
        { text = "I'll mind your floor too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    been = {
      lines = {
        { id = "be_default", text = "Have you! Then you've stood in the very halls where Garretts stood. Tell me, are the common halls still standing, or have the troggs had the run of them? I ask as a man with property there." },
        { id = "be_done", when = { questDone = TODO_QUEST("Reclaimed Treasures") }, text = "You have, and you came back with the chest, and I'll never forget it. Tell me again what the South Common Hall looked like, because I intend to describe it to Lord Ashby, and he's particular about detail." },
      },
      choices = {
        { text = "Troggs and Dark Irons, wall to wall.", next = "BACK", reply = "Dark Irons, in our hall! The family would be appalled. I'm appalled on its behalf, since it can't be here." },
        { text = "Standing, but nobody's swept in years.", next = "BACK", reply = "Then it's in want of a Garrett. I knew it, I said as much to the bats.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig = {
      lines = { { id = "dg_default", text = "Then you'll know there's a right way to shore a trench and a great many wrong ones. We Garretts dug for the dwarves by the yard and were paid by the find, and my grandfather held that a clean trench wall was the mark of a gentleman." } },
      choices = {
        { text = "He'd approve of your floors, then.", next = "BACK", reply = "Do you know, I believe he would. That's the kindest thing anyone has said in this tower.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Garretts are an old family, and I'm the oldest of what's left of it. I'd rather not say how much is left." } },
    advice = { { id = "tp_ad", text = "Always stand up straight, even when you're shovelling dung. Especially then, actually." } },
    forsaken = { { id = "tp_fs", text = "We are all come down in the world, every one of us. It is merely that some of us had further to come." } },
    lordaeron = { { id = "tp_lord", text = "A fine kingdom for a family with a name. I'm told it was less fine for those without one, but I wasn't asked at the time." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside a Garrett's expertise, which is narrower than it once was." } },
  },
}

---------------------------------------------------------------------------
-- Raleigh Andrean: feels nothing for his wife, and wants her killer's hands.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_raleigh", id = TODO_NPC("Raleigh Andrean"), name = "Raleigh Andrean", title = "Ex-Chef",
  bible = "bibles/uc_trade_more.md", role = "citizen", tier = "quest",
  communities = { "undercity" }, temper = { "grim", "calm" }, values = { "vengeful" },
  notices = { "race", "class" },
  impression = {
    first = "Revenge for his murdered wife is the only warm thing about him.",
    third = "{name} met Raleigh Andrean, a Forsaken ex-chef in the Trade Quarter who wanted revenge for his wife's murder.",
  },

  greetings = {
    { id = "g_hi", text = "If you're looking for a cook, I'm no longer one. Try the inn." },
    { id = "g_ring", when = { questActive = TODO_QUEST("Raleigh and the Undercity") }, text = "That ring you're carrying, let me see it. Yes, I know it, because I gave it to my wife." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You still have a sense of taste, I suppose. Use it while you can, because I promise you'll miss it." },
    { id = "n_cook", cat = "class", when = { profession = "Cooking" },
      text = "You cook. I can tell by the burn on your wrist, which is an oven's and not a forge's. Season with a light hand while you can still tell the difference." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "You're one of us, so you'll know the quiet where the feelings used to be. Some fill it with duty, and I've filled mine with one man's name." },
  },

  start = "hello",
  nodes = {
    w3_grave = {
      lines = {
        { id = "w3_grave_1", text = "In the Brill churchyard, under a stone I paid for in the last good year. When the dead began to rise there, I went and looked at every face that came up out of that ground, and hers was not among them." },
      },
      choices = {
        { text = "Were you glad of that?", next = "w3_glad" },
        { text = "Then she's at rest, at least.", next = "BACK", reply = "I tell myself so. It's easier to believe on the days I don't walk past the churchyard." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_glad = {
      lines = {
        { id = "w3_glad_1", text = "I've never decided, and I've had a long time to try. If she had risen, I'd have had her back in some fashion, and she would have had to live with what Valdred did, as I do, and I wouldn't wish that on her." },
      },
      choices = {
        { text = "That's a kind of love, Raleigh.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Raleigh Andrean, once a chef, and once a husband, and neither of those things is true any longer. The Scourge took me, the Dark Lady freed me, and somewhere in between I stopped feeling most of what a man ought to feel." },
        { id = "h_ring", when = { questDone = TODO_QUEST("Raleigh and the Undercity"), questBefore = TODO_QUEST("A Husband's Revenge") },
          text = "Valdred, once my good friend, murdered my wife, and although I can't grieve, I do yearn for revenge. I last heard he was at the Greymane Wall in southern Silverpine, trying to slip into Gilneas, so bring me his cursed hands." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Husband's Revenge") },
          text = "I keep his hands in a box under my bench, and I look at them some evenings. It doesn't bring her back, and I didn't expect it to, but it's the only thing that still feels like anything at all." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask it, then." },
        { id = "h_again2", text = "I have nowhere to be, and no one waiting. Go on." },
        { id = "h_again3", text = "Ask. It passes the time, and I've a great deal of that." },
      },
      choices = {
        { text = "Who was Deliah?", next = "deliah" },
        { text = "Why did Valdred kill her?", next = "valdred" },
        { text = "How can you want revenge but feel no grief?", next = "feeling" },
        { text = "Why did you stop cooking?", next = "chef" },
        { text = "You stand a long way from any kitchen.", next = "kitchen" },
        { text = "I cook. What did you make best?", next = "best", when = { profession = "Cooking" } },
        { text = "I've stopped feeling things too.", next = "numb", when = { race = "Scourge" } },
        { text = "Where does Deliah lie now?", next = "w3_grave" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    deliah = {
      lines = { { id = "de_default", text = "My wife, in Brill, back when Brill was a village with an inn and a market and not a camp for the dead. Her fate was the fate of all who failed to endure those times, and I find I feel nothing for her death, nor for the story of what was done with her body." } },
      choices = {
        { text = "And the ring?", next = "ring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ring = {
      lines = { { id = "ri_default", text = "I gave it to her the summer I was made head cook at a lord's table in Lordaeron, and I meant every word I said that day. Keep it, if you want it, because it's a bauble now, and the hands are all I care to keep." } },
      choices = { { text = "Something else, Raleigh.", next = "BACK" } },
    },
    valdred = {
      lines = { { id = "va_default", text = "I don't know why, and I find I don't care why, which troubles me less than it should. He was my friend for twenty years, he ate at my table, and his hands did it, so it's his hands I want." } },
      choices = {
        { text = "Did Valdred become one of the dead too?", next = "valdred2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valdred2 = {
      lines = { { id = "v2_default", text = "No, he lived, and ran south to the Greymane Wall hoping the Gilneans would open their gate for him. They won't, they don't open it for anyone, so he'll be standing there waiting, with his hands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feeling = {
      big = true,
      lines = { { id = "fe_default", text = "Grief is for the living, who can still be hurt by what they've lost. Revenge is simpler, because it only needs to know who did it, and I know exactly who did it." } },
      choices = {
        { text = "Then he should pay for what he did.", next = "BACK", reply = "He will, and I'll be the one to serve it to him. Cold, as revenge should be.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Revenge won't give you anything back. Let it go.", next = "BACK", reply = "Nothing gives anything back, friend, not to the dead. Revenge at least gives me something to do.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chef = {
      lines = { { id = "cf_default", text = "Because I can't taste anything now, and a cook who can't taste is only a man who burns things. I still know every recipe, though, and sometimes I recite them in my head to remember what saffron was like." } },
      choices = { { text = "Something else, Raleigh.", next = "BACK" } },
    },
    kitchen = {
      lines = { { id = "ki_default", text = "By choice. Eunice Burch teaches cooking across the quarter, and she asked me to help with her students when I first came down. I lasted a morning, because I could see every mistake in the pot and couldn't taste a single one." } },
      choices = {
        { text = "She might still value your eye.", next = "kitchen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen2 = {
      lines = { { id = "ki2_default", text = "She says so, and she sends her best students to me with a question now and then. I answer them. A sauce is only heat and time and patience, and I can still teach those, so long as nobody hands me a spoon." } },
      choices = {
        { text = "Then you're still a chef, in part.", next = "BACK", reply = "In the part that remembers. I'd not call it more than that.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "bs_default", text = "Venison, larded and roasted slow, with a sauce of juniper and red wine. His lordship had it every Winter Veil for nine years. Deliah used to stand in the kitchen door to smell it, since the staff weren't given any." } },
      choices = {
        { text = "Tell me the sauce.", next = "best2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best2 = {
      lines = { { id = "bs2_default", text = "Crush six juniper berries, no more, and let the wine fall by half before the butter goes in. Take it off the heat while it still looks too thin. Make it once for someone you'd stand in a doorway for, and then you'll have used it properly." } },
      choices = {
        { text = "I will. Thank you, Raleigh.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    numb = {
      lines = { { id = "nu_default", text = "Then you know. People tell me it comes back, in pieces, and that I'll grieve for her one morning without warning. I can't decide whether I want that morning to come." } },
      choices = {
        { text = "Some of mine came back. It was worth it.", next = "BACK", reply = "Then perhaps I'll leave a door open for it. After Valdred, and not before.", fx = { affinity = 1 } },
        { text = "None of mine did. It's easier this way.", next = "BACK", reply = "Easier, yes. I've noticed that easier and better stopped being the same thing when I died." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked for lords and their guests for fifteen years. Not one of them ever asked my name." } },
    advice = { { id = "tp_ad", text = "Eat well while you still can, and trust no one who praises your cooking too much." } },
    lordaeron = { { id = "tp_lord", text = "I knew it by its kitchens. The great houses ate well right up until the grain came in from Andorhal." } },
    scourge = { { id = "tp_scourge", text = "I remember very little of being theirs, and I'm told that's a mercy. I only know that I never cooked for them." } },
    _none = { { id = "tp_none", text = "I don't know, and I find I don't much care, which is how most questions go with me now." } },
  },
}

---------------------------------------------------------------------------
-- Velora Nitely: Lordaeron's finest armorsmith, still telling jokes that don't land.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_velora", id = TODO_NPC("Velora Nitely"), name = "Velora Nitely",
  bible = "bibles/uc_trade_more.md", role = "blacksmith", tier = "quest",
  communities = { "undercity" }, temper = { "cheerful", "grim" }, values = { "honest", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Her jokes fall flat, and she notices every time.",
    third = "{name} met Velora Nitely, a Forsaken armorsmith in the Trade Quarter who makes brutal legguards.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome to the finest forge in the Undercity, which isn't saying much, because it's mostly sewers. That was a joke." },
    { id = "g_bones", when = { questActive = TODO_QUEST("Dragonmaw Shinbones") }, text = "Any shinbones yet? Sturdy ones, mind, and test them, because if you can snap one with your bare hands it's no good to me." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, good, so you'll know why I hate a cold anvil. You do know, don't you?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's falling apart, so either you've had a terrible week or a wonderful one. Which was it?" },
  },

  start = "hello",
  nodes = {
    w3_engrave = {
      lines = {
        { id = "w3_engrave_1", text = "No, and it used to be covered in it, lilies and lions for the Silver Hand, and a little hammer hidden in every piece where only the wearer would find it. I stopped when I came back, because I couldn't remember why anyone would bother." },
      },
      choices = {
        { text = "Engrave something just for yourself.", next = "w3_self" },
        { text = "Plain steel suits the Forsaken better anyway.", next = "BACK", reply = "That's what I tell people, and they nod, and none of us believes it. Still, it does save time." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_self = {
      lines = {
        { id = "w3_self_1", text = "For myself? I'd not know what to put. A grave, perhaps, or a sewer rat, and I'd laugh at it, which might be worth the trouble in itself. I'll think on it while I'm hammering, which is when I do all my thinking." },
      },
      choices = {
        { text = "A rat with a little hammer. That's a start.", next = "BACK" },
        { text = "Something else, Velora.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Velora Nitely, armorsmith, and I used to be the best in Lordaeron, or so the lords told me when they wanted a discount. These days I don't care much for my craft, but it beats being a mindless minion of the Scourge, I suppose." },
        { id = "h_brutal", when = { questActive = TODO_QUEST("Velora Nitely and the Brutal Legguards") },
          text = "Thun'grim in the Barrens sent you for the brutal legguards, did he? I can make them, but I'll need materials, and the materials are attached to some rather angry orcs in the Wetlands." },
        { id = "h_done", when = { questDone = TODO_QUEST("Brutal Legguards") },
          text = "How do the legguards fit? Let me know if you need any changes, I aim to please, or at least I used to aim to please." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, though I'm hammering, and the hammer's louder." },
        { id = "h_again2", text = "Ask. If I don't know, I'll make something up, and it'll be funnier than the truth." },
      },
      choices = {
        { text = "Why tell jokes if they don't land?", next = "jokes" },
        { text = "Why Dragonmaw shinbones?", next = "shinbones" },
        { text = "Who were you making armour for, before?", next = "before" },
        { text = "What makes armour brutal?", next = "brutal" },
        { text = "Can you show a smith your methods?", next = "methods", when = { profession = "Blacksmithing" } },
        { text = "Your work has no engraving on it at all.", next = "w3_engrave" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    jokes = {
      big = true,
      lines = { { id = "jo_default", text = "Because I used to be funny, everyone said so, and I keep hoping that one day a joke will come out the way it used to. Here's one: a Dragonmaw orc walks into my forge and limps out without his shins. You're not laughing, are you?" } },
      choices = {
        { text = "I'll laugh anyway, to be kind.", next = "jokes_kind", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Not really, but keep trying. It'll come back to you.", next = "jokes_honest", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jokes_kind = {
      lines = { { id = "jk_default", text = "You're laughing at me rather than at the joke, I can tell, but I'll take it. Kindness from the living is rarer down here than good iron." } },
      choices = { { text = "Something else, Velora.", next = "BACK" } },
    },
    jokes_honest = {
      lines = { { id = "jh_default", text = "Honest, at least, and that's worth more to an armorsmith than flattery. A smith who's lied to about a weak seam ends up burying the customer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shinbones = {
      lines = { { id = "sh_default", text = "The Dragonmaw orcs in the Wetlands have nice thick shinbones, perfect for bracing a brutal legguard, and I need eight of them. They must be sturdy, though, so test each one, and if it snaps in your hands, throw it away and find a sturdier orc." } },
      choices = {
        { text = "That's grim, Velora.", next = "grim" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } },
      },
    },
    grim = {
      lines = { { id = "gr_default", text = "It's armour, {class}, and armour has always been made from whatever the last war left lying about. Besides, the Dragonmaw won't be needing them once you've finished." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },
    before = {
      lines = { { id = "be_default", text = "Knights of the Silver Hand, lords of the court, and once a breastplate for a prince who wanted his initials worked into the steel. I'd rather not say which prince, since he's the reason I'm dead." } },
      choices = { { text = "Something else, Velora.", next = "BACK" } },
    },
    brutal = {
      lines = { { id = "br_default", text = "Thick plates, heavy bracing, and no decoration at all, because the whole point is to look like you'd survive anything. Thun'grim in the Barrens does the gauntlets, Orm Stonehoof in Thunder Bluff does the helm, and I do the legs, which is the best part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    methods = {
      lines = { { id = "me_default", text = "Use the tongs for everything, even what you'd have held bare-handed in life, because you can't feel the heat any longer and you'll burn your fingers to the bone without noticing. That's a Forsaken smith's first lesson, and most of us learned it the hard way." } },
      choices = { { text = "Something else, Velora.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I apprenticed in Lordaeron's armouries at twelve and was the master there at thirty. I'm not sure what age I am now." } },
    advice = { { id = "tp_ad", text = "Always check the straps before the plates. A good plate on a bad strap is just a weight." } },
    _none = { { id = "tp_none", text = "No idea, but I'll pretend I know if you'd like. That was a joke too." } },
  },
}
