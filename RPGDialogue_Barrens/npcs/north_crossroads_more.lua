-- North of and at the Crossroads: Kranal Fiss, the orc shaman who hands young shaman their first
-- taste of fire, and Sikwa, the Crossroads stable master. Voices: bibles/north_crossroads_more.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kranal Fiss: fire shaman north of the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "kranal", id = TODO_NPC("Kranal Fiss"), name = "Kranal Fiss",
  bible = "bibles/north_crossroads_more.md", role = "questgiver", tier = "quest",
  temper = { "fierce", "warm" }, values = { "ambitious", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Kranal Fiss is an orc shaman who keeps to the hills north of the Crossroads, where young shaman come to him for their first lesson in fire. His eyes look as if something is burning just behind them, and he likes it when he sees the same in yours.",
    third = "{name} met Kranal Fiss, an orc shaman north of the Crossroads who teaches the ways of fire.",
  },

  greetings = {
    { id = "g_hi", text = "Come closer to the fire, {class}, unless you're afraid of it. Most people are, and they're right to be." },
    { id = "g_shaman", when = { class = "SHAMAN", questActive = TODO_QUEST("Call of Fire") }, text = "Your trainer sent you out to me, did he? Then you're ready for the next sapta, the sapta of fire, and I can see the wanting in your eyes already." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your fire is green at the edges, warlock. Keep it away from mine, because they don't get along." },
    { id = "n_troll", cat = "race", when = { race = "Troll", class = "SHAMAN" },
      text = "A Darkspear shaman. Your people kept the spirits close when mine forgot them, and I've never forgotten that we owe you for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kranal Fiss, and I keep the fire for the young shaman of the Horde, the ones strong enough in the ways of earth to want more. You've tasted the earth's power already, and now you're hungry for more, and fire answers hunger better than any other element." },
        { id = "h_torch", when = { class = "SHAMAN", questActive = TODO_QUEST("Call of Fire"), minLevel = 13 },
          text = "Your spirit burns brighter than any torch I've ever seen, and you should be proud of it. Go on down this path, and the elements will be yours to command, and the Horde will look to you for guidance." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The fire's warm, and I'm in no hurry." },
        { id = "h_again2", text = "Ask. Fire doesn't wait, but I can." },
      },
      choices = {
        { text = "What is fire to a shaman?", next = "fire" },
        { text = "Where do I go for the fire sapta?", next = "telf", when = { class = "SHAMAN" } },
        { text = "Why live out here, alone in the hills?", next = "hills" },
        { text = "What's to the north of here?", next = "north" },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "Fire is more than chaos and destruction, though that's what the young ones come for. It's life and creation too, and the same flame that burns a village warms the hands of everyone in it." } },
      choices = {
        { text = "You said fire answers hunger.", next = "hunger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunger = {
      big = true,
      lines = { { id = "hu_default", text = "It does, and that's the danger in it. The orcs who called on fel fire wanted power and got it, and look what it cost us, so a shaman must want the flame and still know when to let it go." } },
      choices = {
        { text = "Wanting power isn't wrong. I'll want it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll learn to let it go, before it takes me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    telf = {
      lines = { { id = "te_default", text = "Along the Southfury River in Durotar there's a hidden trail up one of the highest peaks in that land. At the top is the Shrine of the Dormant Flame, and Telf Joolam watches over it, so take him the torch I give you." } },
      choices = {
        { text = "What will Telf ask of me?", next = "telf2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    telf2 = {
      lines = { { id = "t2_default", text = "He'll want fire tar from the Razormane spellcasters in the east of the Barrens, and a pouch of reagents, so he can make the sapta. Then you'll face the manifestation of fire on that mountaintop, and you'll strike quickly, because it only grows the longer you take." } },
      choices = { { text = "Something else, Kranal.", next = "BACK" } },
    },
    hills = {
      lines = { { id = "hl_default", text = "The Crossroads is loud, full of grunts and kodo and traders shouting their prices, and the fire won't speak to me over that racket. Out here I can hear it, and the young ones who really want to find me always do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    north = {
      lines = { { id = "no_default", text = "The road runs north to the Mor'shan gate and on into Ashenvale, so don't wander too far, or you'll find yourself in the elves' lands. They don't take kindly to orcs, and they take even less kindly to orcs carrying fire." } },
      choices = { { text = "Something else, Kranal.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the spirits again from Thrall's teachers, after the camps. My grandmother would have been ashamed it took so long." } },
    advice = { { id = "tp_ad", text = "Never stand downwind of your own fire, {class}. I learned that one with my eyebrows." } },
    _none = { { id = "tp_none", text = "The fire doesn't know, and neither do I." } },
  },
}

---------------------------------------------------------------------------
-- Sikwa: stable master at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "sikwa", id = TODO_NPC("Sikwa"), name = "Sikwa", title = "Stable Master",
  bible = "bibles/north_crossroads_more.md", role = "stablemaster", tier = "service",
  communities = { "crossroads" }, temper = { "calm", "sharp" }, values = { "loyal", "practical" },
  notices = { "pet" },
  impression = {
    first = "Sikwa keeps the stables at the Crossroads, a tauren hunter who watches the road as closely as the beasts in her care. She has no patience for owners who neglect their companions, and she says so.",
    third = "{name} met Sikwa, the stable master at the Crossroads.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Crossroads stables. Water's in the trough, so mind where you step." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter with a companion at heel, good. Let me see how you've been treating your friend." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "{pet} is limping on a forepaw, and you haven't noticed. Look at it before you set out again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sikwa, and I keep the stables here, which means I keep the beasts that the hunters of the Barrens can't take with them. Every one of them gets fed and watered and walked, and every owner gets told off if they've neglected it." },
      },
      again = { { id = "h_again", text = "Anything else? The beasts need their evening walk soon." } },
      choices = {
        { text = "I'd like to stable my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What beasts do the Barrens hunters tame?", next = "beasts" },
        { text = "Is the Crossroads safe for the animals?", next = "safe" },
        { text = "Farewell, Sikwa.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "Lions, mostly, from the savannah, and the odd raptor from the Lushwater, which I'd rather they didn't bring here, since raptors eat the other guests. Once a young orc brought me a zhevra and swore it was tame, and it kicked a hole in my fence." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safer than out on the plains, with the Kolkar raiding and the Razormane prowling the hills. When the centaur come at the walls, I let the beasts loose behind the inn and they make their own trouble for anyone who gets past the gate." } },
      choices = {
        { text = "You'd let them fight?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      big = true,
      lines = { { id = "fi_default", text = "A caged beast dies afraid, and a free one dies fighting, if it dies at all. Some owners would rather I kept their companions locked away and safe, but I'd rather give them a chance." } },
      choices = {
        { text = "Their owners trusted you to keep them safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better free and fighting than caged and afraid.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted with a lion of my own for twenty years. When she died, I took this post instead of taming another." } },
    _none = { { id = "tp_none", text = "I don't know, but the old lion in the corner stall might. She's seen more of the Barrens than I have." } },
  },
}
