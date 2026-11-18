-- Brill's shopkeepers: trade supplies, general goods and the stables.
-- Voices: bibles/brill_market.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC = P.TODO_NPC

-- Abigail Shiel: trade supplies.
P:NPC {
  key = "tir_abigail", id = TODO_NPC("Abigail Shiel"), name = "Abigail Shiel", title = "Trade Supplies",
  bible = "bibles/brill_market.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "brisk", "sharp" }, values = { "practical", "profit" },
  notices = { "craft", "purse" },
  impression = {
    first = "Abigail Shiel sells thread, flux and salt in Brill and haggles with the patience of someone who no longer needs to sleep. She is brisk, sharp and fair, and she disapproves of almost everyone's needlework.",
    third = "{name} met Abigail Shiel, who sells trade supplies in Brill.",
  },
  greetings = {
    { id = "g_default", text = "Buying or browsing? If it's browsing, browse quickly, because the light's going and I can't see the thread." },
    { id = "g_craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing" } }, text = "A crafter. Good, you'll know what things cost and you won't faint at my prices." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and prices went up in the meantime. Don't look at me like that, because I don't set the cart fares." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 200 } },
      text = "You haven't the coin for much, have you? A spool of coarse thread, then, and come back when the Crusade's paid you better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Abigail Shiel, trade supplies. Thread, dye, flux, salt and vials, and if I haven't got it, it's on the next cart from the Undercity, which arrives when the driver remembers which way Brill is." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "One of the newly risen, and in need of everything, I expect. The dead go through thread like nothing else, because none of us notice when we've torn something." },
      },
      again = {
        { id = "h_again", text = "What else? I've stock to count." },
        { id = "h_again2", text = "Go on, then, but make it quick." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "How does Brill get its supplies?", next = "carts" },
        { text = "Do you remember Brill before the plague?", next = "before" },
        { text = "Good day.", next = "END" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "The apothecaries, for vials, by the crate, and then the tailors, for thread, and Innkeeper Renee at the tavern, for salt, since she cooks for the living as well as us. Nobody buys dye, which I find depressing; the dead could stand a little colour." } },
      choices = {
        { text = "Why so many vials?", next = "buyers_vials" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_vials = {
      big = true,
      lines = { { id = "bv_default", text = "Their business, and they pay promptly, which is more than the Deathguard do. If the Society wants to bottle the whole Glades, I'll sell them the bottles and keep my opinions in the back room with the spare flux." } },
      choices = {
        { text = "Wise woman. Coin is coin.", next = "BACK", reply = "Coin is coin, and the Society's coin spends just as well as anyone's in Brill. Whatever they're brewing up there, I'd rather be the one selling the bottles than the one standing downwind.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "You ought to know what your goods are used for.", next = "BACK", reply = "I know what my vials are used for, thank you; I simply choose not to dwell on it. Dwelling is a luxury for the living, and I've a shop to keep.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts = {
      lines = { { id = "c_default", text = "From the Undercity, down the road past the ruins, and the carts come under Deathguard guard because the Crusade likes to ambush them. When a cart's late, we know why, and we send someone to see what's left." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    before = {
      lines = { { id = "bf_default", text = "I remember bits of it. I think I sold cloth then too, in a shop with a green door, though I couldn't tell you which house it was now. Sometimes I walk past the old buildings and one of them feels like it should know me." } },
      choices = {
        { text = "Have you looked for it?", next = "before_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_look = {
      lines = { { id = "bl_default", text = "No, and I don't mean to. If I found the green door, I'd want to know who lived behind it, and I've a feeling that's a question with a sad answer." } },
      choices = {
        { text = "Some doors are better left shut.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Vials sell, thread sells, dye doesn't. That's Brill's whole market." } },
    _none = { { id = "tp_none", text = "I sell supplies, not answers. Try Innkeeper Renee at the tavern." } },
  },
}

-- Mrs. Winters: general supplies.
P:NPC {
  key = "tir_winters", id = TODO_NPC("Mrs. Winters"), name = "Mrs. Winters", title = "General Supplies",
  bible = "bibles/brill_market.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "warm", "chatty" }, values = { "kind", "practical" },
  notices = { "kit", "hunger", "race" },
  impression = {
    first = "Mrs. Winters keeps Brill's general store and fusses over customers as if they were all her grandchildren, dead or not. She is warm and talkative, and she has decided that manners are worth keeping after the grave.",
    third = "{name} met Mrs. Winters, who keeps the general store in Brill.",
  },
  greetings = {
    { id = "g_default", text = "Come in, dear, come in out of the fog. What can I find for you?" },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Oh, a living one! You'll want proper food, then, and I keep a little in the back for the Warchief's folk." },
    { id = "g_away", when = { away = 14 }, text = "There you are, {away} gone without a word! I was beginning to think the Crusade had got you." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of you. Go and see someone about that armor, dear, before it falls off in the square." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Mrs. Winters, and I keep the general goods for Brill: rope, flasks, bags and the like. I kept a shop like this before, I'm quite sure of it, and I see no reason a little thing like dying should stop me." },
        { id = "h_young", when = { maxLevel = 8 }, text = "Oh, you're fresh from Deathknell, aren't you? Buy yourself a bag, dear; you'll be amazed what you end up carrying." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? Take your time." },
        { id = "h_again2", text = "Go on, I've nowhere to be." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Is there a Mr. Winters?", next = "husband" },
        { text = "Why keep shop at all, being dead?", next = "why" },
        { text = "What do the living buy here?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Goodbye, Mrs. Winters.", next = "END" },
      },
    },
    husband = {
      lines = { { id = "hu_default", text = "There is, dear, and he sells armor across the way, and he hasn't the faintest idea what to say to customers. I do the talking for both of us, which suits us, and we bicker less than we used to, which suits us better." } },
      choices = {
        { text = "Do you remember your wedding?", next = "husband_wed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband_wed = {
      lines = { { id = "hw_default", text = "No, and neither does he, so we've agreed it was lovely. That's the trick of it, dear; when you can't remember, you're free to remember kindly." } },
      choices = {
        { text = "That's a lovely way to see it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because somebody has to, and because a town with a shop in it is a town, and a town without one is just a graveyard with ideas. The Dark Lady gave us our minds back, and I'd like to use mine for something besides grieving." } },
      choices = {
        { text = "Do the other Forsaken agree?", next = "why_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Some do, and some say we should stop pretending to be the living and be what we are. I say I'd rather pretend a little and be pleasant than give up and be dreadful, and I've told Gretchen Dedmar, who sulks by the tavern fire, as much." } },
      choices = {
        { text = "Hold on to the old ways. They matter.", next = "BACK", reply = "It's nice to hear somebody say so, dear. I keep a teapot I can't drink from, and I polish it every morning, and I don't care one bit who thinks that's foolish.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We're something new now. Let the old ways go.", next = "BACK", reply = "Something new, is it? You sound like Gretchen, and she's never once looked happier for having let go of anything. I'll keep my teapot and my manners, thank you kindly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "l_default", text = "Bread and water and the odd cheese, mostly, and they look so grateful when they find it. I don't keep much, since it spoils and nobody else buys it, but I'll not have a guest of the Dark Lady go hungry in my town." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, dear. Ask Innkeeper Renee at the tavern; she knows everything." } },
  },
}

-- Morganus: Brill's stable master.
P:NPC {
  key = "tir_morganus", id = TODO_NPC("Morganus"), name = "Morganus", title = "Stable Master",
  bible = "bibles/brill_market.md", role = "stablemaster", tier = "service",
  communities = { "brill" }, temper = { "gruff", "steady" }, values = { "practical", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Morganus keeps the stables in Brill and seems to like the beasts in them more than anyone who comes to collect them. He is gruff and unhurried, and the animals settle when he talks to them.",
    third = "{name} met Morganus, Brill's stable master.",
  },
  greetings = {
    { id = "g_default", text = "Quietly. The beasts are resting, and so am I, in a manner of speaking." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Bring your companion in out of the wet, then; they don't like this fog any more than you do." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "That's {pet}, is it? Good animal, by the look of it. Better than most I get." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} is nervous of the dead. That's no fault of theirs, and it'll pass, if you give it time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Morganus. I keep the stables, for the hunters and their beasts, and I keep the Deathguard's horses shod, though they've no hooves left worth the name." },
      },
      again = {
        { id = "h_again", text = "Something else? I've feed to measure." },
        { id = "h_again2", text = "Go on. The beasts don't mind the talk." },
      },
      choices = {
        { text = "I'd like to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do beasts take to the dead?", next = "beasts" },
        { text = "What about the skeletal horses?", next = "horses" },
        { text = "Any trouble in Tirisfal for animals?", next = "trouble" },
        { text = "What did you do before the plague?", next = "past" },
        { text = "How should I care for a beast in this fog?", next = "care" },
        { text = "My companion's restless here. Any advice?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "My people raise kodo. These beasts seem unhappy.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Good day.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Badly, at first. They smell the grave on us and shy away, but after a few days of being fed by the same hands they stop caring, and the living in Brill never have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horses = {
      lines = { { id = "h_horses", text = "Zachariah Post sells them here in Brill, and Velma Warnam teaches you to sit them. They don't eat and they don't tire, and they don't love you either, which is the part nobody warns you about." } },
      choices = {
        { text = "Would you rather a living horse?", next = "horses_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horses_stance = {
      big = true,
      lines = { { id = "hs_default", text = "I would, if I'm honest. A living horse knows your voice, and a dead one only knows the reins, and I miss being known." } },
      choices = {
        { text = "A loyal beast is worth more than a tireless one.", next = "BACK", reply = "Now there's somebody who's sat a good horse in their time. I'll groom these ones all the same, though they can't feel it, because I'd hate to forget how.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A horse that never tires is all I need.", next = "BACK", reply = "Then you'll be well served, and you'll never have to feed one or walk it cool after a hard ride. I only hope you never find out what you're missing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "The wolves in the hills are sick, and the bats near the cemetery are worse, and the Crusade shoots anything that isn't theirs. Keep your beast out of the plagued water, because they'll drink it if you let them." } },
      choices = {
        { text = "Sick how, the wolves?", next = "trouble2" },
        { text = "Thank you, Morganus.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble2 = {
      lines = { { id = "t2_default", text = "Thin, with their coats coming out in patches and their eyes gone milky, and they bite at things that aren't there. The plague's in the ground here, and the ground's in everything that eats from it." } },
      choices = {
        { text = "Can anything be done for them?", next = "trouble3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble3 = {
      big = true,
      lines = { { id = "t3_default", text = "Not by me. The apothecaries would take one off my hands for study, I expect, and some say a quick arrow's the only kindness left. What would you do with a beast that's past saving?" } },
      choices = {
        { text = "End it quickly. That's the only mercy left.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Give it to the apothecaries. Its death could serve.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = { { id = "pa_default", text = "Kept horses for a lord's estate outside the capital, forty stalls and a tack room I could find blind. The lord's name doesn't matter now, and neither does mine, much." } },
      choices = {
        { text = "What became of the horses?", next = "past2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past2 = {
      lines = { { id = "p2_default", text = "I opened the stalls the night the dead came up the road and let them run. Some of them, I expect, are in Zachariah's stock now, but I never look too close at a skeleton's teeth." } },
      choices = {
        { text = "You gave them a chance. That counts.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = {
        { id = "ca_default", text = "Dry straw, a rub-down after the fog, and keep it out of the plagued water like I said. Most of all, feed it yourself, every time, so it learns your hands even if it can't stand your smell." },
        { id = "ca_cat", when = { pet = { family = "Cat" } }, text = "Cats hate the damp worst of all, so give yours somewhere high and dry to sleep and it'll forgive you the rest. Feed it yourself, every time, so it learns your hands." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "Course it is; it smells death in every doorway in this town. Talk to it while you feed it, any words will do, because it's the voice it learns, not the meaning." } },
      choices = {
        { text = "I'll talk to it, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Unhappy's the word. They're living beasts in a dead town, and nobody here can give them what a herd gives. If you've a song your people sing to kodo, sing it in my stable sometime, because I've nothing of the sort." } },
      choices = {
        { text = "I'll sing it for them, Morganus.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "The Scourge emptied every stable in Lordaeron, and the beasts that ran are the only ones that lived. I don't forgive that, and I don't forget it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They shoot hunters' pets on sight, for walking at our heels. A man who'll kill a dog for its company isn't worth arguing with." } },
    _none = { { id = "tp_none", text = "Don't know. Ask someone who talks to people more than I do." } },
  },
}
